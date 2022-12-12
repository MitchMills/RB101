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

#####

def display_initial_deal(hands) #####
  deal_order = deal_order(hands)
  deal_order[1] = "a facedown card"
  prompt("Here's the deal:")
  show_each_card(deal_order)
  puts
end

def deal_order(hands) #####
  deal_order = []
  2.times do |idx|
    add_cards_to_hand(hands, deal_order, idx)
  end
  card_names(deal_order).each { |card| card.prepend("the ") }
end

def add_cards_to_hand(hands, deal_order, index) #####
  hands.each do |_, cards|
    cards.each_with_index do |card, idx|
      (deal_order << card) if (idx == index)
    end
  end
  deal_order
end

def card_names(hand) #####
  hand.map do |card|
    "#{card[0]} of #{card[1]}"
  end
end

def show_each_card(deal_order) #####
  deal_order.each_with_index do |card, idx|
    sleep(0.7)
    if idx.even?
      prompt("  You get #{deal_order[idx]}")
    else
      prompt("    The dealer gets #{deal_order[idx]}")
    end
  end
end

# [{:rank=>"2", :suit=>"Clubs", :value=>2}]
hands = { 
  player: [{:rank=>"2", :suit=>"Clubs", :value=>2}, {:rank=>"King", :suit=>"Clubs", :value=>10}],
  dealer: [{:rank=>"Ace", :suit=>"Spades", :value=>11}, {:rank=>"5", :suit=>"Hearts", :value=>5}]
}



deck = initialize_deck
deal_card(deck, hands[:dealer])
p hands[:dealer]
p deck.size
