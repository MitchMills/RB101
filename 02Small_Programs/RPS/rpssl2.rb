=begin
Rock crushes Scissors, Rock crushes Lizard
Paper covers Rock, Paper disproves Spock
Scissors cuts Paper, Scissors decapitates Lizard
Spock vaporizes Rock, Spock smashes Scissors
Lizard eats Paper, Lizard poisons Spock

=> THE RULES:
=> Rock (r) defeats:      lizard, scissors
=> Paper (p) defeats:     rock, spock
=> Scissors (sc) defeats: paper, lizard
=> Spock (sp) defeats:    scissors, rock
=> Lizard (l) defeats:    spock, paper

=end

require 'yaml'
MESSAGES = YAML.load_file('rpssl2_messages.yml')
LANGUAGE = 'en'

CHOICES = {
  'rock' => {abbreviation: 'r', defeats: %w(scissors lizard), description: ['crushes Scissors', 'crushes Lizard']},
  'paper' => {abbreviation: 'p', defeats: %w(rock spock), description: ['covers Rock', 'disproves Spock']},
  'scissors' => {abbreviation: 'sc', defeats: %w(paper lizard), description: ['cuts Paper', 'decapitates Lizard']},
  'spock' => {abbreviation: 'sp', defeats: %w(rock scissors), description: ['vaporizes Rock', 'smashes Scissors']},
  'lizard' => {abbreviation: 'l', defeats: %w(paper spock), description: ['eats Paper', 'poisons Spock']}
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
    "#{choice.capitalize} defeats: " +
    "#{CHOICES[choice][:defeats].map(&:capitalize).join(', ')}"
  end
end



# Display Score Methods
def display_scores(game_info)
  system('clear')
  prompt("games_played", data: get_games_played(game_info))
  prompt("scores", data: get_scores(game_info))
  blank_line
end

def get_games_played(game_info)
  game_info[:scores].sum { |label, score| score}
end

def get_scores(game_info)
  categories = game_info[:scores].keys
  [game_info[:name], 'Computer', 'Ties'].map.with_index do |label, idx|
    "#{label}: #{game_info[:scores][categories[idx]]}"
  end.join(',  ')
end



# Get Choices Methods
def get_choices(game_info)
  [get_user_choice(game_info), get_computer_choice()]
end

def get_user_choice(game_info)
  display_user_choices()
  prompt("game_number", data: (get_games_played(game_info) + 1))
  user_choice = get_choice()
  abbreviation_to_word(user_choice)
end

def display_user_choices
  choices = format_user_choices()
  prompt('choices_banner')
  choices.each { |choice| prompt('choice', data: choice) }
  blank_line
end

def format_user_choices
  CHOICES.keys.map do |choice|
    "#{choice.capitalize}: enter '#{CHOICES[choice][:abbreviation]}'"
  end
end

def get_choice
  loop do
    prompt('user_choice?', action: 'print')
    user_choice = gets.chomp.downcase
    return user_choice if VALID_CHOICES.include?(user_choice)
    blank_line
    prompt("invalid_choice")
    blank_line
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
  ['You', 'The computer'].map.with_index do |word, idx|
    "#{word} chose #{choices[idx].capitalize}."
  end
end



# Results Methods
def display_result(choices, game_info)
  result = determine_result(choices)
  describe_result(choices, result)
  prompt(result, data: game_info[:name] )
  blank_line
end

def determine_result(choices)
  user, computer = choices
  if game_winner?(user, computer)
    'user_won'
  elsif game_winner?(computer, user)
    'computer_won'
  else
    "tie"
  end
end

def game_winner?(player1, player2)
  CHOICES[player1][:defeats].include?(player2)
end

def describe_result(choices, result)
  description = get_description(choices, result).join(' ')
  prompt('describe_result', data: description)
  blank_line
end

def get_description(choices, result)
  ordered_choices = (result == 'computer_won' ? choices.reverse : choices)
  winner, loser = ordered_choices
  return [winner.capitalize, "coexists with", loser.capitalize] if result == 'tie'

  loser_index = ((CHOICES[winner][:defeats][0] == loser) ? 0 : 1)
  [winner.capitalize, CHOICES[winner][:description][loser_index]]
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
  name: 'Clarence', 
  scores: {user_wins: 1, computer_wins: 2, ties: 3}
}
# welcome_player(game_info)
# loop do

#   loop do
    display_scores(game_info)
    choices = get_choices(game_info)
    display_choices(choices)
    display_result(choices, game_info)
#     break if match_winner?()
#   end

#   break unless play_again?()
#   welcome_back(player_info)
#   reset_game_info(game_info)
# end
# goodbye()
