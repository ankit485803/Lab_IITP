




:'


Ques. this is sovle Ankit can create the password.sh file
 
Password Prompt (until loop)
 
Write a script password.sh that:
Keeps asking the user for a password until the correct one (1234) is entered.
Prints "Access Granted" when correct.
 
Next do these assignments





Ankit Learn from this prob two thing SP: 
-s: The -s option tells read to SUPPRESS the input (i.e., don’t show the password as the user types it).
-p: The -p option allows you to show a prompt ("Enter password: ").


'





#this password checker code bhai Ankit

PASSWORD="1234"
user_input=""

# until loop keeps running until condition is true
until [ "$user_input" = "$PASSWORD" ]
do 
	read -sp "Enter password: " user_input
	echo
done

echo "Access Granted"

