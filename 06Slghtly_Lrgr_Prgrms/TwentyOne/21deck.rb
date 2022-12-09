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

def prompt(message)
  puts "=> #{message}"
end

# def display_initial_deal(hands)
#   prompt("Here's the deal:")
#   sleep(0.8)
#   prompt("  You get the #{hands[:player][0][0]} of #{hands[:player][0][1]}.")
#   sleep(0.8)
#   prompt("    The dealer gets a facedown card.")

#   sleep(0.8)
#   prompt("  You get the #{hands[:player][1][0]} of #{hands[:player][1][1]}.")
#   sleep(0.8)
#   prompt("    The dealer gets the #{hands[:dealer][1][0]} of #{hands[:dealer][1][1]}")
  
#   puts
# end



hands = { player: [["King", "Hearts"], ["8", "Diamonds"]], dealer: [["2", "Clubs"], ["Ace", "Spades"]] }

def display_initial_deal(hands)
  deal_order = deal_order(hands)
  deal_order[1] = "a facedown card"
  prompt("Here's the deal:")
  show_each_card(deal_order)
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

display_initial_deal(hands)
