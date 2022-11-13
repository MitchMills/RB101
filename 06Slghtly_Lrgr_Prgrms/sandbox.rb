INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

board = 
{
  1=>["1", "X"], 2=>["2", "X"], 3=>["3", "X"], 

  4=>["4", " "], 5=>["5", " "], 6=>["6", " "], 

  7=>["7", " "], 8=>["8", " "], 9=>["9", " "]
}

WINNING_LINES.each do |line|
  if board.values_at(*line).flatten.count(PLAYER_MARK) == 3
    puts 'Player'
  end
end

# line = [1, 2, 3]
# p board.values_at(*line)
# puts
# p WINNING_LINES.flatten.count(1)