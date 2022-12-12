CARD_RANKS = [
  '2', '3', '4', '5', '6', '7', '8', '9', '10', 
  'Jack', 'Queen', 'King', 'Ace'
]
CARD_SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']

CARD_VALUES = CARD_RANKS.each_with_object({}) do |rank, hash|
  if rank == "Ace"
    hash[rank] = 11
  elsif rank.to_i == 0
    hash[rank] = 10
  else
    hash[rank] = rank.to_i
  end
end

BUSTED = 22
DEALER_STAY = 17

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck(number_of_decks = 1) ##### ***
  one_deck = CARD_RANKS.product(CARD_SUITS).map do |card|
    card_info = {}
    card_info[:rank] = card[0]
    card_info[:suit] = card[1]
    card_info[:value] = CARD_VALUES[card[0]]
    card_info
  end
  (one_deck * number_of_decks).shuffle
end

def initial_deal(deck, hands) ##### ***
  deal_initial_hands(deck, hands)
  display_initial_deal(hands)
end

def deal_initial_hands(deck, hands) ##### ***
  2.times do
    deal_card(deck, hands[:player])
    deal_card(deck, hands[:dealer])
  end
end

def deal_card(deck, hand) ##### ***
  hand << deck.pop
end

def display_initial_deal(hands) ##### ***
  deal_order = deal_order(hands)
  deal_order[3] = "a facedown card"
  prompt("Here's the deal:")
  show_each_card(deal_order)
  puts
end

def deal_order(hands) ##### ***
  deal_order = []
  2.times do |idx|
    add_cards_to_hand(hands, deal_order, idx)
  end
  card_names(deal_order).each { |card| card.prepend("the ") }
end

def add_cards_to_hand(hands, deal_order, index) ##### ***
  hands.each do |owner, cards|
    cards.each_with_index do |card, idx|
      (deal_order << card) if (idx == index)
    end
  end
  deal_order
end

def card_names(hand) ##### ***
  hand.map do |card|
    "#{card[:rank]} of #{card[:suit]}"
  end
end

def show_each_card(deal_order) ##### ***
  deal_order.each_with_index do |card, idx|
    sleep(0.7)
    if idx.even?
      prompt("  You get #{deal_order[idx]}")
    else
      prompt("    The dealer gets #{deal_order[idx]}")
    end
  end
end

#####

def display_both_hands(hands, context) ##### ***
  display_hand(hands, :dealer, context)  
  display_hand(hands, :player, :all_cards)
end

def display_hand(hands, owner, context) ##### ***
  prompt(owner == :player ? "Your hand:" : "Dealer hand:")
  hand = card_names(hands[owner])
  hand[1] = "Facedown Card" if context == :face_up_cards
  hand.each { |card| prompt(" #{card}") }
  display_total(hands[owner], context)
  puts
end

def display_total(hand, context) ##### ***
  label = (context == :face_up_cards) ? "Visible card value: " : "Card value: "
  prompt(label + "#{total(hand, context)}")
end

def total(hand, context) ##### ***
  sum = hand.map { |card| card[:value] }.sum
  sum -= hand[1][:value] if context == :face_up_cards
  sum = correct_for_aces(hand, sum)
end

# def initial_sum(face_values, start_index, sum) #####
#   face_values.each_with_index do |value, idx|
#     if idx >= start_index
#       sum = sum_cards(sum, value)
#     end
#   end
#   sum
# end

# def sum_cards(sum, value) #####
#   if value == "Ace"
#     sum += 11
#   elsif value.to_i == 0
#     sum += 10
#   else
#     sum += value.to_i
#   end
# end

def correct_for_aces(hand, sum) ##### ***
  hand.select { |card| card[:rank] == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

#####
# [{:rank=>"2", :suit=>"Clubs", :value=>2}]
hands = { 
  player: [{:rank=>"2", :suit=>"Clubs", :value=>2}, {:rank=>"King", :suit=>"Clubs", :value=>10}],
  dealer: [{:rank=>"Ace", :suit=>"Spades", :value=>11}, {:rank=>"5", :suit=>"Hearts", :value=>5}, {:rank=>"King", :suit=>"Clubs", :value=>10}]
}


p total(hands[:dealer], :face_up_cards)
