def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p string = "hello world"
p string.object_id
puts
p string2 = spin_me(string)
p string2.object_id
puts
p string
p string.object_id
