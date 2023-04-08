### 2 WHAT CENTURY IS THAT?
def century(year)
  modifier = (year % 100 == 0) ? 0 : 1
  century = ((year / 100) + modifier).to_s
  suffix =  case century[-1]
            when '1' then 'st'
            when '2' then 'nd'
            when '3' then 'rd'
            else 'th'
            end
  if (century[-2, 2].to_i > 10) && (century[-2, 2].to_i < 14)
    suffix = 'th'
  end
  century + suffix
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

### 1 SHORT LONG SHORT
# def short_long_short(str1, str2)
#   short =  (str1.size < str2.size) ? str1 : str2
#   long =   (str1.size > str2.size) ? str1 : str2
#   short + long + short 
# end


# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"
