INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

def prompt(msg)
  puts "=> #{msg}"
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

def update_score(brd, score, winner)
  if game_winner?(brd)
    score[winner] += 1
  else
    score[:ties] += 1
  end
  score
end

board = {1=>"X", 2=>"X", 3=>"X", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
score = { player: 0, computer: 0, ties: 0 }
game_winner = detect_game_winner(board)
update_score(board, score, game_winner)
p game_winner
p score
