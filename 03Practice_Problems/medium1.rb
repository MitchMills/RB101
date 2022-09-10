system('clear')

# QUESTION 9
def foo(param = 'no')
  'yes'
end

def bar(param = 'no')
  param == 'no' ? 'yes' : 'no'
end

p bar(foo)

# QUESTION 8
# def rps(fist1, fist2)
#   if fist1 == 'rock'
#     (fist2 == 'paper') ? 'paper' : 'rock'
#   elsif fist1 == 'paper'
#     (fist2 == 'scissors') ? 'scissors' : 'paper'
#   else
#     (fist2 == 'rock') ? 'rock' : 'scissors'
#   end
# end
#
# puts rps(rps(rps('rock', 'paper'), rps('rock', 'scissors')), 'rock')

# QUESTION 7
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female" }
# }
#
# def mess_with_demographics(demo_hash)
#   demo_hash.values.each do |family_member|
#     family_member["age"] += 42
#     family_member["gender"] = "other"
#   end
# end
#
# p munsters
# mess_with_demographics(munsters)
# p munsters

# QUESTION 6
# answer = 42
#
# def mess_with_it(some_number)
#   some_number += 8
# end
#
# new_answer = mess_with_it(answer)
# p new_answer
# p answer
# p answer - 8

# QUESTION 5
# def fib(first_num, second_num, limit)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end
#
# result = fib(0, 1, 15)
# puts "result is #{result}."

# QUESTION 4
# def rolling_buffer1(buffer, max_buffer_size, new_element)
#   buffer << new_element
#   buffer.shift if buffer.size > max_buffer_size
#   buffer
# end
#
# def rolling_buffer2(input_array, max_buffer_size, new_element)
#   buffer = input_array + [new_element]
#   buffer.shift if buffer.size > max_buffer_size
#   buffer
# end
#
# buffer1 = ["a"]
# buffer2 = ["x"]
# p buffer1
# p buffer2
#
# rolling_buffer1(buffer1, 3, "b")
# buffer3 = rolling_buffer2(buffer2, 3, "y")
# p buffer1
# p buffer2
# p buffer3

# QUESTION 3
# def factors(number)
#   divisor = number
#   factors = []
#   while divisor > 0 do
#     factors << (number / divisor) if ((number % divisor) == 0)
#     divisor -= 1
#   end
#   factors
# end
#
# puts "12: #{factors(12)}"
# puts "0: #{factors(0)}"
# puts "-2: #{factors(-2)}"

# QUESTION 2
# puts "the value of 40 + 2 is " + (40 + 2).to_s
# puts "the value of 40 + 2 is " + "#{(40 + 2)}"

# QUESTION 1
# 10.times { |i| puts  (" " * i) + "The Flintstones Rock!" }
