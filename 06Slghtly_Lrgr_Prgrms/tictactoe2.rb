require 'pry-byebug'

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

def choose_first_player
  first_player = nil
  loop do
    prompt("Choose who will go first:")
    prompt("  Enter 1 to go first")
    prompt("  Enter 2 to have the computer go first")
    prompt("  Enter 3 to have a first player chosen randomly")
    first_player = gets.chomp.to_i
    break if [1, 2, 3].include?(first_player)
    prompt("Sorry, that's not a valid choice")
  end
  first_player
end

def first_player
  first_player = choose_first_player
  current_player =  case first_player
                    when 1 then 'Player'
                    when 2 then 'Computer'
                    when 3 then ['Player', 'Computer'].sample
                    end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARK }
  new_board
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, score)
  brd_nums = board_numbers(brd)
  system('clear')
  prompt("Game #{game_number(score)}")
  display_score(score)
  prompt("You are #{PLAYER_MARK}. Computer is #{COMPUTER_MARK}.")
  prompt("Your move!")
  puts
  puts "       |       |"
  puts "   #{brd[1]}   |   #{brd[2]}   |   #{brd[3]}"
  puts "      #{brd_nums[1]}|      #{brd_nums[2]}|      #{brd_nums[3]}"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[4]}   |   #{brd[5]}   |   #{brd[6]}"
  puts "      #{brd_nums[4]}|      #{brd_nums[5]}|      #{brd_nums[6]}"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{brd[7]}   |   #{brd[8]}   |   #{brd[9]}"
  puts "      #{brd_nums[7]}|      #{brd_nums[8]}|      #{brd_nums[9]}"
  puts
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARK }
end

def empty_corners(brd)
  corners = [1, 3, 7, 9]
  corners.intersection(empty_squares(brd))
end

def board_numbers(brd)
  brd_nums = {}
  (1..9).each do |num|
    brd_nums[num] = if empty_squares(brd).include?(num)
                      num
                    else
                      ' '
                    end
  end
  brd_nums
end

def game_number(score)
  score.values.sum + 1
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
  brd[square] = PLAYER_MARK
end

def get_target_square(line, brd, mark)
  if (brd.values_at(*line).count(mark) == 2) &&
     (brd.values_at(*line).count(INITIAL_MARK) == 1)
    line.intersection(empty_squares(brd)).first
  end
  nil
end

def target_square?(line, brd, mark)
  !!get_target_square(line, brd, mark)
end

def get_all_targets(brd)
  opportunities = []
  threats = []

  WINNING_LINES.each do |line|
    opportunities << get_target_square(line, brd, COMPUTER_MARK) if
      target_square?(line, brd, COMPUTER_MARK)
    threats << get_target_square(line, brd, PLAYER_MARK) if
      target_square?(line, brd, PLAYER_MARK)
  end

  { opportunities: opportunities, threats: threats }
end

# rubocop:disable Metrics/AbcSize
def computer_picks_square!(brd)
  all_targets = get_all_targets(brd)

  target_square = if all_targets[:opportunities].size > 0
                    all_targets[:opportunities].sample
                  elsif all_targets[:threats].size > 0
                    all_targets[:threats].sample
                  elsif empty_squares(brd).include?(5)
                    5
                  elsif empty_corners(brd).size > 0
                    empty_corners(brd).sample
                  else
                    empty_squares(brd).sample
                  end

  brd[target_square] = COMPUTER_MARK
end
# rubocop:enable Metrics/AbcSize

def detect_game_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARK) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARK) == 3
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
  score
end

def display_score(score)
  prompt("SCORES: Player: #{score[:player_score]}, \
Computer: #{score[:computer_score]}, Ties: #{score[:ties]}")
end

def ahead?(player1, player2)
  player1 > player2
end

def detect_match_winner(score)
  if  (score[:player_score] >= 3) ||
      (game_number(score) > 5 && ahead?(score[:player_score], score[:computer_score]))
    return 'Player' 
  elsif (score[:computer_score] >= 3) ||
        (game_number(score) > 5 && ahead?(score[:computer_score], score[:player_score]))
    return 'Computer'
  elsif game_number(score) > 5
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
    prompt("You have won the Match!")
  when 'Computer'
    prompt("Computer has won the Match!")
  when 'Tie'
    prompt("This Match has ended in a tie.")
  end
end

def pick_square!(brd, current_player)
  if current_player == 'Computer'
    computer_picks_square!(brd)
  else
    player_picks_square!(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'Computer'
    'Player'
  else
    'Computer'
  end
end

# main game loop
first_time = true

loop do ### MATCH LOOP BEGIN
  system('clear')
  score = { player_score: 0, computer_score: 0, ties: 0 }
  if first_time == true
    prompt("Welcome to Tic Tac Toe! You will play against the computer.")
    first_time = false
  else
    prompt("Welcome back! Ready for another Match?")
  end

  prompt("Whoever wins the most games out of five will win the Match.")
  puts

  current_player = first_player
  prompt("#{current_player} will go first on Game 1.")
  prompt("After that the first player will alternate.")
  prompt("Enter any key to continue.")
  gets

  loop do ### SINGLE GAME LOOP BEGIN
    board = initialize_board

    loop do ### MOVES LOOP BEGIN
      display_board(board, score) if current_player == 'Player'
      pick_square!(board, current_player)
      current_player = alternate_player(current_player)
      break if game_winner?(board) || board_full?(board)
    end ### MOVES LOOP END

    display_board(board, score)

    game_winner = detect_game_winner(board)
    if game_winner?(board)
      prompt("#{game_winner} won this game!")
    else
      prompt("It's a tie!")
    end
    puts

    update_score(score, game_winner)
    display_score(score)
    break if match_winner?(score)

    prompt("Enter any key to continue to Game #{score.values.sum + 1}.")
    gets
  end ### SINGLE GAME LOOP END

  match_winner = detect_match_winner(score)
  display_match_winner(match_winner)
  puts

  prompt("If you would you like to play another Match, enter 'y'.")
  prompt("Enter any other key to exit.")
  another_match = gets.chomp.downcase
  break unless another_match == 'y'
end ### MATCH LOOP END

prompt("Thank you for playing Tic Tac Toe! Goodbye.")
