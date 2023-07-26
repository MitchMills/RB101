### Question 2.2
munsters_description = "The Munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

### Question 1.2
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# p ages.slice("Spot")

######################

# Question 10
# title = "Flintstone Family Members"
# puts title.center(40)

# Question 9
# statement = "The Flintstones Rock!"
# number_of_ts = statement.count('t')
# puts number_of_ts

# Question 8
# advice = "Few things in life are as important as house training your pet dinosaur."
# puts advice
# first_half = advice.slice!(0, advice.index('house'))
# puts first_half
# puts advice

# Question 7
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.concat(%w(Dino Hoppy))
# flintstones.insert(-1, 'Dino', 'Hoppy')
# p flintstones

# Question 6
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones << 'Dino'
# p flintstones

# Question 5
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# p flintstones

# Question 4
# advice = "Few things in life are as important as house training your pet dinosaur."
# puts advice.match?('Dino')
# puts advice.include?('Dino')

# Question 3
# ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10 }
# p ages
# additional_ages = { 'Marilyn' => 22, 'Spot' => 237 }
# p additional_ages
# combined_ages = ages.merge(additional_ages)
# p combined_ages

# Question 2
# munsters_description = "The Munsters are creepy in a good way."
# puts munsters_description
# puts munsters_description.swapcase
# puts munsters_description.capitalize
# puts  munsters_description.downcase
# puts  munsters_description.upcase

# Question 1
# ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

# puts ages.any? { |key, value| key == 'Spot' }
# puts ages.key?('Spot')
# puts ages['Spot'] == nil
