
#!/bin/bash

# Ask the user for a filename and a word to search for
read -p "Enter the filename: " file
read -p "Enter the word to search: " word

# Check if the file exists
if [ -f "$file" ]; then
  # Use grep to search for the word, count occurrences and use wc to count the lines
  count=$(grep -wo "$word" "$file" | wc -l)
  
  # Display the count of the word found
  echo "Word '$word' found $count times in file '$file'."
else
  # If the file doesn't exist, display an error message
  echo "Error: The file '$file' does not exist."
fi
