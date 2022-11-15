const raw = String.raw
import { globby } from "globby"
import njk from "nunjucks"
const { Environment, FileSystemLoader } = njk
import { $, chalk } from "zx"

const chordNames = { M: "Б", m: "М", 7: "7", d: "У" }

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
  const stPatterns = [
    /\b(?:([cdefgab](?:es|is|eses|isis)?[,']*)\+)?/, // [bass]
    /([cdefgab](?:es|is)?[,']*)(@)?/, // root + [bind]
    /([Mm7d])(!)?/, // chord + [name]
    /(\S+)?/ // [modifiers]
  ]
  const stNotation = new RegExp(stPatterns.map(p => p.source).join(""), 'g')
  function lyNotation(_, bass, root, bind, chord, name, mods) {
    const tr = { eis: "f", bis: "c", ces: "b", fes: "e" }
    let rootKey = root.replace(/[,']*/g, "")
    rootKey = tr[rootKey] || rootKey
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
  return String(score).replace(stNotation, lyNotation)
}

function lilypond(score, file, format) {
  process.env.PATH = `${process.env.HOME}/.lilypond/bin:${process.env.PATH}`
  const lilypond = $`lilypond -f ${format} -o ${file} -`
  lilypond.stdin.write(score)
  lilypond.stdin.end()
  return lilypond
}

function svgo(file) {
  return  $`./node_modules/.bin/svgo --multipass ${file}.svg -o ${file}.svg`
}

function optimizeSvg(file) {
  return async function() {
    const pages = await globby(`${file}@(|-+([0-9])).svg`)
    const tasks = pages.map(page => svgo(page.replace(/\.svg$/, "")))
    return Promise.all(tasks)
  }
}

function engrave(score, file, format) {
  const task = lilypond(score, file, format)
  if (format === "svg") { return task.then(optimizeSvg(file)) }
  return task
}

export function engravePieces(pieces, args) {
  const env = new Environment(new FileSystemLoader("."), { autoescape: false })
  env.addFilter("stradella", stradella)
  return pieces.flatMap(piece => {
    const context = { pieces: [piece], args }
    const score = env.render("source/master.lys", context)
    return args.f.split(":").map(format =>
      engrave(score, `scores/${piece.file}`, format)
    )
  })
}

export function engraveBooks(books, pieces, args) {
  const env = new Environment(new FileSystemLoader("."), { autoescape: false })
  env.addFilter("stradella", stradella)
  return books.flatMap(book => {
    const bpieces = book.pieces.map(id => pieces[id])
    console.log(
      chalk.blue(`Book ${book.id}:`),
      chalk.yellow.bold(`${bpieces.length} pieces`)
    )
    const context = { book, pieces: bpieces, args }
    const score = env.render("source/master.lys", context)
    return args.f.split(":").map(format =>
      engrave(score, `scores/${book.file}`, format)
    )
  })
}
