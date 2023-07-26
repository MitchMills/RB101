### Question 8.2
# flintstones = {
#   "Fred" => 0,
#   "Wilma" => 1,
#   "Barney" => 2,
#   "Betty" => 3,
#   "BamBam" => 4,
#   "Pebbles" => 5
# }

# p flintstones.assoc("Barney")

### Question 7.2
# flintstones = ["Fred", "Wilma"]
# flintstones += ["Barney", "Betty"]
# flintstones += ["BamBam", "Pebbles"]

# p flintstones
# p flintstones.flatten

### Question 6.2
# famous_words = "seven years ago..."

# famous_words.prepend("Four score and ")
# p "Four score and " + famous_words
# famous_words.insert(0, "Four score and ")
# famous_words[0] = "Four score and s"
# p famous_words

### Question 5.2
# p (10..100).include?(42)
# p 100.between?(10, 100)
# p (10..100).cover?(100)

### Question 4.2
# numbers = [1, 2, 3, 4, 5]
# p numbers.delete_at(1)
# p numbers

# numbers = [1, 2, 3, 4, 5]
# p numbers.delete(1)
# p numbers

### Question 3.2
# advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.gsub!('important', 'urgent')
# p advice

### Question 2.2

### Question 1.2
# numbers = [1, 2, 2, 3]
# numbers.uniq

# puts numbers


# Question 8
# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# barney = flintstones.assoc("Barney")
# p barney

# Question 7
# flintstones = ["Fred", "Wilma"]
# puts "1"
# p flintstones

# flintstones << ["Barney", "Betty"]
# puts "2"
# p flintstones 

# flintstones << ["BamBam", "Pebbles"]
# puts "3"
# p flintstones

# flintstones2 = flintstones.flatten!
# puts "4"
# p flintstones
# puts "5"
# p flintstones2


# Question 6
# famous_words = "seven years ago..."
# puts famous_words

# famous_words2 = famous_words.prepend("Four score and ")
# puts famous_words
# puts famous_words2

# famous_words3 = famous_words.insert(0, "Four score and ")
# puts famous_words
# puts famous_words3

# Question 5
# puts (10..100).cover?(42)

# Question 4
# numbers = [1, 2, 3, 4, 5]
# p numbers

# numbers2 = numbers.delete_at(1)
# p numbers
# puts numbers2

# numbers3 = numbers.delete(1)
# p numbers
# puts numbers3

# Question 3
# advice = "Few things in life are as important as house training your pet dinosaur."
# advice2 = advice.gsub('important', 'urgent')
# puts advice
# puts advice2

# Question 1
# numbers = [1, 2, 2, 3]
# numbers .uniq
# puts numbers