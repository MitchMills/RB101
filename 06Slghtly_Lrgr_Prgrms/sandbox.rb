
INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

board = {
  1=>[1, "X"], 2=>[2, " "], 3=>[3, "X"], 
  4=>[4, " "], 5=>[5, " "], 6=>[6, " "], 
  7=>[7, " "], 8=>[8, " "], 9=>[9, " "]
}

def detect_game_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).flatten.count(PLAYER_MARK) == 3
      return 'Player'
    elsif brd.values_at(*line).flatten.count(COMPUTER_MARK) == 3
      return 'Computer'
    end
  end
  nil
end

def detect_threat(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).flatten.count(PLAYER_MARK) == 2 &&
      brd.values_at(*line).flatten.count(INITIAL_MARK) == 1
      return line
    end
  end
  nil
end

def counter_threat(brd)
  if detect_threat(brd)
    threat_line = detect_threat(brd)
    target_square = threat_line.select {|num| brd[num][1] == INITIAL_MARK}
    brd[target_square[0]][1] = COMPUTER_MARK
  end
end

p board
puts
counter_threat(board)
p board
