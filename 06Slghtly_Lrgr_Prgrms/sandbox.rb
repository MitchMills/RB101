require 'pry-byebug'

INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

# board = {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
board = {1=>"X", 2=>"X", 3=>"O", 4=>"O", 5=>"X", 6=>"O", 7=>" ", 8=>" ", 9=>" "}
score = { player_score: 0, computer_score: 0, ties: 0 }

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARK }
end

def empty_corners(brd)
  corners = [1, 3, 7, 9]
  empty_corners = corners.intersection(empty_squares(brd))
end

def get_target_square(line, brd)
  target_square = line.intersection(empty_squares(brd)).first
end

def get_target(line, brd, mark)
  if (brd.values_at(*line).count(mark) == 2) &&
     (brd.values_at(*line).count(INITIAL_MARK) == 1)
    target = get_target_square(line, brd)
  end  
end

def target?(line, brd, mark)
  !!get_target(line, brd, mark)
end

def get_all_targets(brd)
  opportunities = []
  threats = []

  WINNING_LINES.each do |line|
    opportunities << get_target(line, brd, COMPUTER_MARK) if target?(line, brd, COMPUTER_MARK)
    threats << get_target(line, brd, PLAYER_MARK) if target?(line, brd, PLAYER_MARK)
  end

  all_targets = {opportunities: opportunities, threats: threats}
end


def computer_picks_square!(brd)
  all_targets = get_all_targets(brd)

  if all_targets[:opportunities].size > 0
    target_square = all_targets[:opportunities].sample
  elsif all_targets[:threats].size > 0
    target_square = all_targets[:threats].sample
  elsif empty_squares(brd).include?(5)
    target_square = 5
  elsif empty_corners(brd).size > 0
    target_square = empty_corners(brd).sample
  else
    target_square = empty_squares(brd).sample
  end

  brd[target_square] = COMPUTER_MARK
end


# line = [3, 6, 9]
p board
p get_all_targets(board)
# p board
