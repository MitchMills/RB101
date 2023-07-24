require 'yaml'
MESSAGES = YAML.load_file('rps+_messages.yml')
LANGUAGE = 'en'

BASIC_CHOICES = {
  'rock' => {
    abbreviation: 'r',
    defeats: { 'scissors' => 'crushes', 'lizard' => 'crushes' }
  },
  'paper' => {
    abbreviation: 'p',
    defeats: { 'rock' => 'covers', 'spock' => 'disproves' }
  },
  'scissors' => {
    abbreviation: 's',
    defeats: { 'paper' => 'cuts', 'lizard' => 'decapitates' }
  }
}

EXTRA_CHOICES = {
  'spock' => {
    abbreviation: 'sp',
    defeats: { 'scissors' => 'smashes', 'rock' => 'vaporizes' }
  },
  'lizard' => {
    abbreviation: 'l',
    defeats: { 'paper' => 'eats', 'spock' => 'poisons' }
  }
}

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
  set_rules(game_info)
  start_game(game_info)
end

def set_rules(game_info)
  choice = choose_rules(game_info)
  game_info[:rules] = if choice == '1'
                        BASIC_CHOICES
                      else
                        BASIC_CHOICES.merge(EXTRA_CHOICES)
                      end
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

def start_game(game_info)
  system('clear')
  game = game_info[:rules].keys.map(&:capitalize).join(', ')
  prompt('ready', data: game)
  blank_line
  prompt('display_rules?', action: 'print')
  display_rules(game_info) if gets.chomp.downcase == 'y'
end

def display_rules(game_info)
  system('clear')
  rules = format_rules(game_info)
  prompt('rules_banner')
  rules.each do |rule|
    prompt('rule', data: rule)
  end
  blank_line
  prompt('start_playing', action: 'print')
  gets
end

def format_rules(game_info)
  game_info[:rules].keys.map do |choice|
    defeats = game_info[:rules][choice][:defeats].keys
    defeated = if game_info[:rules] == BASIC_CHOICES
                 defeats[0].capitalize
               else
                 defeats.map(&:capitalize).join(' and ')
               end
    "#{choice.capitalize} defeats #{defeated}."
  end
end

# Display Scores Methods
def display_scores(game_info)
  prompt("games_played", data: get_games_played(game_info))
  prompt("scores", data: get_scores(game_info))
  blank_line
end

def get_games_played(game_info)
  game_info[:scores].sum { |_label, score| score }
end

def get_scores(game_info)
  categories = game_info[:scores].keys
  [game_info[:name], 'Computer', 'Ties'].map.with_index do |label, idx|
    "#{label}: #{game_info[:scores][categories[idx]]}"
  end.join(',  ')
end

# Get Choices Methods
def get_choices(game_info)
  [get_user_choice(game_info), get_computer_choice(game_info)]
end

def get_user_choice(game_info)
  display_user_choices(game_info)
  prompt("game_number", data: (get_games_played(game_info) + 1))
  user_choice = get_choice(game_info)
  abbreviation_to_word(user_choice, game_info)
end

def display_user_choices(game_info)
  choices = format_user_choices(game_info)
  prompt('choices_banner')
  choices.each { |choice| prompt('choice', data: choice) }
  blank_line
end

def format_user_choices(game_info)
  game_info[:rules].keys.map do |choice|
    "#{choice.capitalize}: enter '#{game_info[:rules][choice][:abbreviation]}'"
  end
end

def get_choice(game_info)
  loop do
    prompt('user_choice?', action: 'print')
    user_choice = gets.chomp.downcase
    return user_choice if valid_choices(game_info).include?(user_choice)

    blank_line
    prompt("invalid_choice", data: game_info[:name])
    blank_line
  end
end

def valid_choices(game_info)
  choices = game_info[:rules].keys
  choices.map { |choice| game_info[:rules][choice][:abbreviation] }
end

def abbreviation_to_word(user_choice, game_info)
  game_info[:rules].each do |choice, info|
    return choice if info[:abbreviation] == user_choice
  end
end

def get_computer_choice(game_info)
  game_info[:rules].keys.sample
end

# Game Results Methods
def display_game_result(choices, game_info)
  system('clear')
  display_both_choices(choices)
  describe_result(choices, game_info)
  blank_line
  update_scores(choices, game_info)
  display_scores(game_info)
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

def describe_result(choices, game_info)
  description = get_description(choices, game_info)
  prompt('describe_result', data: description)
  blank_line
  prompt(determine_result(choices, game_info), data: game_info[:name])
end

def get_description(choices, game_info)
  case determine_result(choices, game_info)
  when 'tie' then get_tied_description(choices)
  when 'user_won' then get_win_description(choices, game_info)
  when 'computer_won' then get_win_description(choices.reverse, game_info)
  end
end

def determine_result(choices, game_info)
  if game_winner?(choices, game_info)
    'user_won'
  elsif game_winner?(choices.reverse, game_info)
    'computer_won'
  else
    "tie"
  end
end

def game_winner?(player_choices, game_info)
  player1, player2 = player_choices
  game_info[:rules][player1][:defeats].keys.include?(player2)
end

def get_tied_description(choices)
  "#{choices[0].capitalize} coexists with #{choices[1].capitalize}"
end

def get_win_description(choices, game_info)
  winner, loser = choices
  loser_index = game_info[:rules][winner][:defeats].keys[0] == loser ? 0 : 1
  verb = game_info[:rules][winner][:defeats].values[loser_index]
  "#{winner.capitalize} #{verb} #{loser.capitalize}"
end

def update_scores(choices, game_info)
  case determine_result(choices, game_info)
  when 'user_won' then game_info[:scores][:user_wins] += 1
  when 'computer_won' then game_info[:scores][:computer_wins] += 1
  when 'tie' then game_info[:scores][:ties] += 1
  end
end

# Match Results Methods
def match_winner?(game_info)
  game_info[:scores][:user_wins] == 3 ||
    game_info[:scores][:computer_wins] == 3
end

def continue
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
def another_match?
  prompt("another_match?", action: 'print')
  gets.chomp.downcase == 'y'
end

def welcome_back(game_info)
  reset_game_info(game_info)
  system('clear')
  prompt('welcome_back', data: game_info[:name])
  intro(game_info)
end

def reset_game_info(game_info)
  game_info[:scores].each do |label, _score|
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
  rules: BASIC_CHOICES,
  scores: { user_wins: 0, computer_wins: 0, ties: 0 }
}

welcome_player(game_info)
loop do
  loop do
    system('clear')
    display_scores(game_info)
    choices = get_choices(game_info)
    display_game_result(choices, game_info)
    break if match_winner?(game_info)
    continue()
  end
  display_match_results(game_info)
  break unless another_match?
  welcome_back(game_info)
end
goodbye(game_info)
