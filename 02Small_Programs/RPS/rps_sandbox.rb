BASIC_CHOICES = {
  'rock' => {abbreviation: 'r', defeats: {'scissors' => 'crushes', 'lizard' => 'crushes'}},
  'paper' => {abbreviation: 'p', defeats: {'rock' => 'covers', 'spock' => 'disproves'}},
  'scissors' => {abbreviation: 's', defeats: {'paper' => 'cuts', 'lizard' => 'decapitates'}}
}

EXTRA_CHOICES = {
  'spock' => {abbreviation: 'sp', defeats: {'scissors' => 'smashes', 'rock' => 'vaporizes'}},
  'lizard' => {abbreviation: 'l', defeats: {'paper' => 'eats', 'spock' => 'poisons'}}
}
