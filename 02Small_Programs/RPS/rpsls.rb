ABBREVIATIONS = {
  'rock' => 'r',
  'paper' => 'p',
  'scissors' => 'sc',
  'spock' => 'sp',
  'lizard' => 'l'
}

WINNERS = {
  'r' => [['lizard', 'crushes'], ['scissors', 'crushes']],
  'p' => [['rock', 'covers'], ['spock', 'disproves']],
  'sc' => [['paper', 'cuts'], ['lizard', 'decapitates']],
  'sp' => [['scissors', 'smashes'], ['rock', 'vaporizes']],
  'l' => [['spock', 'poisons'], ['paper', 'eats']]
}

VALID_CHOICES = WINNERS.keys

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  WINNERS[player1].flatten.include?(player2)
end

def print_outcome(player1, player2)
  verb = WINNERS[player1].assoc(player2)[1]
  prompt("#{player1.capitalize} #{verb} #{player2}.")
end

def display_results(player_choice, computer_choice)
  prompt("You chose #{player_choice}, computer chose #{computer_choice}.")

  if win?(player_choice, computer_choice)
    print_outcome(player_choice, computer_choice)
    prompt("You won!")
  elsif win?(computer_choice, player_choice)
    print_outcome(computer_choice, player_choice)
    prompt("Computer won!")
  else
    prompt("It's a tie.")
  end
end

def player_score(player_choice, computer_choice, player_score)
  if win?(player_choice, computer_choice)
    player_score += 1
  else
    player_score
  end
end

def computer_score(player_choice, computer_choice, computer_score)
  if win?(computer_choice, player_choice)
    computer_score += 1
  else
    computer_score
  end
end

# main game loop
loop do
  player_choice = ''
  player_score = 0
  computer_score = 0

  prompt("Welcome to Rock Paper Scissors Spock Lizard!")
  prompt("The first player to win three games will be the Grand Winner.")

  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      player_choice = gets.chomp
      if VALID_CHOICES.include?(player_choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    display_results(player_choice, computer_choice)

    player_score = player_score(player_choice, computer_choice, player_score)
    computer_score = computer_score(player_choice, computer_choice, computer_score)

    if player_score == 3
      prompt("You have won three games.")
      prompt("You are the Grand Winner!")
      break
    elsif computer_score == 3
      prompt("Computer has won three games.")
      prompt("Computer is the Grand Winner!")
      break
    else
      prompt("You have won #{player_score} games.")
      prompt("Computer has won #{computer_score} games.")
      prompt("Time for another round!")
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
