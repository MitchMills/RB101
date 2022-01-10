=begin
*****
1) A method that returns the sum of two integers

START
PRINT prompt to user for first number
GET first number from user
SET number1 = user input

PRINT prompt to user for second number
GET second number from user
SET number2 = user input

SET result = number1 + number2

PRINT result
END

*****
2) A method that takes an array of strings, and returns a string that is all those strings concatenated together
 
START
Given an array of strings called string_array

SET all_strings = ""

Iterate through string_array
Append each individual string to all_strings

RETURN all_strings
END

*****
3) A method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element.

START
Given an array of integers called integer_array

Iterate through integer_array, select integers whose index number is even and put them in new array every_other

RETURN every_other
END

*****
4) a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

START
Given a string called string
Given a character called given_character

Split string into an array of individual characters called all_characters

SET occurence = 0
Iterate through all_characters
IF individual character == given_character
  occurence = occurence + 1
  IF occurence == 3
    RETURN index
  ELSE
    RETURN nil

END

*****
5) a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes. You may assume that both array arguments have the same number of elements.

START
Given two arrays, array1 and array 2

SET iterator = 0
SET new_array = []

WHILE iterator < length or array1
  IF iterator is even
    - remove the first element of array1 and add it to new_array
    - iterator = iterator + 1
  ELSE
    - remove the first element of array2 and add it to new_array
    - iterator = iterator + 1

RETURN new_array
