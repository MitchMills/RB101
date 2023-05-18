### 4 HOW LONG ARE YOU?
# def word_lengths(string)
#   string.split.map { |word| "#{word} #{word.size}" }
# end

###############
def get_spaces(string)
  string.chars.each_with_index.with_object([]) do |(char, idx), spaces|
    spaces << idx if char == ' '
  end
end

def get_words(string)
  spaces = get_spaces(string)
  p spaces # [3, 9]
  spaces.each. do |idx|
    string[idx...spaces[idx]]
  end
end

p get_words("cow sheep chicken")

def word_lengths(string)
  words = get_words(string, spaces)
end
####################
# p word_lengths("cow sheep chicken") #== ["cow 3", "sheep 5", "chicken 7"]
# p word_lengths("baseball hot dogs and apple pie") #== ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
# p word_lengths("It ain't easy, is it?") #== ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
# p word_lengths("Supercalifragilisticexpialidocious") #== ["Supercalifragilisticexpialidocious 34"]
# p word_lengths("") #== []

### 3 COUNTING UP
# def sequence(num)
#   (1..num).to_a
# end

# def sequence(num)
#   1.upto(num).to_a
# end

# def sequence(num)
#   num > 0 ? (1..num).to_a : (num..-1).to_a
# end

# def sequence(num)
#   return [0] if num == 0
#   num.positive? ? 1.upto(num).to_a : -1.downto(num).to_a
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]
# p sequence(0) == []
# p sequence(-1) == [-1]
# p sequence(-5) == [-5, -4, -3, -2, -1]

### 2 DOUBLE DOUBLES
# def twice(num)
#   str = num.to_s
#   half = str.size / 2
#   str[...half] == str[half..] ? num : num * 2
# end

# def twice(num)
#   array = num.to_s.chars
#   half = array.size / 2
#   array.take(half) == array.drop(half) ? num : num * 2
# end

# def twice(num) # by Shawn Grycki
#   array = num.to_s.chars
#   half = array.size / 2
#   array1, array2 = array.partition.with_index { |_, idx| idx < array.length / 2 }
#   array1 == array2 ? num : num * 2
# end

# def twice(num)
#   array = num.to_s.chars
#   half = (array.size / 2.0).ceil
#   half.times.all? { |idx| array[idx] == array[idx + half] } ? num : num * 2
# end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

### 1 WELCOME STRANGER
# def greetings(name, info)
#   "Hello, #{name.join(' ')}! " +
#   "Nice to have a #{info.values.join(' ')} around."
# end

# p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> "Hello, John Q Doe! Nice to have a Master Plumber around."
