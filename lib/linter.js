import { readFileSync } from "fs"
import { chalk } from "zx"

// Disable: prepend | (measure starts)
function lintFirstNoteOctaveCheck(content) {
  console.log(chalk.yellow("* Missing first note octave check"))
  // First note or chord
  for (const [_, note, check, rest] of content.matchAll(
    /(^ +<?[cdefgab](?:is|es){0,2}[,']*)(.)(.*)/mg
  )) {
    if (!/[=+@Mm7d]/.test(check)) {
      console.log(`${chalk.red(note)}${chalk.red(check)}${rest}`)
    }
  }
  // \command { first note or chord }
  for (const [_, note, check, rest] of content.matchAll(
    /(\\\w+ \S* ?\{ <?[cdefgab](?:is|es){0,2}[,']*)(.)(.*)/mg
  )) {
    if (!/[=+@Mm7d]/.test(check)) {
      console.log(`${chalk.red(note)}${chalk.red(check)}${rest}`)
    }
  }
  // r/lhFragN("first note or chord")
  for (const [_, note, check, rest] of content.matchAll(
    /([rl]hFrag\d+\("<?[cdefgab](?:is|es){0,2}[,']*)(.)(.*)/mg
  )) {
    if (!/[=+@Mm7d]/.test(check)) {
      console.log(`${chalk.red(note)}${chalk.red(check)}${rest}`)
    }
  }
}

// Disable: append % (measure continues)
function lintEndLineBarCheck(content) {
  console.log(chalk.yellow("* Missing end line bar check"))
  for (const [_, rest, end] of content.matchAll(
    /((?:^ +|^ +\| |^ +\{\{ )<?[cdefgabs](?:is|es){0,2}[,']*.*)(.{2})$/mg
  )) {
    if (!/ \||."|\}\}| %/.test(end)) {
      console.log(`${rest}${chalk.red(end)}`)
    }
  }
}

// Pitch, duration, articulation, dynamic, text
function lintTermComponentOrder(content) {
  console.log(chalk.yellow("* Invalid note component order"))
  for (const [note] of content.matchAll(/\b[cdefgab](?:is|es){0,2}\b\S*/g)) {
    const [_, m, rest] = note.match(
      /^([cdefgab](?:is|es){0,2}(?:[,']*=?[,']*){0,1}(?:\d{1.2}\.{0,2}){0,1})(.*)/
    )
    if (m) { console.log(`${chalk.cyan(m)}${rest}`) }
    else { console.log(chalk.red(note)) }
  }
}

const linters = [
  lintFirstNoteOctaveCheck,
  lintEndLineBarCheck,
  // lintTermComponentOrder
]

export function lint(piece) {
  const { src, file } = piece
  const path = `source/${src}/${file}.lys`
  console.log("$", chalk.green.bold("lint"), chalk.yellow.bold(path))
  const content = String(readFileSync(path))
  for (const linter of linters) { linter(content) }
}
