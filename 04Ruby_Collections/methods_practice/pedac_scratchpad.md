## PRACTICE PROBLEM 7
Create a hash that expresses the frequency with which each letter occurs in a given string

## Problem
**Rules / Requirements**
- INPUT: string
- OUTPUT: hash
    - each key is a unique letter in the given string
    - each associated value is the number of times that letter appears in the string
- Order of letters in hash is not important (see example)

## Examples
`{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }`

## Data Structures
- string input
- intermediate array (string broken up into individual letters)
  - can easily be iterated over to count occurence of each letter
- hash output

## Algorithm
1. Given a string 'statement'
2. Create an empty hash 'letter_frequency'
3. Iterate over each character in 'statement' and add key-value pairs to 'letter_frequency'
    - current character will be the key
    - count of that character will be the value
    - check whether hash already has a key for current letter to avoid duplicate entries.
4. Return 'letter_frequency'

