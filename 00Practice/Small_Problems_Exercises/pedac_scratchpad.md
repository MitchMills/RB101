# PROBLEM
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

    round 1: every light is turned on
    round 2: lights 2 and 4 are now off; 1, 3, 5 are on
    round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
    round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
    round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].


  # Input: integer
    - input integer represents the number of switches, AND the number of repetitions to perform

  # Output: array
    - output array represents the switches that are left in the 'on' position once all repetitions are performed

  ## Rules
  ### explicit
  - each switch is toggled between on and off each time it is "visited"
  
  ### implicit
  - all switches start in the off position, but then are all switched on after the first iteration
  - once the number of the round exceeds the number of a particular switch, that switch's toggle will not change for the remaining iterations
  - once the number of the round exceeds half the total number of iterations, only the switch at the number of the round will change
    - e.g. with ten iterations, on round 6 only switch 6 changes, on round 7 only switch 7 changes, etc

  ## Questions


# EXAMPLES


# DATA STRUCTURES


# ALGORITHM
- `reps` = the number of switches and number of reps to perform
- set up a hash `switches` to represent the switches and their current state:
  - keys are the numbers 1 up to `reps`
  - values all start at -1 (i.e. off)
- iterate over `switches`
  - on each iteration, start at the key that has the same number as the `rep` number
    - visit every switch that is a multiple of that number
    - flip the sign of every key visited (1 to -1 or vice versa)
- once all iterations are complete, return an array of the keys that equal 1 (on)


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
