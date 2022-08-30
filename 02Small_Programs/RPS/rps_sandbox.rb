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

RULES = CHOICES.map do |key, value|
  "#{key.capitalize} (#{value[:abbreviation]}) defeats:\
  #{value[:beats].keys.join(', ')}"
end

def prompt(message)
  puts "=> #{message}"
end

prompt("Line 1\n")
prompt("Line 2\n\n")
prompt("Line 3")
