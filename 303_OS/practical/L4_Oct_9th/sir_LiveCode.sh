


%%%%%%%%%%%% String Handling %%%%%%%%%%%

# String operations in Bash

text="Hello, Programming!"
name="alice"

echo "Original: $text"
echo "Length: ${#text}"

# Uppercase
echo "Uppercase: ${text^^}"

# Lowercase
echo "Lowercase: ${text,,}"

# Capitalize first letter
echo "Capitalized name: ${name^}"

# Substring
echo "Substring: ${text:0:5}"

# Contains check
if [[ $text == *"Hello"* ]]; then
    echo "Contains 'Hello': true"
else
    echo "Contains 'Hello': false"
fi