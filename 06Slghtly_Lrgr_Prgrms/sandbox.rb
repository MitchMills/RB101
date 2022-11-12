INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'

def display_board(brd)
  system('clear')
  puts ""
  puts "You're #{PLAYER_MARK}. Computer is #{COMPUTER_MARK}."
  puts ""
  puts "       |       |"
  puts "   #{brd[1][0]}   |   #{brd[2][0]}   |   #{brd[3][0]}"
  puts "      #{brd[1][1]}|      #{brd[2][1]}|      #{brd[3][1]}"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[4][0]}   |   #{brd[5][0]}   |   #{brd[6][0]}"
  puts "      #{brd[4][1]}|      #{brd[5][1]}|      #{brd[6][1]}"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[7][0]}   |   #{brd[8][0]}   |   #{brd[9][0]}"
  puts "      #{brd[7][1]}|      #{brd[8][1]}|      #{brd[9][1]}"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = [INITIAL_MARK, "#{num}"] }
  new_board
end


board = initialize_board()
# board[5] = [PLAYER_MARK, ' ']
# board[9] = [COMPUTER_MARK, ' ']
# board[1] = [PLAYER_MARK, ' ']
display_board(board)
