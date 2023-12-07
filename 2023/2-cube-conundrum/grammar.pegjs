{
  const maximums = {
    "red": 12,
    "blue": 14,
    "green": 13
  };
  
  const analyzeMaximums = (games) => {
    const validGames = games.filter(g => {
      return g.rounds.every(round => {
        return round.every(co => co.colorCount <= maximums[co.color]); 
      })
    })

    return validGames.reduce((t, g) => t + g.gameNumber, 0);
  };

  const analyzeMinimums = (games) => {
    const gamePowers = games.map(g => {
      let counts = {
        red: 0,
        blue: 0,
        green: 0
      }

      for (const round of g.rounds) {
        for (const pick of round) {
          if (pick.colorCount > counts[pick.color]) {
            counts[pick.color] = pick.colorCount;
          }
        }
      }

      return counts.red * counts.blue * counts.green;
    })

    return gamePowers.reduce((t, p) => t + p, 0);
  }
}

Start = games:(Game+) {
  return analyzeMinimums(games);
}

_  = ' '*
__ = ' '+

eol = [\r]* [\n]+

Other = [^\n]

Number = digits:([0-9]+) { return Number(digits.join("")) }
  
Char = Number / Other { return "_"; }

Color = "blue" / "red" / "green"

ColorOutput = _ colorCount:(Number) _ color:(Color) ","? {
  return {
    colorCount,
    color
  }
}

GameRound = colorOutputs:(ColorOutput)+ (";" / eol) { return colorOutputs }

Game = "Game" __ gameNumber:(Number) ":" _ rounds:(GameRound+) {
  return {
    gameNumber: Number(gameNumber),
    rounds
  }
}
