require 'pry'

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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = [num, INITIAL_MARK] }
  new_board
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, score)
  system('clear')
  puts
  puts "You are #{PLAYER_MARK}. Computer is #{COMPUTER_MARK}."
  puts "Game #{score.values.sum + 1}"
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
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def empty_squares(brd)
  brd.keys.select { |num| brd[num][1] == INITIAL_MARK }
end

def joinor(array, delimiter = ', ', word = 'or')
  case array.size
  when 0 then ''
  when 1 then array[0].to_s
  when 2 then array.join(" #{word} ")
  else
    array[-1] = "#{word} #{array.last}"
    array.join(delimiter)
  end
end

def player_picks_square!(brd)
  square = ''
  loop do
    prompt("Choose an empty square: #{joinor(empty_squares(brd))}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("That's not a valid choice. Try again.")
  end
  brd[square] = [' ', PLAYER_MARK]
end

def computer_picks_square!(brd)
  square = empty_squares(brd).sample
  brd[square] = [' ', COMPUTER_MARK]
end

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

def game_winner?(brd)
  !!detect_game_winner(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def update_score(score, winner)
  if winner == 'Player'
    score[:player_score] += 1
  elsif winner == 'Computer'
    score[:computer_score] += 1
  else
    score[:ties] += 1
  end
end

def display_score(score)
  prompt("SCORES: Player: #{score[:player_score]}, Computer: #{score[:computer_score]}, \
Ties: #{score[:ties]}")
end

def detect_match_winner(score)
  if score[:player_score] >= 3
    return 'Player'
  elsif score[:computer_score] >= 3
    return 'Computer'
  elsif score.values.sum >= 5
    return 'Tie'
  end
  nil
end

def match_winner?(score)
  !!detect_match_winner(score)
end

def display_match_winner(match_winner)
  case match_winner
  when 'Player'
    prompt("You are the Match Winner!")
  when 'Computer'
    prompt("Computer is the Match Winner!")
  when 'Tie'
    prompt("The Match has ended in a tie.")
  end
end



# main game loop
first_time = true

loop do ### PROGRAM LOOP BEGIN
  system('clear')
  score = { player_score: 0, computer_score: 0, ties: 0 }
  
  if first_time
    prompt("Welcome to Tic Tac Toe. You will play against the computer.")
    first_time = false
  else
    prompt("Welcome back! Ready for another match?")
  end
  prompt("Whoever wins the most games out of five will be the Match Winner.")


  loop do ### MATCH LOOP BEGIN

    prompt("Let's begin Game #{score.values.sum + 1}.")
    prompt("Enter any key to continue.")
    gets

    loop do ### GAME LOOP BEGIN
      board = initialize_board()

      loop do
        display_board(board, score)

        player_picks_square!(board)
        break if game_winner?(board) || board_full?(board)

        computer_picks_square!(board)
        break if game_winner?(board) || board_full?(board)
      end

      display_board(board, score)
      
      
    

      game_winner = detect_game_winner(board)
      if game_winner?(board)
        prompt("#{game_winner} won!")
      else
        prompt("It's a tie!")
      end

      update_score(score, game_winner)
      display_score(score)
      prompt("Enter any key to continue to Game #{score.values.sum + 1}.")
      gets
      

      break if match_winner?(score)

    end ### GAME LOOP END
    match_winner = detect_match_winner(score)
    display_match_winner(match_winner)
    
  end ### MATCH LOOP END

end ### PROGRAM LOOP END

prompt("Thank you for playing Tic Tac Toe! Goodbye.")
