CARD_FACES = [
  '2', '3', '4', '5', '6', '7', '8', '9', '10', 
  'Jack', 'Queen', 'King', 'Ace'
]
CARD_SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']

# deck = CARD_FACES.product(CARD_SUITS)

deck = [
  ["2", "Clubs"], ["2", "Diamonds"], ["2", "Hearts"], ["2", "Spades"],
  ["3", "Clubs"], ["3", "Diamonds"], ["3", "Hearts"], ["3", "Spades"],
  ["4", "Clubs"], ["4", "Diamonds"], ["4", "Hearts"], ["4", "Spades"],
  ["5", "Clubs"], ["5", "Diamonds"], ["5", "Hearts"], ["5", "Spades"],
  ["6", "Clubs"], ["6", "Diamonds"], ["6", "Hearts"], ["6", "Spades"],
  ["7", "Clubs"], ["7", "Diamonds"], ["7", "Hearts"], ["7", "Spades"],
  ["8", "Clubs"], ["8", "Diamonds"], ["8", "Hearts"], ["8", "Spades"],
  ["9", "Clubs"], ["9", "Diamonds"], ["9", "Hearts"], ["9", "Spades"],
  ["10", "Clubs"], ["10", "Diamonds"], ["10", "Hearts"], ["10", "Spades"],
  ["Jack", "Clubs"], ["Jack", "Diamonds"], ["Jack", "Hearts"], ["Jack", "Spades"],
  ["Queen", "Clubs"], ["Queen", "Diamonds"], ["Queen", "Hearts"], ["Queen", "Spades"],
  ["King", "Clubs"], ["King", "Diamonds"], ["King", "Hearts"], ["King", "Spades"],
  ["Ace", "Clubs"], ["Ace", "Diamonds"], ["Ace", "Hearts"], ["Ace", "Spades"]
]

hands = { player: [["King", "Hearts"], ["8", "Diamonds"]], dealer: [["2", "Clubs"], ["Ace", "Spades"]] }
def display_initial_deal(hands) 
  card_order = []

  hands.each do |owner, hand|
    card_order << hands[owner][0]
  end

  hands.each do |owner, hand|
    card_order << hands[owner][1]
  end
  
  card_order
end

p display_initial_deal(hands)
