#!/usr/bin/env node

import { cpus } from "os"
import parseArgs from "minimist"
import {
  readBooks, selectPieces, playPieces
} from "./modules/catalog.js"
import {
  initPieces, engravePieces, engraveBooks
} from "./modules/score.js"

function configure() {
  const argsConfig = {
    boolean: [
      "i", "b", "dynbook", "nometa", "lint", "relax", "dry", "optimize",
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
  if (args.dynbook) {
    const pieces = await selectPieces(args)
    const book = {
      id: "selc", tit: "Вибрані твори", sub: "для баяна",
      file: "Вибрані-твори-selc", pieces
    }
    return await engraveBooks([book], args)
  }
  if (args.p) {
    const pieces = await selectPieces(args)
    return await playPieces(pieces, args)
  }
  const pieces = await selectPieces(args)
  return await engravePieces(pieces, args)
}

await dispatch(configure())
