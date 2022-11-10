require 'pry'

INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'

def prompt(msg)
 puts "=> #{msg}"
end

def display_board(brd)
  system('clear')
  puts ""
  puts "You're #{PLAYER_MARK}. Computer is #{COMPUTER_MARK}."
  puts ""
puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARK}
  new_board
end

def empty_squares(brd)
  brd.keys.select{|num| brd[num] == INITIAL_MARK}
end

def player_picks_square!(brd)
  square = ''
  loop do
    prompt("Choose an empty square (#{empty_squares(brd).join(', ')}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end

  brd[square] = PLAYER_MARK
end

def computer_picks_square!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARK
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                   [1, 5, 9], [3, 5, 7]]            # diagonals
  
  winning_lines.each do |line|
    if  brd[line[0]] == PLAYER_MARK &&
        brd[line[1]] == PLAYER_MARK &&
        brd[line[2]] == PLAYER_MARK
        return 'Player'
    elsif brd[line[0]] == COMPUTER_MARK &&
          brd[line[1]] == COMPUTER_MARK &&
          brd[line[2]] == COMPUTER_MARK
          return 'Computer'
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_picks_square!(board)
    break if winner?(board) || board_full?(board)

    computer_picks_square!(board)
    break if winner?(board) || board_full?(board)
  end

  display_board(board)

  if winner?(board)
    prompt("#{detect_winner(board)} won!")
  else
    prompt("It's a tie!")
  end

  prompt("Play again? (y or n)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thanks for playing Tic Tac Toe! Goodbye.")

