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
  ["J", "Clubs"], ["J", "Diamonds"], ["J", "Hearts"], ["J", "Spades"],
  ["Q", "Clubs"], ["Q", "Diamonds"], ["Q", "Hearts"], ["Q", "Spades"],
  ["K", "Clubs"], ["K", "Diamonds"], ["K", "Hearts"], ["K", "Spades"],
  ["A", "Clubs"], ["A", "Diamonds"], ["A", "Hearts"], ["A", "Spades"]
]

small_deck = [["2", "Clubs"], ["2", "Diamonds"], ["2", "Hearts"], ["2", "Spades"]]

def prompt(message)
  puts "=> #{message}"
end

hands = { player: [["9", "Spades"], ["Q", "Diamonds"]], dealer: [["10", "Clubs"], ["K", "Hearts"]] }

# p "#{hands[:player][0][0]} of #{hands[:player][0][1]}"

# hands[:player].each do |card|
#   prompt("#{card[0]} of #{card[1]}")
# end
p hands.keys[0].to_s