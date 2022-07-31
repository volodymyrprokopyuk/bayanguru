import { readFile, writeFile } from "fs/promises"
import parseArgs from "minimist"
import { globby } from "globby"
import { load } from "js-yaml"
import { marked } from "marked"
import { engravePieces, engraveBooks } from "./score.js"

async function sortPages(file) {
  const parsePage = page => parseInt(page.match(/-(\d+)\.svg$/)[1])
  const pages = await globby(`${file}@(|-+([0-9])).svg`)
  return pages.length > 1 ?
    pages.sort((a, b) => parsePage(a) - parsePage(b)) : pages
}

async function markupScores(scores) {
  const env = njk.configure(".", { autoescape: false })
  env.addFilter("md", marked.parseInline)
  const { en: t, ua } = load(await readFile("content/text.yaml"))
  const tasks = scores.map(async score => {
    const file = `${args.o}/${score.file}`
    score.pages = await sortPages(file)
    return writeFile(
      `${file}.html`, env.render("content/score.njk", { score, t })
    )
  })
  tasks.push(
    writeFile("index.html", env.render("content/index.njk", { scores, t }))
  )
  return tasks
}

async function engraveAndMarkup() {
  let { pieces, books } = load(await readFile(args.c))
  if (args.b) {
    books = args._.length && args._[0] === "all" ? books :
      books.filter(book => args._.some(arg => book.file.match(arg)))
    await Promise.all(engraveBooks(books, pieces, args.f))
    if (args.f.match("svg")) { await Promise.all(await markupScores(books)) }
  } else {
    pieces = args._.length && args._[0] === "all" ? pieces :
      pieces.filter(piece => args._.some(arg => piece.file.match(arg)))
    await Promise.all(engravePieces(pieces, args.f))
    if (args.f.match("svg")) { await Promise.all(await markupScores(pieces)) }
  }
}

const argsConfig = {
  boolean: ["b"],
  default: { c: "catalog/ukrainian.yaml", i: "source", o: "score", f: "ps" }
}
const args = parseArgs(process.argv.slice(2), argsConfig)
engraveAndMarkup()

// npm run serve
