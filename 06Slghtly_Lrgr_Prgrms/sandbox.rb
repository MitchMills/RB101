require 'pry-byebug'

INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

board = {1=>"X", 2=>"X", 3=>"O", 4=>"O", 5=>"X", 6=>"O", 7=>" ", 8=>" ", 9=>" "}
score = { player_score: 0, computer_score: 0, ties: 0 }

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARK }
end




#####
def find_third_square(line, brd)
  if brd.values_at(*line).count(INITIAL_MARK) == 1
    third_square = brd.select{ |k, v| line.include?(k) && v == INITIAL_MARK }.keys.first
  end
end

def classify_third_square(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARK) == 2
    return 'opportunity'
  elsif brd.values_at(*line).count(PLAYER_MARK) == 2
    return 'threat'
  end
end

def get_third_squares(brd)
  third_squares = {}
  WINNING_LINES.each do |line|
    if find_third_square(line, brd)
      third_square = find_third_square(line, brd)
      square_status = classify_third_square(line, brd)
      third_squares[third_square] = square_status
    end
  end
  third_squares.reject! { |k, v| v == nil }
end

def computer_picks_square!(brd)
  
  
  if third_squares.values.any?('opportunity')
    target_square = third_squares.select { |k, v| v == 'opportunity'}.keys.sample
  elsif third_squares.values.any?('threat')
    target_square = third_squares.select { |k, v| v == 'threat'}.keys.sample
  elsif empty_squares(brd).include?(5)
    target_square = 5
  else
    target_square = empty_squares(brd).sample
  end

  brd[target_square] = COMPUTER_MARK
end
#####




def find_at_risk_square(line, brd)
  if brd.values_at(*line).count(PLAYER_MARK) == 2
    at_risk_square = brd.select{ |square, status| line.include?(square) && status == INITIAL_MARK }.keys.first
  else
    nil
  end
end

# def computer_places_piece!(brd)
#   threats = []
#   WINNING_LINES.each do |line|
#     at_risk_square = find_at_risk_square(line, brd)
#     threats << at_risk_square
#   end
#   p threats.compact

#   if threats.compact.empty?
#     target_square = empty_squares(brd).sample
#   else
#     target_square = threats.compact.sample
#   end

#   brd[target_square] = COMPUTER_MARK
# end

p board
third_squares = get_third_squares(board)
p third_squares
