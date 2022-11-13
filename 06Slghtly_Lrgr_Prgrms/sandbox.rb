score = {player: 1, computer: 4, ties: 1}

def detect_match_winner(score)
  if score[:player] >= 3
    return 'Player'
  elsif score[:computer] >= 3
    return 'Computer'
  elsif score.values.sum >= 5
    return 'Tie'
  end
  nil
end


def match_winner?(score)
  !!detect_match_winner(score)
end

p detect_match_winner(score)
p match_winner?(score)
