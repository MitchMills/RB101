# Selection and Transformation Practice

# Select then transform
def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p my_numbers
p double_odd_indices(my_numbers)
p my_numbers

# def double_odd_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     current_number *= 2 if current_number.odd?
#     doubled_numbers << current_number

#     counter += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p my_numbers
# p double_odd_numbers(my_numbers)
# p my_numbers

# Transformation within a method: mutating
# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size
#     numbers[counter] *= 2
#     counter += 1
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p my_numbers
# p double_numbers!(my_numbers)
# p my_numbers

# Transformation within a method: non-mutating
# def double_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     doubled_numbers << current_number * 2

#     counter += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p my_numbers
# p double_numbers(my_numbers)
# p my_numbers

# Extracting to Methods, Hash
# def select_fruit(produce)
#   selected_fruit = {}
#   produce_keys = produce.keys
#   index = 0

#   loop do
#     break if index == produce.size

#     current_key = produce_keys[index]
#     current_value = produce[current_key]

#     if current_value == 'Fruit'
#       selected_fruit[current_key] = current_value 
#     end

#     index += 1
#   end

#   selected_fruit  
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p produce
# p select_fruit(produce)

# Extracting to Methods, Array
# def select_vowels(string)
#   selected_chars = ''
#   counter = 0

#   loop do
#     current_char = string[counter]

#     if 'aeiouAEIOU'.include?(current_char)
#       selected_chars << current_char
#     end

#     counter += 1
#     break if counter == string.size
#   end

#   selected_chars # returns a new collection
# end

# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# p alphabet
# vowels = select_vowels(alphabet)
# p vowels
# number_of_vowels = select_vowels(alphabet).size
# p number_of_vowels
# p alphabet


# Basic transformation
# fruits = ['apple', 'banana', 'pear']
# transformed_elements = []
# counter = 0

# loop do
#   current_element = fruits[counter]

#   transformed_elements << current_element + 's' # transformation criteria

#   counter += 1
#   break if counter == fruits.size
# end

# p transformed_elements
# p fruits

# Basic selection
# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# selected_chars = ''
# counter = 0

# loop do # basic loop
#   current_char = alphabet[counter]

#   if current_char == 'g' # selection criteria
#     selected_chars << current_char
#   end

#   counter += 1
#   break if counter == alphabet.size
# end

# p selected_chars