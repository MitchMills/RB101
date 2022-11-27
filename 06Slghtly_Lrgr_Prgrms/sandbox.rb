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

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_board
  new_board = {}
  ALL_SQUARES.each { |num| new_board[num] = INITIAL_MARK }
  new_board
end

def update_score(brd, score)
  if game_winner?(brd)
    score[detect_game_winner(brd)] += 1
  else
    score[:ties] += 1
  end
  score
end

def detect_game_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARK) == 3
      return :player
    elsif brd.values_at(*line).count(COMPUTER_MARK) == 3
      return :computer
    end
  end
  nil
end

def game_winner?(brd)
  !!detect_game_winner(brd)
end

def update_score(brd, score)
  if game_winner?(brd)
    score[detect_game_winner(brd)] += 1
  else
    score[:ties] += 1
  end
  score
end

def display_score(brd, score)
  update_score(brd, score)
  prompt("SCORES: Player: #{score[:player]}, \
Computer: #{score[:computer]}, Ties: #{score[:ties]}")
end

board = {
  1=>" ", 2=>" ", 3=>" ", 
  4=>" ", 5=>" ", 6=>" ", 
  7=>" ", 8=>" ", 9=>" "
}

score = score = { player: 0, computer: 0, ties: 0 }

p board
p score
puts
display_score(board, score)
puts
p board
p score
