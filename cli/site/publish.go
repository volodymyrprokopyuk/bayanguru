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

type publishCommand struct {
  catalog.BaseCmd
  init, upload bool
  siteDir, templateDir, contentDir, publicDir string
  uploadURL, scoreURL, pieceURL string
  pageSize int
}

func copyFile(src, dst string) (int64, error) {
  srcFile, err := os.Open(src) //nolint:gosec,gocritic
  if err != nil {
    return 0, err
  }
  defer func() {
    _ = srcFile.Close()
  }()
  dstFile, err := os.Create(dst) //nolint:gosec,gocritic
  if err != nil {
    return 0, err
  }
  defer func() {
    _ = dstFile.Close()
  }()
  return io.Copy(dstFile, srcFile)
}

func engraveImage(siteDir, publicDir, image string) error {
  lyImage := filepath.Join(siteDir, image + ".ly")
  svgImage := filepath.Join(publicDir, image)
  fmt.Printf(
    "%s %s\n", catalog.BlueTit("engrave"), catalog.BlueSub(svgImage + ".svg"),
  )
  lyCmd := exec.Command( //nolint:gosec,gocritic
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
  for _, sec := range sections {
    for _, sub := range sec.Sub {
      dirs = append(dirs, filepath.Join("catalog", sec.Name, sub.Name))
    }
  }
  for _, dir := range dirs {
    d := filepath.Join(publicDir, dir)
    fmt.Printf("%s %s\n", catalog.BlueTit("init"), catalog.BlueSub(d))
    err := os.MkdirAll(d, 0o755) //nolint:gosec,gocritic
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
    _, _ = fmt.Fprintf(
      w, "%s %s\n", catalog.BlueTit("publish"), catalog.BlueSub(file),
    )
  }
  // Overwrites an existing file
  htmlFile, err := os.Create(file) //nolint:gosec,gocritic
  if err != nil {
    return err
  }
  defer func() {
    _ = htmlFile.Close()
  }()
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
  file, err := os.Open(contentFile) //nolint:gosec,gocritic
  if err != nil {
    return SiteContent{}, err
  }
  defer func() {
    _ = file.Close()
  }()
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
  file, err := os.Open(metaFile) //nolint:gosec,gocritic
  if err != nil {
    return CatalogMeta{}, err
  }
  defer func() {
    _ = file.Close()
  }()
  var meta CatalogMeta
  err = yaml.NewDecoder(file).Decode(&meta)
  if err != nil {
    return CatalogMeta{}, err
  }
  return meta, nil
}

func indexSectionLinks(sections []Section) []Link {
  links := make([]Link, len(sections))
  for i, sec := range sections {
    //nolint:gocritic
    url := filepath.Join("/catalog", sec.Name, sec.Sub[0].Name, "1")
    links[i] = Link{Tit: sec.Tit, URL: url}
  }
  return links
}

func publishIndex(pc publishCommand) error {
  tpl, err := makeTemplate(pc.templateDir, "index.html")
  if err != nil {
    return err
  }
  sectionLinks := indexSectionLinks(sections)
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
  }{
    SectionLinks: sectionLinks,
    SiteContent: siteContent,
    CatalogMeta: catalogMeta,
  }
  return publishFile(os.Stdout, tpl, pc.publicDir, "index", indexData)
}

func uploadPiece(w io.Writer, pieceFile, uploadURL string) error {
  file := fmt.Sprintf("piece/%s.pdf", pieceFile)
  _, _ = fmt.Fprintf(
    w, "%s %s\n", catalog.BlueTit("upload"), catalog.BlueSub(file),
  )
  rclCmd := exec.Command( //nolint:gosec,gocritic
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
  tpl := tplPool.Get().(*template.Template) //nolint:errcheck,gocritic
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
      pieceData := struct { Piece catalog.Piece }{Piece: piece}
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
  chPieces, chErrors := make(chan catalog.Piece), make(chan error, n)
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

func indexPieces(publicDir string) error {
  fmt.Printf(
    "%s %s\n", catalog.BlueTit("index"),
    catalog.BlueSub(publicDir + "/piece/..."),
  )
  pfDir := filepath.Join(publicDir, "pagefind")
  err := os.RemoveAll(pfDir) // Remove the existing index
  if err != nil {
    return err
  }
  pfCmd := exec.Command( //nolint:gosec,gocritic
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
  fmt.Printf("%s %s\n", catalog.BlueTit("publish"), catalog.BlueSub(outStyle))
  twCmd := exec.Command( //nolint:gosec,gocritic
    "bunx", "@tailwindcss/cli", "--input", inStyle,
    "--output", outStyle, "--minify",
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
  //nolint:gocritic
  // pc.Queries["lcs"] = "^cpr" // Exclude copyrighted pieces from publishing
  if len(pc.Queries) > 0 {
    pieces, err = catalog.QueryPieces(pieces, pc.Queries)
    if err != nil {
      return err
    }
  }
  if pc.init {
    err = initSite(pc.siteDir, pc.publicDir)
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
  err = indexPieces(pc.publicDir)
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
  catalog.PrintStat(catLen, len(pieces))
  return nil
}
