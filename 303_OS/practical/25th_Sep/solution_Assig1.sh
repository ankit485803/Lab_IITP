

1. String Length (strlen.sh) read -p "Enter a string: " str length=${#str} echo "Length of string: $length"

2. String Comparison (strcompare.sh) read -p "Enter first string: " str1 read -p "Enter second string: " str2 if [ "$str1" = "$str2" ]; then echo "Strings are equal" else echo "Strings are different" fi

3. Concatenate Strings (concat.sh) read -p "Enter first string: " str1 read -p "Enter second string: " str2 concat="$str1$str2" echo "Concatenated string: $concat


4. Count Vowels in a String (countvowels.sh) read -p "Enter a string: " str count=0 for (( i=0; i<${#str}; i++ )); do ch=${str:$i:1} case $ch in [aeiouAEIOU]) ((count++)) ;; esac done

5. Reverse a String (reverse.sh) read -p "Enter a string: " str rev="" for (( i=${#str}-1; i>=0; i-- )); do rev="$rev${str:$i:1}" done echo "Reversed string: $rev


