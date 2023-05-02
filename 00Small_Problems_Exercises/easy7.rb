### 2 LETTERCASE COUNTER
def letter_case_count(string)
  
end

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

### 1 COMBINE TWO LISTS
# def interleave(arr1, arr2)
#   arr1.each_index.with_object([]) do |idx, result|
#     result << arr1[idx] << arr2[idx]
#   end
# end

# def interleave(arr1, arr2)
#   arr1.zip(arr2).flatten
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
