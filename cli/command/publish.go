package command

import (
	"path/filepath"

	"github.com/spf13/cobra"
	"github.com/volodymyrprokopyuk/bayanguru/cli/site"
)

func publishCmd() *cobra.Command {
  var catalog string
  var init, book, upload bool
  var tit, com, arr, art, aut, lcs, org, sty, gnr, ton, frm, bss, lvl, ens, lyr string
  var queries = map[string]query{
    "tit": {"piece title", &tit},
    "com": {"piece composer", &com},
    "arr": {"piece arranger", &arr},
    "art": {"arrangement type", &art},
    "aut": {"lyrics author", &aut},
    "lcs": {"piece license e.g. cpl,cpr", &lcs},
    "org": {"piece origin e.g. ukr,rus", &org},
    "sty": {"piece style e.g. flk,cls", &sty},
    "gnr": {"piece genre e.g. sng,stu", &gnr},
    "ton": {"piece tonality e.g. cmj,ami", &ton},
    "frm": {"piece form e.g. mel,var", &frm},
    "bss": {"piece bass e.g. stb,frb", &bss},
    "lvl": {"piece level e.g. ela,inb", &lvl},
    "ens": {"piece ensemble e.g. duo,vc1", &ens},
    "lyr": {"piece lyrics e.g. lyr", &lyr},
  }
  cmd := &cobra.Command{
    Use: "publish",
    Short: "Publish pieces on the web",
    Long:
`Publish command uploads PDF pieces to a cloud storage, generates and publishes
a web site`,
    Example:
`bayanguru publish [-c catalog] [--upload] pieces...
bayanguru publish [-c catalog] -b books... [--query]
bayanguru publish all --query...`,
    Args: func(_ *cobra.Command, args []string) error {
      err := validateReq(catalog, args)
      if err != nil {
        return cmdError("%v", err)
      }
      err = validateQueries(queries)
      if err != nil {
        return cmdError("%v", err)
      }
      return nil
    },
    RunE: func(_ *cobra.Command, args []string) error {
      pc := site.PublishCommand{
        CatalogDir: catalogDir, BookFile: bookFile,
        PieceDir: pieceDir, BookDir: bookDir,
        Catalog: catalog,
        Init: init,
        All: len(args) == 1 && args[0] == "all",
        Book: book,
        Upload: upload,
        Queries: make(map[string]string, 10),
        SiteDir: siteDir,
        TemplateDir: filepath.Join(siteDir, "template"),
        ContentDir: filepath.Join(siteDir, "content"),
        PublicDir: filepath.Join(siteDir, "public"),
        UploadURL: "bayanguru:bayanguru/score",
        ScoreURL: "https://score.bayanguru.org/score",
        PageSize: 24,
      }
      if !pc.All {
        if book {
          pc.Books = args
        } else {
          pc.Pieces = args
        }
      }
      for opt, query := range queries {
        if len(*query.varp) > 0 {
          pc.Queries[opt] = *query.varp
        }
      }
      return site.Publish(pc)
    },
  }
  cmd.Flags().StringVarP(
    &catalog, "catalog", "c", "", "read catalog files e.g. ukr,rus, ^stu,sch",
  )
  cmd.Flags().BoolVarP(
    &init, "init", "i", false, "initialize the site",
  )
  cmd.Flags().BoolVarP(
    &book, "book", "b", false, "publish pieces from books",
  )
  cmd.Flags().BoolVarP(
    &upload, "upload", "u", false, "upload pieces to cloud storage",
  )
  for opt, query := range queries {
    cmd.Flags().StringVarP(query.varp, opt, "", "", query.short)
  }
  return cmd
}
