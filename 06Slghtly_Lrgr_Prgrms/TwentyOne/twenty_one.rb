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
  display_hand(hands[:dealer], :dealer)  
  display_hand(hands[:player], :player)
end

def display_hand(hand, owner)
  if owner == :player
    prompt("Your hand:")
  elsif owner == :dealer
    prompt("Dealer hand:")
    prompt(" Facedown Card")
  end
  start_index = (owner == :player ? 0 : 1)
  card_names(hand).each_with_index do |card, idx|
    prompt(" #{card}") if idx >= start_index
  end
  display_total(hand, owner)
  puts
end

def card_names(hand)
  hand.map do |card|
    "#{card[0]} of #{card[1]}"
  end
end

def display_total(hand, owner)
  if owner == :player
    prompt("Card value: #{total(hand, owner)}")
  elsif owner == :dealer
    prompt("Visible card value: #{total(hand, owner)}")
  end
end

def total(hand, owner)
  face_values = hand.map { |card| card[0] }
  sum = 0
  start_index = (owner == :player ? 0 : 1)

  face_values.each_with_index do |value, idx|
    if idx >= start_index
      sum = sum_cards(sum, value)
    end
  end
  face_values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def sum_cards(sum, value)
  if value == "Ace"
    sum += 11
  elsif value.to_i == 0
    sum += 10
  else
    sum += value.to_i
  end
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
      system 'clear'
      break if busted?(hands[:player], :player)
    else
      prompt("Sorry, that's not a valid answer. Try again:")
    end
    
  end

  if busted?(hands[:player], :player)
    display_both_hands(hands)
    prompt("Busted!")
  else
    prompt("You chose to stay")
  end
end

def busted?(hand, owner)
  total(hand, owner) > 21
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
