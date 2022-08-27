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

puts VALID_CHOICES
