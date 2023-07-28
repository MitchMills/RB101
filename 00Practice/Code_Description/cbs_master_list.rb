

### JULY 28 ### 3
# s = "string"
# arr = [s, 1, 2]
# arr[0] = 'S'
# puts s

=begin
Line 4 will now output `string`. Line 2 assigns the first element of the array object assigned to `arr` to reference the same object as local variable `s`. Line 3 now reassigns that first element to reference a different object (the String object 'S'). So `s` still points to the original object assigned to it, and the first element of `arr` points to a different object.
=end

# ### JULY 28 ### 2
# a = 10

# while false do
#   c = a
#   break
# end

# puts c

=begin
With this change, there won't be anything output on line 8. Variable `c` is set to `nil`, and `puts` doesn't output anything when it is passed `nil` as an argument. `c` is set to `nil` because the `while` loop on lines 3 to 6 never executes due to the conditional on line 3 never being fulfilled. Despite never being executed, the assignment syntax on line 4 does result in variable `c` being defined. `c` does not get initialized, however, so the value referenced by `a` is not assigned to it, and instead it is set to `nil`.
=end

### JULY 28 ### 1
# a = 4
# b = 2

# loop do |a|
#   c = 3
#   a = c
#   break
# end

# puts a
# puts b

=begin
The output on line 10 will be `4`. The addition of a block parameter with the same name prevents local variable `a` in the outer scope from being accessible within the block due to variable shadowing. Though they share the same name, the variable initialized on line 4 and reassigned on line 6 is a different variable from the one initialized on line 1. It is only accessible within the block, and prevents access to the variable named `a` in the outer scope. As a result line 6 has no effect on the outer scope variable.
=end

### JULY 25 ###
### Question 3
# s = "string"
# arr = [s, 1, 2]
# arr[0][0] = 'S'
# puts s

=begin
What is the output on line 4?
Why?
What is the underlying concept?

The output of line 4 will be "String". Local variable `s` was initialized and assigned a value of "string" on line 1. On line 2, an 'Array' object was assigned to local variable `arr`. The first element of that array was assigned to reference the same value as `s`. 

On line 3, the first character of the first element of the array was reassigned to  the value `S` using indexed assignment (the `String#[]=` method). Indexed assignment is mutating with respect to the calling String itself, so `s` now references a value of "String", and this is what is output when `puts` is invoked on line 4 with `s` passed in as an argument.

This example demonstrates the concept that indexed assignment mutates the calling object even though it involves reassignment of characters or elements within that object.

=end

### Question 2 ###
# a = 10

# while true do
#   c = a
#   break
# end

# puts c

=begin
What does this code output on line 8? Why?
Explain the structure defined on lines 3-6.
How does this structure affect the final output?
What is the underlying concept?

The code on line 8 will output 10. `c` was initialized on line 4, and the value referenced by local variable `a` was assigned to it. `a` was assigned a value of 10 when it was initialized on line 1. So `c` has a value of 10 when it is passed as an argument to the invocation of `puts` on line 8.

The structure defined on lines 3 through 6 is a `while loop`. A `while loop` is a control expression in Ruby, not a method. The use of `while` on line 3 is therefore not a method invocation, and so the code between `do` and `end` that follows is not a block. Because of this, no new scope is created. That allows local variable `c`, initialized within the `while loop`, to be accessed outside it.

This example demonstrates the concept that block scope can only be created following the invocation of a method. Because `while` (and `until` and `for`) loops are not methods, they do not introduce new scope.

=end

### Question 1
# a = 4
# b = 2

# loop do
#   c = 3
#   a = c
#   break
# end

# puts a
# puts b

=begin
Explain why line 10 outputs 3 instead of 4.
What structure is defined on lines 4 – 8?
How does this structure affect a‘s final value?
What is the underlying concept here?

Local variable `a` was originally assigned a value of 4 on line 1 when it was initialized. It was reassigned to reference the same value as `c` on line 6, and `c` has a value of 3. So when `puts` is invoked on line 10, and `a` is passed in as an argument, the output is the current value of `a`: 3.

The structure defined on lines 4 through 8 is an invocation of the `Kernel#loop` method, with a block passed in as an argument. Local variables initialized outside a block are accessible within it, which is why `a` can be reassigned on line 6.

This demonstrates the concept of block scope (and of variables as pointers). Local variable `a`, initialized outside the block, is accessible within the block. Local variable `c`, initialized inside the block, is not accessible outside it. However, the value that `c` references can be assigned to `a`, and `a` will continue to reference that value outside the block.

=end

##### CODE BLOCK SOCIAL
# JUNE 19 #
### 1
# int = 7
# array = [2, 4, 6]
 
# array.each do |element|
#   int = element
# end
 
# puts int

# ### 2
# int = 6
# array = [3, 2, 1]
 
# array.each do |int|
#   int += 1
# end
 
# puts int

# ### 3
# int = 4
# array = [2, 5, 9]
 
# def my_value(ary)
#   ary.each do |element|
#     int += element
#   end
# end
 
# my_value(array)
# puts int

# June 12 #
### 1
# arr = ["b", "a"]
# arr = arr.product([Array(1..3)])
# arr.first.delete(arr.first.last)

### 2
# def count_sheep
#   5.times do |sheep|
#     puts sheep
#     if sheep >= 2
#       return
#     end
#   end
#  "sheep"
# end

# p count_sheep

### 3
# def whats_my_value(value)
#   value = value.upcase!
#   value.concat('!')
# end

# s = "string"
# t = whats_my_value(s)

# p s
# p t

#############
# June 4 #
### 1
# a = 4

# loop do
#   a = 5 
#   b = 3

#   break
# end

# puts a
# puts b

### 2
# animal = "dog"

# loop do |_|
#   animal = "cat" 
#   var = "ball"
#   break
# end

# puts animal
# puts var

### 2
# array = [1, 2, 3, 4, 5]
# array.select do |num|
# 	puts num if num.odd?
# end

########## SAMPLE
# a = "hi there"
# b = a
# a = "not here"
# puts b
