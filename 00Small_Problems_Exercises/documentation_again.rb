
# KEYWORD ARGUMENTS
# 5.step(by: 3, to: 10) { |value| puts value } # --> 5 8


# MULTIPLE SIGNATURES
# array = %w(a b c d e)
# # puts array.fetch(7) # --> IndexError
# puts array.fetch(7, 'beats me') # --> 'beats me'
# puts array.fetch(7) { |index| index**2 } # --> 49


# MANDATORY BLOCKS
# array = [1, 4, 8, 11, 15, 19]
# found_num = array.bsearch { |num| num > 8 }
# p found_num

# DEFAULT ARGUMENTS IN THE MIDDLE
# def my_method(a, b = 2, c = 3, d)
#   p [a, b, c, d]
# end

# my_method(4, 5, 6) # --> [4, 5, 3, 6]

# OPTIONAL ARGUMENTS REDUX
# require 'date'

# puts Date.civil # --> -4712-01-01
# puts Date.civil(2016) # --> 2016-01-01
# puts Date.civil(2016, 5) # --> 2016-05-01
# puts Date.civil(2016, 5, 13) # --> 2016-05-13
# puts Date.civil(1751, 5, 13, Date::ENGLAND)
