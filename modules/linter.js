import { readFile } from "fs/promises"
import chalk from "chalk"
import { reFromParts } from "./util.js"

const reOctaveCheck = reFromParts(
  "mg",
  // Line beginning ..., \command [x] { ... }, r/lhN("..."), v2("..."), tN("...")
  /(^ +|\\\w+ (?:\S+ )?\{ |[rl]h\d+\("|v2\("|t\d\(")/,
  // First note or chord
  /(<?[a-g](?:is|es){0,2}[,']*)(.)(.*)/
)

// Disable: prepend | (measure starts)
function lintFirstNoteOctaveCheck(content, logs) {
  logs.push(chalk.yellow("* Missing first note octave check or duration"))
  let conforms = true
  for (const [_, start, note, check, rest] of
       content.matchAll(reOctaveCheck)) {
    // No octave check
    if (!/[=+@Mm7d]/.test(check)) {
      logs.push(`${start}${chalk.red(note)}${chalk.red(check)}${rest}`)
      conforms = false
    }
    // No duration for the non-chord first note
    if (check === "=" && !/^</.test(note) && !/^[,']*\d/.test(rest)) {
      logs.push(`${start}${chalk.red(note)}${chalk.red(check)}${rest}`)
      conforms = false
    }
    // No duration for the first chord
    if (/^</.test(note) && !/^[^>]+>\d/.test(rest)) {
      logs.push(`${start}${chalk.red(note)}${chalk.red(check)}${rest}`)
      conforms = false
    }
  }
  return conforms
}

// Disable: append % (measure continues)
function lintEndLineBarCheck(content, logs) {
  logs.push(chalk.yellow("* Missing end line bar check"))
  let conforms = true
  // Bar check at the line end |$
  for (const [_, rest, end] of content.matchAll(
    /((?:^ +|^ +\| |^ +\{\{ )<?[a-gsrR](?:is|es){0,2}[,']*.*)(.{2})$/mg
  )) {
    if (!/ \||."|\}\}| \}| %/.test(end)) {
      logs.push(`${rest}${chalk.red(end)}`)
      conforms = false
    }
  }
  // Bar check within a \command [x] { ... | }
  for (const [_, rest, end] of content.matchAll(
    /(^ +\\\w+ (?:\S+ )?\{ .+)(.{2} \}(?: %)?)$/mg
  )) {
    if (!/ \||."|\}\}| %/.test(end)) {
      logs.push(`${rest}${chalk.red(end)}`)
      conforms = false
    }
  }
  logs.push(chalk.yellow("* Extra end line bar check"))
  // No bar check after } or >>
  for (const [_, rest, end] of content.matchAll(/(^.+)(\} \||>> \|)$/mg)) {
    logs.push(`${rest}${chalk.red(end)}`)
    conforms = false
  }
  return conforms
}

const reNoteComponents = reFromParts(
  null,
  // pitch
  /(^[a-gsrR](?:is|es){0,2})/,
  // stradella
  /(,{0,2}[@+]?(?:[a-g](?:is|es){0,2},?@?)?[Mm7d]?!?)?/,
  // octave check
  /([,']*=?[,']*)?/,
  // duration
  /(\d{0,2}\.{0,2}[\[\]]?)?/,
  // slur
  /([_^]?\\{0,2}[\(\)~]){0,2}/,
  // articulation
  /(-[-.>]){0,2}/,
  // dynamic
  /(\\{1,2}[ms]?[pf]{1,3})?/,
  // hairpin
  /(\\{1,2}[<>])?/,
  // text
  /([-^_]\\{1,2}\w+){0,2}/,
  // end
  /$/
)

function showNote(m, logs) {
  const [_, pch, str, och, dur, slr, art, dyn, hrp, txt] = m
  const note = [
    pch + (str || "") + (och || ""), chalk.yellow(dur || ""),
    chalk.blue(slr || ""), chalk.green(art || ""),
    chalk.magenta((dyn || "") + (hrp || "")), chalk.italic(txt || "")
  ]
  logs.push(note.join(''))
}

// Disable: insert space
// Pitch, duration, slur, articulation, dynamic, hairpin, text
function lintNoteComponentOrder(content, logs) {
  logs.push(chalk.yellow("* Unordered note components"))
  let conforms = true
  for (const [note] of content.matchAll(
    /\b[a-gsrR](?:is|es){0,2}[Mm7d]?\d{0,2}\b\S*/g
  )) {
    // remove chord end ...>
    const m = note.replace(/(?<![-\\])>/, "")
      // remove r/lhN param ending
      .replace(/"[,\)]/, "").match(reNoteComponents)
    if (!m) {
      logs.push(chalk.red(note))
      conforms = false
    }
    // if (m) { showNote(m, logs) }
  }
  return conforms
}

// Disable: c@M!__c8 insert two consecutive spaces
function lintDurationAfterBoundChord(content, logs) {
  logs.push(chalk.yellow("* Missing explicit duration after bound chord"))
  let conforms = true
  for (const [_, chord, note] of content.matchAll(
    /(@[Mm7d]\S* (?:\| )?)([a-gsrR]\S*)/g)
  ) {
    if (!/[123468]+/.test(note)) {
      logs.push(`${chord}${chalk.red(note)}`)
      conforms = false
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
