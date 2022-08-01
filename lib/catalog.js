import { globby } from "globby"
import { readFile } from "fs/promises"
import { load } from "js-yaml"

function scoreFile(score) {
  const title = score.tit.replace(/,/g, "").replace(/ /g, "-")
  score.file = `${title}-${score.id}`
  return score
}

function pieceSub(legend) {
  return function(piece) {
    if (piece.sub in legend) { piece.sub = legend[piece.sub] }
    return piece
  }
}

export async function readLegend() {
  const { legend } = load(await readFile("catalog/legend.yaml"))
  return legend
}

export async function readPieces() {
  const files = await globby([
    "catalog/*.yaml/", "!*/sources.yaml", "!*/legend.yaml", "!*/books.yaml"
  ])
  const tasks = files.map(async file => {
    const { pieces } = load(await readFile(file))
    return pieces
  })
  const pieces = await Promise.all(tasks)
  const legend = await readLegend()
  return pieces.flat().map(scoreFile).map(pieceSub(legend.ua))
}

export async function readBooks() {
  const { books } = load(await readFile("catalog/books.yaml"))
  const pieces = await readPieces()
  return { books: books.map(scoreFile), pieces }
}
