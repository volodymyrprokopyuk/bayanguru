const raw = String.raw
import { readFile, writeFile } from "fs/promises"
import parseArgs from "minimist"
import { globby } from "globby"
import { load } from "js-yaml"
import nj from "nunjucks"
const { render } = nj
import { $ } from "zx"

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

function engravePieces(pieces) {
  return pieces.flatMap(piece => {
    const score = stradella(
      render(`${args.i}/master.lys`, { pieces: [piece], args })
    )
    return args.f.split(":").map(format =>
      engrave(score, `${args.o}/${piece.file}`, format)
    )
  })
}

function engraveBooks(books, pieces) {
  return books.flatMap(book => {
    pieces = pieces.filter(piece =>
      book.pieces.some(bpiece => piece.file.match(bpiece))
    )
    const score = stradella(
      render(`${args.i}/master.lys`, { book, pieces, args })
    )
    return args.f.split(":").map(format =>
      engrave(score, `${args.o}/${book.file}`, format)
    )
  })
}

async function sortPages(file) {
  const parsePage = page => parseInt(page.match(/-(\d+)\.svg$/)[1])
  const pages = await globby(`${file}@(|-+([0-9])).svg`)
  return pages.length > 1 ?
    pages.sort((a, b) => parsePage(a) - parsePage(b)) : pages
}

function markupScores(scores) {
  const tasks = scores.map(async score => {
    score.pages = await sortPages(`${args.o}/${score.file}`)
    return writeFile(
      `score/${score.file}.html`, render("content/score.njk", { score })
    )
  })
  tasks.push(writeFile("index.html", render("content/index.njk", { scores })))
  return tasks
}

async function engraveAndMarkup(index = "index.yaml") {
  let { pieces, books } = load(await readFile(index))
  if (args.b) {
    books = args._.length && args._[0] === "all" ? books :
      books.filter(book => args._.some(arg => book.file.match(arg)))
    await Promise.all(engraveBooks(books, pieces))
    if (args.f.match("svg")) { await Promise.all(markupScores(books)) }
  } else {
    pieces = args._.length && args._[0] === "all" ? pieces :
      pieces.filter(piece => args._.some(arg => piece.file.match(arg)))
    await Promise.all(engravePieces(pieces))
    if (args.f.match("svg")) { await Promise.all(markupScores(pieces)) }
  }
}

const argsConfig = {
  boolean: ["b"], default: { i: "source", o: "score", f: "ps" }
}
const args = parseArgs(process.argv.slice(2), argsConfig)
engraveAndMarkup()

// ./node_modules/.bin/http-server -c-1
