=begin
card = [face_value, suit]
hand = [[card1], [card2], etc ]

=end

# def card_value(card, current_hand_value)
#   if card[0] != 'A'
#     card_value = card[0].to_i
#   else
#     card_value =
#       if current_hand_value <= 10
#         card_value = 11
#       else
#         card_value = 1
#       end
#   end
#   card_value
# end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ] ### I will reverse order ('3 of hearts') --> ['3', 'H']
  values = cards.map { |card| card[1] } # get all the number values

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do # find number of aces in hand
    sum -= 10 if sum > 21 # subtract 10 for each ace until sum is less than 21
  end

  sum
end