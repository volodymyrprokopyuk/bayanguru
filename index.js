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
      "tobook", "frombook"
    ],
    alias: { i: "init", c: "catalog", b: "book", j: "jobs", p: "play" },
    default: {
      c: "", j: cpus().length,
      bid: "selc", btit: "Вибрані твори", bsub: "для баяна",
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
  if (args.tobook) {
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
