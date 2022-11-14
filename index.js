#!/usr/bin/env node

import parseArgs from "minimist"
import { mkdir, readFile, writeFile, copyFile, access } from "fs/promises"
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

async function pieceInit(id) {
  const { src, file } = (await readPieces(args))[id]
  await mkdir(`source/${src}`, { recursive: true })
  const path = `source/${src}/${file}.lys`
  try { await access(path); console.log(`skipping ${path} already exists`) }
  catch { await copyFile("source/piece.lys", path) }
}

async function engrave() {
  if (args.b) {
    let { books, pieces } = await readBooks(args)
    books = args._.length && args._[0] === "all" ?
      Object.values(books) : args._.map(id => books[id])
    await Promise.all(engraveBooks(books, pieces, args))
  } else {
    let pieces = await readPieces(args)
    pieces = args._.length && args._[0] === "all" ?
      Object.values(pieces) : args._.map(id => pieces[id])
    await Promise.all(engravePieces(pieces, args))
  }
}

const argsConfig = { boolean: ["b", "m"], default: { c: "", f: "pdf" } }
const args = parseArgs(process.argv.slice(2), argsConfig)
if (args.i) { await pieceInit(args.i) } else { await engrave() }

// npm run serve
