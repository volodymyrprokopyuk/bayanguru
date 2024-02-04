package site

import (
  "fmt"
  "text/template"
  "path/filepath"
  "os"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

type PublishCommand struct {
  CatalogDir, BookFile, PieceDir, BookDir string
  Catalog string
  All, Book bool
  Pieces, Books []string
  Queries cat.PieceQueries
  SiteDir, PublicDir string
}

func makeTemplate(siteDir string) (*template.Template, error) {
  tpl := template.New("page")
  pageFile := filepath.Join(siteDir, "page.html")
  _, err := tpl.ParseFiles(pageFile)
  if err != nil {
    return nil, err
  }
  return tpl, nil
}

func generateIndex(
  tpl *template.Template, pieces []cat.Piece, siteDir, publicDir string,
) error {
  indexFile := filepath.Join(siteDir, "index.html")
  _, err := tpl.ParseFiles(indexFile)
  if err != nil {
    return err
  }
  indexHTML := filepath.Join(publicDir, "index.html")
  index, err := os.Create(indexHTML)
  if err != nil {
    return err
  }
  type indexData struct {
    Title string
    Pieces []cat.Piece
  }
  data := indexData{"Sheet music library", pieces}
  return tpl.ExecuteTemplate(index, "page.html", data)
}

func siteError(format string, args ...any) error {
  return fmt.Errorf("site: " + format, args...)
}

func Publish(pc PublishCommand) error {
  pieces, _, catLen, err := cat.ReadPiecesAndBooks(
    pc.CatalogDir, pc.Catalog, pc.Pieces,
    pc.BookFile, pc.Books, pc.Book, pc.All,
  )
  if err != nil {
    return cat.CatError("%v", err)
  }
  if len(pc.Queries) > 0 {
    pieces, err = cat.QueryPieces(pieces, pc.Queries)
    if err != nil {
      return cat.CatError("%v", err)
    }
  }
  cat.PrintStat(catLen, len(pieces))
  tpl, err := makeTemplate(pc.SiteDir)
  if err != nil {
    return siteError("%v", err)
  }
  err = generateIndex(tpl, pieces, pc.SiteDir, pc.PublicDir)
  if err != nil {
    return siteError("%v", err)
  }
  return nil
}
