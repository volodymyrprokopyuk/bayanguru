package catalog

import (
  "fmt"
  "strings"
  "os"
  "regexp"
)

type PlayCommand struct {
  Catalog string
  Book, Cycle, Random, List, All bool
  Pieces, Books []string
  Queries map[string]string
}

type MatchFunc func(s string) bool

func catError(format string, vals ...any) error {
  return fmt.Errorf("catalog: " + format, vals...)
}

func makeMatch(pattern string) (MatchFunc, error) {
  isNeg := strings.HasPrefix(pattern, "^")
  pattern = regexp.QuoteMeta(strings.TrimPrefix(pattern, "^"))
  r, err := regexp.Compile(strings.ReplaceAll(pattern, ",", "|"))
  if err != nil {
    return nil, catError("%v", err)
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

func listCatalog(dir, query string) ([]string, error) {
  entries, err := os.ReadDir(dir)
  if err != nil {
    return nil, catError("%v", err)
  }
  match, err := makeMatch(query)
  if err != nil {
    return nil, catError("%v", err)
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

func Play(pc PlayCommand) error {
  files, err := listCatalog("catalog", pc.Catalog)
  if err != nil {
    return catError("%v", err)
  }
  fmt.Println(files)
  return nil
}
