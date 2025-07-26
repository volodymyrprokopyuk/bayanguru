package score

import (
	"context"
	"fmt"
	"io"
	"runtime"
	"strings"
	"sync"
	"text/template"

	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
)

func engraveBook(
  w io.Writer, tplPool *sync.Pool, book *catalog.Book, ec *engraveCommand,
) error {
  catalog.PrintBook(w, book)
  if ec.lint {
    for _, piece := range book.Pieces {
      err := lintPiece(w, piece, ec.SourceDir)
      if err != nil {
        return err
      }
    }
  }
  book.Meta = ec.meta
  pieces := make([]*catalog.Piece, len(book.Pieces))
  for i, piece := range book.PtrPieces() {
    pieces[i] = piece
  }
  tpl := tplPool.Get().(*template.Template) //nolint:errcheck,gocritic
  defer tplPool.Put(tpl)
  for _, piece := range pieces {
    err := templatePiece(tpl, piece, ec)
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
  if ec.optimize {
    err := optimizeScore(w, book.File, ec.BookDir)
    if err != nil {
      return err
    }
  }
  return nil
}

func fanOutEngraveBooks(
  ctx context.Context, wg *sync.WaitGroup,
  chBooks <-chan *catalog.Book, chErrors chan<- error,
  tplPool *sync.Pool, ec *engraveCommand,
) {
  defer wg.Done()
  var w strings.Builder
  for {
    select {
    case <- ctx.Done():
      return
    case book, open := <- chBooks:
      if !open {
        return
      }
      w.Reset()
      err := engraveBook(&w, tplPool, book, ec)
      fmt.Print(w.String())
      if err != nil {
        chErrors <- err
        return
      }
    }
  }
}

func engraveBooks(books []*catalog.Book, ec *engraveCommand) error {
  tplPool, err := templatePool(ec.SourceDir, "book.ly")
  if err != nil {
    return err
  }
  n := min(len(books), runtime.GOMAXPROCS(0))
  var ctx, cancel = context.WithCancel(context.Background())
  defer cancel()
  chBooks, chErrors := make(chan *catalog.Book), make(chan error, n)
  var ewg sync.WaitGroup
  ewg.Add(1)
  go func() {
    defer ewg.Done()
    err = <- chErrors
    if err != nil {
      cancel()
    }
  }()
  var wg sync.WaitGroup
  for range n {
    wg.Add(1)
    go fanOutEngraveBooks(ctx, &wg, chBooks, chErrors, tplPool, ec)
  }
  books: for _, book := range books {
    select {
    case <- ctx.Done():
      break books
    case chBooks <- book:
    }
  }
  close(chBooks)
  wg.Wait()
  close(chErrors)
  ewg.Wait()
  return err
}
