import { globby } from "globby"
import { readFile } from "fs/promises"
import { load } from "js-yaml"

function scoreFile(score) {
  const title = score.tit.replace(/[,!?]/g, "").replace(/ /g, "-")
  score.file = `${title}-${score.id}`
  return score
}

function pieceDerived(legend) {
  return function(piece) {
    if (piece.sub in legend) { piece.sub = legend[piece.sub] }
    if (piece.arr) {
      if (piece.aty) { piece.aty = legend[piece.aty] }
      else  { piece.aty = legend.arr }
    }
    return piece
  }
}

export async function readLegend() {
  const { legend } = load(await readFile("catalog/legend.yaml"))
  return legend
}

export async function readPieces(args) {
  const files = await globby([
    `catalog/cat-*${args.c.split(",").join("*")}*.yaml`
  ])
  const tasks = files.map(async file => {
    const { pieces } = load(await readFile(file))
    return pieces
  })
  const pieces = await Promise.all(tasks)
  const legend = await readLegend()
  function pieceMap(pieces, piece) {
    if (piece.id in pieces) {
      throw new Error(`Piece ${piece.id} already exists`)
    }
    pieces[piece.id] = piece
    return pieces
  }
  return pieces.flat().map(scoreFile).map(pieceDerived(legend.ua))
    .reduce(pieceMap, { })
}

export async function readBooks(args) {
  let { books } = load(await readFile("catalog/books.yaml"))
  function bookMap(books, book) {
    if (book.id in books) {
      throw new Error (`Book ${book.id} already exists`)
    }
    books[book.id] = book
    return books
  }
  books = books.map(scoreFile).reduce(bookMap, { })
  const pieces = await readPieces(args)
  return { books, pieces }
}
