hand = [["10", "Clubs"], ["Ace", "Hearts"]]

def total(hand)
  face_values = hand.map { |card| card[0] }
  sum = 0
  face_values.each do |value|
    sum = sum_cards(sum, value)
  end
  face_values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def visible_total(hand)
  face_values = hand.map { |card| card[0] }
  visible_sum = 0
  face_values.each_with_index do |value, idx|
    if idx > 0
      visible_sum = sum_cards(visible_sum, value)
    end
  end
  face_values.select { |value| value == "Ace" }.count.times do
    visible_sum -= 10 if visible_sum > 21
  end
  visible_sum
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

p total(hand)
p visible_total(hand)