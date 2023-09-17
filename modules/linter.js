import { readFile } from "fs/promises"
import chalk from "chalk"
import { reFromParts } from "./util.js"

const reMusicContent = reFromParts(
  "mg",
  // ^ space, rN, sN, { }, } { }, \cmd , \cmd { } \!, {{ mcr("") }}
  /^( +| +[rs]\d{1,2}\.?[\\mspf<>]{0,4}(?: \|)? | +(?:\} )?\{ | +\\(?:hSpace|sSlur) | +\\[^{!\n]+[{!] | +\{\{ [^(\n]+\(")/,
  // First note or chord + check + rest
  /(<?[a-g](?:es|is){0,2}[,']{0,4})(.)(.*)/
)

// Disable: prepend | (measure starts)
function lintFirstNoteOctaveCheck(content, logs) {
  logs.push(chalk.yellow("* Missing first note octave check or duration"))
  let conforms = true
  for (const [_, start, note, check, rest] of
       content.matchAll(reMusicContent)) {
    // No octave check
    if (!/[=+@Mm7dust]/.test(check)) {
      logs.push(`${start}${chalk.red(note + check)}${rest}`)
      conforms = false
    }
    // No duration for the non-chord first note
    if (check === "=" && !/^</.test(note) && !/^[,']{0,4}\d/.test(rest)) {
      logs.push(`${start}${chalk.red(note + check)}${rest}`)
      conforms = false
    }
    // No duration for the first chord
    if (/^</.test(note) && !/^[^>]+>\d/.test(rest)) {
      logs.push(`${start}${chalk.red(note + check)}${rest}`)
      conforms = false
    }
  }
  return conforms
}

// Disable: append % (measure continues)
function lintEndLineBarCheck(content, logs) {
  logs.push(chalk.yellow("* Missing end line bar check"))
  let conforms = true
  for (const [_, start, note, check, rest] of
       content.matchAll(reMusicContent)) {
    // OK |, "|.", | }, "|." }, }}, %, "...",
    if (!/ \|( \})?$| ".."( \})?$| \}\}$| %$|",/.test(rest)) {
      logs.push(`${start + note + check +
        rest.slice(0, -2)}${chalk.red(rest.slice(-2))}`)
      conforms = false
    }
  }
  return conforms
}

// Disable: insert space
// Pitch, duration, slur, articulation, dynamic, hairpin, text
function lintNoteComponentOrder(content, logs) {
  logs.push(chalk.yellow("* Unordered note components"))
  const reNote = reFromParts(
    null,
    // pitch
    /^([a-g](?:es|is){0,2}|(?:fu|fd|bu|bd|bs|dt|bass)$)/,
    // stradella
    /(\+?(?:[a-g](?:is|es){0,2})?@?[Mm7d]!?)?/,
    // octave check
    /([,']{0,4}=?[,']{0,4})?/,
    // duration
    /(>?\d{0,2}\.{0,2}[\[\]]?)?/,
    // slur
    /([_^]?\\?[()~]){0,2}/,
    // articulation
    /(-[-.>]){0,2}/,
    // dynamic
    /(\\[ms]?[pf]{1,3})?/,
    // hairpin
    /(\\[<>])?/,
    // text
    /([-^_]\\\w+){0,2}/,
    // end
    /$/
  )
  let conforms = true
  for (const [line] of
       content.matchAll(reMusicContent)) {
    for (let [_, note] of line.matchAll(/[ <"]([a-g][^ ]+)/g)) {
      if (!reNote.test(note.replace(/",$|"\)$/, "").replace(/\\{2}/g, "\\"))) {
        logs.push(chalk.red(note))
        conforms = false
      }
    }
  }
  return conforms
}

// Disable: c@M!__c8 insert two consecutive spaces
function lintDurationAfterBoundChord(content, logs) {
  logs.push(chalk.yellow("* Missing explicit duration after bound chord"))
  let conforms = true
  for (const [line] of
       content.matchAll(reMusicContent)) {
    for (const [_, chord, note] of line.matchAll(
      /(@[Mm7d]\S* (?:\| )?)([a-gr]\S*)/g)
        ) {
      if (!/[123468]+/.test(note)) {
        logs.push(`${chord}${chalk.red(note)}`)
        conforms = false
      }
    }
  }
  return conforms
}

const linters = [
  lintFirstNoteOctaveCheck,
  lintEndLineBarCheck,
  lintNoteComponentOrder,
  lintDurationAfterBoundChord
]

export async function lint(piece) {
  const logs = []
  const { src, file } = piece
  const path = `source/${src}/${file}.lys`
  logs.push(`$ ${chalk.green.bold("lint")} ${chalk.yellow.bold(path)}`)
  const content = await readFile(path, "utf8")
  let conforms = true
  for (const linter of linters) {
    if (!linter(content, logs)) { conforms = false }
  }
  console.log(logs.join("\n"))
  return conforms
}
