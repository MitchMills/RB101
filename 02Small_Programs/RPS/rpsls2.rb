=begin
Rock crushes Scissors
Rock crushes Lizard
Paper covers Rock
Paper disproves Spock
Scissors cuts Paper
Scissors decapitates Lizard
Spock vaporizes Rock
Spock smashes Scissors
Lizard eats Paper
Lizard poisons Spock

=end

RULES = {
  'Rock' => {abbreviation: 'r', verbs: %(crushes crushes), defeats: %w(Scissors Lizard)},
  'Paper' => {abbreviation: 'p', verbs: %(covers disproves), defeats: %w(Rock Spock)},
  'Scissors' => {abbreviation: 'sc', verbs: %(cuts decapitates), defeats: %w(Paper Lizard)},
  'Spock' => {abbreviation: 'sp', verbs: %(vaporizes smashes), defeats: %w(Rock Scissors)},
  'Lizard' => {abbreviation: 'l', verbs: %(eats poisons), defeats: %w(Paper Spock)}
}

VALID_CHOICES = RULES.keys.map { |key| RULES[key][:abbreviation]}

def prompt(message, action: 'puts')
  action == 'print' ? print("=> #{message}") : puts("=> #{message}")
end

def blank_line(lines = 1)
  lines.times { puts }
end

def welcome
  system('clear')
  prompt("Welcome to Rock, Paper, Scissors!")
  prompt("You will play against the computer.")
  prompt("Enter any key to begin.")
  gets
end

def get_choices
  system('clear')
  [get_user_choice, get_computer_choice]
end

def get_user_choice
  loop do
    prompt("Choose one: #{VALID_CHOICES}: ", action: 'print')
    user_choice = gets.chomp
    return user_choice if VALID_CHOICES.include?(user_choice)
    
    prompt("That's not a valid choice.")
  end
end

def get_computer_choice
  VALID_CHOICES.sample
end

def display_choices(choices)
  user_choice, computer_choice = choices
  prompt("You chose #{user_choice}. The computer chose #{computer_choice}.")
end

def display_result(choices)
  prompt(determine_result(choices))
  blank_line
end

def determine_result(choices)
  user, computer = choices
  if winner?(user, computer)
    'You won!'
  elsif winner?(computer, user)
    'The computer won!'
  else
    "It's a tie!"
  end
end

def winner?(player1, player2)
  (player1 == 'rock' && player2 == 'scissors') ||
    (player1 == 'paper' && player2 == 'rock') ||
    (player1 == 'scissors' && player2 == 'paper')
end

def play_again?
  prompt("Would you like to play again?")
  prompt("Enter y to play again, or any other key to quit: ", action: 'print')
  gets.chomp.downcase == 'y'
end

def goodbye
  blank_line
  prompt("Thank you for playing Rock, Paper, Scissors! Goodbye.")
end

# main program loop
# welcome()
# loop do
#   choices = get_choices()
#   display_choices(choices)
#   display_result(choices)
#   break unless play_again?()
# end
# goodbye()
