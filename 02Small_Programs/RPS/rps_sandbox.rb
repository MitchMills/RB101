BASIC_CHOICES = {
  'rock' => {abbreviation: 'r', defeats: {'scissors' => 'crushes', 'lizard' => 'crushes'}},
  'paper' => {abbreviation: 'p', defeats: {'rock' => 'covers', 'spock' => 'disproves'}},
  'scissors' => {abbreviation: 's', defeats: {'paper' => 'cuts', 'lizard' => 'decapitates'}}
}

EXTRA_CHOICES = {
  'spock' => {abbreviation: 'sp', defeats: {'scissors' => 'smashes', 'rock' => 'vaporizes'}},
  'lizard' => {abbreviation: 'l', defeats: {'paper' => 'eats', 'spock' => 'poisons'}}
}


rules = BASIC_CHOICES
rules.keys.map do |choice|
  p rules[choice][:defeats].keys[0].capitalize
end
