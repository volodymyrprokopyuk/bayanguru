package site

import (
  "fmt"
  "strings"
  "text/template"
  "path/filepath"
  "os"
  "os/exec"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

type PublishCommand struct {
  CatalogDir, BookFile, PieceDir, BookDir string
  Catalog string
  Init, All, Book bool
  Pieces, Books []string
  Queries cat.PieceQueries
  SiteDir, TemplateDir, PublicDir string
  PageSize int
}

func initSite(siteDir, publicDir string) error {
  dirs := []string{
    filepath.Join(publicDir, "image"),
    filepath.Join(publicDir, "piece"),
  }
  for _, dir := range dirs {
    fmt.Printf("%v %v\n", sty.Org("init"), sty.Lvl(dir))
    err := os.MkdirAll(dir, 0755)
    if err != nil {
      return err
    }
  }
  images := []string{"image/icon", "image/logo"}
  for _, image := range images {
    lyImage := filepath.Join(siteDir, image + ".ly")
    svgImage := filepath.Join(publicDir, image)
    fmt.Printf("%v %v\n", sty.Org("engrave"), sty.Lvl(svgImage + ".svg"))
    lyCmd := exec.Command(
      "lilypond", "-d", "backend=cairo", "-l", "WARN", "-f", "svg",
      "-o", svgImage, lyImage,
    )
    lyCmd.Stdout = os.Stdout
    lyCmd.Stderr = os.Stderr
    err := lyCmd.Run()
    if err != nil {
      return err
    }
  }
  return nil
}

func makeTemplate(templateDir string) (*template.Template, error) {
  tpl := template.New("page")
  tpl.Funcs(template.FuncMap{
    "join": func(sep string, slc []string) string {
      return strings.Join(slc, sep)
    },
  })
  pageFile := filepath.Join(templateDir, "page.html")
  return tpl.ParseFiles(pageFile)
}

func generateFile(
  tpl *template.Template, publicDir, publicFile string, data any,
) error {
  file := filepath.Join(publicDir, publicFile)
  fmt.Printf("%v %v\n", sty.Org("publish"), sty.Lvl(file))
  w, err := os.Create(file) // overwrites an existing file
  if err != nil {
    return err
  }
  return tpl.ExecuteTemplate(w, "page.html", data)
}

func generateIndex(
  tpl *template.Template, templateDir, publicDir string,
) error {
  indexFile := filepath.Join(templateDir, "index.html")
  _, err := tpl.ParseFiles(indexFile)
  if err != nil {
    return err
  }
  indexData := struct{}{}
  return generateFile(tpl, publicDir, "index.html", indexData)
}

func generatePieces(
  tpl *template.Template, pieces []cat.Piece, templateDir, publicDir string,
) error {
  pieceFile := filepath.Join(templateDir, "piece.html")
  _, err := tpl.ParseFiles(pieceFile)
  if err != nil {
    return err
  }
  piecesDir := filepath.Join(publicDir, "piece")
  for _, piece := range pieces {
    pieceData := struct { Piece cat.Piece }{piece}
    err := generateFile(tpl, piecesDir, piece.File, pieceData)
    if err != nil {
      return err
    }
  }
  return nil
}

func genereateSearchIndex(siteDir, publicDir string) error {
  pfDir := filepath.Join(publicDir, "pagefind")
  err := os.RemoveAll(pfDir) // removes an existing index
  if err != nil {
    return err
  }
  cwd, err := os.Getwd()
  if err != nil {
    return err
  }
  err = os.Chdir(siteDir)
  if err != nil {
    return err
  }
  defer os.Chdir(cwd)
  fmt.Printf(
    "%v %v\n", sty.Org("index"), sty.Lvl(filepath.Join(publicDir, "piece")),
  )
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
  if pc.Init {
    err := initSite(pc.SiteDir, pc.PublicDir)
    if err != nil {
      return siteError("%v", err)
    }
  }
  tpl, err := makeTemplate(pc.TemplateDir)
  if err != nil {
    return siteError("%v", err)
  }
  err = generateIndex(tpl, pc.TemplateDir, pc.PublicDir)
  if err != nil {
    return siteError("%v", err)
  }
  err = generatePieces(tpl, pieces, pc.TemplateDir, pc.PublicDir)
  if err != nil {
    return siteError("%v", err)
  }
  err = genereateSearchIndex(pc.SiteDir, pc.PublicDir)
  if err != nil {
    return siteError("%v", err)
  }
  err = generateCatalog(tpl, pc)
  if err != nil {
    return siteError("%v", err)
  }
  return nil
}
