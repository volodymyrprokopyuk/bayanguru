import { load } from "js-yaml"
import { readFile, writeFile } from "fs/promises"
import { $ } from "zx"
const raw = String.raw

const chordNames = { M: "Б", m: "М", "7": "7", d: "У" }

const stradellaChords = {
  fM: "a, c f", fm: "aes, c f", f7: "a, ees f", fd: "aes, d f",
  cM: "g, e c", cm: "g, c ees", c7: "bes, c e", cd: "a, c ees",
  gM: "g, b, d", gm: "g, bes, d", g7: "g, b, f", gd: "g, bes, e",
  dM: "a, d fis", dm: "a, d f", d7: "c d fis", dd: "b, d f",
  aM: "a, cis e", am: "a, c e", a7: "g, a, cis", ad: "a, c fis",
  eM: "gis, b, e", em: "g, b, e", e7: "gis, d e", ed: "g, cis e",
  bM: "b, dis fis", bm: "b, d fis", b7: "a, b, dis", bd: "gis, b, d",
}

function stradella(score, bindAfter = true) {
  const stPatterns = [
    /\b(?:([cdefgab](?:es|is|eses|isis)?[,']*)\+)?/, // [bass]
    /([cdefgab](?:es|is)?[,']*)(@)?/, // root + [bind]
    /([Mm7d])(!)?/, // chord + [name]
    /(\S+)?/ // [modifiers]
  ]
  const stNotation = new RegExp(stPatterns.map(p => p.source).join(""), 'g')
  function lyNotation(_, bass, root, bind, chord, name, mods) {
    const triad = stradellaChords[root.replace(/[,']*/g, "") + chord]
    name = name ? raw`^\markup \smaller ${chordNames[chord]}` : ""
    mods = mods || ""
    chord = bass ?
      raw`\fixed c' { <${bass} ${triad}>${mods}${name} }` :
      raw`\fixed c' { <${triad}>${mods}${name} }`
    if (bindAfter) {
      return bind ?
        raw`\afterGrace 1/4 ${chord} { \fixed c { \once \hide Stem \parenthesize ${root}8 } }` :
        chord
    } else {
      return bind ?
        raw`\fixed c { \once \hide Stem \grace \parenthesize ${root}8 } ${chord}` :
        chord
    }
  }
  return String(score).replace(stNotation, lyNotation)
}

try {
  // const { meta } = load(await readFile("index.yaml"))
  const file = "music"
  const score = await readFile(`${file}.lys`)
  const stScore = stradella(score)
  await writeFile(`${file}.ly`, stScore)
  await $`lilypond ${file}.ly`
} catch (e) { console.error(e) }
