import { load } from "js-yaml"
import { readFile, writeFile } from "fs/promises"
import { $ } from "zx"

const chordNames = { M: "Б", m: "М", "7": "7", d: "У" }

const stradellaChords = {
  fM: "a, c f",
  fm: "aes, c f",
  cM: "g, e c",
  cm: "",
  gM: "g, b, d",
  gm: "",
  dM: "a, d fis",
  dm: "",
  aM: "a, cis e",
  am: "",
  eM: "gis, b, e",
  em: "",
  bM: "b, dis fis",
  bm: ""
}

function stradella(score, bindBefore = true) {
  const stPatterns = [
    /\b(?:([cdefgab](?:es|is|eses|isis)?[,']*)\+)?/, // [bass]
    /([cdefgab](?:es|is)?[,']*)(@)?/, // root + [bind]
    /([Mm7d])(!)?/, // chord + [name]
    /(\S+)?/ // [modifiers]
  ]
  const stNotation = new RegExp(stPatterns.map(p => p.source).join(""), 'g')
  function lyNotation(_, bass, root, bind, chord, name, mods) {
    const triad = stradellaChords[root.replace(/[,']*/g, "") + chord]
    name = name ? `^${chordNames[chord]}` : ""
    mods = mods || ""
    chord = bass ?
      `\\fixed c' { <${bass} ${triad}>${mods}${name} }` :
      `\\fixed c' { <${triad}>${mods}${name} }`
    if (bindBefore) {
      return bind ?
        `\\fixed c { \\once \\hide Stem \\grace \\parenthesize ${root}8 } ${chord}` :
        chord
    } else {
      return bind ?
        `\\afterGrace ${chord} { \\fixed c { \\once \\hide Stem \\parenthesize ${root}8 } }` :
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
