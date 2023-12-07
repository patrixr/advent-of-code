import peg from "npm:pegjs";

export const read = (path: string, directory: string = ".") => {
  return Deno.readTextFileSync(directory + "/" + path);
};

export const grammar = (file: string, directory = ".") => {
  return peg.generate(read(file, directory), {
    cache: true,
    optimize: "speed",
  });
};

export const parse = (input: string, grammarFile: string, directory = ".") => {
  return grammar(grammarFile, directory).parse(read(input, directory));
};
