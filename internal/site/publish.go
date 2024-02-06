package site

import (
  "fmt"
  "text/template"
  "path/filepath"
  "os"
  "os/exec"
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
  // siteDir, templateFile, publicDir, generatedFile string, data any,
  publicDir, publicFile string, data any,
) error {

  // tplFile := filepath.Join(siteDir, templateFile)
  // _, err := tpl.ParseFiles(tplFile)
  // if err != nil {
  //   return err
  // }

  file := filepath.Join(publicDir, publicFile)
  w, err := os.Create(file)
  if err != nil {
    return err
  }
  return tpl.ExecuteTemplate(w, "page.html", data)
}

func generateIndex(
  tpl *template.Template, pieces []cat.Piece, siteDir, publicDir string,
) error {
  indexFile := filepath.Join(siteDir, "index.html")
  _, err := tpl.ParseFiles(indexFile)
  if err != nil {
    return err
  }
  indexData := struct {
    Title string
    Pieces []cat.Piece
  }{"Sheet music library", pieces}
  return generateFile(tpl, publicDir, "index.html", indexData)
}

func generatePieces(
  tpl *template.Template, pieces []cat.Piece, siteDir, publicDir string,
) error {
  pieceFile := filepath.Join(siteDir, "piece.html")
  _, err := tpl.ParseFiles(pieceFile)
  if err != nil {
    return err
  }
  piecesDir := filepath.Join(publicDir, "pieces")
  for _, piece := range pieces {
    pieceData := struct {
      Title string
      Piece cat.Piece
    }{piece.Tit, piece}
    err := generateFile(tpl, piecesDir, piece.File + ".html", pieceData)
    if err != nil {
      return err
    }
  }
  return nil
}

func genereateSearchIndex(siteDir string) error {
  cwd, err := os.Getwd()
  if err != nil {
    return err
  }
  err = os.Chdir(siteDir)
  if err != nil {
    return err
  }
  defer os.Chdir(cwd)
  pfFile := filepath.Join(cwd, "pagefind")
  pfCmd := exec.Command(pfFile)
  pfCmd.Stdout = os.Stdout
  pfCmd.Stderr = os.Stderr
  return pfCmd.Run()
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
  err = generatePieces(tpl, pieces, pc.SiteDir, pc.PublicDir)
  if err != nil {
    return siteError("%v", err)
  }
  err = genereateSearchIndex(pc.SiteDir)
  if err != nil {
    return siteError("%v", err)
  }
  return nil
}
