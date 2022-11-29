Given two words, how many letters do you have to remove from them to make them anagrams?
Example
First word : c od e w ar s (4 letters removed)
["a", "c", "d", "e", "o", "r", "s", "w"] # 8 letters
["a", "a", "c", "e", "h", "k", "k", "n", "r", "r"] #10 letters
Second word : ha c k er r a nk (6 letters removed)

array1 = ["a", "c", "e", "r"]
array2 = ["a", "c", "e", "r"]
in_common = ["a",  ]
not_in_common = ["a", "d", "h", "k", "k", "n", "o", "r", "s", "w"]

Result : 10
Hints
A word is an anagram of another word if they have the same letters (usually in a different order).
Do not worry about case. All inputs will be lowercase.

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10
