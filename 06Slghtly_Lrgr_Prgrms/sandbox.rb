
def game_number(score)
  score.values.sum + 1
end

def ahead?(player1, player2)
  player1 > player2
end



# collapse if and elsif branches into one with parameter for player in question
def detect_match_winner(score)
  if  (score[:player_score] >= 3) ||
      (game_number(score) >= 5 && ahead?(score[:player_score], score[:computer_score]))
    return 'Player' 
  elsif (score[:computer_score] >= 3) ||
        (game_number(score) >= 5 && ahead?(score[:computer_score], score[:player_score]))
    return 'Computer'
  elsif game_number(score) >= 5
    return 'Tie'
  end
  nil
end






p detect_match_winner({ player_score: 3, computer_score: 2, ties: 0 }) # player
p detect_match_winner({ player_score: 0, computer_score: 3, ties: 0 }) # computer
p detect_match_winner({ player_score: 2, computer_score: 2, ties: 1 }) # tie
p detect_match_winner({ player_score: 0, computer_score: 0, ties: 0 }) # nil
p detect_match_winner({ player_score: 1, computer_score: 2, ties: 2 }) # computer
