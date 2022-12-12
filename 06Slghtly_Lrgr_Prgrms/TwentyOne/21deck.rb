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

def initialize_deck(number_of_decks = 1)
  one_deck = CARD_RANKS.product(CARD_SUITS).map do |card|
    card_info = {}
    card_info[:rank] = card[0]
    card_info[:suit] = card[1]
    card_info[:value] = CARD_VALUES[card[0]]
    card_info
  end
  one_deck * number_of_decks
end

deck = initialize_deck(2)
p deck
