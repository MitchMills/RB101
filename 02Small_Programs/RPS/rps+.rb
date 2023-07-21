require 'yaml'
MESSAGES = YAML.load_file('rps+_messages.yml')
LANGUAGE = 'en'

BASIC_CHOICES = {
  'rock' => {abbreviation: 'r', defeats: %w(scissors lizard), description: ['crushes Scissors', 'crushes Lizard']},
  'paper' => {abbreviation: 'p', defeats: %w(rock spock), description: ['covers Rock', 'disproves Spock']},
  'scissors' => {abbreviation: 'sc', defeats: %w(paper lizard), description: ['cuts Paper', 'decapitates Lizard']}
}

EXTRA_CHOICES = {
  'spock' => {abbreviation: 'sp', defeats: %w(rock scissors), description: ['vaporizes Rock', 'smashes Scissors']},
  'lizard' => {abbreviation: 'l', defeats: %w(paper spock), description: ['eats Paper', 'poisons Spock']}
}

# VALID_CHOICES = CHOICES.keys + CHOICES.keys.map { |choice| CHOICES[choice][:abbreviation]}



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
  prompt('get_started', data: game_info[:name])
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
  prompt('choice_of_rules')
  blank_line
  set_rules(game_info)
  system('clear')
  game = (game_info[:rules] == 'rps' ? '' : ', Spock, Lizard')
  prompt('ready', data: game)
  blank_line
  prompt('display_rules?', action: 'print')
  display_rules if gets.chomp.downcase == 'y'
end

def set_rules(game_info)
  choice = choose_rules(game_info)
  game_info[:rules] = (choice == '1' ? 'rps' : 'rpssl')
end

def choose_rules(game_info)
  loop do
    prompt('choose_rules', action: 'print')
    choice = gets.chomp
    return choice if ['1', '2'].include?(choice)
    blank_line
    prompt('invalid_choice', data: game_info[:name])
    blank_line
  end
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
    "#{choice.capitalize} defeats " +
    "#{CHOICES[choice][:defeats].map(&:capitalize).join(' and ')}."
  end
end


# Display Scores Methods
def display_scores(game_info)
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

def get_choice(game_info)
  loop do
    prompt('user_choice?', action: 'print')
    user_choice = gets.chomp.downcase
    return user_choice if VALID_CHOICES.include?(user_choice)

    blank_line
    prompt("invalid_choice", data: game_info[:name])
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


# Game Results Methods
def display_game_result(choices, game_info)
  system('clear')
  display_both_choices(choices)
  result = determine_result(choices)
  describe_result(choices, result)
  prompt(result, data: game_info[:name] )
  blank_line
  update_scores(result, game_info)
end

def display_both_choices(choices)
  formatted_choices = format_choices(choices).join(' ')
  prompt('display_both_choices', data: formatted_choices)
end

def format_choices(choices)
  ['You', 'The computer'].map.with_index do |word, idx|
    "#{word} chose #{choices[idx].capitalize}."
  end
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
  if result == 'tie'
    tied_choice = choices[0].capitalize
    [tied_choice, "coexists with", tied_choice]
  else
    ordered_choices = (result == 'computer_won' ? choices.reverse : choices)
    winner, loser = ordered_choices
    loser_index = ((CHOICES[winner][:defeats][0] == loser) ? 0 : 1)
    [winner.capitalize, CHOICES[winner][:description][loser_index]]
  end
end

def update_scores(result, game_info)
  case result
  when 'user_won' then game_info[:scores][:user_wins] += 1
  when 'computer_won' then game_info[:scores][:computer_wins] += 1
  when 'tie' then game_info[:scores][:ties] += 1
  end
  display_scores(game_info)
end


# Match Results Methods
def match_winner?(game_info)
  game_info[:scores][:user_wins] == 3 ||
    game_info[:scores][:computer_wins] == 3
end

def continue()
  prompt('continue', action: 'print')
  gets
end

def display_match_results(game_info)
  if game_info[:scores][:user_wins] == 3
    prompt('user_won_match', data: game_info[:name].upcase)
  else
    prompt('computer_won_match', data: game_info[:name])
  end
  blank_line
end


# Outro Methods
def another_match?(game_info)
  prompt("another_match?", action: 'print')
  gets.chomp.downcase == 'y'
end

def welcome_back(game_info)
  reset_game_info(game_info)
  system('clear')
  prompt('welcome_back', data: game_info[:name])
  blank_line
  prompt('rules_again?', action: 'print')
  display_rules if gets.chomp.downcase == 'y'
end

def reset_game_info(game_info)
  game_info[:scores].each do |label, score|
    game_info[:scores][label] = 0
  end
end

def goodbye(game_info)
  blank_line
  prompt('goodbye', data: game_info[:name])
end



# main program loop
game_info = {
  name: '',
  rules: 'rps',
  scores: {user_wins: 0, computer_wins: 0, ties: 0}
}

welcome_player(game_info)
# loop do
#   loop do
#     system('clear')
#     display_scores(game_info)
#     choices = get_choices(game_info)
#     display_game_result(choices, game_info)
#     break if match_winner?(game_info)
#     continue()
#   end
#   display_match_results(game_info)
#   break unless another_match?(game_info)
#   welcome_back(game_info)
# end
# goodbye(game_info)
