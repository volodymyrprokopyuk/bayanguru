package catalog

import (
  "fmt"
  "strings"
  "os"
  "regexp"
  "path/filepath"
  "gopkg.in/yaml.v3"
)

var meta = map[string]string{
  // Piece subtitle (sub)
  "ukrfs": "Українська народна пісня",
  "ukrfsvar": "Варіації на тему української народної пісні",
  "ukrfd": "Український народний танець",
  "rusfs": "Російська народна пісня",
  "rusfsvar": "Варіації на тему російської народної пісні",
  "rusfd": "Російський народний танець",
  "blrfs": "Білоруська народна пісня",
  "blrfd": "Білоруський народний танець",
  "hunfs": "Угорська народна пісня",
  "hunfd": "Угорський народний танець",
  "mdafs": "Молдавська народна пісня",
  "mdafd": "Молдавський народний танець",
  "roufs": "Румуньска народна пісня",
  "roufd": "Румунський народний танець",
  "polfs": "Польська народна пісня",
  "polfd": "Польський народний танець",
  "czefs": "Чеська народна пісня",
  "czefd": "Чеський народний танець",
  "svkfs": "Словацька народна пісня",
  "svkfd": "Словацький народний танець",
  // Piece arrangment type (art)
  "arr": "Обр.", // обробка = arrangment (default)
  "ipr": "Пер.", // переклад = interpratation
  "hrm": "Гарм.", // гармонізація = harmonization
}

type PlayCommand struct {
  Catalog string
  Book, Cycle, Random, List, All bool
  Pieces, Books []string
  Queries map[string]string
}

type MatchFunc func(s string) bool

type StrSlice []string

func (ss *StrSlice) UnmarshalYAML(node *yaml.Node) error {
  var slc []string
  err := node.Decode(&slc) // try a string slice
  if err != nil {
    var str string
    err := node.Decode(&str) // try a single string
    if err != nil {
      return err
    }
    *ss = []string{str} // convert a string to a string slice
    return nil
  }
  *ss = slc // return a string slice
  return nil
}

type Piece struct {
  ID string `yaml:"id"`
  Tit string `yaml:"tit"`
  Sub string `yaml:"sub"`
  Com string `yaml:"com"`
  Arr string `yaml:"arr"`
  Art string `yaml:"art"`
  Src string `yaml:"src"`
  Org string `yaml:"org"`
  Sty string `yaml:"sty"`
  Gnr string `yaml:"gnr"`
  Ton StrSlice `yaml:"ton"`
  Frm StrSlice `yaml:"frm"`
  Bss StrSlice `yaml:"bss"`
  Lvl string `yaml:"lvl"`
  File string
}

func catError(format string, vals ...any) error {
  return fmt.Errorf("catalog: " + format, vals...)
}

func makeMatch(pattern string) (MatchFunc, error) {
  isNeg := strings.HasPrefix(pattern, "^")
  pattern = regexp.QuoteMeta(strings.TrimPrefix(pattern, "^"))
  r, err := regexp.Compile(strings.ReplaceAll(pattern, ",", "|"))
  if err != nil {
    return nil, err
  }
  match := func (s string) bool {
    if isNeg {
      return !r.MatchString(s)
    } else {
      return r.MatchString(s)
    }
  }
  return match, nil
}

func listCatalogFiles(catDir, catQuery string) ([]string, error) {
  entries, err := os.ReadDir(catDir)
  if err != nil {
    return nil, err
  }
  match, err := makeMatch(catQuery)
  if err != nil {
    return nil, err
  }
  files := make([]string, 0, 50)
  for _, entry := range entries {
    if !entry.IsDir() && strings.HasSuffix(entry.Name(), ".yaml") &&
      match(strings.TrimSuffix(entry.Name(), ".yaml")) {
      files = append(files, entry.Name())
    }
  }
  return files, nil
}

func readCatalogFile(catDir, catFile string) ([]Piece, error) {
  file, err := os.Open(filepath.Join(catDir, catFile))
  if err != nil {
    return nil, err
  }
  defer file.Close()
  dec := yaml.NewDecoder(file)
  pieces := struct { Pieces []Piece `yaml:"pieces"` }{}
  err = dec.Decode(&pieces)
  if err != nil {
    return nil, err
  }
  return pieces.Pieces, nil
}

func addMetaToPieces(pieces []Piece) {
  cleanTit := regexp.MustCompile(`[',\.!\?]`)
  for i := range pieces {
    piece := &pieces[i]
    // sub
    if sub, ok := meta[piece.Sub]; ok {
      piece.Sub = sub
    }
    // art
    if len(piece.Arr) > 0 {
      if len(piece.Art) > 0 {
        piece.Art = meta[piece.Art]
      } else {
        piece.Art = meta["arr"]
      }
    }
    // file
    tit := strings.ReplaceAll(
      cleanTit.ReplaceAllLiteralString(piece.Tit, ""), " ", "-",
    )
    piece.File = fmt.Sprintf("%v-%v", tit, piece.ID)
  }
}

func readPieces(catDir, catQuery string) (map[string]Piece, error) {
  catFiles, err := listCatalogFiles(catDir, catQuery)
  if err != nil {
    return nil, err
  }
  idPiece := make(map[string]Piece, 1000)
  for _, catFile := range catFiles {
    pieces, err := readCatalogFile(catDir, catFile)
    if err != nil {
      return nil, err
    }
    addMetaToPieces(pieces)
    for _, piece := range pieces {
      idPiece[piece.ID] = piece
    }
  }
  return idPiece, nil
}

func Play(pc PlayCommand) error {
  pieces, err := readPieces("catalog", pc.Catalog)
  if err != nil {
    return catError("%v", err)
  }
  for _, piece := range pieces {
    fmt.Println(piece)
  }
  return nil
}
