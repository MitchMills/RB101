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

def correct_for_aces(face_values, sum)
  face_values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
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


hands = { player: [["King", "Hearts"], ["Ace", "Diamonds"], ["Ace", "Clubs"]], dealer: [["2", "Clubs"], ["Ace", "Spades"], ["Ace", "Hearts"]] }


p total(hands[:player], :player)
p total(hands[:dealer], :dealer)
