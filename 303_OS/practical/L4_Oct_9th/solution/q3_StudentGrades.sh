
#!/bin/bash

# Initialize arrays for student names and marks
names=("Alice" "Bob" "Charlie")
marks=(78 85 92)

# Function to print the results and find the highest mark
print_results() {
  highest_mark=${marks[0]}
  highest_name=${names[0]}

  # Loop through the arrays and print each student's name and mark
  for i in "${!names[@]}"; do
    echo "${names[i]}: ${marks[i]} marks"
    
    # Find the highest mark
    if [ ${marks[i]} -gt $highest_mark ]; then
      highest_mark=${marks[i]}
      highest_name=${names[i]}
    fi
  done

  # Print the highest mark
  echo "The highest mark is $highest_mark, achieved by $highest_name."
}

# Call the function to print results
print_results
