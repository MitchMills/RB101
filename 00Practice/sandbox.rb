# s = 'a, b, c'
# s[0].upcase!    # 'a, b, c'
# s[-1] << ', d'  # 'a, b, c'
# s[0] += 'b'     # 'ab, b, c'
# puts s

=begin
On line 5 the `Kernel#puts` method is invoked, with the object referenced by local variable `s` passed in as an argument. In order to determine the output, we have to first determine the value of `s` when `puts` is invoked.

Local variable `s` is initialized on line 1 and a string object with the value `'a, b, c'` is assigned to it.

On line 2 the `String#slice` method is called on `s`, with `0` passed in as the argument. `s[0]` returns a new string with a value of `'a'`. Then the `upcase!` method is called, which mutates this new string in place and returns 'A'. Because `s[0]` returned a new string, the value of `s` is not changed.

On line 3, the `String#slice` method is again called on `s`, with `-1` passed in. `s[-1]` returns a new string with a value of `'c'`. Then the `<<` method is called, with `', d'` passed in as an argument. This mutates the new string in place and returns `'c, d'`. As with the expression on line 2, since element referencing returns a new string, the subsequent mutation does not affect the original string object, so `s` still has a value of `'a, b, c'`.

Finally, on line 4, the `String#slice` method is again called on `s`, but in this case the return value is reassigned to the value of `'ab'`.
=end


letters = 'abc'

letters[0].object_id
letters[0].object_id

letters[0].upcase!
p letters

letters[0] = 'd'
p letters

