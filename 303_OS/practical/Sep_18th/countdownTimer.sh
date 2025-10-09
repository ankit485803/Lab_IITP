

:'

Countdown Timer (while loop)
 
Write a script countdown.sh that:
Reads a number N from the user.
Uses a while loop to print numbers from N down to 1.

After finishing, 
prints "Times up!"




Ankit bhai Hint: The -p option allows you to display a prompt message ("Enter a number: ").
-gt: This is a comparison operator that means "greater than". Its used to compare the value of N with another numb



'



# solution

read -p "Enter a number: " N

while [ $N -gt 0 ]
do 
	echo $N
	N=$((N - 1))
done

echo "Time's Up! Bhai"







:'
Rule: apko space nahi dena hai otherwise give error

Assignments: No spaces → x=10
Commands (like [ ], echo, ls): Arguments must be separated by spaces

'