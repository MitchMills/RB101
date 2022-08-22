VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def display_results(player_choice, computer_choice)
  prompt("You chose: #{player_choice}")
  prompt("Computer chose: #{computer_choice}")

  if  (player_choice == 'rock' && computer_choice == 'scissors') ||
      (player_choice == 'paper' && computer_choice == 'rock') ||
      (player_choice == 'scissors' && computer_choice == 'paper')
    prompt("You won!")
  elsif (player_choice == 'rock' && computer_choice == 'paper') ||
        (player_choice == 'paper' && computer_choice == 'scissors') ||
        (player_choice == 'scissors' && computer_choice == 'rock')
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
