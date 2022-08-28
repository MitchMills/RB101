system('clear')

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

player_choice = ''

player_choice = get_player_choice()
computer_choice = CHOICES.keys.sample
puts player_choice
puts computer_choice

winner = determine_winner(player_choice, computer_choice)
puts winner
