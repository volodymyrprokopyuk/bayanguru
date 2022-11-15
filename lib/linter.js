import { readFileSync } from "fs"
import { chalk } from "zx"

function lintFirstNoteOctaveCheck(content) {
  console.log(chalk.cyan("* Missing first note octave check (FNOC)"))
}

function lintEndLineBarCheck(content) {
  console.log(chalk.cyan("* Missing end line bar check (ELBC)"))
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
