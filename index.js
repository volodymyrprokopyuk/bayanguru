#!/usr/bin/env node

import parseArgs from "minimist"
import { mkdir, readFile, writeFile, copyFile, access } from "fs/promises"
import { chalk } from "zx"
import { readPieces, readBooks } from "./lib/catalog.js"
import { engravePieces, engraveBooks } from "./lib/score.js"

async function pieceInit(id) {
  const { src, file } = (await readPieces(args))[id]
  await mkdir(`source/${src}`, { recursive: true })
  const path = `source/${src}/${file}.lys`
  try { await access(path); console.log(`skipping ${path} already exists`) }
  catch { await copyFile("source/template/piece-init.lys", path) }
}

async function engrave() {
  if (args.b) {
    let { books, pieces } = await readBooks(args)
    console.log(
      chalk.blue("Catalog:"),
      chalk.yellow.bold(`${Object.values(pieces).length} pieces`)
    )
    books = args._.length && args._[0] === "all" ?
      Object.values(books) : args._.map(id => books[id])
    await Promise.all(engraveBooks(books, pieces, args))
  } else {
    let pieces = await readPieces(args)
    console.log(
      chalk.blue("Catalog:"),
      chalk.yellow.bold(`${Object.values(pieces).length} pieces`)
    )
    pieces = args._.length && args._[0] === "all" ?
      Object.values(pieces) : args._.map(id => pieces[id])
    await Promise.all(engravePieces(pieces, args))
  }
}

const argsConfig = {
  boolean: ["b", "nometa", "lint", "relax", "dry"],
  alias: { c: "catalog", i: "init", b: "book" },
  default: { c: "", f: "pdf" } // TODO: remove f, review c
}
const args = parseArgs(process.argv.slice(2), argsConfig)
if (args.i) { await pieceInit(args.i) } else { await engrave() }
