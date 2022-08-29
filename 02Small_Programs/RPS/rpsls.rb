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

      def welcome
      # foofoofoo
      end

      def welcome_back
      # foofoofoo
      end

      def display_rules
      # foofoofoo
      end

      def game_intro
      # foofoofoo
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
  elsif winner == 'computer'
    print_outcome(computer_choice, player_choice)
    prompt("Computer won!")
  else
    prompt("It's a tie.")
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


# 
# 
# 
# 
# main program loop
loop do
  system('clear')
  player_choice = ''
  scores = {player_score: 0, computer_score: 0, ties: 0}
  game_intro()

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

  prompt("To play again, type y. Type any other letter to quit.")
  play_again = gets.chomp.downcase

  if play_again == 'y'
    next
  else
    prompt("Thank you for playing. Goodbye!")
    break
  end
end
