### LETTER COUNTER II


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

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
