import { copyFile } from "fs/promises"
import { mkdirp, pathExists } from "fs-extra"
import chalk from "chalk"
import { $ } from "zx"
import njk from "nunjucks"
import { reFromParts, asyncParallel } from "./util.js"
import { readPieces } from "./catalog.js"
import { lint } from "./linter.js"

const template = nunjucks()

const chordNames = { M: "Б", m: "М", 7: "7", d: "У" }
const noteEnharm = { eis: "f", bis: "c", ces: "b", fes: "e" }

const stradellaChords = {
  aisM: "ais, cisis eis", aism: "ais, cis eis",
  ais7: "gis, ais, cisis", aisd: "fisis, ais, cis",
  disM: "fisis, ais, dis", dism: "ais, dis fis",
  dis7: "fisis, cis dis", disd: "bis, dis fis",
  gisM: "gis, bis, dis", gism: "gis, b, dis",
  gis7: "gis, bis, fis", gisd: "gis, b, eis",
  cisM: "gis, cis eis", cism: "gis, cis e",
  cis7: "bis, c eis", cisd: "ais, cis e",
  fisM: "ais, cis fis", fism: "a, cis fis",
  fis7: "ais, e fis", fisd: "a, dis fis",

  bM: "b, dis fis", bm: "b, d fis", b7: "a, b, dis", bd: "gis, b, d",
  eM: "gis, b, e", em: "g, b, e", e7: "gis, d e", ed: "g, cis e",
  aM: "a, cis e", am: "a, c e", a7: "g, a, cis", ad: "a, c fis",
  dM: "a, d fis", dm: "a, d f", d7: "c d fis", dd: "b, d f",
  gM: "g, b, d", gm: "g, bes, d", g7: "g, b, f", gd: "g, bes, e",
  cM: "g, e c", cm: "g, c ees", c7: "bes, c e", cd: "a, c ees",
  fM: "a, c f", fm: "aes, c f", f7: "a, ees f", fd: "aes, d f",

  besM: "bes, d f", besm: "bes, des f",
  bes7: "aes, bes, d", besd: "g, bes, des",
  eesM: "g, bes, ees", eesm: "bes, ees ges",
  ees7: "g, des ees", eesd: "c ees ges",
  aesM: "aes, c ees", aesm: "aes, ces ees",
  aes7: "aes, c ges", aesd: "aes, ces f",
  desM: "aes, des f", desm: "aes, des fes",
  des7: "ces des f", desd: "bes, des fes",
  gesM: "bes, des ges", gesm: "beses, des ges",
  ges7: "bes, fes ges", gesd: "beses, ees ges"
}

function stradella(score) {
  const raw = String.raw
  const stNotation = reFromParts(
    "g",
    /\b(?:([cdefgab](?:es|is|eses|isis)?[,']*)\+)?/, // [bass]
    /([cdefgab](?:es|is)?[,']*)(@)?/, // root + [bind]
    /([Mm7d])(!)?/, // chord + [name]
    /(\S+)?/ // [modifiers]
  )
  function lyNotation(_, bass, root, bind, chord, name, mods) {
    let rootKey = root.replace(/[,']*/g, "")
    rootKey = noteEnharm[rootKey] || rootKey
    const triad = stradellaChords[rootKey + chord]
    name = name ? raw`^\markup \smaller ${chordNames[chord]}` : ""
    mods = mods || ""
    chord = bass ?
      raw`\fixed c' { <${bass} ${triad}>${mods}${name} }` :
      raw`\fixed c' { <${triad}>${mods}${name} }`
    return bind ?
      raw`\afterGrace 1/4 ${chord} { \fixed c { \once \hide Stem \parenthesize ${root}4 } }` :
      chord
  }
  return score.replace(stNotation, lyNotation)
}

function nunjucks() {
  const { Environment, FileSystemLoader } = njk
  const env = new Environment(
    ["source", "source/template"].map(dir => new FileSystemLoader(dir)),
    { autoescape: false }
  )
  env.addFilter("stradella", stradella)
  env.addFilter("join", (x, sep) => Array.isArray(x) ? x.join(sep) : x)
  return env
}

async function lilypond(score, file) {
  process.env.PATH = `${process.env.HOME}/.lilypond/bin:${process.env.PATH}`
  const lilypond = $`lilypond -f pdf -o ${file} -`
  lilypond.stdin.write(score)
  lilypond.stdin.end()
  return await lilypond
}

export async function initPieces(args) {
  const pieces = await readPieces(args)
  for (const { src, file } of pieces) {
    await mkdirp(`source/${src}`)
    const path = `source/${src}/${file}.lys`
    if (await pathExists(path)) {
      return console.log(chalk.yellow(`Skipping ${path} already exists`))
    }
    await copyFile("source/template/piece-init.lys", path)
  }
}

async function engravePiece(piece, args) {
  if (args.lint) {
    const conforms = await lint(piece)
    if (!conforms && !args.relax) {
      throw new Error(`Piece ${piece.id} has linting errors`)
    }
  }
  if (args.dry) { return }
  const score = template.render("piece.lys", { piece, args })
  return await lilypond(score, `scores/${piece.file}`)
}

export async function engravePieces(pieces, args) {
  const jobs = pieces.map(piece => () => engravePiece(piece, args))
  return await asyncParallel(jobs, args.j)
}

async function lintBook(book) {
  let conforms = true
  for (const bpiece of book.pieces) {
    if (bpiece.sec) {
      for (const spiece of bpiece.pieces) {
        if (!await lint(spiece)) { confroms = false }
      }
    } else if (!await lint(bpiece)) { conforms = false }
  }
  return conforms
}

async function engraveBook(book, args) {
  if (args.lint) {
    const conforms = await lintBook(book)
    if (!conforms && !args.relax) {
      throw new Error(`Book ${book.id} has linting errors`)
    }
  }
  if (args.dry) { return }
  const score = template.render("book.lys", { book, args })
  return await lilypond(score, `scores/${book.file}`)
}

export async function engraveBooks(books, args) {
  const jobs = books.map(book => () => engraveBook(book, args))
  return await asyncParallel(jobs, args.j)
}
