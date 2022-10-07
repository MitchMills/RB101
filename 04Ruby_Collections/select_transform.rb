# Selection and Transformation Practice

# Extracting to Methods, Hash
def select_fruit
  selected_fruit = {}
  
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce)

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