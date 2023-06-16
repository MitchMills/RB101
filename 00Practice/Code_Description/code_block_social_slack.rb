n = 101.times do |n|
  n = 11
end

puts n

###### IAN LEWIS, JUNE 16
=begin
On line 1, the local variable `n` is assigned to the value returned by invoking the `Integer#times` method on the integer `101` and passing in a block. 

The block itself iterates 101 times, and on each iteration a number from 0 up to 100 is passed in to the block in turn. The block variable `n` is assigned that value on line 1, so on the first iteration it will be assigned to `0`, on the next it will be assigned to `1`, etc. Within the block, block variable `n` is then reassigned to the value `11` on line 2.

This process repeats 101 times, and then `Integer#times` returns the calling object. So despite all that happens within the block, local variable `n` ends up assigned to `101`.

It's important to note that block variable `n` is scoped to the block and does not affect local variable `n` in the outer scope.

On line 5, the `Kernel#puts` method is called and local variable `n` is passed in as an argument. This outputs the current value of 'n', which is `101`, to the terminal, and returns `nil`.
=end
