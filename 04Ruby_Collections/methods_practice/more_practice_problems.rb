
# PROBLEM 8
numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

numbers.each_with_index do |number, index|
  p "#{index}, #{numbers.inspect}, #{number}"
  numbers.shift(1)
end
p numbers




# PROBLEM 7
# statement = "The Flintstones Rock"
# letter_frequency = {}

# statement.gsub(/\s+/, '').each_char do |letter|
#   letter_frequency[letter] = statement.count(letter)
# end

# p letter_frequency


# PROBLEM 6
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# fli_sto = flintstones.map { |name| name[0, 3] }
# p fli_sto
# p flintstones


# PROBLEM 5
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# first_be =  flintstones.find_index do |name|
#               name.start_with?('Be')
#             end
# p first_be


# PROBLEM 4
# ages = {  'Herman' => 32,
#           'Lily' => 30,
#           'Grandpa' => 5843,
#           'Eddie' => 10,
#           'Marilyn' => 22,
#           'Spot' => 237
#         }
# youngest_age = ages.values.min
# youngest_person = ages.key(youngest_age)    
# p youngest_person


# PROBLEM 3
# ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

# Solution 3.1
# youngs_only = ages.select! { |name, age| age < 100 }

# Solution 3.2
# youngs_only = ages.keep_if { |name, age| age < 100 }
# p youngs_only


# PROBLEM 2
# ages = { 
#         'Herman' => 32, 
#         'Lily' => 30, 
#         'Grandpa' => 5_843, 
#         'Eddie' => 10, 
#         'Marilyn' => 22, 
#         'Spot' => 237 
#       }
# Solution 2.1
# cumulative_ages = 0
# ages.each do |name, age|
#   cumulative_ages += age
# end

# Solution 2.2
# cumulative_ages = ages.values.inject(:+)
# p cumulative_ages


# PROBLEM 1
# flintstones = ['Fred', 'Barney', 'Wilma', 'Betty', 'Pebbles', 'BamBam']

# Solution 1.1
# flinthash = {}
# flintstones.each_with_index do |name, index|
#   flinthash[name] = index
# end

# Solution 1.2
# flinthash = flintstones.each_with_object({}) do |name, hash|
#   hash[name] = flintstones.index(name)
# end

# p flinthash