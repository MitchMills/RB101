# PROBLEM
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

  Input: integer
  Output: string

  ## Rules
  ### explicit
  - integer input represents minutes before or after midnight
    - negative means before, positive means after
  - output should be in 24 hour format (hh:mm)
    - midnight = "00:00", 8am = "08:00", 1pm = "13:00" etc
  - input can be any integer
  ### implicit
  - if value of integer is greater than 1440 (60 min * 24 hrs = 1440), loop into following or preceding day(s)


  ## Questions


# EXAMPLES
time_of_day(0) == "00:00" # hours = 0, minutes = 0
time_of_day(-3) == "23:57" # hours = 23, minutes = 57
time_of_day(35) == "00:35" # hours = 0, minutes = 35
time_of_day(-1437) == "00:03" # hours = 0, minutes = 3
time_of_day(3000) == "02:00" # hours = 2, minutes = 0
time_of_day(800) == "13:20" # hours = 13, minutes = 20
time_of_day(-4231) == "01:29" # hours = 1, minutes = 29

# DATA STRUCTURES


# ALGORITHM
- get the modulus of the input integer divided by 1440
  - assign modulus to variable `total_minutes`
- get the quotient and modulus of `total_minutes` divided by 60
  - assign the quotient to variable `hours`
  - assign modulus to variable `minutes`
- set `hrs` equal to `hours.to_s`, prepend `0` if `hours < 10`
- set `mins` equal to `minutes.to_s`, prepend `0` if `minutes < 10`
- set `time` equal to `hrs:mins`





# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #

# PROBLEM


  Input: 
  Output:

  ## Rules
  ### explicit
  
  ### implicit


  ## Questions


# EXAMPLES


# DATA STRUCTURES


# ALGORITHM
