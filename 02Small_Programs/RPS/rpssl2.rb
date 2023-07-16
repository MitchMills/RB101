=begin
Rock crushes Scissors, Rock crushes Lizard
Paper covers Rock, Paper disproves Spock
Scissors cuts Paper, Scissors decapitates Lizard
Spock vaporizes Rock, Spock smashes Scissors
Lizard eats Paper, Lizard poisons Spock

=> THE RULES:
=> Rock (r) defeats:   lizard, scissors
=> Paper (p) defeats:   rock, spock
=> Scissors (sc) defeats:   paper, lizard
=> Spock (sp) defeats:   scissors, rock
=> Lizard (l) defeats:   spock, paper

=end

require 'yaml'
MESSAGES = YAML.load_file('rpssl2_messages.yml')
LANGUAGE = 'en'

CHOICES = {
  'rock' => {abbreviation: 'r', verbs: %(crushes crushes), defeats: %w(scissors lizard)},
  'paper' => {abbreviation: 'p', verbs: %(covers disproves), defeats: %w(rock spock)},
  'scissors' => {abbreviation: 'sc', verbs: %(cuts decapitates), defeats: %w(paper lizard)},
  'spock' => {abbreviation: 'sp', verbs: %(vaporizes smashes), defeats: %w(rock scissors)},
  'lizard' => {abbreviation: 'l', verbs: %(eats poisons), defeats: %w(paper spock)}
}

VALID_CHOICES = CHOICES.keys + CHOICES.keys.map { |choice| CHOICES[choice][:abbreviation]}

# General Use Methods
def blank_line(lines = 1)
  lines.times { puts }
end

def prompt(key, action: 'puts', data: '', lang: LANGUAGE)
  message = format(MESSAGES[lang][key], data: data)
  action == 'print' ? print("=> #{message}") : puts("=> #{message}")
end

# Intro Methods
def welcome_player(user_info)
  system('clear')
  welcome(user_info)
  intro(user_info)
  gets
end

def welcome(user_info)
  prompt('welcome')
  user_info[:name] = get_name()
  prompt('start', data: user_info[:name])
end

def get_name
  prompt('name', action: 'print')
  gets.chomp
end

def intro(user_info)
  blank_line
  prompt('intro')
  prompt('rules?', action: 'print')
  display_rules if gets.chomp.downcase == 'y'
  ready?(user_info)
end

def display_rules
  rules = generate_rules
  prompt('rules')
  rules.each do |rule|
    prompt('rule', data: rule)
  end
end

def generate_rules
  CHOICES.keys.map do |choice|
    "#{choice.capitalize} (#{CHOICES[choice][:abbreviation]}) defeats: #{CHOICES[choice][:defeats].join(', ')}"
  end
end

def ready?(user_info)

end






# Choice Methods
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

# Results Methods
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
  CHOICES[player1][:defeats].include?(player2)
end

# Outro Methods
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
user_info = {
  name: '', 
  score: {user_wins: 0, computer_wins: 0, ties: 0}
}
welcome_player(user_info)
loop do
  choices = get_choices()
  display_choices(choices)
  display_result(choices)
  break unless play_again?()
end
goodbye()
