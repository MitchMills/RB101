# Dealer Turn
# loop do
#   if dealer_hand_value >= 17
#     'stay'
#   else
#    'hit'
#   end
# end

# def determine_winner
#   foo = 0
# end

# def display_result
#   faf = 2
# end

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

def prompt(message)
  puts "=> #{message}"
end

def deal_card(deck, hand)
  card = deck.sample
  deck.delete(card)
  hand << card
end


def card_names(hand)
  hand.map do |card|
    "#{card[0]} of #{card[1]}"
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

def busted?(hand, owner)
  total(hand, owner) > 21
end

def player_turn(deck, hands)
  hit_or_stay(deck, hands)
  # if busted?(hands[:player], :player)
  #   display_both_hands(hands)
  #   prompt("Busted!")
  # else
  #   prompt("You chose to stay")
  # end
end



def hit_or_stay(deck, hands)
  answer = nil
  loop do
    display_both_hands(hands)
    prompt("Would you like to hit or stay?")
    answer = gets.chomp.downcase
    response(answer, deck, hands)

    if busted?(hands[:player], :player)
      display_both_hands(hands)
      prompt("Busted!")
      break
    else
      prompt("You chose to stay")
      break
    end

    # if answer == "stay"
    #   break
    # elsif answer == "hit"
    #   hit(deck, hands)
    #   break if busted?(hands[:player], :player)
    # else
    #   system 'clear'
    #   prompt("Sorry, that's not a valid answer. Try again:")
    #   puts
    # end
  end
end

def response(answer, deck, hands)
  if answer == "stay"
    return
  elsif answer == "hit"
    hit(deck, hands)
    return if busted?(hands[:player], :player)
  else
    system 'clear'
    prompt("Sorry, that's not a valid answer. Try again:")
    puts
    return
  end
end

def hit(deck, hands)
  system 'clear'
  deal_card(deck, hands[:player])
  prompt("You get the #{hands[:player].last[0]} of #{hands[:player].last[1]}.")
  puts
end


player_turn(deck, hands)
