### 2 DELETE VOWELS
VOWELS = "aeiouAEIOU"
# def remove_vowels(string_array)
#   string_array.map { |string| string.delete(VOWELS) }
# end

# def remove_vowels(string_array)
#   string_array.map { |string| string.gsub(/[aeiouAEIOU]/, "") }
# end

# def remove_vowels(string)
#   string.each_char.map do |char|
#     char = VOWELS.include?(char) ? "" : char
#   end.join
# end

# p remove_vowels("abcde")

def remove_vowels(string_array)
  string_array.map do |string| 
    string.each_char.map do |char|
      char = VOWELS.include?(char) ? "" : char
    end.join
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

### 1 CUTE ANGLES
# DEGREE = "\xC2\xB0"
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60
# SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

# # def dms(angle)
# #   degrees = angle
# #   minutes = (degrees % 1) * 60
# #   seconds = (minutes % 1) * 60
# #   %Q(%(#{sprintf("%d", degrees)}°#{sprintf("%02d", minutes)}'#{sprintf("%02d", seconds)}\"))
# # end

# puts dms(30) #== %(30°00'00")
# puts dms(76.73) #== %(76°43'48")
# puts dms(254.6) #== %(254°36'00")
# puts dms(93.034773) #== %(93°02'05")
# puts dms(0) #== %(0°00'00")
# puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
