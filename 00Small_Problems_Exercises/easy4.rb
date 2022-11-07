# 2 WHAT CENTURY?
def century(year)
  increment = year % 100 > 0 ? 1 : 0
  century = (year / 100) + increment
end


p century(2000) #== '20th'
p century(2001) #== '21st'
p  century(1965) #== '20th'
p century(256) #== '3rd'
p century(5) #== '1st'
p century(10103) #== '102nd'
p century(1052) #== '11th'
p century(1127) #== '12th'
p century(11201) #== '113th'


# 1 SHORT LONG SHORT
# def short_long_short(string1, string2)
#   if string1.size > string2.size
#     string2 + string1 + string2
#   else
#     string1 + string2 + string1
#   end
# end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"
