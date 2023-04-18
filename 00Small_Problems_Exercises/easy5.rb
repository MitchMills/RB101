### DDAAIILLYY DDOOUUBBLLEE
# def crunch(string)
#   new_string = ''
#   string.each_char do |char|
#     new_string << char unless char == new_string[-1]
#   end
#   new_string
# end

def crunch(input_string)
  input_string.each_char.each_with_object("") do |char, new_string|
    new_string << char unless char == new_string[-1]
  end 
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''

### ALPHABETICAL NUMBERS
# INTEGERS = (0..19).to_a
# WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
# INTEGERS_TO_WORDS = INTEGERS.zip(WORDS).to_h
# { 0=>"zero",      1=>"one",         2=>"two",       3=>"three",
#   4=>"four",      5=>"five",        6=>"six",       7=>"seven", 
#   8=>"eight",     9=>"nine",        10=>"ten",      11=>"eleven", 
#   12=>"twelve",   13=>"thirteen",   14=>"fourteen", 15=>"fifteen", 
#   16=>"sixteen",  17=>"seventeen",  18=>"eighteen", 19=>"nineteen"}

# SORTED_INTEGERS = [
#   8, 18, 11, 15, 5,
#   4, 14, 9, 19, 1,
#   7, 17, 6, 16, 10,
#   13, 3, 12, 2, 0
# ]

# def alphabetic_number_sort(int_array)
#   int_array.sort do |int1, int2|
#     WORDS[int1] <=> WORDS[int2]
#   end
# end

# def alphabetic_number_sort(int_array)
#   int_array.sort_by { |int| WORDS[int] }
# end

# def alphabetic_number_sort(int_array)
#   int_words = int_array.map { |int| INTEGERS_TO_WORDS[int] }.sort
#   int_words.map { |word| INTEGERS_TO_WORDS.key(word) }
# end

# def alphabetic_number_sort(int_array)
#   sorted_array = []
#   int_array.map do |int|
#     sorted_array[SORTED_INTEGERS.index(int)] = int
#   end
#   sorted_array.compact
# end

# def alphabetic_number_sort(int_array)
#   sorted_array = int_array.map.each_with_object([]) do |int, array|
#     array[SORTED_INTEGERS.index(int)] = int
#   end.compact
# end

# def alphabetic_number_sort(int_array)
#   sorted_array = []
#   index = 0
#   SORTED_INTEGERS.each do |int|
#     if int_array.include?(int)
#       sorted_array[index] = int
#       index += 1
#     end
#   end
#   sorted_array
# end

# def alphabetic_number_sort(int_array)
#   SORTED_INTEGERS.intersection(int_array)
# end

# def alphabetic_number_sort(int_array)
#   int_array.sort_by { |int| SORTED_INTEGERS.index(int) }
# end

# p alphabetic_number_sort([1, 2, 3, 3, 3, 4, 5])
# p alphabetic_number_sort((0..15).to_a) #== [
#   8, 18, 11, 15, 5,
#   4, 14, 9, 19, 1,
#   7, 17, 6, 16, 10,
#   13, 3, 12, 2, 0
# ]

### LETTER COUNTER II
# def word_sizes(string)
#   words = string.split.map { |word| word.gsub(/[^[:alpha:]]/, '') }
#   words.each_with_object(Hash.new(0)) { |word, hash| hash[word.size] += 1 }
# end

# def word_sizes(string)
#   string.split.each_with_object(Hash.new(0)) do |word, hash|
#     hash[word.count('A-Za-z')] += 1
#   end
# end

# def word_sizes(words_string)
#   counts = Hash.new(0)
#   words_string.split.each do |word|
#     clean_word = word.delete('^A-Za-z')
#     counts[clean_word.size] += 1
#   end
#   counts
# end

# p word_sizes('[Four] score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}

### LETTER COUNTER I
# def word_sizes(string)
#   sizes = Hash.new(0)
#   string.split.each { |word| sizes[word.size] += 1 }
#   sizes
# end

# def word_sizes(string)
#   string.split.map {|word| word.size}.tally
# end

# def word_sizes(string)
#   string.split.each_with_object(Hash.new(0)) do |word, hash|
#     hash[word.size] += 1
#   end
# end

# def word_sizes(string)
#   string.split.each_with_object({}) do |word, hash|
#     hash[word.size] = string.split.map {|word| word.size}.count(word.size)
#   end
# end

# def word_sizes(string)
#   words = string.split
#   sizes = Hash.new do |hash, key| 
#     hash[key] = words.map {|word| word.size}.count(key)
#   end
#   words.each { |word| sizes[word.size] }
#   sizes
# end

# def word_sizes(string)
#   word_sizes = string.split.map { |word| word.size }
#   size_counts = Hash.new do |hash, key| 
#     hash[key] = word_sizes.count(key)
#   end
#   word_sizes.uniq.each { |size| size_counts[size] }
#   size_counts
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

### 5 CLEAN UP THE WORDS
# def cleanup(string)
#   cleaned_up = string.chars.map { |char| ('a'..'z').include?(char) ? char : ' ' }
#   string = cleaned_up.join.squeeze(' ')
#   p string
# end

# p cleanup("---what's my +*& line?") == ' what s my line '

### 4 LETTER SWAP
# def swap(string)
#   words = string.split
#   words.each { |word| word[0], word[-1] = word[-1], word[0] }
#   words.join(' ')
# end

# def swap(string)
#   string.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
# end

# p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') #== 'ebcdA'
# p swap('a') #== 'a'

### 3 AFTER MIDNIGHT II
# SECONDS_PER_MINUTE = 60
# MINUTES_PER_DAY = 1440
# CURRENT_YEAR = Time.now.year
# MIDNIGHT = Time.new(CURRENT_YEAR)

# def get_time(time_string)
#   hours, minutes = time_string[0..1].to_i, time_string[3..4].to_i
#   time = Time.new(CURRENT_YEAR, 1, 1, hours, minutes)
# end

# def after_midnight(time_string)
#   time = get_time(time_string)
#   (((time - MIDNIGHT) / SECONDS_PER_MINUTE).to_i) % MINUTES_PER_DAY
# end

# def before_midnight(time_string)
#   (MINUTES_PER_DAY - after_midnight(time_string)) % MINUTES_PER_DAY
# end

# p after_midnight('00:00') #== 0
# p before_midnight('00:00') #== 0
# p after_midnight('12:34') #== 754
# p before_midnight('12:34') #== 686
# p after_midnight('24:00') #== 0
# p before_midnight('24:00') #== 0

# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = 1440

# def get_total_minutes(time)
#   hours, minutes = time[0..1].to_i, time[3..4].to_i
#   total_minutes = (hours * MINUTES_PER_HOUR) + minutes
# end

# def after_midnight(time)
#   get_total_minutes(time) % MINUTES_PER_DAY
# end

# def before_midnight(time)
#   MINUTES_PER_DAY - get_total_minutes(time)) % MINUTES_PER_DAY
# end

# def get_total_minutes(time, direction)
#   hours, minutes = time[0..1].to_i, time[3..4].to_i
#   if direction == 'after' && hours == 24
#     hours = 0
#   elsif direction == 'before' && hours == 0
#     hours = 24
#   end
#   total_minutes = (hours * MINUTES_PER_HOUR) + minutes
# end

# def after_midnight(time)
#   get_total_minutes(time, 'after')
# end

# def before_midnight(time)
#   MINUTES_PER_DAY - get_total_minutes(time, 'before')
# end

### 2 AFTER MIDNIGHT I
# SECONDS_PER_MINUTE = 60
# MIDNIGHT = Time.new(2023, 4, 16)

# def time_of_day(num)
#   (MIDNIGHT + (num * SECONDS_PER_MINUTE)).strftime("%A %R")
# end

# p time_of_day(0) == "Sunday 00:00"
# p time_of_day(-3) == "Saturday 23:57"
# p time_of_day(35) == "Sunday 00:35"
# p time_of_day(-1437) == "Saturday 00:03"
# p time_of_day(3000) == "Tuesday 02:00"
# p time_of_day(800) == "Sunday 13:20"
# p time_of_day(-4231) == "Thursday 01:29"

# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = 1440

# def format_string(int)
#   int < 10 ? int.to_s.prepend('0') : int.to_s
# end

# def time_of_day(num)
#   normalized_minutes = num % MINUTES_PER_DAY
#   hrs_and_mins = normalized_minutes.divmod(MINUTES_PER_HOUR)
#   hrs_and_mins.map! { |ele| format_string(ele) }
#   "#{hrs_and_mins[0]}:#{hrs_and_mins[1]}"
# end

# p time_of_day(0) #== "00:00"
# p time_of_day(-3) #== "23:57"
# p time_of_day(35) #== "00:35"
# p time_of_day(-1437) #== "00:03"
# p time_of_day(3000) #== "02:00"
# p time_of_day(800) #== "13:20"
# p time_of_day(-4231) #== "01:29"

### 1 ASCII STRING VALUE
# def ascii_value(string)
#   sum = 0
#   string.chars.each { |char| sum += char.ord }
#   sum
# end

# def ascii_value(string)
#   string.chars.each_with_object([]) { |char, ords| ords << char.ord }.sum
# end

# def ascii_value(string)
#   string.each_char.inject(0) { |sum, char| sum + char.ord }
# end

# def ascii_value(string)
#   p string.chars.map { |char| char = char.ord }.sum
# end

# def ascii_value(string)
#   string.sum
# end
  

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0
