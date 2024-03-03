package score

import (
  "fmt"
  "strings"
  "text/template"
  "io"
  "sync"
  "context"
  "runtime"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

func bookPieces(book cat.Book) []*cat.Piece {
  pieces := make([]*cat.Piece, 0, 200)
  if len(book.Sections) > 0 {
    nextPiece, piece := cat.SectionPieces(book)
    for nextPiece() {
      pieces = append(pieces, piece())
    }
  } else {
    for i := range book.Pieces {
      pieces = append(pieces, &book.Pieces[i])
    }
  }
  return pieces
}

func engraveBook(
  w io.Writer, tplPool *sync.Pool, book cat.Book, ec EngraveCommand,
) error {
  cat.PrintBook(w, book)
  if ec.Lint {
    for _, piece := range book.Pieces {
      err := lintPiece(w, piece, ec.SourceDir)
      if err != nil {
        return err
      }
    }
  }
  book.Meta = ec.Meta
  pieces := bookPieces(book)
  tpl := tplPool.Get().(*template.Template)
  for _, piece := range pieces {
    err := templatePiece(tpl, piece, ec.SourceDir, ec.Meta)
    if err != nil {
      return err
    }
  }
  var bookScore strings.Builder
  err := tpl.ExecuteTemplate(&bookScore, "score.ly", book)
  if err != nil {
    return err
  }
  err = engraveScore(w, bookScore.String(), book.File, ec.BookDir)
  if err != nil {
    return err
  }
  if ec.Optimize {
    err := optimizeScore(w, book.File, ec.BookDir)
    if err != nil {
      return err
    }
  }
  return nil
}

func receiveAndEngraveBooks(
  ctx context.Context, wg *sync.WaitGroup,
  books <-chan cat.Book, errors chan<- error,
  tplPool *sync.Pool, ec EngraveCommand,
) {
  defer wg.Done()
  var w strings.Builder
  for {
    select {
    case <- ctx.Done():
      return
    case book, open := <- books:
      if !open {
        return
      }
      w.Reset()
      err := engraveBook(&w, tplPool, book, ec)
      fmt.Print(w.String())
      if err != nil {
        errors <- err
        books = nil // do not process books after an error
      }
    }
  }
}

func engraveBooks(books []cat.Book, ec EngraveCommand) error {
  _, err := makeTemplate(ec.SourceDir, "book.ly") // validate template
  if err != nil {
    return err
  }
  var tplPool = sync.Pool {
    New: func() any {
      tpl, _ := makeTemplate(ec.SourceDir, "book.ly")
      return tpl
    },
  }
  var wg sync.WaitGroup
  var ctx, cancel = context.WithCancel(context.Background())
  defer cancel()
  engBooks, engErrors := make(chan cat.Book), make(chan error)
  for i := 0; i < min(len(books), runtime.GOMAXPROCS(0)); i++ {
    wg.Add(1)
    go receiveAndEngraveBooks(ctx, &wg, engBooks, engErrors, &tplPool, ec)
  }
  wg.Add(1)
  go func() {
    defer wg.Done()
    books: for _, book := range books {
      select {
      case <- ctx.Done():
        break books
      case engBooks <- book:
      }
    }
    close(engBooks)
  }()
  go func() {
    err = <- engErrors // capture the first error
    cancel()
    for range engErrors { } // ignore other errors
  }()
  wg.Wait()
  close(engErrors)
  return err
}
