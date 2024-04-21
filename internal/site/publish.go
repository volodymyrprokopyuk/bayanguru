package site

import (
  "fmt"
  "strings"
  "text/template"
  "io"
  "path/filepath"
  "os"
  "os/exec"
  "sync"
  "context"
  "runtime"
  "gopkg.in/yaml.v3"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
  cat "github.com/volodymyrprokopyuk/bayan/internal/catalog"
)

type PublishCommand struct {
  CatalogDir, BookFile, PieceDir, BookDir string
  Catalog string
  Init, All, Book bool
  Pieces, Books []string
  Queries cat.PieceQueries
  SiteDir, TemplateDir, ContentDir, PublicDir string
  PageSize int
}

func engraveImage(siteDir, publicDir, image string) error {
  lyImage := filepath.Join(siteDir, image + ".ly")
  svgImage := filepath.Join(publicDir, image)
  fmt.Printf("%v %v\n", sty.Org("engrave"), sty.Lvl(svgImage + ".svg"))
  lyCmd := exec.Command(
    "lilypond", "-d", "backend=cairo", "-l", "WARN", "-f", "svg",
    "-o", svgImage, lyImage,
  )
  lyCmd.Stdout = os.Stdout
  lyCmd.Stderr = os.Stderr
  return lyCmd.Run()
}

var catGroups = map[string][]string{
  "origin": {
    "ukrainian", "russian", "belarusian", "hungarian", "extra", "european",
  },
  "style": {
    "folk", "custom", "classic",
  },
  "genre": {
    "song", "dance", "piece",
  },
  "study-stb": {
    "scale", "arpeggio", "interval", "chord", "polyphony", "left-hand",
  },
  "study-frb": {
    "scale", "arpeggio", /*"interval",*/ "chord", //"polyphony",
  },
  "composer": {
    "composer", "no-composer",
  },
  "bass": {
    "standard-bass", "pure-bass", "free-bass",
  },
  "level": {
    "elementary-a", "elementary-b", "elementary-c",
    "intermediary-a",
  },
}

func initSite(siteDir, publicDir string) error {
  dirs := make([]string, 0, 100)
  dirs = append(dirs, "image", "piece")
  for key, groups := range catGroups {
    for _, group := range groups {
      dirs = append(dirs, filepath.Join("catalog", key, group))
    }
  }
  for _, dir := range dirs {
    d := filepath.Join(publicDir, dir)
    fmt.Printf("%v %v\n", sty.Org("init"), sty.Lvl(d))
    err := os.MkdirAll(d, 0755)
    if err != nil {
      return err
    }
  }
  images := []string{"image/icon", "image/logo"}
  for _, image := range images {
    err := engraveImage(siteDir, publicDir, image)
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

func publishFile(
  w io.Writer, tpl *template.Template, publicDir, publicFile string, data any,
) error {
  file := filepath.Join(publicDir, publicFile)
  fmt.Fprintf(w, "%v %v\n", sty.Org("publish"), sty.Lvl(file))
  w, err := os.Create(file) // overwrites an existing file
  if err != nil {
    return err
  }
  return tpl.ExecuteTemplate(w, "page.html", data)
}

type MetaEntry struct {
  Name string `yaml:"name"`
  Eng string `yaml:"eng"`
  Ukr string `yaml:"ukr"`
}

type CatalogMeta struct {
  Tit MetaEntry `yaml:"tit"`
  Sec []struct {
    Tit MetaEntry `yaml:"tit"`
    Sub []MetaEntry `yaml:"sub"`
  } `yaml:"sec"`
}

func readCatalogMeta(siteDir, metaFile string) ([]CatalogMeta, error) {
  metaFile = filepath.Join(siteDir, metaFile)
  file, err := os.Open(metaFile)
  if err != nil {
    return nil, err
  }
  defer file.Close()
  dec := yaml.NewDecoder(file)
  var meta struct { Meta []CatalogMeta `yaml:"meta"` }
  err = dec.Decode(&meta)
  if err != nil {
    return nil, err
  }
  return meta.Meta, nil
}

func publishIndex(tpl *template.Template, pc PublishCommand) error {
  indexFile := filepath.Join(pc.TemplateDir, "index.html")
  _, err := tpl.ParseFiles(indexFile)
  if err != nil {
    return err
  }
  catalogMeta, err := readCatalogMeta(pc.ContentDir, "catalog-meta.yaml")
  if err != nil {
    return err
  }
  indexData := struct {
    SiteContent string
    CatalogMeta []CatalogMeta
  }{
    SiteContent: "",
    CatalogMeta: catalogMeta,
  }
  return publishFile(os.Stdout, tpl, pc.PublicDir, "index.html", indexData)
}

func receiveAndPublishPieces(
  ctx context.Context, wg *sync.WaitGroup,
  pieces <-chan cat.Piece, errors chan<- error,
  tplPool *sync.Pool, publicDir string,
) {
  defer wg.Done()
  pieceDir := filepath.Join(publicDir, "piece")
  var w strings.Builder
  for {
    select {
    case <- ctx.Done():
      return
    case piece, open := <- pieces:
      if !open {
        return
      }
      w.Reset()
      tpl := tplPool.Get().(*template.Template)
      pieceData := struct { Piece cat.Piece }{piece}
      err := publishFile(&w, tpl, pieceDir, piece.File, pieceData)
      fmt.Print(w.String())
      tplPool.Put(tpl)
      if err != nil {
        errors <- err
        pieces = nil // do not publish pieces after an error
      }
    }
  }
}

func publishPieces(
  pieces []cat.Piece, templateDir, publicDir string,
) error {
  tpl, err := makeTemplate(templateDir) // validate template
  if err != nil {
    return err
  }
  pieceFile := filepath.Join(templateDir, "piece.html")
  _, err = tpl.ParseFiles(pieceFile) // validate template
  if err != nil {
    return err
  }
  var tplPool = sync.Pool{
    New: func() any {
      tpl, _ := makeTemplate(templateDir)
      _, _ = tpl.ParseFiles(pieceFile)
      return tpl
    },
  }
  var wg sync.WaitGroup
  ctx, cancel := context.WithCancel(context.Background())
  defer cancel()
  pubPieces, pubErrors := make(chan cat.Piece), make(chan error)
  for range min(len(pieces), runtime.GOMAXPROCS(0)) {
    wg.Add(1)
    go receiveAndPublishPieces(
      ctx, &wg, pubPieces, pubErrors, &tplPool, publicDir,
    )
  }
  wg.Add(1)
  go func() {
    defer wg.Done()
    pieces: for _, piece := range pieces {
      select {
      case <- ctx.Done():
        break pieces
      case pubPieces <- piece:
      }
    }
    close(pubPieces)
  }()
  go func() {
    err = <- pubErrors // capture the first error
    cancel()
    for range pubErrors { } // ignore other errors
  }()
  wg.Wait()
  close(pubErrors)
  return err
}

func indexPieces(siteDir, publicDir string) error {
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
  defer func() {
    _ = os.Chdir(cwd)
  }()
  fmt.Printf(
    "%v %v\n", sty.Org("index"), sty.Lvl(filepath.Join(publicDir, "piece")),
  )
  pfFile := filepath.Join(cwd, "pagefind")
  pfCmd := exec.Command(pfFile)
  pfCmd.Stdout = os.Stdout
  pfCmd.Stderr = os.Stderr
  return pfCmd.Run()
}

func publishStyle(siteDir, publicDir string) error {
  cwd, err := os.Getwd()
  if err != nil {
    return err
  }
  err = os.Chdir(siteDir)
  if err != nil {
    return err
  }
  defer func() {
    _ = os.Chdir(cwd)
  }()
  styleFile := filepath.Join(publicDir, "style.css")
  fmt.Printf("%v %v\n", sty.Org("publish"), sty.Lvl(styleFile))
  styleFile = strings.Join(strings.Split(styleFile, "/")[1:], "/")
  twCmd := exec.Command("bunx", "tailwindcss", "-o", styleFile)
  twCmd.Stdout = os.Stdout
  twCmd.Stderr = os.Stderr
  return twCmd.Run()
}

func catError(format string, args ...any) error {
  return fmt.Errorf("catalog: " + format, args...)
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
    return catError("%v", err)
  }
  if len(pc.Queries) > 0 {
    pieces, err = cat.QueryPieces(pieces, pc.Queries)
    if err != nil {
      return catError("%v", err)
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
  err = publishIndex(tpl, pc)
  if err != nil {
    return siteError("%v", err)
  }
  err = publishPieces(pieces, pc.TemplateDir, pc.PublicDir)
  if err != nil {
    return siteError("%v", err)
  }
  err = indexPieces(pc.SiteDir, pc.PublicDir)
  if err != nil {
    return siteError("%v", err)
  }
  err = publishCatalog(tpl, pc)
  if err != nil {
    return siteError("%v", err)
  }
  // err = publishStyle(pc.SiteDir, pc.PublicDir)
  // if err != nil {
  //   return siteError("%v", err)
  // }
  return nil
}
