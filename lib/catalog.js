import { globbyStream } from "globby"
import { readFile } from "fs/promises"
import { load } from "js-yaml"

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

export async function readPieces(args) {
  const pieces = { }
  const glob = `catalog/*${args.c.split(",").join("*")}*.yaml`
  for await (const catalog of globbyStream(glob)) {
    const { pieces: cpieces } = load(await readFile(catalog))
    for (const piece of cpieces) {
      if (piece.id in pieces) {
        throw new Error(`Piece ${piece.id} already exists`)
      }
      addScoreFile(piece)
      addPieceMeta(piece)
      pieces[piece.id] = piece
    }
  }
  return pieces
}

export async function readBooks(args) {
  const books = { }
  let { books: mbooks } = load(await readFile("meta/books.yaml"))
  for (const book of mbooks) {
    if (book.id in books) {
      throw new Error (`Book ${book.id} already exists`)
    }
    addScoreFile(book)
    books[book.id] = book
  }
  const pieces = await readPieces(args)
  return { books, pieces }
}
