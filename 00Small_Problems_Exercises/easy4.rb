### 6 RUNNING TOTALS
# def running_total(array)
#   total = 0
#   array.map { |num| total += num }
# end

# def running_total(array)
#   total = 0
#   total_array = []
#   array.each do |num|
#     total_array << total += num
#   end
#   total_array
# end

# def running_total(array)
#   total = 0
#   array.each_with_object([]) { |num, array| array << total += num }
# end

# def running_total(array)
#   total_array = []
#   array.inject(0) { |sum, num| total_array[array.index(num)] = sum + num }
#   total_array
# end

# def running_total(array)
#   array.inject([]) { |result, element| result << result.last.to_i + element }
# end

# def running_total(array)
#   total = 0
#   array.inject([]) { |total_array, num| total_array << total += num }
# end

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []


### 5 MULTIPLES OF 3 AND 5
# def multisum(num)
#   total = 0
#   1.upto(num) do |i|
#     total += i if (i % 3 == 0 || i % 5 == 0)
#   end
#   total
# end

# def multisum(max)
#   (1..max).select { |num| num % 3 == 0 || num % 5 == 0}.sum
# end

# p multisum(3) == 3 # (1, 2, 3) => 3
# p multisum(5) == 8 # (1, 2, 3, 4, 5) => 3 + 5
# p multisum(10) == 33 #(1..10) => 3 + 5 + 6 + 9 + 10
# p multisum(1000) == 234168

### 4 LEAP YEARS II
# def leap_year?(year)
#   if (year % 100 == 0) && (year > 1752)
#     year % 400 == 0
#   else
#     year % 4 == 0
#   end
# end

# def leap_year?(year)
#   if year < 1752
#     year % 4 == 0
#   else
#     (year % 100 == 0) ? (year % 400 == 0) : (year % 4 == 0)
#   end
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true

### 3 LEAP YEARS I
# def leap_year?(year)
  # (year % 100 == 0) ? (year % 400 == 0) : (year % 4 == 0)
# end

# def leap_year?(year)
  # if year % 100 == 0
  #   year % 400 == 0
  # else
  #   year % 4 == 0
  # end
# end

# def leap_year?(year)
#   if year % 4 == 0
#     if year % 100 == 0
#       return false unless year % 400 == 0
#     end
#     true
#   else
#     false
#   end
# end

# def leap_year?(year)
#   if year % 4 == 0
#     if year % 100 == 0
#       return year % 400 == 0
#     end
#     true
#   else
#     false
#   end
# end

# def leap_year?(year)
#   if year % 400 == 0
#     true
#   elsif year % 100 == 0
#     false
#   else
#     year % 4 == 0
#   end
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

### 2 WHAT CENTURY IS THAT?
# def century(year)
#   adjustment = (year % 100 == 0) ? 0 : 1
#   century = ((year / 100) + adjustment)
#   suffix =  case (century % 10)
#             when 1 then 'st'
#             when 2 then 'nd'
#             when 3 then 'rd'
#             else 'th'
#             end
#   suffix = 'th' if (11..13).include?(century % 100)
#   century.to_s + suffix
# end

# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(4) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'

### 1 SHORT LONG SHORT
# def short_long_short(str1, str2)
#   short =  (str1.size < str2.size) ? str1 : str2
#   long =   (str1.size > str2.size) ? str1 : str2
#   short + long + short 
# end


# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"
