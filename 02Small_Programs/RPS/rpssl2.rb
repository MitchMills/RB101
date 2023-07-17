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
def welcome_player(game_info)
  system('clear')
  welcome(game_info)
  intro(game_info)
end

def welcome(game_info)
  prompt('welcome')
  game_info[:name] = get_name()
  prompt('start', data: game_info[:name])
  blank_line
end

def get_name
  prompt('name', action: 'print')
  loop do
    name = gets.chomp
    return name unless name.empty?
    prompt('invalid_name', action: 'print')
  end
end

def intro(game_info)
  prompt('intro')
  blank_line
  prompt('rules?', action: 'print')
  display_rules if gets.chomp.downcase == 'y'
end

def display_rules
  system('clear')
  rules = format_rules()
  prompt('rules')
  rules.each do |rule|
    prompt('rule', data: rule)
  end
  blank_line
  prompt('start_playing', action: 'print')
  gets
end

def format_rules
  CHOICES.keys.map do |choice|
    "#{choice.capitalize} (#{CHOICES[choice][:abbreviation]}) defeats: " +
    "#{CHOICES[choice][:defeats].join(', ')}"
  end
end




# Choice Methods
def get_choices
  system('clear')
  [get_user_choice, get_computer_choice]
end

def get_user_choice
  display_user_choices()
  user_choice = get_choice()
  abbreviation_to_word(user_choice)
end

def display_user_choices
  system('clear')
  choices = format_user_choices()
  prompt('choices')
  choices.each { |choice| prompt('choice', data: choice) }
end

def format_user_choices
  CHOICES.keys.map do |choice|
    "To choose #{choice.capitalize}, enter: #{CHOICES[choice][:abbreviation]}"
  end
end

def get_choice
  loop do
    blank_line
    prompt('user_choice?', action: 'print')
    user_choice = gets.chomp.downcase
    return user_choice if VALID_CHOICES.include?(user_choice)
    prompt("invalid_choice")
  end
end

def abbreviation_to_word(user_choice)
  CHOICES.each do |choice, info|
    return choice if (choice == user_choice) ||
      (info[:abbreviation] == user_choice) 
  end
end

def get_computer_choice
  CHOICES.keys.sample
end

def display_choices(choices)
  blank_line
  formatted_choices = format_choices(choices).join(' ')
  prompt('display_choices', data: formatted_choices)
end

def format_choices(choices)
  ['You', 'The computer'].map do |word|
    "#{word} chose #{choices.shift.capitalize}."
  end
end

display_choices(get_choices)



# Results Methods
def display_result(choices)
  prompt(determine_result(choices))
  blank_line
end

def determine_result(choices)
  user, computer = choices
  if game_winner?(user, computer)
    'You won!'
  elsif game_winner?(computer, user)
    'The computer won!'
  else
    "It's a tie!"
  end
end

def game_winner?(player1, player2)
  CHOICES[player1][:defeats].include?(player2)
end


# Outro Methods
def play_again?
  prompt("play_again?")
  gets.chomp.downcase == 'y'
end

def goodbye
  blank_line
  prompt("Thank you for playing Rock, Paper, Scissors! Goodbye.")
end

# main program loop
game_info = {
  first_time?: true,
  name: '', 
  score: {user_wins: 0, computer_wins: 0, ties: 0}
}
# welcome_player(game_info)
# loop do

#   loop do
#     choices = get_choices()
#     display_choices(choices)
#     display_result(choices)
#     break unless match_winner?()
#   end
#   break unless play_again?()
# end
# goodbye()
