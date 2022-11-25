INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
ALL_SQUARES = [1, 2, 3, 4, 5, 6, 7, 8, 9]
MIDDLE_SQUARE = 5
CORNER_SQUARES = [1, 3, 7, 9]
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

def game_number(score)
  score.values.sum + 1
end

def ahead?(score, player1, player2)
  score[player1] > score[player2]
end

def detect_match_winner(score, current_player)
  if (score[current_player] >= 3) || 
    (game_number(score) > 5 && ahead?(score, current_player, alternate_player(current_player)))
    return current_player


    
  elsif (score[player2] >= 3) || 
    (game_number(score) > 5 && ahead?(score, player2, player1))
    return player2
  elsif
    game_number(score) > 5
    return :tie
  end
  nil
end

def match_winner?(score, player1, player2)
  !!detect_match_winner(score, player1, player2)
end

def display_match_winner(match_winner)
  case match_winner
  when :player
    prompt("You have won the Match!")
  when :computer
    prompt("Computer has won the Match!")
  when :tie
    prompt("This Match has ended in a tie.")
  end
end

def alternate_player(current_player)
  if current_player == :computer
    :player
  else
    :computer
  end
end


current_player = :player
score = { player: 1, computer: 2, ties: 2 }

match_winner = detect_match_winner(score, current_player, alternate_player(current_player))
match_winner2 = detect_match_winner(score, :player, :computer)
p match_winner
p match_winner2
