

# Hello, World! print okkk annkit


puts "Hello, World!"



## 1.Comments in Ruby

# This is a single-line comment

=begin
This is a 
multi-line comment
=end




## 2. Variables and Data Type
name = "Alice"      # String
age = 25            # Integer
height = 5.8        # Float
is_student = true   # Boolean
fruits = ["Apple", "Banana", "Cherry"] # Array
person = {name: "Bob", age: 30} # Hash (Dictionary)

puts name
puts age
puts height
puts is_student
puts fruits
puts person[:name]  # Accessing hash value


## 3.Ruby is dynamically typed
x = 10
x = "Hello"  # Allowed! Type can change


## 4. Getting User Input
print "Enter your name: "
name = gets.chomp  # Removes newline
puts "Hello, #{name}!"


## 5. Conditionals (if-else, case)
age = 18

if age >= 18
  puts "You are an adult."
elsif age > 12
  puts "You are a teenager."
else
  puts "You are a child."
end


## 6.Loops in Ruby
#FOR LOOP
for i in 1..5
    puts "Iteration #{i}"
  end

#WHILE 
count = 0
while count < 3
  puts "Count: #{count}"
  count += 1
end

  




##
## Getting User Input
print "Enter your name: "
name = gets.chomp  # Takes user input and removes newline
puts "Hello, #{name}!"

## Variables and Data Types