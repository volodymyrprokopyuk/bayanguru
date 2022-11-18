import { readFileSync } from "fs"
import { chalk } from "zx"

function reFromParts(...parts) {
  return new RegExp(parts.map(p => p.source).join(""))
}

// Disable: prepend | (measure starts)
function lintFirstNoteOctaveCheck(content) {
  console.log(chalk.yellow("* Missing first note octave check"))
  let conforms = true
  // First note or chord
  for (const [_, note, check, rest] of content.matchAll(
    /(^ +<?[cdefgab](?:is|es){0,2}[,']*)(.)(.*)/mg
  )) {
    if (!/[=+@Mm7d]/.test(check)) {
      console.log(`${chalk.red(note)}${chalk.red(check)}${rest}`)
      conforms = false
    }
  }
  // \command { first note or chord }
  for (const [_, note, check, rest] of content.matchAll(
    /(\\\w+ \S* ?\{ <?[cdefgab](?:is|es){0,2}[,']*)(.)(.*)/mg
  )) {
    if (!/[=+@Mm7d]/.test(check)) {
      console.log(`${chalk.red(note)}${chalk.red(check)}${rest}`)
      conforms = false
    }
  }
  // r/lhFragN("first note or chord")
  for (const [_, note, check, rest] of content.matchAll(
    /([rl]hFrag\d+\("<?[cdefgab](?:is|es){0,2}[,']*)(.)(.*)/mg
  )) {
    if (!/[=+@Mm7d]/.test(check)) {
      console.log(`${chalk.red(note)}${chalk.red(check)}${rest}`)
      conforms = false
    }
  }
  return conforms
}

// Disable: append % (measure continues)
function lintEndLineBarCheck(content) {
  console.log(chalk.yellow("* Missing end line bar check"))
  let conforms = true
  for (const [_, rest, end] of content.matchAll(
    /((?:^ +|^ +\| |^ +\{\{ )<?[cdefgabs](?:is|es){0,2}[,']*.*)(.{2})$/mg
  )) {
    if (!/ \||."|\}\}| %/.test(end)) {
      console.log(`${rest}${chalk.red(end)}`)
      conforms = false
    }
  }
  return conforms
}

const reNoteComponents = reFromParts(
  // pitch
  /^([cdefgab](?:is|es){0,2})/,
  // stradella
  /(,{0,2}[@+]?(?:[cdefgab](?:is|es){0,2},?@?)?[Mm7d]?!?)?/,
  // octave check
  /([,']*=?[,']*)?/,
  // duration
  /(\d{0,2}\.{0,2}[\[\]]?)?/,
  // slur
  /(\\{0,2}[\(\)~])?/,
  // articulation
  /(-[-.>])?/,
  // dynamic
  /(\\{1,2}m?[pf]{1,3})?/,
  // hairpin
  /(\\{1,2}[<>])?/,
  // text
  /([-^_]\\{1,2}\w+)?/,
  // end
  /$/
)

function showNote(m) {
  const [_, pch, str, och, dur, slr, art, dyn, hrp, txt] = m
  const note = [
    pch + (str || "") + (och || ""), chalk.yellow(dur || ""),
    chalk.blue(slr || ""), chalk.green(art || ""),
    chalk.magenta((dyn || "") + (hrp || "")), chalk.italic(txt || "")
  ]
  console.log(note.join(''))
}

// Pitch, duration, slur, articulation, dynamic, text
function lintNoteComponentOrder(content) {
  console.log(chalk.yellow("* Non-standard note component order"))
  let conforms = true
  for (const [note] of content.matchAll(
    /\b[cdefgab](?:is|es){0,2}[Mm7d]?\d{0,2}\b\S*/g
  )) {
    const m = note.replace(/(?<![-\\])>/, "")
          .replace(/"[\),]/, "").match(reNoteComponents)
    if (!m) {
      console.log(chalk.red(note))
      conforms = false
    }
    // if (m) { showNote(m) }
  }
  return conforms
}

const linters = [
  lintFirstNoteOctaveCheck,
  lintEndLineBarCheck,
  lintNoteComponentOrder
]

export function lint(piece) {
  const { src, file } = piece
  const path = `source/${src}/${file}.lys`
  console.log("$", chalk.green.bold("lint"), chalk.yellow.bold(path))
  const content = String(readFileSync(path))
  let conforms = true
  for (const linter of linters) {
    conforms = linter(content)
  }
  return conforms
}
