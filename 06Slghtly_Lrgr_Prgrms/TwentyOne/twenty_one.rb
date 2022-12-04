CARD_FACES = [
  '2', '3', '4', '5', '6', '7', '8', '9', '10', 
  'Jack', 'Queen', 'King', 'Ace'
]
CARD_SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']

# deck = [
#   ["2", "Clubs"], ["2", "Diamonds"], ["2", "Hearts"], ["2", "Spades"],
#   ["3", "Clubs"], ["3", "Diamonds"], ["3", "Hearts"], ["3", "Spades"],
#   ["4", "Clubs"], ["4", "Diamonds"], ["4", "Hearts"], ["4", "Spades"],
#   ["5", "Clubs"], ["5", "Diamonds"], ["5", "Hearts"], ["5", "Spades"],
#   ["6", "Clubs"], ["6", "Diamonds"], ["6", "Hearts"], ["6", "Spades"],
#   ["7", "Clubs"], ["7", "Diamonds"], ["7", "Hearts"], ["7", "Spades"],
#   ["8", "Clubs"], ["8", "Diamonds"], ["8", "Hearts"], ["8", "Spades"],
#   ["9", "Clubs"], ["9", "Diamonds"], ["9", "Hearts"], ["9", "Spades"],
#   ["10", "Clubs"], ["10", "Diamonds"], ["10", "Hearts"], ["10", "Spades"],
#   ["J", "Clubs"], ["J", "Diamonds"], ["J", "Hearts"], ["J", "Spades"],
#   ["Q", "Clubs"], ["Q", "Diamonds"], ["Q", "Hearts"], ["Q", "Spades"],
#   ["K", "Clubs"], ["K", "Diamonds"], ["K", "Hearts"], ["K", "Spades"],
#   ["A", "Clubs"], ["A", "Diamonds"], ["A", "Hearts"], ["A", "Spades"]
# ]

def prompt(message)
  puts "=> #{message}"
end

def welcome()
  system 'clear'
  prompt "Welcome to Twenty-One!"
  prompt "Enter any key to begin."
  gets
end

def initialize_deck()
  CARD_FACES.product(CARD_SUITS)
end

def deal_initial_hands(deck, hands)
  2.times {deal_round(deck, hands)}
end

def deal_round(deck, hands)
  deal_card(deck, hands[:player])
  deal_card(deck, hands[:dealer])
end

def deal_card(deck, hand)
  card = deck.sample
  deck.delete(card)
  hand << card
end

def display_both_hands(hands)
  system 'clear'
  display_dealer_hand(hands[:dealer])  
  display_player_hand(hands[:player])
end

def display_player_hand(hand)
  prompt("Your hand:")
  display_hand(hand).each {|card| prompt(" #{card}")}
  display_total(hand)
  puts
end

def display_dealer_hand(hand)
  prompt("Dealer hand:")
  prompt(" Face Down Card")
  display_hand(hand).each_with_index do |card, idx|
    prompt(" #{card}") if idx > 0
  end
  display_visible_total(hand)
  puts
end
  

def display_hand(hand)
  hand.map do |card|
    "#{card[0]} of #{card[1]}"
  end
end

def display_total(hand)
  prompt("Card value: #{total(hand)}")
end

def display_visible_total(hand)
  prompt("Visible card value: #{visible_total(hand)}")
end

def total(hand)
  face_values = hand.map { |card| card[0] }
  sum = 0
  face_values.each do |value|
    if value == "Ace"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end
  face_values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def visible_total(hand)
  face_values = hand.map { |card| card[0] }
  visible_sum = 0
  face_values.each_with_index do |value, idx|
    if idx > 0
      if value == "Ace"
        visible_sum += 11
      elsif value.to_i == 0
        visible_sum += 10
      else
        visible_sum += value.to_i
      end
    end
  end
  face_values.select { |value| value == "Ace" }.count.times do
    visible_sum -= 10 if visible_sum > 21
  end
  visible_sum
end

def player_turn(deck, hands)
  answer = nil

  loop do
    display_both_hands(hands)
    prompt("Would you like to hit or stay?")
    answer = gets.chomp.downcase
    
    if answer == "stay"
      break
    elsif answer == "hit"
      deal_card(deck, hands[:player])
      break if busted?(hands[:player])
    else
      prompt("Sorry, that's not a valid answer. Try again:")
      answer = gets.chomp.downcase
    end
  end

  if busted?(hands[:player])
    prompt("Busted!")
  else
    prompt("You chose to stay")
  end

end

def busted?(hand)
  total(hand) > 21
end

# MAIN GAME LOOP
# welcome()
# initialize_deck()
# deal_cards()
# player_turn()
# dealer_turn()
# determine_winner()
# outro()

# loop do
  welcome()
  deck = initialize_deck()
  hands = { player: [], dealer: [] }
  deal_initial_hands(deck, hands)
  player_turn(deck, hands)
# end

# puts
# p hands[:player]
# p hands[:dealer]
# puts
# p deck
