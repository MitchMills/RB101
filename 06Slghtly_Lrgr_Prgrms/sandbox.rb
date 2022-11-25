INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
ALL_SQUARES = [1, 2, 3, 4, 5, 6, 7, 8, 9]
MIDDLE_SQUARE = 5
CORNER_SQUARES = [1, 3, 7, 9]
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
  [1, 5, 9], [3, 5, 7]              # diagonals
]

def prompt(msg)
  puts "=> #{msg}"
end

def choose_first_player
  first_player_choice = nil
  loop do
    prompt("Choose who will go first:")
    prompt("  Enter 1 to go first")
    prompt("  Enter 2 to have the computer go first")
    prompt("  Enter 3 to have a first player chosen randomly")
    first_player_choice = gets.chomp.to_i
    break if [1, 2, 3].include?(first_player_choice)
    prompt("Sorry, that's not a valid choice")
  end
  first_player_choice
end

def first_player
  case choose_first_player()
  when 1 then :player
  when 2 then :computer
  when 3 then [:player, :computer].sample
  end
end

current_player = first_player()
p current_player