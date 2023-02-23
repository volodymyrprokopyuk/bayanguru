#!/usr/bin/env node

import { cpus } from "os"
import parseArgs from "minimist"
import { readPieces, readBooks } from "./lib/catalog.js"
import { initPieces, engravePieces, engraveBooks } from "./lib/score.js"

const argsConfig = {
  boolean: ["i", "b", "nometa", "lint", "relax", "dry"],
  alias: { c: "catalog", i: "init", b: "book", j: "jobs" },
  default: { c: "", j: cpus().length }
}

const args = parseArgs(process.argv.slice(2), argsConfig)

if (args.i) { await initPieces(args) }
else if (args.b) {
  const books = await readBooks(args)
  await engraveBooks(books, args)
}
else {
  const pieces = await readPieces(args)
  await engravePieces(pieces, args)
}
