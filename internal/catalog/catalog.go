package catalog

import (
  "fmt"
  "strings"
  "os"
  "regexp"
  "gopkg.in/yaml.v3"
)

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
  Id string `yaml:"id"`
  Tit string `yaml:"tit"`
  Sub string `yaml:"sub"`
  Com string `yaml:"com"`
  Arr string `yaml:"arr"`
  Art string `yaml:"art"`
  Org string `yaml:"org"`
  Sty string `yaml:"sty"`
  Gnr string `yaml:"gnr"`
  Ton StrSlice `yaml:"ton"`
  Frm StrSlice `yaml:"frm"`
  Bss StrSlice `yaml:"bss"`
  Lvl string `yaml:"lvl"`
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

func listCatalogFiles(dir, query string) ([]string, error) {
  entries, err := os.ReadDir(dir)
  if err != nil {
    return nil, err
  }
  match, err := makeMatch(query)
  if err != nil {
    return nil, err
  }
  files := make([]string, 0, 40)
  for _, entry := range entries {
    if !entry.IsDir() && strings.HasSuffix(entry.Name(), ".yaml") &&
      match(strings.TrimSuffix(entry.Name(), ".yaml")) {
      files = append(files, entry.Name())
    }
  }
  return files, nil
}

func readCatalogFile(path string) ([]Piece, error) {
  file, err := os.Open(path)
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

func Play(pc PlayCommand) error {

  files, err := listCatalogFiles("catalog", pc.Catalog)
  if err != nil {
    return catError("%v", err)
  }
  fmt.Println(files)

  pieces, err := readCatalogFile("catalog/stu-cls.yaml")
  if err != nil {
    return catError("%v", err)
  }
  fmt.Printf("%+v\n", pieces)

  return nil
}
