CARD_FACES = [
  '2', '3', '4', '5', '6', '7', '8', '9', '10', 
  'Jack', 'Queen', 'King', 'Ace'
]
CARD_SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']

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
  2.times do
    deal_card(deck, hands[:player])
    deal_card(deck, hands[:dealer])
  end
end

def deal_card(deck, hand)
  card = deck.sample
  deck.delete(card)
  hand << card
end

def display_initial_deal(hands)
  deal_order = deal_order(hands)
  deal_order[1] = "a facedown card"
  prompt("Here's the deal:")
  show_each_card(deal_order)
  puts
end

def deal_order(hands)
  deal_order = []
  round = 0
  loop do
    add_cards_to_hand(hands, deal_order, round)
    round += 1
    break if round >= 2
  end
  card_names(deal_order).each { |card| card.prepend("the ") }
end

def add_cards_to_hand(hands, deal_order, round)
  hands.each do |_, cards|
    cards.each_with_index do |card, idx|
      deal_order << card if idx == round
    end
  end
  deal_order
end

def card_names(hand)
  hand.map do |card|
    "#{card[0]} of #{card[1]}"
  end
end

def show_each_card(deal_order)
  deal_order.each_with_index do |card, idx|
    if idx.even?
      sleep(0.8)
      prompt("  You get #{deal_order[idx]}")
    else
      sleep(0.8)
      prompt("    The dealer gets #{deal_order[idx]}")
    end
  end
end

def display_both_hands(hands)
  display_hand(hands[:dealer], :dealer)  
  display_hand(hands[:player], :player)
end

def display_hand(hand, owner)
  display_hand_header(owner)
  start_index = (owner == :player ? 0 : 1)
  card_names(hand).each_with_index do |card, idx|
    prompt(" #{card}") if idx >= start_index
  end
  display_total(hand, owner)
  puts
end

def display_hand_header(owner)
  if owner == :player
    prompt("Your hand:")
  elsif owner == :dealer
    prompt("Dealer hand:")
    prompt(" Facedown Card")
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
  sum = initial_sum(face_values, start_index, sum)
  sum = correct_for_aces(face_values, sum)
end

def initial_sum(face_values, start_index, sum)
  face_values.each_with_index do |value, idx|
    if idx >= start_index
      sum = sum_cards(sum, value)
    end
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

def correct_for_aces(face_values, sum)
  face_values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
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
      system 'clear'

      deal_card(deck, hands[:player])
      prompt("You get the #{hands[:player].last[0]} of #{hands[:player].last[1]}.")
      puts

      break if busted?(hands[:player], :player)
    else
      system 'clear'
      prompt("Sorry, that's not a valid answer. Try again:")
      puts
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
  display_initial_deal(hands)
  player_turn(deck, hands)
# end

# puts
# p hands[:player]
# p hands[:dealer]
# puts
# p deck
