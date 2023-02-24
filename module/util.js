export function reFromParts(flags, ...parts) {
  const re = parts.map(part => part.source).join("")
  return flags ? new RegExp(re, flags) : new RegExp(re)
}

export function asyncParallel(jobs, limit) {
  let index = 0
  let running = 0
  let completed = 0
  return new Promise((resolve, reject) => {
    function done() {
      if (++completed === jobs.length) { return resolve() }
      if (--running < limit) { parallel() }
    }
    function parallel() {
      while (index < jobs.length && running < limit) {
        const job = jobs[index++]
        job().then(done, error => { throw new Error(error) })
        ++running
      }
    }
    parallel()
  })
}
