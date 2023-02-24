import { globbyStream } from "globby"
import { readFile } from "fs/promises"
import { load } from "js-yaml"
import chalk from "chalk"

const meta = {
  // Piece subtitle (sub)
  uafs: "Українська народна пісня",
  uafsvar: "Варіації на тему української народної пісні",
  uafd: "Український народний танець",
  rufs: "Російська народна пісня",
  rufsvar: "Варіації на тему російської народної пісні",
  rufd: "Російський народний танець",
  hufs: "Угорська народна пісня",
  hufd: "Угорський народний танець",
  mdfs: "Молдавська народна пісня",
  mdfd: "Молдавський народний танець",
  rofs: "Румуньска народна пісня",
  rofd: "Румунський народний танець",
  byfs: "Білоруська народна пісня",
  byfd: "Білоруський народний танець",
  plfs: "Польська народна пісня",
  plfd: "Польський народний танець",
  // Piece arrangment type (aty)
  arr: "Обр.", // обробка, arrangment (default)
  ipr: "Пер.", // переклад, interpratation
  hrm: "Гарм." // гармонізація, harmonization
}

function addScoreFile(score) {
  const title = score.tit.replace(/[,!?]/g, "").replace(/ /g, "-")
  score.file = `${title}-${score.id}`
}

function addPieceMeta(piece) {
  if (piece.sub in meta) { piece.sub = meta[piece.sub] }
  if (piece.arr) {
    piece.aty = piece.aty ? meta[piece.aty] : meta.arr
  }
}

function addBookPieces(book, cpieces) {
  const bpieces = []
  for (const pieceId of book.pieces) {
    if (cpieces.has(pieceId)) {
      bpieces.push(cpieces.get(pieceId))
    } else {
      throw new Error(`Piece ${pieceId} is not in catalog`)
    }
  }
  console.log(
    chalk.blue(`Book ${book.id}:`),
    chalk.yellow.bold(`${bpieces.length} pieces`)
  )
  book.pieces = bpieces
}

export async function readPieces(args, all = false) {
  const pieces = []
  let pieceCount = 0
  const glob = `catalog/*${args.c.split(",").join("*")}*.yaml`
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
    }
  }
  return books
}
