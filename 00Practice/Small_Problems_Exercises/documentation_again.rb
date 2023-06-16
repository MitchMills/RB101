### 9 DOWN THE RABBIT HOLE
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')


### 8 INCLUDED MODULES
# a = [5, 9, 3, 11]
# puts a.min(2)

### 7 PARENT CLASS
# s = 'abc'
# puts s.public_methods(false).inspect

### 6 KEYWORD ARGUMENTS
# 5.step(to: 10, by: 3) { |value| puts value }

### 5 MULTIPLE SIGNATURES
# a = %w(a b c d e)
# p a[7]
# # puts a.fetch(7)
# puts a.fetch(7, 'beats me')
# puts a.fetch(7) { |index| index**2 }

### 4 MANDATORY BLOCKS
# a = [1, 4, 8, 11, 15, 19]
# p a.bsearch {|num| num > 8}

### 3 DEFAULT ARGUMENTS IN THE MIDDLE
# def my_method(a, b = 2, c = 3, d)
#   p [a, b, c, d]
# end

# my_method(4, 5, 6)

### 2 OPTIONAL ARGUMENTS REDUX
# require 'date'

# puts Date.civil
# puts Date.civil(2016)
# puts Date.civil(2016, 5)
# puts Date.civil(2016, 5, 13)

### 1 CLASS AND INSTANCE METHODS
# puts File.path('bin')

# f = File.new('my-file.txt')
# puts f.path
