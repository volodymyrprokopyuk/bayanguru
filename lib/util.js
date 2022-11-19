export function reFromParts(flags, ...parts) {
  const re = parts.map(p => p.source).join("")
  return flags ? new RegExp(re, flags) : new RegExp(re)
}
