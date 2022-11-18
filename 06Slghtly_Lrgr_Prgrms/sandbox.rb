INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

board = {1=>"X", 2=>"X", 3=>" ", 4=>"O", 5=>"X", 6=>"O", 7=>" ", 8=>" ", 9=>" "}
score = { player_score: 0, computer_score: 0, ties: 0 }

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARK }
end


def find_at_risk_square(line, brd)
  if brd.values_at(*line).count(PLAYER_MARK) == 2
    at_risk_square = brd.select{ |k,v| line.include?(k) && v == INITIAL_MARK }.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  at_risk_squares = []
  WINNING_LINES.each do |line|
    at_risk_square = find_at_risk_square(line, brd)
    at_risk_squares << at_risk_square
  end
  

  if at_risk_squares.compact.empty?
    target_square = empty_squares(brd).sample
  else
    target_square = at_risk_squares.compact.sample
  end

  brd[target_square] = COMPUTER_MARK
end

p board
computer_places_piece!(board)
p board
