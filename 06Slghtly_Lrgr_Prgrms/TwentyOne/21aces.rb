def prompt(message)
  puts "=> #{message}"
end

def total(hand, context)
  face_values = hand.map { |card| card[0] }
  sum = 0
  start_index = (context == :hidden_card) ? 1 : 0
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

def card_names(hand)
  hand.map do |card|
    "#{card[0]} of #{card[1]}"
  end
end

def display_both_hands(hands, context)
  display_hand(hands[:dealer], :dealer, context)  
  display_hand(hands[:player], :player, :all_cards)
end

def display_hand(hand, owner, context)
  display_hand_header(owner, context)
  start_index = (context == :hidden_card ? 1 : 0)
  card_names(hand).each_with_index do |card, idx|
    prompt(" #{card}") if idx >= start_index
  end
  display_total(hand, context)
  puts
end

def display_hand_header(owner, context)
  label = (owner == :player) ? "Your hand:" : "Dealer hand:"
  prompt(label)
  prompt(" Facedown Card") if context == :hidden_card
end

def display_total(hand, context)
  label = (context == :hidden_card) ? "Visible card value: " : "Card value: "
  prompt(label + "#{total(hand, context)}")
end

def busted?(hand)
  total(hand, :all_cards) > 21
end

#####
def determine_result(hands)
  if busted?(hands[:player])
    return :dealer
  elsif busted?(hands[:dealer])
    return :player
  elsif total(hands[:player], :all_cards) > total(hands[:dealer], :all_cards)
    return :player
  elsif total(hands[:dealer], :all_cards) > total(hands[:player], :all_cards)
    return :dealer
  else
    return :tie
  end
end

def display_result(hands)
  system 'clear'
  display_both_hands(hands, :all_cards)
  result = determine_result(hands)
  if result == :player
    prompt("You have won this hand!")
  elsif result == :dealer
    prompt("The dealer won this hand.")
  else
    prompt("It's a tie.")
  end
end
#####


hands = { player: [["King", "Hearts"], ["Ace", "Diamonds"]], dealer: [["Jack", "Clubs"], ["Ace", "Spades"]] }

display_result(hands)
