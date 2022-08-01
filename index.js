import parseArgs from "minimist"
// import { readFile, writeFile } from "fs/promises"
// import { globby } from "globby"
// import { marked } from "marked"
import { readPieces, readBooks } from "./lib/catalog.js"
import { engravePieces, engraveBooks } from "./lib/score.js"

// async function sortPages(file) {
//   const parsePage = page => parseInt(page.match(/-(\d+)\.svg$/)[1])
//   const pages = await globby(`${file}@(|-+([0-9])).svg`)
//   return pages.length > 1 ?
//     pages.sort((a, b) => parsePage(a) - parsePage(b)) : pages
// }

// async function markupScores(scores) {
//   const env = njk.configure(".", { autoescape: false })
//   env.addFilter("md", marked.parseInline)
//   const { en: t, ua } = load(await readFile("content/text.yaml"))
//   const tasks = scores.map(async score => {
//     const file = `${args.o}/${score.file}`
//     score.pages = await sortPages(file)
//     return writeFile(
//       `${file}.html`, env.render("content/score.njk", { score, t })
//     )
//   })
//   tasks.push(
//     writeFile("index.html", env.render("content/index.njk", { scores, t }))
//   )
//   return tasks
// }

async function engrave() {
  if (args.b) {
    let { books, pieces } = await readBooks()
    books = args._.length && args._[0] === "all" ?
      Object.values(books) : args._.map(id => books[id])
    await Promise.all(engraveBooks(books, pieces, args.f))
  } else {
    let pieces = await readPieces()
    pieces = args._.length && args._[0] === "all" ?
      Object.values(pieces) : args._.map(id => pieces[id])
    await Promise.all(engravePieces(pieces, args.f))
  }
}

const argsConfig = { boolean: ["b"], default: { f: "ps" } }
const args = parseArgs(process.argv.slice(2), argsConfig)
engrave()

// npm run serve
