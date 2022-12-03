CARD_FACES = [
  '2', '3', '4', '5', '6', '7', '8', '9', '10', 
  'J', 'Q', 'K', 'A'
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
  prompt "Welcome to Twenty-One!"
  prompt "Enter any key to begin."
  gets
end

def initialize_deck()
  CARD_FACES.product(CARD_SUITS)
end

def get_initial_hands(deck, hands)
  hands = deal_cards(deck, hand, 2)
end

def deal_cards(deck, hand, number)
  number.times { |i| hand << get_card(deck) }
  hand
end

def get_card(deck)
  card = deck.sample
  deck.delete(card)
  p card
  card
end

# MAIN GAME LOOP
# welcome()
# initialize_deck()
# deal_cards()
# player_turn()
# dealer_turn()
# determine_winner()
# outro()

loop do
  welcome()
  deck = initialize_deck()
  hands = { player: [], dealer: [] }
  get_initial_hands(deck, hands)
  display_hands(player_hand, dealer_hand)
end

# deck = initialize_deck()
# player_hand = []
# player_hand = deal_cards(deck, player_hand, 2)
# p player_hand
# puts
# p deck
