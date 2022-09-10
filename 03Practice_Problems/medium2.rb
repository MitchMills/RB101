system('clear')

# QUESTION 6
def color_valid(color)
  color == 'blue' || color == 'green'
end

puts "red: #{color_valid('red')}"
puts "blue: #{color_valid('blue')}"

# QUESTION 5
# def not_so_tricky_method(a_string_param, an_array_param)
#   a_string_param += 'rutabaga'
#   an_array_param += ['rutabaga']
#   return a_string_param, an_array_param
# end
#
# my_string = 'pumpkins'
# my_array = ['pumpkins']
# my_string, my_array = not_so_tricky_method(my_string, my_array)
#
# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# QUESITON 4
# def tricky_method_two(a_string_param, an_array_param)
#   a_string_param << 'rutabaga'
#   an_array_param = ['pumpkins', 'rutabaga']
# end
#
# my_string = 'pumpkins'
# my_array = ['pumpkins']
# tricky_method_two(my_string, my_array)
#
# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# QUESTION 3
# def tricky_method(a_string_param, an_array_param)
#   a_string_param += 'rutabaga'
#   an_array_param << 'rutabaga'
# end
#
# my_string = 'pumpkins'
# my_array = ['pumpkins']
# tricky_method(my_string, my_array)
#
# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# QUESTION 2
# a = 42
# b = 42
# c = a
#
# puts a.object_id
# puts b.object_id
# puts c.object_id

# QUESTION 1
# a = 'forty two'
# b = 'forty two'
# c = a
#
# puts a.object_id
# puts b.object_id
# puts c.object_id
