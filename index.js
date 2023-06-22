#!/usr/bin/env node

import { cpus } from "os"
import parseArgs from "minimist"
import chalk from "chalk"
import {
  readBooks, selectPieces, playPieces
} from "./modules/catalog.js"
import {
  initPieces, engravePieces, engraveBooks
} from "./modules/score.js"

function configure() {
  const argsConfig = {
    boolean: [
      "i", "b", "nometa", "lint", "relax", "dry", "optimize",
      "p", "cycle", "random",
      "tobk", "frbk"
    ],
    alias: { c: "catalog", i: "init", b: "book", p: "play", j: "jobs" },
    default: {
      c: "", j: cpus().length,
      bid: "selc", btit: "Вибрані твори", bsub: "для баяна",
      org: "", sty: "", gnr: "", ton: "", frm: "", bss: "", lvl: "",
      tit: "", com: "", arr: ""
    }
  }
  const args = parseArgs(process.argv.slice(2), argsConfig)
  args._ = args._.map(a => String(a))
  return args
}

async function dispatch(args) {
  if (args.i) {
    return await initPieces(args)
  }
  if (args.b) {
    const books = await readBooks(args)
    return await engraveBooks(books, args)
  }
  if (args.tobk) {
    const pieces = await selectPieces(args)
    const book = {
      id: args.bid, tit: args.btit, sub: args.bsub,
      file: `${args.btit.replace(/ /g, "-")}-${args.bid}`, pieces
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

try { await dispatch(configure()) }
catch (error) {
  console.error(chalk.red(error))
  process.exit(1)
}
