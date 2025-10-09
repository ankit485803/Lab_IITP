#!/bin/bash

# Initialize the array of numbers
numbers=(5 10 15 20 25)

# Initialize the sum variable
sum=0

# Get the length of the array
array_length=${#numbers[@]}

# Use a for loop to iterate through the array
for num in "${numbers[@]}"
do
  sum=$((sum + num))  # Add each number to sum
done

# Calculate the average
average=$(echo "scale=2; $sum / $array_length" | bc)

# Print the sum and average
echo "Sum of numbers: $sum"
echo "Average of numbers: $average"
