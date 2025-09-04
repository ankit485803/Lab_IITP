#!/bin/bash

# Script Name: evenodd_check_5Sep2025.sh
# Purpose: Check whether a number is Even or Odd
# Author: Ankit Kumar
# Date: 5th September 2025 (Thursday Lab)

# Read input from user egex or extra validation, to check 12abc, 7.5, abc, --5, 5- ❌ 
read -p "Enter a number: " number

# Check if input is a number using regex
if [[ "$number" =~ ^-?[0-9]+$ ]]; then
    # Check if number is divisible by 2
    if (( number % 2 == 0 )); then
        echo "Even"
    else
        echo "Odd"
    fi
else
    echo "Invalid input! Please enter a valid integer."
fi







# echo "Enter a number:"
# read number

# # Check even or odd using modulus
# if (( number % 2 == 0 )); then
#     echo "Even"
# else
#     echo "Odd"
# fi