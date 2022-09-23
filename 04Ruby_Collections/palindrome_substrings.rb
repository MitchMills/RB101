def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)ß
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

string = 'goalies'
substrings = substrings(string)
p substrings
