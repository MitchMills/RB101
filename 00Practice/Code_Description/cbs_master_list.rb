### JULY 31 ### 3
# output = [1, 2, 3].each do |num|
#   puts num
# end

# p output

=begin
What is output from line 2?
What is returned?
Describe the structure between do..end on lines 1 to 3 and how it relates to the Array#each method the precedes it.
What is output from line 5 and why?

Line 2 will output the current value of `num`. `Array#each` is called on the array `[1, 2, 3]` on line 1, and a block is passed in as an argument. The block will be executed once for each element in `[1, 2, 3]`.

On each iteration, a successive element of the array is passed into the block and assigned to the variable `num`. The value referenced by `num` is then passed in as an argument to the invocation of `Kernel#puts` on line 2. So line 2 will output `1`, then `2`, then `3`, each on separate lines. Line 2 will return `nil` on each iteration, as `#puts` always returns `nil`.

Line 5 will output `[1, 2, 3]`. Local variable `output` is initialized on line 1 and the return value of the call to `Array#each` is assigned to it. The `each` method always returns the caller, in this case the array `[1, 2, 3]`. 

So when the `Kernel#p` method is invoked on line 5, it will output the value referenced by `output`:`[1, 2, 3]`
=end

### JULY 31 ### 2
# def short_long_short(string1, string2)
#   if string1.length > string2.length
#     string2 + string1 + string2
#   else
#     string1 + string2 + string1
#   end
# end

# longer_string = short_long_short('abc', 'defgh')
# p longer_string

=begin
What is the value assigned to the variable longer_string on line 9 and why?
Describe an underlying concept demonstrated in this code in one paragraph.

The value assigned to the variable `longer_string` will be the string `"abcdefghabc"`. `longer_string` is initialized on line 9 and the return value of an invocation of the method `short_long_short` is assigned to it. 

Two string objects, `abc` and `defgh`, are passed in to `short_long_short` as arguments. The method, defined on lines 1 through 7, takes the two passed-in strings and assigns them to the variables `string1` and `string2` respectively.

On line 2 the number of characters of each string is compared using the `String#length` method. Since the value referenced by `string1` has 3 characters, and that by `string2` has 5, the conditional on line 2 will evaluate to `false`.

So the `else` branch of the conditional will be executed. That branch concatenates the value of `string1` to that of `string2` and then to that of `string1` again. The result is the string `abcdefghabc`, which is implicitly returned by the method since it is the last evaluated expression. This return value is what is assigned to `longer_string` when it is initialized on line 9.

One concept demonstrated in this code is that variables can be assigned to the value of an expression, and so that expression must first be evaluated to determine what value the variable now references. In this case the expression was a method invocation, and only by determining the return value of that method invocation can we know the value assigned to the variable.
=end

### JULY 31 ### 1
# def say_hello
#   puts 'Hello, World'
# end

# 5.times { say_hello }

=begin
What is output when this code is executed and why?
What is the return value from say_hello and why?
What is the return value from line 5 and why? 

This code will output the string `"Hello, World` five times on separate lines. When the `Integer#times` method is called on line 5, it will execute the block passed in as an argument a number of times based on the calling integer. Within the block, the `say_hello` method is invoked, and that method, defined on lines 1 through 3, will output the string `"Hello, World"` using the `Kernel#puts` method. So the block passed in to `Integer#times` will be executed 5 times, and on each execution it will invoke `say_hello`, which will output `"Hello, World"`.

The return value of `say_hello` is `nil`. The method implicitly returns the last evaluated expression, which is the invocation of `Kernel#puts` on line 2. `#puts` always returns `nil`.

The return value from line 5 will the the integer `5`. The `Integer#times` method always returns the calling integer.
=end

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
