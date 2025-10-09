



:' this is multiple lines comments

Ques explain bhai


From a specific dir, copy all files of given extension to collected/.
 Move files to ~/.trash/ instead of deleting; create folder if absent. use mv command.
 Next assignments
 





'
#!/bin/bash
# collect.sh - Copy all files of given extension into collected/

read -p "Enter the extension (e.g. txt, sh, c, py): " EXT
DIR=$(pwd)    # current working directory

# Make collected/ folder if not exists
mkdir -p "$DIR/collected"

# Copy files of that extension (if they exist)
cp "$DIR"/*."$EXT" "$DIR/collected/" 2>/dev/null

echo "All .$EXT files copied to $DIR/collected/"







read -p "Enter directory path: " dir
read -p "Enter file extension (without dot): " ext

mkdir -p collected
 
# Loop through matching files

for file in "$dir"/*."$ext"
do
    if [ -f "$file" ]; then
        cp "$file" collected/
        echo "Copied: $file"
    fi
done






mkdir -p ~/.trash
 
# Loop through given files
for file in "$@"
do
    if [ -e "$file" ]; then
        mv "$file" ~/.trash/
        echo "Moved $file to trash"
    else
        echo "File not found: $file"
    fi
done