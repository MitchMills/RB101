VALID_CHOICES = %w(rock paper scissors)

def prompt(message, action: 'puts')
  action == 'print' ? print("=> #{message}") : puts("=> #{message}")
end

def blank_line(lines = 1)
  lines.times { puts }
end

def welcome
  prompt("Welcome to Rock, Paper, Scissors!")
  prompt("You will play against the computer.")
  prompt("Enter any key to begin.")
  gets
end

def get_choices
  [get_user_choice, get_computer_choice]
end

def get_user_choice
  loop do
    prompt("Choose one: #{VALID_CHOICES}: ", action: 'print')
    user_choice = gets.chomp
    return user_choice if VALID_CHOICES.include?(user_choice)
    prompt("That's not a valid choice.")
  end
end

def get_computer_choice
  VALID_CHOICES.sample
end

def display_choices(choices)
  user_choice, computer_choice = choices
  prompt("You chose #{user_choice}. The computer chose #{computer_choice}.")
end

def determine_result(choices)
  user, computer = choices
  if winner?(user, computer)
    'You'
  elsif winner?(computer, user)
    'The computer'
  else 
    'tie'
  end
end

def winner?(player1, player2)
  (player1 == 'rock'      && player2 == 'scissors') ||
  (player1 == 'paper'     && player2 == 'rock') ||
  (player1 == 'scissors'  && player2 == 'paper')
end

def display_result(result)
  if result == 'tie'
    prompt("It's a tie!")
  else
    prompt("#{result} won!")
  end
end

def play_again?
  prompt("Would you like to play again?")
  prompt("Enter y to play again, or any other key to quit: ", action: 'print')
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
  choices = get_choices()
  display_choices(choices)
  result = determine_result(choices)
  display_result(result)
  blank_line
  break unless play_again?()
end
goodbye()


