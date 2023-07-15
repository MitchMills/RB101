VALID_CHOICES = %w(rock paper scissors)

def prompt(action = 'puts', message)
  action == 'print' ? print("=> #{message}") : puts("=> #{message}")
end

def welcome
  prompt("Welcome to Rock, Paper, Scissors!")
  prompt("You will play against the computer.")
  prompt("Enter any key to begin.")
  gets
end

def get_user_choice
  loop do
    prompt('print', "Choose one: #{VALID_CHOICES}: ")
    user_choice = gets.chomp
    return user_choice if VALID_CHOICES.include?(user_choice)
    prompt("That's not a valid choice.")
  end
end

def get_computer_choice
  VALID_CHOICES.sample
end

def display_choices(user_choice, computer_choice)
  prompt("You chose #{user_choice}. The computer chose #{computer_choice}.")
end

def determine_result(user, computer)
  if  (user == 'rock'     && computer == 'scissors') ||
      (user == 'paper'    && computer == 'rock') ||
      (user == 'scissors' && computer == 'paper')
    'user'
  elsif (user == 'rock'     && computer == 'paper') ||
        (user == 'paper'    && computer == 'scissors') ||
        (user == 'scissors' && computer == 'rock')
    'computer'
  else 
    'tie'
  end
end

def display_result(result)
  message = case result
            when 'user' then "You won!"
            when 'computer' then "The computer won!"
            when 'tie' then "It's a tie!"
            end
  prompt(message)
end

def play_again?
  prompt("Would you like to play again?")
  prompt('print', "Enter y to play again, or any other key to quit: ")
  answer = gets.chomp.downcase
  answer == 'y'
end

def goodbye
  prompt("Thanks for playing Rock, Paper, Scissors! Goodbye.")
end


# main program loop
system('clear')
welcome()
loop do
  system('clear')
  user_choice = get_user_choice()
  computer_choice = get_computer_choice()
  display_choices(user_choice, computer_choice)
  result = determine_result(user_choice, computer_choice)
  display_result(result)
  break unless play_again?()
end
goodbye()


