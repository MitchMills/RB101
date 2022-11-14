def update_score(score, winner)
  if winner == 'Player'
    score[:player_score] += 1
  elsif winner == 'Computer'
    score[:computer_score] += 1
  else
    score[:ties] += 1
  end
end

score = { player_score: 0, computer_score: 0, ties: 0 }
p score
puts

winner = 'Player'
p update_score(score, winner)
