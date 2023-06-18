def whats_my_value(value)
  value = value.upcase!
  value.concat('!')
end

s = "string"
t = whats_my_value(s)

p s # => "STRING!"
p t # => "STRING!"

=begin
On line 9, the `Kernel#p` method is called and  local variable `s` is passed in as an argument. On line 10, the `Kernel#p` method is again called and local variable `t` is passed in as an argument. Both these method calls will output the value referenced by the local variable to the terminal and return that value, as `Kernel#p` always returns the object passed in as an argument. So to determine what is output and returned by these method calls to `#p`, we need to find what the current values referenced by `s` and `t` are. 

Local variable `s` was initialized and assigned to the string object "string" on line 6. On line 7, `s` was passed in as an argument to the `whats_my_value` method.

The whats_my_value method is defined on lines 1 through 4. On line 1 method variable `value` is assigned to the value of the passed in argument. So at this point `value` references the same thing as `s`, namely a string object with the value "string".

On line 2 `value` is reassigned to the return value of the expression `value.upcase!`. In this expression, the `String#upcase!` method is called on `value`. `String#upcase!` mutates the calling object, so the string object referenced by `value` now has the value `"STRING"`.

On line 3, the `String#concat` method is called on `value` and the string object `!` is passed in as an argument. This method also mutates the calling object, so the string object referenced by `value` now has the value `"STRING!"`.

This is also the last evaluated line in the method definition, so the implicit return value of the method in this case is the string object "STRING!". Because the string object originally referenced by `s` was mutated within the method, `s` still references that same string object, but its value is now "STRING!".
  
On line 7 local variable `t` was initialized and assigned to the return value of the expression `whats_my_value(s)`. `t` thus also references the same string object as `s`.

So the two calls to `Kernel#p` on lines 9 and 10 will both output "STRING!" to the terminal and will both return "STRING!".

This code demonstrates the concept of "pass by reference" with respect to mutating methods. In this case, Ruby behaves as if it is passing a reference or pointer to the string object into the `whats_my_value` method, since the methods within mutate that object directly. If non-mutating methods had been used instead, then the behavior would have resembled "pass by value", and `s` and `t` would have ended up pointing to different objects.
=end

###### NIKHIL FERNANDES, JUNE 12

### PROBLEM 2
# def count_sheep
#   5.times do |sheep|
#     puts sheep
#     if sheep >= 2
#       return
#     end
#   end
#   "sheep"
# end

# p count_sheep
=begin
On line 11, the `Kernel#p` method is invoked and the method `count_sheep` is passed in as an argument. `Kernel#p` will output the return value of `count_sheep` to the terminal and return that same value. To figure out that return value, we have to evaluate the `count_sheep` method, which is defined on lines 1 through 9.

Within the `count_sheep` method, on line 2 the `Integer#times` method is called on the integer `5` and a block is passed to it. The method will attempt to execute the block five times, and the integers 0 through 4 will be passed in to the block on each successive iteration.

Each passed-in integer will be assigned to the block variable `sheep` for the duration of the block's current iteration.

Within the block, on line 3 the `Kernel#puts` method is called and the value assigned to block variable `sheep` is passed in as an argument. This will output the current value of `sheep` to the terminal and return `nil`.

On line 4, a conditional statement will evaluate whether the current value of `sheep` is greater than or equal to 2. If not, the method will proceed to the next iteration of the block. If so, the `return` keyword on line 5 will exit the method.

So when `count_sheep` is called on line 11, the block will be executed three times, and the internal `Kernel#puts` call will output the integers `0`, `1`, and `2` to the terminal on separate lines.

Because the current value of `sheep` will then be equal to 2, the conditional on line 4 will evaluate to `true`, and the `return` keyword on line 5 will exit the method. Line 8 of the method will never be executed.

Because the 'return' keyword on line 5 is the last expression evaluated by the method, and it does not include an explicit return value, the method will implicitly return a value of `nil`.

This return value is passed as an argument to the `Kernel#p` method invoked on line 11, which will output `nil` to the terminal and return `nil`.

=end


###### PROBLEM 1
# arr = ["b", "a"]
# arr = arr.product([Array(1..3)])
# arr.first.delete(arr.first.last)

=begin
On line 1, local variable arr is initialized and assigned to an array object containing two string objects.

On line 2, arr is reassigned to the return value of the Array#product method called on arr with [Array(1..3)] passed in as an argument. The argument [Array(1..3)] evaluates to the nested array object [[1, 2, 3]].

The return value of Array#product called on arr with this argument is [["b", [1, 2, 3]], ["a", [1, 2, 3]]], and this is the value that arr now references

On line 3, first the Array#first method is called on arr, which returns the first element of arr, namely the subarray ["b", [1, 2, 3]]. Then the Array#delete method is called on that return value, with arr.first.last passed in as an argument.

The argument arr.first.last evaluates to [1, 2, 3] (the last element of the subarray that is the first element of arr). So the call to Array#delete deletes that element from ["b", [1, 2, 3]], and returns the deleted element: [1, 2, 3]

The Array#delete method mutates the calling object, so  arr now references the value [["b"], ["a", [1, 2, 3]]]

Nothing is printed to the terminal.
=end