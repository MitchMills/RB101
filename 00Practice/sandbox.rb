##### CODE SNIPPET 2 #####
# total_tacos = 5
# tacos_eaten = 5

# if total_tacos - tacos_eaten
#   puts "Keep eating tacos!"
# else
#   puts "There are no more tacos."
# end


##### CODE SNIPPET 111 #####
s = 'a, b, c'
s[0].upcase!    # 'a, b, c'
s[-1] << ', d'  # 'a, b, c'
p s[0] += 'b'     # 'ab, b, c'
puts s

=begin
On line 5 the `Kernel#puts` method is invoked, with the object referenced by local variable `s` passed in as an argument. `puts` always returns `nil`, but in order to determine the output, we have to first determine the value of `s` when `puts` is invoked.

Local variable `s` is initialized on line 1 and a string object with the value `'a, b, c'` is assigned to it.

On line 2 the `String#[]` method is called on `s`, with `0` passed in as the argument. `s[0]` returns a new string with a value of `'a'`. Then the `upcase!` method is called, which mutates this new string and returns 'A'. Because `s[0]` returned a new string, the value of `s` is not changed by the subsequent call to `upcase!`.

On line 3, the `String#[]` method is again called on `s`, with `-1` passed in. `s[-1]` returns a new string with a value of `'c'`. Then the `<<` method is called, with `', d'` passed in as an argument. This mutates the new string and returns `'c, d'`. As with line 2, because `String#[]` returns a new string, the subsequent mutation does not affect the original string object, so `s` still holds a value of `'a, b, c'`.

Finally, on line 4, the `String#[]=` method is called on `s` with `0` passed in as the argument. This method reassigns the character at index 0. It is reassigned to the return value of the expression `s[0] + b`.

`s[0] + b` invokes the `String.+` method and concatenates `'b'` to 'a'` (the value at `s[0]`). The return value is the string `'ab'`. So the character referenced by `s[0]` is reassigned to the value `'ab'`.

While the character at index 0 of `s` is reassigned, `s` itself is not. The object that `s` references is mutated. So when `puts` is invoked on line 5, it outputs `'ab, b, c'`.

This code demonstrates the difference between indexed reference and indexed assignment for Strings. For Strings, indexed reference acts like pass by value, i.e. it returns a copy of the referenced elements of the string. In contrast, indexed assignment acts like pass by reference. While indexed assignment for strings involves reassignment of characters within the string, it is mutating with respect to the string object itself.
=end
