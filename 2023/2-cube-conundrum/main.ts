import { parse } from "../../utils.ts";

const __dirname = new URL(".", import.meta.url).pathname;

console.log(
  JSON.stringify(parse("input.txt", "grammar.pegjs", __dirname), null, 2),
);
