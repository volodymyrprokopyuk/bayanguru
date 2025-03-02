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
	"github.com/yuin/goldmark"
	"gopkg.in/yaml.v3"
)

type Link struct {
  Tit, URL string
  Disabled bool
}

type Section struct {
  Name string
  Tit string
  Sub []string
}

var sections2 = []Section{
  {
    Name: "origin", Tit: "Origin | Країна", Sub: []string{
      "ukrainian", "russian", "belarusian", "hungarian", "extra", "european",
    },
  }, {
    Name: "style", Tit: "Style | Стиль", Sub: []string{
      "folk", "custom", "classic",
    },
  }, {
    Name: "genre", Tit: "Genre | Жанр", Sub: []string{
      "song", "dance", "piece",
    },
  }, {
    Name: "composer", Tit: "Composer | Композитор", Sub: []string{
      "composer",
    },
  }, {
    Name: "study-stb", Tit: "Study | Етюди stb", Sub: []string{
      "scale", "arpeggio", "interval", "chord", "polyphony", "left-hand",
    },
  }, {
    Name: "study-frb", Tit: "Study | Етюди frb", Sub: []string{
      "scale", "arpeggio", "interval", "chord", //"polyphony",
    },
  }, {
    Name: "bass", Tit: "Bass | Бас", Sub: []string{
      "standard-bass", "pure-bass", "free-bass",
    },
  }, {
    Name: "level", Tit: "Level | Рівень", Sub: []string{
      "elementary-a", "elementary-b", "elementary-c",
    },
  }, {
    Name: "lyrics", Tit: "Lyrics | Пісні", Sub: []string{
      "lyrics",
    },
  },
}

var sections = map[string][]string{
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
  "lyrics": {
    "lyrics",
  },
}

type publishCommand struct {
  catalog.BaseCmd
  init, upload bool
  siteDir, templateDir, contentDir, publicDir string
  uploadURL, scoreURL, pieceURL string
  pageSize int
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
  fmt.Printf(
    "%s %s\n", catalog.BlueTit("engrave"), catalog.BlueSub(svgImage + ".svg"),
  )
  lyCmd := exec.Command(
    "lilypond", "-d", "backend=cairo", "-l", "WARN", "-f", "svg",
    "-o", svgImage, lyImage,
  )
  lyCmd.Stdout = os.Stdout
  lyCmd.Stderr = os.Stderr
  return lyCmd.Run()
}

func initSite(siteDir, publicDir string) error {
  dirs := make([]string, 0, 100)
  dirs = append(dirs, "image", "piece")
  for _, sec := range sections2 {
    for _, sub := range sec.Sub {
      dirs = append(dirs, filepath.Join("catalog", sec.Name, sub))
    }
  }
  for _, dir := range dirs {
    d := filepath.Join(publicDir, dir)
    fmt.Printf("%s %s\n", catalog.BlueTit("init"), catalog.BlueSub(d))
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

func markdown(md string) string {
  var html bytes.Buffer
  err := goldmark.Convert([]byte(md), &html)
  if err != nil {
    panic(err)
  }
  return reRemovePar.ReplaceAllString(html.String(), "")
}

func strJoin(sep string, slc []string) string {
  return strings.Join(slc, sep)
}

func makeTemplate(templateDir, targetFile string) (*template.Template, error) {
  tpl := template.New("page")
  tpl.Funcs(template.FuncMap{"md": markdown, "join": strJoin})
  pageFile := filepath.Join(templateDir, "page.html")
  targetFile = filepath.Join(templateDir, targetFile)
  return tpl.ParseFiles(pageFile, targetFile)
}

func templatePool(templateDir, targetFile string) (*sync.Pool, error) {
  _, err := makeTemplate(templateDir, targetFile) // Validate HTML templates
  if err != nil {
    return nil, err
  }
  var tplPool = sync.Pool{
    New: func() any {
      tpl, _ := makeTemplate(templateDir, targetFile)
      return tpl
    },
  }
  return &tplPool, nil
}

func publishFile(
  w io.Writer, tpl *template.Template, publicDir, publicFile string, data any,
) error {
  file := filepath.Join(publicDir, publicFile + ".html")
  if !strings.Contains(file, "/catalog/") {
    fmt.Fprintf(w, "%s %s\n", catalog.BlueTit("publish"), catalog.BlueSub(file))
  }
  htmlFile, err := os.Create(file) // Overwrites an existing file
  if err != nil {
    return err
  }
  defer htmlFile.Close()
  return tpl.ExecuteTemplate(htmlFile, "page.html", data)
}

type ContentEntry struct {
  Name string `yaml:"name"`
  Eng string `yaml:"eng"`
  Ukr string `yaml:"ukr"`
}

type SiteContent struct {
  Purpose []ContentEntry `yaml:"purpose"`
  UserFeats []ContentEntry `yaml:"userFeats"`
  ContribFeats []ContentEntry `yaml:"contribFeats"`
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
  Purpose ContentEntry `yaml:"purpose"`
  Meta []struct{
    Tit ContentEntry `yaml:"tit"`
    Sec []struct {
      Tit ContentEntry `yaml:"tit"`
      Sub []ContentEntry `yaml:"sub"`
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

func publishIndex(pc publishCommand) error {
  tpl, err := makeTemplate(pc.templateDir, "index.html")
  if err != nil {
    return err
  }
  sectionLinks := make([]Link, len(sections2))
  for i, sec := range sections2 {
    link := Link{
      Tit: sec.Tit,
      URL: filepath.Join("/", "catalog", sec.Name, sec.Sub[0], "1"),
    }
    sectionLinks[i] = link
  }
  siteContent, err := readSiteContent(pc.contentDir, "site-content.yaml")
  if err != nil {
    return err
  }
  catalogMeta, err := readCatalogMeta(pc.contentDir, "catalog-meta.yaml")
  if err != nil {
    return err
  }
  indexData := struct {
    SectionLinks []Link
    SiteContent SiteContent
    CatalogMeta CatalogMeta
  }{sectionLinks, siteContent, catalogMeta}
  return publishFile(os.Stdout, tpl, pc.publicDir, "index", indexData)
}

func uploadPiece(w io.Writer, pieceFile, uploadURL string) error {
  file := fmt.Sprintf("piece/%s.pdf", pieceFile)
  fmt.Fprintf(w, "%s %s\n", catalog.BlueTit("upload"), catalog.BlueSub(file))
  rclCmd := exec.Command(
    "rclone", "copy", "--s3-no-check-bucket", file, uploadURL,
  )
  rclCmd.Stdout = w
  rclCmd.Stderr = w
  return rclCmd.Run()
}

func fanOutPublishPieces(
  ctx context.Context, wg *sync.WaitGroup,
  chPieces <-chan catalog.Piece, chErrors chan<- error,
  tplPool *sync.Pool, pc publishCommand,
) {
  defer wg.Done()
  var w strings.Builder
  pieceDir := filepath.Join(pc.publicDir, "piece")
  tpl := tplPool.Get().(*template.Template)
  defer tplPool.Put(tpl)
  for {
    select {
    case <- ctx.Done():
      return
    case piece, open := <- chPieces:
      if !open {
        return
      }
      w.Reset()
      if pc.upload {
        err := uploadPiece(&w, piece.File, pc.uploadURL)
        if err != nil {
          chErrors <- err
          return
        }
      }
      piece.URL = fmt.Sprintf("%s/%s.pdf", pc.scoreURL, piece.File)
      pieceData := struct { Piece catalog.Piece }{piece}
      err := publishFile(&w, tpl, pieceDir, piece.File, pieceData)
      fmt.Print(w.String())
      if err != nil {
        chErrors <- err
        return
      }
    }
  }
}

func publishPieces(pieces []catalog.Piece, pc publishCommand) error {
  tplPool, err := templatePool(pc.templateDir, "piece.html")
  if err != nil {
    return err
  }
  n := min(len(pieces), runtime.GOMAXPROCS(0))
  ctx, cancel := context.WithCancel(context.Background())
  defer cancel()
  chPieces, chErrors := make(chan catalog.Piece), make(chan error)
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
    go fanOutPublishPieces(ctx, &wg, chPieces, chErrors, tplPool, pc)
  }
  pieces: for _, piece := range pieces {
    select {
    case <- ctx.Done():
      break pieces
    case chPieces <- piece:
    }
  }
  close(chPieces)
  wg.Wait()
  close(chErrors)
  ewg.Wait()
  return err
}

func indexPieces(siteDir, publicDir string) error {
  fmt.Printf(
    "%v %v\n", catalog.GreenSub("index"), catalog.BlueSub(publicDir + "/piece/..."),
  )
  pfDir := filepath.Join(publicDir, "pagefind")
  err := os.RemoveAll(pfDir) // removes an existing index
  if err != nil {
    return err
  }
  pfCmd := exec.Command(
    "./pagefind", "--quiet", "--site", publicDir, "--glob", "piece/*.html",
    "--root-selector", "main", "--output-path", pfDir,
  )
  pfCmd.Stdout = os.Stdout
  pfCmd.Stderr = os.Stderr
  return pfCmd.Run()
}

func publishStyle(templateDir, publicDir string) error {
  inStyle := filepath.Join(templateDir, "style.css")
  outStyle := filepath.Join(publicDir, "tw.css")
  fmt.Printf("%v %v\n", catalog.GreenSub("publish"), catalog.BlueSub(outStyle))
  twCmd := exec.Command(
    "bunx", "@tailwindcss/cli", "--input", inStyle, "--output", outStyle, "--minify",
  )
  twCmd.Stdout = os.Stdout
  twCmd.Stderr = os.Stderr
  return twCmd.Run()
}

func publish(pc publishCommand) error {
  pieces, _, catLen, err := catalog.ReadPiecesAndBooks(pc.BaseCmd)
  if err != nil {
    return err
  }
  pc.Queries["lcs"] = "^cpr" // Exclude copyrighted pieces from publishing
  if len(pc.Queries) > 0 {
    pieces, err = catalog.QueryPieces(pieces, pc.Queries)
    if err != nil {
      return err
    }
  }
  catalog.PrintStat(catLen, len(pieces))
  if pc.init {
    err := initSite(pc.siteDir, pc.publicDir)
    if err != nil {
      return err
    }
  }
  err = publishIndex(pc)
  if err != nil {
    return err
  }
  err = publishPieces(pieces, pc)
  if err != nil {
    return err
  }
  err = indexPieces(pc.siteDir, pc.publicDir)
  if err != nil {
    return err
  }
  err = publishCatalog(pc)
  if err != nil {
    return err
  }
  err = publishStyle(pc.templateDir, pc.publicDir)
  if err != nil {
    return err
  }
  return nil
}

