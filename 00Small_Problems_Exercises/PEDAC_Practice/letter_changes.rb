=begin
Have the method letter_changes(str) take the str parameter being passed and modify it using the following algorithm.
Replace every letter in the string with the 3rd letter following it in the alphabet
(ie. c becomes f, Z becomes C).
Then return this modified string.
=end

def letter_changes(string)

end

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')


=begin
### EWA
LOWER = ("a".."z").to_a
 UPPER = ("A".."Z").to_a
​
def get_lowercase(letter)
  if letter == "x"
    return "a"
  elsif letter == "y"
    return "b"
  elsif letter == "z"
    return "c"
  else
    current_index = LOWER.index(letter)
    return LOWER[current_index + 3]
  end
 end
​
def get_uppercase(letter)
  if letter == "X"
    return "A"
  elsif letter == "Y"
    return "B"
  elsif letter == "Z"
    return "C"
  else
    current_index = UPPER.index(letter)
    return UPPER[current_index + 3]
  end
end
​
def letter_changes(str)
  result = []
  str.chars.each do |char|
    if LOWER.include?(char)
      result << get_lowercase(char)
    elsif UPPER.include?(char)
      result << get_uppercase(char)
    else
      result << char
    end
  end
  result.join
end
### EWA

### SYED
LOWER = ("a".."z").to_a
UPPER = ("A".."Z").to_a

def get_letter(letter)
  current_index = LOWER.index(letter.downcase)
  current_index = current_index - 26 if current_index > 22
  letter == letter.downcase ? LOWER[current_index + 3] : UPPER[current_index + 3]
end

def letter_changes(str)
  result = ""
  str.each_char do |char|
    result << get_letter(char) if LOWER.include?(char.downcase)
    result << char unless LOWER.include?(char.downcase)
  end
  result
end
### SYED

###### SAURABH
Breakdown
    - Every word in the given string has to be iterated over
    - Every letter in the word is to be replaced
    - The letter is replaced by the letter 3 spaces ahead of it
    - Only operate over alphabets and account for case
    - Input: String
    - Output: String
​
  Data structure
    - 'abc' > 'def'
    - a = 1, d = 4, 1 + 3
    - b = 2, 2 + 3 = 5, e = 5
    - 1, 2, 3 > 4, 5, 6
    - End of the string needs to repeat
    - English alphabets - 26
    - If letter_number + 3 > 26
     - new_letter_number = letter_number + 3 - 26
     - Z = 26, 26 + 3 - 26, 3 = c
​
  Problem
    - Iterate over each word
    - Iterate over each letter in the word
    - Replace each letter based on algorithm
    - Join the letters and words, return that as result
​
  Algorithm
    - Iterate over each word of the given string
      - Iterate over each letter of letter of the current word
      - If the letter is an alphabet
        - Replace the letter
      - Else return letter
      - Join the resultant array
    - Join the resultant array with spaces as separator
​
    - To replace the letter
      - If ALPHABET_NUMBERS[letter] + 3 > 26
        new_letter_number = ALPHABET_NUMBERS[letter] + 3 - 26
      - Else
        new_letter_number = ALPHABET_NUMBERS[letter] + 3
      - ALPHABET_NUMBER.key(new_letter_number)

# SOLUTION 1
ALPHABETS = ('a'..'z').zip(1..26).to_h
​
def letter_changes(string)
  string.split.map do |word|
    word.chars.map do |letter|
      if ALPHABETS.key?(letter.downcase)
        new_letter = change_letter(letter.downcase)
        letter.downcase == letter ? new_letter : new_letter.upcase
      else
        letter
      end
    end.join
  end.join(' ')
end
​
def change_letter(letter)
  letter_value = ALPHABETS[letter]
  if letter_value + 3 > 26
    ALPHABETS.key((letter_value - 26) + 3)
  else
    ALPHABETS.key(letter_value + 3)
  end
end

# Alternate 1
def letter_changes(string)
  string.chars.map do |letter|
    if ALPHABETS.key?(letter.downcase)
      new_letter = change_letter(letter.downcase)
      letter.downcase == letter ? new_letter : new_letter.upcase
    else
      letter
    end
  end.join
end
​
# Alternate 2 based on Syed's input
def letter_changes(string)
  string.chars.map do |letter|
    ALPHABETS.key?(letter.downcase) ? change_letter(letter) : letter
  end.join
end
​
def change_letter(letter)
  value = ALPHABETS[letter.downcase] + 3
  value = value - 26 if value > 23
​
  letter.downcase == letter ? ALPHABETS.key(value) : ALPHABETS.key(value).upcase
end
###### SAURABH

###### WILLIAM
Understand the problem:
- given a sting return a new string where every alphabetical character from the input string is offset by 3
- example : c becomes f and Z becomes C
- rules: every non alphabetical characters remains as is
​
- input: string 
- output: string 
​
Mental Model
- map all the alphabetical characters to their corresponding shifted character and store them into a hash where the keys represent the non-shifted alphabetical characters and the values represent the corresponding shifted character. #zip #to_h
- iterate over each character
- if the current character is an alphabetical character #ternary 
  - convert it 
- otherwise 
  - return the current character
- convert the new array of characters into a string #join

CONVERTER = ([*"a".."z"].zip([*"d".."z"] + [*"a".."c"]) + [*"A".."Z"].zip([*"D".."Z"] + [*"A".."C"])).to_h
​
def letter_changes(str)
  str.chars.map do |chr|
    chr.match?(/[a-zA-Z]/) ? CONVERTER[chr] : chr
  end.join
end
###### WILLIAM

###### ELJAN
def letter_changes(str)
  arr = Array("a".."z")
  new_str = []
  for i in str.chars
    down = i == i.downcase
    i = i.downcase
    if arr.include?(i)
      index = arr.index(i)
      char = arr[index + 3 - 26]
      new_str.push(down ? char : char.upcase)
    else
      new_str.push(i)
    end
  end
  new_str.join
end                                               
p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')
###### ELJAN

###### TRAVIS
def letter_changes(str)
  new_str = ''
  str.each_char do |letter|
    if ('a'..'w').cover?(letter.downcase)
      new_str << (letter.ord + 3).chr
    elsif ('x'..'z').cover?(letter.downcase)
      new_str << (letter.ord - 23).chr
    else
      new_str << letter
    end
  end
  new_str
end
###### TRAVIS

###### DANIEL CHAE
def letter_changes(s)
  s.gsub(/[a-z]/i) { |c| ((x = c =~ /[A-Z]/ ? 65 : 97) + (c.ord - x + 3) % 26).chr }
end

def letter_changes(s)
  s.gsub(/[a-z]/i) do |c| # look for chars in range a-z, the i means case-insensitive
	# that found char will be assigned to block parameter c
	((x = c =~ /[A-Z]/ ? 65 : 97) # Assign x to 65 if c matches the regex (within range A-Z), else 97
	+ (c.ord - x + 3) % 26).chr # Subtract x from the codepoint of c, so that "a" (or "A") is 0 and "z" (or "Z) is 25. 
	# Add 3. Modulo 26 (so that "xyz" wraps around to "abc")
	# Add back to x so we return to the codepoint range for "a-z" or "A-Z".
	# convert to char with .chr
	# gsub will replace c with return value of this block
  end
end

# I think interesting things to take away though are assigning a local var
# in parentheses to use in the same line, and using modulo to loop back around.
# The modulo is equivalent to saying "subtract 26 if it is greater than 26",
# but a bit cleaner and more concise.
###### DANIEL CHAE

=end