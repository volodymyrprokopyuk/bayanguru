#!/usr/bin/env node

import { cpus } from "os"
import parseArgs from "minimist"
import { readPieces, readBooks } from "./lib/catalog.js"
import { initPieces, engravePieces, engraveBooks } from "./lib/score.js"

function configure() {
  const argsConfig = {
    boolean: ["i", "b", "nometa", "lint", "relax", "dry"],
    alias: { c: "catalog", i: "init", b: "book", j: "jobs" },
    default: { c: "", j: cpus().length }
  }
  return parseArgs(process.argv.slice(2), argsConfig)
}

async function dispatch(args) {
  if (args.i) {
    return await initPieces(args)
  }
  if (args.b) {
    const books = await readBooks(args)
    return await engraveBooks(books, args)
  }
  const pieces = await readPieces(args)
  return await engravePieces(pieces, args)
}

await dispatch(configure())
