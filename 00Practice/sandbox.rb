s = 'a, b, c'
s[0].upcase!    # 'a, b, c'
s[-1] << ', d'  # 'a, b, c'
s[0] += 'b'     # 'ab, b, c'
puts s

=begin
On line 5 the `Kernel#puts` method is invoked, with the object referenced by local variable `s` passed in as an argument. In order to determine the output, we have to first determine the value referenced by `s` when `puts` is invoked.

Local variable `s` is initialized on line 1 and a string object with the value `'a, b, c'` is assigned to it.

On line 2 the `String#upcase!` method is invoked on `s[0]`, which references a string object with the value 'a'. The `upcase!` method mutates this object in place and the expression returns 'A'. However, this does not affect the original string object referenced by 's', which still has the value `'a, b, c'`. This is because the expression `s[0]` only accesses a copy of the value at that index in `s`.

On line 3, the `<<` operator is called on `s[-1]`, which references the string object 'c'. This expression also mutates this object in place and returns `'c, d'`. As with the expression on line 2, this use of element referencing does not affect the original string object referenced by `s`, so `s` still has a value of `'a, b, c'`.

Finally, on line 4 the object referenced by `s[0]` is reassigned to the value of `'ab'`. This change does affect the original string object referenced by `s`, and so when `puts` is called on line 5, the output is `'ab, b, c'`. 
=end

# string = 'a, b, c'

