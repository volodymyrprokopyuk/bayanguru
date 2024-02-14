package catalog

import (
  "fmt"
  "strings"
  "regexp"
  "io"
  "path/filepath"
  "os"
  "gopkg.in/yaml.v3"
  sty "github.com/volodymyrprokopyuk/bayan/internal/style"
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
  "arr": "Обр. ", // обробка = arrangment (default)
  "ipr": "Пер. ", // переклад = interpratation
  "hrm": "Гарм. ", // гармонізація = harmonization
}

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
    *ss = []string{str} // convert a single string into a string slice
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
  Meta bool
  RightHand, LeftHand string
}

type PieceMap map[string]Piece

type MatchStr func(str string) bool

func makeMatchStr(pattern string) (MatchStr, error) {
  isNeg := strings.HasPrefix(pattern, "^")
  pattern = regexp.QuoteMeta(strings.TrimPrefix(pattern, "^"))
  pattern = fmt.Sprintf("(?i:%v)", strings.ReplaceAll(pattern, ",", "|"))
  re, err := regexp.Compile(pattern)
  if err != nil {
    return nil, err
  }
  match := func(str string) bool {
    if isNeg {
      return !re.MatchString(str)
    } else {
      return re.MatchString(str)
    }
  }
  return match, nil
}

type MatchPiece func(piece Piece) bool

func makeMatchPiece(queries PieceQueries) (MatchPiece, error) {
  matches := make(map[string]MatchStr, len(queries))
  for opt, query := range queries {
    match, err := makeMatchStr(query)
    if err != nil {
      return nil, err
    }
    matches[opt] = match
  }
  matchSlice := func(slc StrSlice, match MatchStr, negMatch bool) bool {
    if negMatch {
      for _, str := range slc {
        if !match(str) {
          return false // first false on negative match e.g. ^frb
        }
      }
      return true
    }
    for _, str := range slc {
      if match(str) {
        return true // first true on positive match e.g. frb
      }
    }
    return false
  }
  matchPiece := func(piece Piece) bool {
    for opt, match := range matches {
      switch opt {
      case "org":
        if !match(piece.Org) {
          return false
        }
      case "sty":
        if !match(piece.Sty) {
          return false
        }
      case "gnr":
        if !match(piece.Gnr) {
          return false
        }
      case "ton":
        negMatch := strings.HasPrefix(queries["ton"], "^")
        if !matchSlice(piece.Ton, match, negMatch) {
          return false
        }
      case "frm":
        negMatch := strings.HasPrefix(queries["frm"], "^")
        if !matchSlice(piece.Frm, match, negMatch) {
          return false
        }
      case "bss":
        negMatch := strings.HasPrefix(queries["bss"], "^")
        if !matchSlice(piece.Bss, match, negMatch) {
          return false
        }
      case "lvl":
        if !match(piece.Lvl) {
          return false
        }
      case "tit":
        if !match(piece.Tit) {
          return false
        }
      case "com":
        if !match(piece.Com) {
          return false
        }
      case "arr":
        if !match(piece.Arr) {
          return false
        }
      default:
        panic(fmt.Sprintf("catalog: unknown query option %v", opt))
      }
    }
    return true
  }
  return matchPiece, nil
}

func listCatalogFiles(catDir, catQuery string) ([]string, error) {
  entries, err := os.ReadDir(catDir)
  if err != nil {
    return nil, err
  }
  match, err := makeMatchStr(catQuery)
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
  var pieces struct { Pieces []Piece `yaml:"pieces"` }
  err = dec.Decode(&pieces)
  if err != nil {
    return nil, err
  }
  return pieces.Pieces, nil
}

func addMetaToPieces(pieces []Piece) {
  for i := range pieces {
    piece := &pieces[i]
    // sub
    if sub, in := meta[piece.Sub]; in {
      piece.Sub = sub
    }
    // art
    if len(piece.Arr) > 0 {
      if len(piece.Art) > 0 {
        piece.Art = meta[piece.Art]
      } else {
        piece.Art = meta["arr"] // default: arrangement
      }
    }
    // file
    piece.File = scoreFile(piece.Tit, piece.ID)
  }
}

func readPieces(catDir, catQuery string) (PieceMap, []string, error) {
  catFiles, err := listCatalogFiles(catDir, catQuery)
  if err != nil {
    return nil, nil, err
  }
  pieceMap := make(PieceMap, 1000)
  pieceIDs := make([]string, 0, 1000) // ordered pieces for all
  for _, catFile := range catFiles {
    pieces, err := readCatalogFile(catDir, catFile)
    if err != nil {
      return nil, nil, err
    }
    addMetaToPieces(pieces)
    for _, piece := range pieces {
      pieceMap[piece.ID] = piece
      pieceIDs = append(pieceIDs, piece.ID)
    }
  }
  return pieceMap, pieceIDs, nil
}

func QueryPieces(pieces []Piece, queries PieceQueries) ([]Piece, error) {
  match, err := makeMatchPiece(queries)
  if err != nil {
    return nil, err
  }
  selPieces := make([]Piece, 0, 200)
  for _, piece := range pieces {
    if match(piece) {
      selPieces = append(selPieces, piece)
    }
  }
  return selPieces, nil
}

func Bss(bss []string, ID string) string {
  for _, b := range bss {
    switch b {
    case "stb", "pub", "frb":
      return b
    }
  }
  err := fmt.Sprintf(
    "catalog: piece %v missing bass type, expected: stb, pub, frb", ID,
  )
  panic(err)
}

var studyType = regexp.MustCompile(`^(scl|arp|in|cr|vo|pub)\d?$`)

func Stu(frmOrBss []string, ID string) string {
  for _, s := range frmOrBss {
    if m := studyType.FindStringSubmatch(s); m != nil {
      stu := m[1]
      switch stu {
      case "in":
        stu = "int"
      case "cr":
        stu = "crd"
      case "vo":
        stu = "pph"
      }
      return stu
    }
  }
  err := fmt.Sprintf(
    "catalog: piece %v missing study type, expected: scl, arp, in, cr, vo, pub",
    ID,
  )
  panic(err)
}

func PrintPiece(w io.Writer, piece Piece) {
  tit := piece.Tit
  com := fmt.Sprintf("%v %v%v", piece.Com, piece.Art, piece.Arr)
  com = strings.TrimSpace(com)
  titLen, comLen := len([]rune(tit)), len([]rune(com))
  maxTit := 53 - comLen
  if titLen > maxTit {
    tit = fmt.Sprintf("%v…", string([]rune(tit)[:maxTit - 1]))
    titLen = maxTit
  }
  spaceLen := 53 - titLen - comLen
  fmt.Fprintf(
    w, "%v %v %v %v %v %v %v %v %v\n",
    sty.ID(piece.ID), sty.Tit(tit),
    strings.Repeat(" ", spaceLen), sty.Com(com),
    sty.Org(piece.Org), sty.Org(piece.Sty), sty.Org(piece.Gnr),
    sty.Bss(Bss(piece.Bss, piece.ID)), sty.Lvl(piece.Lvl),
  )
}
