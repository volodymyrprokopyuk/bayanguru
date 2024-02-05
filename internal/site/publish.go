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
  return tpl.ParseFiles(pageFile)
}

func generateFile(
  tpl *template.Template,
  siteDir, templateFile, publicDir, generatedFile string, data any,
) error {
  tplFile := filepath.Join(siteDir, templateFile)
  _, err := tpl.ParseFiles(tplFile)
  if err != nil {
    return err
  }
  genFile := filepath.Join(publicDir, generatedFile)
  w, err := os.Create(genFile)
  if err != nil {
    return err
  }
  return tpl.ExecuteTemplate(w, "page.html", data)
}

func generateIndex(
  tpl *template.Template, pieces []cat.Piece, siteDir, publicDir string,
) error {
  type indexData struct {
    Title string
    Pieces []cat.Piece
  }
  data := indexData{"Sheet music library", pieces}
  return generateFile(tpl, siteDir, "index.html", publicDir, "index.html", data)
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
