{
  const last = (arr) => arr[arr.length - 1];
  const first = (arr) => arr[0];
  const sum = (arr) => arr.reduce((t, n) => t + n, 0)
}

Start = lines:(Line+) {
  return sum(lines.map(Number));
}

_  = ' '+

eol = [\r]* [\n]+

Other = [^\n]

Number =
  "o" &"ne" { return "1" } /
  "t" &"wo" { return "2" } /
  "t" &"hree" { return "3" } /
  "f" &"our" { return "4" } /
  "f" &"ive" { return "5" } /
  "s" &"ix" { return "6" } /
  "s" &"even" { return "7" } /
  "e" &"ight" { return "8" } /
  "n" &"ine" { return "9" } /
  [0-9]
  
Char = Number / Other { return "_"; }

Line = chars:(Char+) eol {
  const res = chars.filter(c => c !== "_").join("");
  console.log(chars.join(""), first(res) + last(res));
  return first(res) + last(res);
}
