package score

import (
	"context"
	"fmt"
	"io"
	"runtime"
	"strings"
	"sync"
	"text/template"

	cat "github.com/volodymyrprokopyuk/bayanguru/internal/catalog"
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
  tplPool.Put(tpl)
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
  ctx context.Context, bookCh <-chan cat.Book, errorCh chan<- error,
  tplPool *sync.Pool, ec EngraveCommand,
) {
  defer close(errorCh)
  var w strings.Builder
  for {
    select {
    case <- ctx.Done():
      return
    case book, open := <- bookCh:
      if !open {
        return
      }
      w.Reset()
      err := engraveBook(&w, tplPool, book, ec)
      fmt.Print(w.String())
      if err != nil {
        errorCh <- err
        bookCh = nil // do not engrave books after an error
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
  var ctx, cancel = context.WithCancel(context.Background())
  defer cancel()
  n := min(len(books), runtime.GOMAXPROCS(0))
  bookCh := make(chan cat.Book)
  errorChs := make([]chan error, n)
  for i := range n { // fan-out books
    errorChs[i] = make(chan error)
    go receiveAndEngraveBooks(ctx, bookCh, errorChs[i], &tplPool, ec)
  }
  errorCh := cat.FanIn(errorChs) // fan-in books
  go func() {
    books: for _, book := range books {
      select {
      case <- ctx.Done():
        break books
      case bookCh <- book:
      }
    }
    close(bookCh)
  }()
  var firstErr error
  for err := range errorCh {
    if firstErr == nil {
      cancel()
      firstErr = err // capture the first error
    }
  }
  return firstErr
}
