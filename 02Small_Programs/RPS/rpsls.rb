VALID_CHOICES = %w(rock paper scissors spock lizard)

WINNERS = { rock: [['lizard', 'crushes'], ['scissors', 'crushes']],
            paper: [['rock', 'covers'], ['spock', 'disproves']],
            scissors: [['paper', 'cuts'], ['lizard', 'decapitates']],
            spock: [['scissors', 'smashes'], ['rock', 'vaporizes']],
            lizard: [['spock', 'poisons'], ['paper', 'eats']] }

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  WINNERS[player1.to_sym].flatten.include?(player2)
end

def print_outcome(player1, player2)
  prompt("#{player1.capitalize} #{WINNERS[player1.to_sym].assoc(player2)[1]} #{player2}.")
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

loop do # main loop
  player_choice = ''

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

  prompt("To play again, type y. Type any other letter to quit.")
  play_again = gets.chomp.downcase

  if play_again == 'y'
    next
  else
    prompt("Thank you for playing. Goodbye!")
    break
  end
end
