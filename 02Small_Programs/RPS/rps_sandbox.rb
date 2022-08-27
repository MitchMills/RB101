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

player1 = "rock"
p player1

player2 = "scissors"
p player2

verb = CHOICES[player1][:beats][player2]
p verb

puts "#{player1.capitalize} #{verb} #{player2}."

p CHOICES[player1][:beats].include?(player2)

VALID_CHOICES = CHOICES.keys.map { |key| CHOICES[key][:abbreviation]}
p VALID_CHOICES
