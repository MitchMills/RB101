VALID_CHOICES = %w(rock paper scissors spock lizard)

WINNERS = { rock: [['lizard', 'crushes'], ['scissors', 'crushes']],
            paper: [['rock', 'covers'], ['spock', 'disproves']],
            scissors: [['paper', 'cuts'], ['lizard', 'decapitates']],
            spock: [['scissors', 'smashes'], ['rock', 'vaporizes']],
            lizard: [['spock', 'poisons'], ['paper', 'eats']] }

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  WINNERS[player1.to_sym].flatten.include?(player2)
end

puts win?('rock', 'paper')
puts win?('paper', 'rock')
