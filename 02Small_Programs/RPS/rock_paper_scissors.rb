VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  (player1 == 'rock' && player2 == 'scissors') ||
    (player1 == 'paper' && player2 == 'rock') ||
    (player1 == 'scissors' && player2 == 'paper')
end

def display_results(player_choice, computer_choice)
  prompt("You chose: #{player_choice}")
  prompt("Computer chose: #{computer_choice}")

  if win?(player_choice, computer_choice)
    prompt("You won!")
  elsif win?(computer_choice, player_choice)
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

  prompt("Type y to play again, any other letter to quit.")
  play_again = gets.chomp.downcase
  if play_again == 'y'
    next
  else
    prompt("Thank you for playing. Goodbye!")
    break
  end
end
