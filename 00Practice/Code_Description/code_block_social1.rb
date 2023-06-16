def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
  "sheep"
end

p count_sheep

###### NIKHIL FERNANDES, JUNE 12

### PROBLEM 2

=begin
On line 11, the `Kernel#p` method is invoked and the method `count_sheep` is passed in as an argument. This method is defined on lines 1 through 11. `Kernel#p` will output the return value of `count_sheep` to the terminal and return that same value.

Within the `count_sheep` method, on line 2 the `Integer#times` method is called on the integer `5` and a block is passed to it. The method will attempt to execute the block five times, and the integers from 0 through 4 will be passed in to the block on each successive iteration.

Each passed-in integer will be assigned to the block variable `sheep` for the duration of the block's current iteration.

Within the block, on line 3 the `Kernel#puts` method is called and the value assigned to block variable `sheep` is passed in as an argument. This will output the current value of `sheep` to the terminal and return `nil`.

On line 4, a conditional statement will evaluate whether the current value of `sheep` is greater than or equal to 2. If not, the method will proceed to the next iteration of the block. If so, the `return` keyword on line 5 will exit the method.

Line 8 has an implicit return value for the method, a string containing the value "sheep".

When `count_sheep` is called on line 11, the block will be executed three times, and the internal `Kernel#puts` call will output the integers `0`, `1`, and `2` to the terminal on separate lines.

The conditional on line 4 will then evaluate to `true`, and the `return` keyword on line 5 will exit the method. Because the 'return' keyword on line 5 is the last expression evaluated by the method, and it does not include an explicit return value, the method will retun a value of `nil`.

This value is passed as an argument to the `Kernel#p` method invoked on line 11, which will output `nil` to the terminal and return `nil`.



=end


### PROBLEM 1
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