import { readFileSync } from "fs"
import { chalk } from "zx"

function lintFirstNoteOctaveCheck(content) {
  console.log(chalk.yellow("* Missing first note octave check"))
  for (const [_, note, check, rest] of content.matchAll(
    /((?:^ +| \\\S+ \S* ?\{ | [rl]hFrag\d+\(")<?[cdefgab](?:is|es){0,2}[,']*)(.)(.*)/mg
  )) {
    if (!/[=+@Mm7d]/.test(check)) {
      console.log(`${chalk.red(note)}${chalk.red(check)}${rest}`)
    }
  }
}

function lintEndLineBarCheck(content) {
  console.log(chalk.yellow("* Missing end line bar check"))
  for (const [_, rest, end] of content.matchAll(
    /((?:^ +|^ +\{\{ )<?[cdefgab](?:is|es){0,2}[,']*.*)(.{2})$/mg
  )) {
    if (!/ \||."|\}{2}| %/.test(end)) {
      console.log(`${rest}${chalk.red(end)}`)
    }
  }
}

const linters = [
  lintFirstNoteOctaveCheck,
  lintEndLineBarCheck
]

export function lint(piece) {
  const { src, file } = piece
  const path = `source/${src}/${file}.lys`
  console.log("$", chalk.green.bold("lint"), chalk.yellow.bold(path))
  const content = String(readFileSync(path))
  for (const linter of linters) { linter(content) }
}
