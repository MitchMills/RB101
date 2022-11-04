# PROBLEM
- Write a method that returns one UUID when called with no parameters.

*INPUT*
- Nothing, no parameters
*OUTPUT*
- String

*Rules*
- Each UUID consists of 32 hexadecimal characters
- The characters will be broken into 5 sections
    - Pattern: 8-4-4-4-12
- The UUID will be represented by a string
  - The string will include dashes between each section

*Assumption(s)*
- Will generate each character randomly one at a time and add it to the string instead of generating an 8 character number, then a 4 character number, etc

# EXAMPLES
"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"