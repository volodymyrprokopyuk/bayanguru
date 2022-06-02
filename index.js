import { readFile } from "fs/promises"
import { load } from "js-yaml"

const { scores } = load(await readFile("index.yaml"))
console.log(scores)
