def like(letters)
  letters = letters.map { |letter| "I like the letter: #{letter}" }
  p letters
end

my_letters = ['a', 'b', 'c']
like(my_letters)

p my_letters
