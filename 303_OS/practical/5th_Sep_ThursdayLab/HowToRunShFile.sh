#!/bin/bash

# Step 1: Print user name
name="Ankit Kumar"
echo "Welcome, $name"

# Step 2: Show current working directory
echo "Current directory is: $(pwd)"

# Step 3: List all files and folders
echo "Files and folders in current directory:"
ls

# Step 4: Create a new folder called 'DemoFolder'
mkdir -p DemoFolder
echo "Created folder: DemoFolder"

# Step 5: Create a text file inside DemoFolder
touch DemoFolder/info.txt
echo "Created file: DemoFolder/info.txt"

# Step 6: Write some text into the file
echo "This is a sample file created by Ankit bhai's script." > DemoFolder/info.txt

# Step 7: Show content of the file
echo "Content of info.txt:"
cat DemoFolder/info.txt

# Step 8: Show current date and time
echo "Current Date and Time:"
date

# Step 9: Show disk usage
echo "Disk usage of current folder:"
du -sh .
