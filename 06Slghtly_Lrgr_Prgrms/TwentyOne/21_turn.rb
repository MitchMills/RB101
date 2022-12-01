# Player Turn
answer = nil
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted?
end

if busted?
  # end current game
else
  puts "You chose to stay!"
end

# Dealer Turn

loop do
  if dealer_hand_value >= 17
    'stay'
  else
   'hit'
  end
end

def determine_winner
  foo = 0
end

def display_result
  faf = 2
end