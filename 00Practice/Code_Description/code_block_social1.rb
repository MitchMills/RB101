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
The method `count_sheep` is defined on lines 1 through 9 and passed in as an argument to the `Kernel#p` method on line 11.

Within the `count_sheep` method

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