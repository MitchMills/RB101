### 2 AFTER MIDNIGHT I
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def prepend_zero(int)
  int < 10 ? int.to_s.prepend('0') : int.to_s
end

def time_of_day(num)
  normalized_minutes = num % MINUTES_PER_DAY
  hrs_and_mins = normalized_minutes.divmod(MINUTES_PER_HOUR)
  hrs_and_mins.map! { |ele| prepend_zero(ele) }
  "#{hrs_and_mins[0]}:#{hrs_and_mins[1]}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

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
