card_values = [
  '2', '3', '4', '5', '6', '7', '8', '9', '10', 
  'jack', 'queen', 'king', 'ace'
]
card_suits = [:clubs, :diamonds, :hearts, :spades]

# deck = {
#   :clubs=>["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"], 
#   :diamonds=>["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"], 
#   :hearts=>["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"], 
#   :spades=>["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"]
# }

deck = {
  :clubs=>["2", "3", "4", "5", "6", "7", "8", "9", "10"],# "jack", "queen", "king", "ace"], 
  :diamonds=>["2", "3", "4", "5", "6", "7", "8", "9", "10"],# "jack", "queen", "king", "ace"], 
  :hearts=>["2", "3", "4", "5", "6", "7", "8", "9", "10"],# "jack", "queen", "king", "ace"], 
  :spades=>["2", "3", "4", "5", "6", "7", "8", "9", "10"]#, "jack", "queen", "king", "ace"]
}


# deck = {}
# card_suits.each do |suit|
#   deck[suit] = card_values
# end
# p deck

# suit = deck.keys.sample
# value = deck[suit].sample
# p "#{value} of #{suit}"

p deck[:clubs]
p deck[:diamonds]
p deck[:hearts]
p deck[:spades]
puts

suit = deck.keys.sample
card1 = [deck[suit].sample, suit]
deck[suit].delete(card1[0])
p card1

suit = deck.keys.sample
card2 = [deck[suit].sample, suit]
deck[suit].delete(card2[0])
p card2
puts

hand = [card1, card2]
p hand
puts

total = 0
current_hand_value = 
hand.each do |card|
  total += card[0].to_i
end
p total
puts

p deck[:clubs]
p deck[:diamonds]
p deck[:hearts]
p deck[:spades]
