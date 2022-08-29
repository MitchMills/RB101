# system('clear')

# CHOICES = {
#   'rock' => {
#     abbreviation: 'r',
#     beats: {'lizard' => 'crushes', 'scissors' => 'crushes'}
#   },
#   'paper' => {
#     abbreviation: 'p',
#     beats: {'rock' => 'covers', 'spock' => 'disproves'}
#   },
#   'scissors' => {
#     abbreviation: 'sc',
#     beats: {'paper' => 'cuts', 'lizard' => 'decapitates'}
#   },
#   'spock' => {
#     abbreviation: 'sp',
#     beats: {'scissors' => 'smashes', 'rock' => 'vaporizes'}
#   },
#   'lizard' => {
#     abbreviation: 'l',
#     beats: {'spock' => 'poisons', 'paper' => 'eats'}
#   }
# }

# VALID_CHOICES = CHOICES.keys.map {|key| CHOICES[key][:abbreviation]}

def prompt(message)
  puts "=> #{message}"
end

# def abbreviation_to_word(player_choice)
#   CHOICES.each do |word, value|
#     return word if player_choice == value[:abbreviation]
#   end
# end

# def get_player_choice
#   loop do
#     prompt("Choose one: #{VALID_CHOICES.join(', ')}")
#     player_choice = gets.chomp.strip.downcase
#     if VALID_CHOICES.include?(player_choice)
#       return abbreviation_to_word(player_choice)
#     else
#       prompt("That's not a valid choice.")
#     end
#   end
# end

# def win?(player1, player2)
#   CHOICES[player1][:beats].include?(player2)
# end

# def determine_winner(player_choice, computer_choice)
#   if win?(player_choice, computer_choice)
#     'player'
#   elsif win?(computer_choice, player_choice)
#     'computer'
#   else
#     'tie'
#   end
# end

# def print_outcome(player1, player2)
#   verb = CHOICES[player1][:beats][player2]
#   prompt("#{player1.capitalize} #{verb} #{player2}.")
# end

# def display_results(player_choice, computer_choice, winner)
#   prompt("You chose #{player_choice}, computer chose #{computer_choice}.")
#   if winner == 'player'
#     print_outcome(player_choice, computer_choice)
#     prompt("You won!")
#   elsif winner == 'computer'
#     print_outcome(computer_choice, player_choice)
#     prompt("Computer won!")
#   else
#     prompt("It's a tie.")
#   end
# end

# player_choice = ''

# player_choice = get_player_choice()
# computer_choice = CHOICES.keys.sample
# puts player_choice
# puts computer_choice

# winner = determine_winner(player_choice, computer_choice)
# puts winner

# display_results(player_choice, computer_choice, winner)

scores = {player_score: 2, computer_score: 0, ties: 0}
winner = 'computer'

def update_scores(winner, scores)
  if winner == 'player'
    scores[:player_score] += 1
  elsif winner == 'computer'
    scores[:computer_score] += 1
  else
    scores[:ties] += 1
  end
end

def display_scores(scores)
  prompt("CURRENT SCORE")
  prompt("Player: #{scores[:player_score]}")
  prompt("Computer: #{scores[:computer_score]}")
  prompt("Ties: #{scores[:ties]}")
end

puts scores
update_scores(winner, scores)
display_scores(scores)
puts scores
