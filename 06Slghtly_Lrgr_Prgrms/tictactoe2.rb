INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ["#{num}", INITIAL_MARK]}
  new_board
end

def display_board(brd)
  system('clear')
  puts
  puts "You are #{PLAYER_MARK}. Computer is #{COMPUTER_MARK}."
  puts
  puts "       |       |"
  puts "   #{brd[1][1]}   |   #{brd[2][1]}   |   #{brd[3][1]}"
  puts "      #{brd[1][0]}|      #{brd[2][0]}|      #{brd[3][0]}"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[4][1]}   |   #{brd[5][1]}   |   #{brd[6][1]}"
  puts "      #{brd[4][0]}|      #{brd[5][0]}|      #{brd[6][0]}"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[7][1]}   |   #{brd[8][1]}   |   #{brd[9][1]}"
  puts "      #{brd[7][0]}|      #{brd[8][0]}|      #{brd[9][0]}"
  puts
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num][1] == INITIAL_MARK }
end

def player_picks_square!(brd)
  square = ''
  loop do
    prompt("Choose a square: (#{empty_squares(brd).join(', ')}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("That's not a valid choice. Try again.")
  end
  brd[square] = [' ', PLAYER_MARK]
end


board = initialize_board()
display_board(board)
player_picks_square!(board)
display_board(board)




=begin
  initialize board
  display board
  {1=>["1", " "], 2=>["2", " "], 3=>["3", " "], 
   4=>["4", " "], 5=>["5", " "], 6=>["6", " "], 
   7=>["7", " "], 8=>["8", " "], 9=>["9", " "]}
  player turn
computer turn
display board
winner?
board full?
repeat
play again?
=end
