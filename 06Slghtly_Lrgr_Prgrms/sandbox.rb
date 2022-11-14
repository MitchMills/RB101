def prompt(msg)
  puts "=> #{msg}"
end

def display_score(score)
  prompt("SCOREBOARD")
  prompt("Player: #{score[:player_score]}, Computer: #{score[:computer_score]}, \
Ties: #{score[:ties]}")
end

score = {player_score: 2, computer_score: 3, ties: 0}

display_score(score)
