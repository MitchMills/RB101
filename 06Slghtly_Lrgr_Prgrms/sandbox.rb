require 'pry-byebug'

INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

board = {1=>"X", 2=>"X", 3=>"O", 4=>"O", 5=>"X", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
score = { player_score: 0, computer_score: 0, ties: 0 }

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARK }
end

def empty_corners(brd)
  corners = [1, 3, 7, 9]
  empty_corners = corners.intersection(empty_squares(brd))
end



# COMBINE THESE TWO: ONLY NEED 'target_square?(line, brd)'.
# Use intersection method?
def find_target_square(line, brd)
  if brd.values_at(*line).count(INITIAL_MARK) == 1
    target_square = brd.select{ |k, v| line.include?(k) && v == INITIAL_MARK }.keys.first
  end
end

def target_square?(line, brd)
  !!find_target_square(line, brd)
end




def get_opportunity(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARK) == 2
    opportunity_square = find_target_square(line, brd)
  end
end

def get_threat(line, brd)
  if brd.values_at(*line).count(PLAYER_MARK) == 2
    threat_square = find_target_square(line, brd)
  end
end

def get_target_squares(brd)
  opportunities = []
  threats = []

  WINNING_LINES.each do |line|
    if target_square?(line, brd)
      opportunities << get_opportunity(line, brd)
      threats << get_threat(line,brd)
    end
  end
  target_squares = {opportunities: opportunities.compact, threats: threats.compact}
end

def computer_picks_square!(brd)
  target_squares = get_target_squares(brd)

  if target_squares[:opportunities].size > 0
    target_square = target_squares[:opportunities].sample
  elsif target_squares[:threats].size > 0
    target_square = target_squares[:threats].sample
  elsif empty_squares(brd).include?(5)
    target_square = 5
  elsif empty_corners(brd).size > 0
    target_square = empty_corners(brd).sample
  else
    target_square = empty_squares(brd).sample
  end

  brd[target_square] = COMPUTER_MARK
end


p board
get_target_squares(board)
p board
