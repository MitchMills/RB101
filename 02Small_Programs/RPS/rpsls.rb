CHOICES = {
  'rock' => {
    abbreviation: 'r',
    beats: {'lizard' => 'crushes', 'scissors' => 'crushes'}
  },
  'paper' => {
    abbreviation: 'p',
    beats: {'rock' => 'covers', 'spock' => 'disproves'}
  },
  'scissors' => {
    abbreviation: 'sc',
    beats: {'paper' => 'cuts', 'lizard' => 'decapitates'}
  },
  'spock' => {
    abbreviation: 'sp',
    beats: {'scissors' => 'smashes', 'rock' => 'vaporizes'}
  },
  'lizard' => {
    abbreviation: 'l',
    beats: {'spock' => 'poisons', 'paper' => 'eats'}
  }
}

VALID_CHOICES = CHOICES.keys.map {|key| CHOICES[key][:abbreviation]}

def prompt(message)
  puts "=> #{message}"
end


def get_name
  loop do
    print("Please enter your name: ")
    name = gets.chomp
    if name.empty?
      prompt("That's not a valid entry.")
    else
      return name
    end
  end
end

def welcome(name)
  prompt("Thanks, #{name}. You will play against the computer.")
  prompt("The first to win three games will be declared the Grand Winner.")
  prompt("To display the rules, enter y. Enter any other letter to continue.")
  show_rules = gets.chomp.downcase
  if show_rules == 'y'
    display_rules
    prompt("Okay, let's start playing!")
  else
    prompt("Let's get started!")
  end
end

def display_rules
  rules = <<~RULES
    Rock defeats: Lizard, Scissors
       Paper defeats: Rock, Spock
       Scissors defeats: Paper, Lizard
       Spock defeats: Scissors, Rock
       Lizard defeats: Spock, Paper

    RULES
  prompt(rules)
  prompt("Press enter to continue")
  gets
end

def welcome_back(name)
  prompt("Welcome back, #{name}! Ready for another match?")
  prompt("To display the rules again, enter y. Enter any other letter to continue.")
  show_rules = gets.chomp.downcase
  if show_rules == 'y'
    display_rules
  else
    prompt("Let's go!")
  end
end

first_time = true
def game_intro(first_time, name)
  if first_time
    welcome(name)
  else
    welcome_back(name)
  end
end



def abbreviation_to_word(player_choice)
  CHOICES.each do |word, value|
    return word if player_choice == value[:abbreviation]
  end
end

def get_player_choice
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player_choice = gets.chomp.strip.downcase
    if VALID_CHOICES.include?(player_choice)
      return abbreviation_to_word(player_choice)
    else
      prompt("That's not a valid choice.")
    end
  end
end

def win?(player1, player2)
  CHOICES[player1][:beats].include?(player2)
end

def determine_winner(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    'player'
  elsif win?(computer_choice, player_choice)
    'computer'
  else
    'tie'
  end
end

def print_outcome(player1, player2)
  verb = CHOICES[player1][:beats][player2]
  prompt("#{player1.capitalize} #{verb} #{player2}.")
end

def display_results(player_choice, computer_choice, winner)
  prompt("You chose #{player_choice}, computer chose #{computer_choice}.")
  if winner == 'player'
    print_outcome(player_choice, computer_choice)
    prompt("You won!")
    puts
  elsif winner == 'computer'
    print_outcome(computer_choice, player_choice)
    prompt("Computer won!")
    puts
  else
    prompt("It's a tie.")
    puts
  end
end

def update_scores(winner, scores)
  if winner == 'player'
    scores[:player_score] += 1
  elsif winner == 'computer'
    scores[:computer_score] += 1
  else
    scores[:ties] += 1
  end
  scores
end

def display_scores(scores)
  prompt("CURRENT SCORE")
  prompt("Player: #{scores[:player_score]}")
  prompt("Computer: #{scores[:computer_score]}")
  prompt("Ties: #{scores[:ties]}")
  puts
end

def grand_winner?(scores)
  scores[:player_score] == 3 || scores[:computer_score] == 3
end

def display_grand_winner(scores)
  if scores[:player_score] == 3
    prompt("You have won three games. You are the Grand Winner!")
  elsif scores[:computer_score] == 3
    prompt("Computer has won three games. Computer is the Grand Winner!")
  end
end

def play_again
  prompt("To play another match, enter y. Enter any other letter to quit.")
  play_again = gets.chomp.downcase
  unless play_again == 'y'
    prompt("Thank you for playing. Goodbye!") 
    exit
  end
end


# 
# 
# 
# 
# main program loop
loop do
  system('clear')
  player_choice = ''
  scores = {player_score: 0, computer_score: 0, ties: 0}
  
  if first_time
    prompt("Welcome to Rock Scissors Paper Spock Lizard!")
    name = get_name
  end

  game_intro(first_time, name)
  first_time = false

  loop do
    player_choice = get_player_choice()
    computer_choice = CHOICES.keys.sample

    winner = determine_winner(player_choice, computer_choice)

    display_results(player_choice, computer_choice, winner)

    scores = update_scores(winner, scores)
    display_scores(scores)

    if grand_winner?(scores)
      display_grand_winner(scores)
      break    
    end
  end

  play_again()
end
