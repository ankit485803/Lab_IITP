#!/bin/bash

# Command Line Calculator

# Check if three arguments are passed
if [ $# -ne 3 ]; then
    echo "Usage: $0 <number1> <operator> <number2>"
    echo "Example: $0 10 + 5"
    exit 1
fi

# Assign command line arguments to variables
num1=$1
operator=$2
num2=$3

# Perform the calculation based on the operator
case $operator in
    +)
        result=$(echo "$num1 + $num2" | bc)
        ;;
    -)
        result=$(echo "$num1 - $num2" | bc)
        ;;
    \*)
        result=$(echo "$num1 * $num2" | bc)
        ;;
    /)
        result=$(echo "scale=2; $num1 / $num2" | bc)  # Divide with 2 decimal places
        ;;
    *)
        echo "Invalid operator! Please use one of: +, -, *, /"
        exit 1
        ;;
esac

# Print the result
echo "Result: $result"
