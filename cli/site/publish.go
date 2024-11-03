package site

import (
	"bytes"
	"context"
	"fmt"
	"io"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"runtime"
	"strings"
	"sync"
	"text/template"

	"github.com/volodymyrprokopyuk/bayanguru/cli/catalog"
	"github.com/volodymyrprokopyuk/bayanguru/cli/style"
	"github.com/yuin/goldmark"
	"gopkg.in/yaml.v3"
)

type PublishCommand struct {
  CatalogDir, BookFile, PieceDir, BookDir string
  Catalog string
  Init, All, Book, Upload bool
  Pieces, Books []string
  Queries catalog.PieceQueries
  SiteDir, TemplateDir, ContentDir, PublicDir string
  UploadURL, ScoreURL, PieceURL string
  PageSize int
}

func copyFile(src, dst string) (int64, error) {
  srcFile, err := os.Open(src)
  if err != nil {
    return 0, err
  }
  defer srcFile.Close()
  dstFile, err := os.Create(dst)
  if err != nil {
    return 0, err
  }
  defer dstFile.Close()
  return io.Copy(dstFile, srcFile)
}

func engraveImage(siteDir, publicDir, image string) error {
  lyImage := filepath.Join(siteDir, image + ".ly")
  svgImage := filepath.Join(publicDir, image)
  fmt.Printf("%v %v\n", style.Org("engrave"), style.Lvl(svgImage + ".svg"))
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
    "scale", "arpeggio", "interval", "chord", //"polyphony",
  },
  "composer": {
    "composer",
  },
  "bass": {
    "standard-bass", "pure-bass", "free-bass",
  },
  "level": {
    "elementary-a", "elementary-b", "elementary-c",
  },
  // "lyrics": {
  //   "lyrics",
  // },
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
    fmt.Printf("%v %v\n", style.Org("init"), style.Lvl(d))
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

var reRemovePar = regexp.MustCompile(`<p>|</p>`)

var tplFuncs = template.FuncMap{
  "join": func(sep string, slc []string) string {
    return strings.Join(slc, sep)
  },
  "md": func(md string) string {
    var htmlBuf bytes.Buffer
    err := goldmark.Convert([]byte(md), &htmlBuf)
    if err != nil {
      panic(err)
    }
    return reRemovePar.ReplaceAllString(htmlBuf.String(), "")
  },
}

func makeTemplate(templateDir string) (*template.Template, error) {
  tpl := template.New("page")
  tpl.Funcs(tplFuncs)
  pageFile := filepath.Join(templateDir, "page.html")
  return tpl.ParseFiles(pageFile)
}

func publishFile(
  w io.Writer, tpl *template.Template, publicDir, publicFile string, data any,
) error {
  file := filepath.Join(publicDir, publicFile + ".html")
  if !strings.Contains(file, "/catalog/") {
    fmt.Fprintf(w, "%v %v\n", style.Org("publish"), style.Lvl(file))
  }
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

type SiteContent struct {
  Purpose []MetaEntry `yaml:"purpose"`
  UserFeatures []MetaEntry `yaml:"userFeatures"`
  ContribFeatures []MetaEntry `yaml:"contribFeatures"`
}

func readSiteContent(contentDir, contentFile string) (SiteContent, error) {
  contentFile = filepath.Join(contentDir, contentFile)
  file, err := os.Open(contentFile)
  if err != nil {
    return SiteContent{}, err
  }
  defer file.Close()
  var content SiteContent
  err = yaml.NewDecoder(file).Decode(&content)
  if err != nil {
    return SiteContent{}, err
  }
  return content, nil
}

type CatalogMeta struct {
  Purpose MetaEntry `yaml:"purpose"`
  Meta []struct{
    Tit MetaEntry `yaml:"tit"`
    Sec []struct {
      Tit MetaEntry `yaml:"tit"`
      Sub []MetaEntry `yaml:"sub"`
    } `yaml:"sec"`
  } `yaml:"meta"`
}

func readCatalogMeta(contentDir, metaFile string) (CatalogMeta, error) {
  metaFile = filepath.Join(contentDir, metaFile)
  file, err := os.Open(metaFile)
  if err != nil {
    return CatalogMeta{}, err
  }
  defer file.Close()
  var meta CatalogMeta
  err = yaml.NewDecoder(file).Decode(&meta)
  if err != nil {
    return CatalogMeta{}, err
  }
  return meta, nil
}

func publishIndex(tpl *template.Template, pc PublishCommand) error {
  indexFile := filepath.Join(pc.TemplateDir, "index.html")
  _, err := tpl.ParseFiles(indexFile)
  if err != nil {
    return err
  }
  siteContent, err := readSiteContent(pc.ContentDir, "site-content.yaml")
  if err != nil {
    return err
  }
  catalogMeta, err := readCatalogMeta(pc.ContentDir, "catalog-meta.yaml")
  if err != nil {
    return err
  }
  catalogGroups := []Link{
    {URL: "/catalog/origin/ukrainian/1", Title: "By origin | За країною"},
    {URL: "/catalog/style/folk/1", Title: "By style | За стилем"},
    {URL: "/catalog/genre/song/1", Title: "By genre | За жанром"},
    {URL: "/catalog/composer/composer/1", Title: "By compos. | За композ."},
    {URL: "/catalog/study-stb/scale/1", Title: "Study stb | Етюди stb"},
    {URL: "/catalog/study-frb/scale/1", Title: "Study frb | Етюди frb"},
    {URL: "/catalog/bass/standard-bass/1", Title: "By bass | За басом"},
    {URL: "/catalog/level/elementary-c/1", Title: "By level | За складністю"},
    // {URL: "/catalog/lyrics/lyrics/1", Title: "Lyrics | Пісні"},
  }
  indexData := struct {
    CatalogGroups []Link
    SiteContent SiteContent
    CatalogMeta CatalogMeta
  }{catalogGroups, siteContent, catalogMeta}
  return publishFile(os.Stdout, tpl, pc.PublicDir, "index", indexData)
}

func uploadPiece(w io.Writer, pieceFile, uploadURL string) error {
  file := fmt.Sprintf("piece/%v.pdf", pieceFile)
  fmt.Fprintf(w, "%v %v\n", style.Org("upload"), style.Lvl(file))
  copyCmd := exec.Command(
    "rclone", "copy", "--s3-no-check-bucket", file, uploadURL,
  )
  copyCmd.Stdout = os.Stdout
  copyCmd.Stderr = os.Stderr
  return copyCmd.Run()
}

func receiveAndPublishPieces(
  ctx context.Context, pieceCh <-chan catalog.Piece, errorCh chan<- error,
  tplPool *sync.Pool, pc PublishCommand,
) {
  defer close(errorCh)
  pieceDir := filepath.Join(pc.PublicDir, "piece")
  var w strings.Builder
  for {
    select {
    case <- ctx.Done():
      return
    case piece, open := <- pieceCh:
      if !open {
        return
      }
      w.Reset()
      if pc.Upload {
        err := uploadPiece(&w, piece.File, pc.UploadURL)
        if err != nil {
          errorCh <- err
          pieceCh = nil
          break;
        }
      }
      piece.URL = fmt.Sprintf("%v/%v.pdf", pc.ScoreURL, piece.File)
      tpl := tplPool.Get().(*template.Template)
      pieceData := struct { Piece catalog.Piece }{piece}
      err := publishFile(&w, tpl, pieceDir, piece.File, pieceData)
      fmt.Print(w.String())
      tplPool.Put(tpl)
      if err != nil {
        errorCh <- err
        pieceCh = nil // do not publish pieces after an error
      }
    }
  }
}

func publishPieces(pieces []catalog.Piece, pc PublishCommand) error {
  tpl, err := makeTemplate(pc.TemplateDir) // validate template
  if err != nil {
    return err
  }
  pieceFile := filepath.Join(pc.TemplateDir, "piece.html")
  _, err = tpl.ParseFiles(pieceFile) // validate template
  if err != nil {
    return err
  }
  var tplPool = sync.Pool{
    New: func() any {
      tpl, _ := makeTemplate(pc.TemplateDir)
      _, _ = tpl.ParseFiles(pieceFile)
      return tpl
    },
  }
  ctx, cancel := context.WithCancel(context.Background())
  defer cancel()
  n := min(len(pieces), runtime.GOMAXPROCS(0))
  pieceCh := make(chan catalog.Piece)
  errorChs := make([]chan error, n)
  for i := range n { // fan-out pieces
    errorChs[i] = make(chan error)
    go receiveAndPublishPieces(ctx, pieceCh, errorChs[i], &tplPool, pc)
  }
  errorCh := catalog.FanIn(errorChs) // fan-in pieces
  go func() {
    pieces: for _, piece := range pieces {
      select {
      case <- ctx.Done():
        break pieces
      case pieceCh <- piece:
      }
    }
    close(pieceCh)
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

func indexPieces(siteDir, publicDir string) error {
  fmt.Printf(
    "%v %v\n", style.Org("index"), style.Lvl(publicDir + "/piece/..."),
  )
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
  pfFile := filepath.Join(cwd, "pagefind")
  pfCmd := exec.Command(pfFile)
  // pfCmd.Stdout = os.Stdout
  // pfCmd.Stderr = os.Stderr
  return pfCmd.Run()
}

func publishStyle(siteDir, templateDir, publicDir string) error {
  twConfig := filepath.Join(siteDir, "tailwind.config.js")
  inStyle := filepath.Join(templateDir, "style.css")
  outStyle := filepath.Join(publicDir, "tw.css")
  fmt.Printf("%v %v\n", style.Org("publish"), style.Lvl(outStyle))
  twCmd := exec.Command(
    "bunx", "tailwindcss", "--config", twConfig,
    "--input", inStyle, "--output", outStyle, "--minify",
  )
  // twCmd.Stdout = os.Stdout
  // twCmd.Stderr = os.Stderr
  return twCmd.Run()
}

func catError(format string, args ...any) error {
  return fmt.Errorf("catalog: " + format, args...)
}

func siteError(format string, args ...any) error {
  return fmt.Errorf("site: " + format, args...)
}

func Publish(pc PublishCommand) error {
  pieces, _, catLen, err := catalog.ReadPiecesAndBooks(
    pc.CatalogDir, pc.Catalog, pc.Pieces,
    pc.BookFile, pc.Books, pc.Book, pc.All,
  )
  if err != nil {
    return catError("%v", err)
  }
  pc.Queries["lcs"] = "^cpr" // exclude lcs: cpr pieces
  if len(pc.Queries) > 0 {
    pieces, err = catalog.QueryPieces(pieces, pc.Queries)
    if err != nil {
      return catError("%v", err)
    }
  }
  catalog.PrintStat(catLen, len(pieces))
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
  err = publishPieces(pieces, pc)
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
  err = publishStyle(pc.SiteDir, pc.TemplateDir, pc.PublicDir)
  if err != nil {
    return siteError("%v", err)
  }
  return nil
}

