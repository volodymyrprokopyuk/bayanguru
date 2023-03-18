#!/usr/bin/env node

import { cpus } from "os"
import parseArgs from "minimist"
import {
  readPieces, readBooks, selectPieces, playPieces
} from "./module/catalog.js"
import { initPieces, engravePieces, engraveBooks } from "./module/score.js"

function configure() {
  const argsConfig = {
    boolean: [
      "i", "b", "nometa", "lint", "relax", "dry", "optimize",
      "p", "cycle", "random"
    ],
    alias: { i: "init", c: "catalog", b: "book", j: "jobs", p: "play" },
    default: {
      c: "", j: cpus().length,
      org: "", sty: "", gnr: "", frm: "", bss: "", lvl: "",
      tit: "", com: "", arr: ""
    }
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
  if (args.p) {
    const pieces = await selectPieces(args)
    return await playPieces(pieces, args)
  }
  const pieces = await readPieces(args)
  return await engravePieces(pieces, args)
}

await dispatch(configure())
