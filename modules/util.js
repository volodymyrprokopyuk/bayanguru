import chalk from "chalk"

export function reFromParts(flags, ...parts) {
  const re = parts.map(part => part.source).join("")
  return flags ? new RegExp(re, flags) : new RegExp(re)
}

export function parallelLimit(jobs, limit) {
  let i = 0, running = 0, completed = 0
  return new Promise((resolve, reject) => {
    function check() {
      if (++completed === jobs.length) { return resolve() }
      if (--running < limit) { parallel() }
    }
    function parallel() {
      while (i < jobs.length && running < limit) {
        jobs[i++]().then(check, error => {
          console.log(chalk.red(error)); process.exit(1)
        })
        ++running
      }
    }
    parallel()
  })
}
