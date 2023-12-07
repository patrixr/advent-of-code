import { parse } from "../../utils.ts";

const __dirname = new URL(".", import.meta.url).pathname;

console.log(parse("input.txt", "grammar.pegjs", __dirname));
