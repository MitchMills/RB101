# Example 2
# What does the following code return?
# What does it output? Why? 
# What concept does it demonstrate?

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

p arr.select { |n| n.odd? }

=begin
This code returns a new array containing the values [1, 3, 5, 7, 9]. It does not output anything because there are no methods invoked which result in any output. This demonstrates the concept of the select method and how it works with the return value of the block passed to it as an argument. When the local variable 'arr' calls the select method, the array object 'arr' references is passed into the block. The block takes each element in 'arr' and calls the 'odd?' method on it. If the result is 'true', that element is put into the new array that the select method returns.

=end