import { globbyStream } from "globby"
import { readFile } from "fs/promises"
import { load } from "js-yaml"
import chalk from "chalk"
import { $ } from "zx"

const meta = {
  // Piece subtitle (sub)
  ukrfs: "Українська народна пісня",
  ukrfsvar: "Варіації на тему української народної пісні",
  ukrfd: "Український народний танець",
  rusfs: "Російська народна пісня",
  rusfsvar: "Варіації на тему російської народної пісні",
  rusfd: "Російський народний танець",
  hunfs: "Угорська народна пісня",
  hunfd: "Угорський народний танець",
  mdafs: "Молдавська народна пісня",
  mdafd: "Молдавський народний танець",
  roufs: "Румуньска народна пісня",
  roufd: "Румунський народний танець",
  blrfs: "Білоруська народна пісня",
  blrfd: "Білоруський народний танець",
  polfs: "Польська народна пісня",
  polfd: "Польський народний танець",
  czefs: "Чеська народна пісня",
  czefd: "Чеський народний танець",
  // Piece arrangment type (art)
  arr: "Обр.", // обробка = arrangment (default)
  ipr: "Пер.", // переклад = interpratation
  hrm: "Гарм." // гармонізація = harmonization
}

function addScoreFile(score) {
  const title = score.tit.replace(/[',!?]/g, "").replace(/ /g, "-")
  score.file = `${title}-${score.id}`
}

function addPieceMeta(piece) {
  if (piece.sub in meta) { piece.sub = meta[piece.sub] }
  if (piece.arr) {
    piece.art = piece.art ? meta[piece.art] : meta.arr
  }
}

function addSectionPieces(section, cpieces) {
  const spieces = []
  for (const spiece of section.pieces) {
    if (cpieces.has(spiece)) {
      spieces.push(cpieces.get(spiece))
    } else {
      throw new Error(`Piece ${spiece} is not in catalog`)
    }
  }
  section.pieces = spieces
}

function addBookPieces(book, cpieces) {
  const bpieces = []
  for (const bpiece of book.pieces) {
    if (bpiece.sec) {
      addSectionPieces(bpiece, cpieces)
      bpieces.push(bpiece)
    } else if (cpieces.has(bpiece)) {
      bpieces.push(cpieces.get(bpiece))
    } else {
      throw new Error(`Piece ${bpiece} is not in catalog`)
    }
  }
  book.pieces = bpieces
}

function countBookPieces(book) {
  let pieceCount = 0
  for (const piece of book.pieces) {
    if (piece.sec) { pieceCount += piece.pieces.length }
    else { ++pieceCount }
  }
  return pieceCount
}

export async function readPieces(args, all = false) {
  const pieces = []
  let pieceCount = 0
  const glob = `catalog/*${args.c}*.yaml`
  for await (const catalog of globbyStream(glob)) {
    const { pieces: cpieces } = load(await readFile(catalog))
    for (const piece of cpieces) {
      ++pieceCount
      if (all || args._.includes("all") || args._.includes(piece.id)) {
        addScoreFile(piece)
        addPieceMeta(piece)
        pieces.push(piece)
      }
    }
  }
  console.log(
    chalk.blue("Catalog:"),
    chalk.yellow.bold(`${pieceCount} pieces`)
  )
  return pieces
}

async function readPiecesFromBook(args) {
  function addBookPiece(bpiece) {
    if (cpieces.has(bpiece)) {
      bpieces.push(cpieces.get(bpiece))
    } else {
      throw new Error(`Piece ${bpiece} is not in catalog`)
    }
  }
  const pieces = await readPieces(args, true)
  const cpieces = new Map()
  pieces.forEach(piece => cpieces.set(piece.id, piece))
  let { books } = load(await readFile("meta/books.yaml"))
  const bpieces = []
  for (const book of books) {
    if (args._.includes("all") || args._.includes(book.id)) {
      for (const bpiece of book.pieces) {
        if (bpiece.sec) {
          for (const spiece of bpiece.pieces) { addBookPiece(spiece) }
        } else { addBookPiece(bpiece) }
      }
    }
  }
  return bpieces
}

export async function readBooks(args) {
  const pieces = await readPieces(args, true)
  const cpieces = new Map()
  pieces.forEach(piece => cpieces.set(piece.id, piece))
  const books = []
  let { books: cbooks } = load(await readFile("meta/books.yaml"))
  for (const book of cbooks) {
    if (args._.includes("all") || args._.includes(book.id)) {
      addScoreFile(book)
      addBookPieces(book, cpieces)
      books.push(book)
      console.log(
        chalk.blue(`Book ${book.id}:`),
        chalk.yellow.bold(`${countBookPieces(book)} pieces`)
      )
    }
  }
  return books
}

export async function selectPieces(args) {
  const match = (tag) => (piece) => {
    if (!args[tag]) { return true }
    if (!piece[tag]) { return false }
    const matchers = args[tag].split(",").map(query => label => {
      const neg = query.startsWith("^")
      const re = new RegExp(neg ? query.slice(1) : query, "i")
      return neg ? !re.test(label) : re.test(label)
    })
    const labels = [].concat(piece[tag])
    return matchers.some(match => labels.some(match))
  }
  const tags = [
    "org", "sty", "gnr", "ton", "frm", "bss", "lvl", "tit", "com", "arr"
  ]
  const matchers = tags.map(match)
  const pieces = args.frbk ?
        await readPiecesFromBook(args) :
        await readPieces(args)
  const selected = pieces.filter(piece =>
    matchers.every(match => match(piece))
  )
  console.log(
    chalk.blue("Selected:"),
    chalk.yellow.bold(`${selected.length} pieces`)
  )
  return selected
}

export async function playPieces(pieces, args) {
  function* playIndex() {
    let i = 0, len = pieces.length, played = new Set()
    while (args.cycle ? true : i < len) {
      if (args.random) {
        if (played.size === len) { played.clear() }
        let ri = Math.floor(Math.random() * len)
        while (played.has(ri)) { ri = Math.floor(Math.random() * len) }
        played.add(ri)
        yield (++i, ri)
      } else { yield i++ % len }
    }
  }
  for (const i of playIndex()) {
    const { id, tit, file, com, arr, art, lvl } = pieces[i]
    if (args.dry) {
      const summary = [chalk.green(id), chalk.yellow(tit)]
      if (com) { summary.push(chalk.cyan(com)) }
      if (arr) { summary.push(chalk.magenta(art), chalk.magenta(arr)) }
      summary.push(lvl)
      console.log(summary.join(" "))
      continue
    }
    await $`xdg-open scores/${file}.pdf`
  }
}
