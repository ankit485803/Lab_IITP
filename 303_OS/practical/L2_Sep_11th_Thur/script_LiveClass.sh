#!/usr/bin/env bash

# shell parameters
echo "script name: $0"
echo "arg count:  $#"
echo "all args:   $*"
echo "each arg:   $@"
echo "first arg:  $1"


# arithmetic (bash)
a=7; b=5
echo $((a + b * 2)) 


read -rp "Enter your name: " name  
printf "Hi, %s!\n" "$name"


read -rp "Choose (1/2/3): " choice
case "$choice" in
  1)  echo "It is ONE";;
  2)   echo "It is TWO";;
  3) echo "It is THREE";;
  *)      echo "unknown choice" >&2; exit 1;;
esac



i=3
while ((i > 0)); do
  echo "tick $i"
  ((i--))
done


c=0
until ((c == 3)); do
  echo "Counter=$c"
  ((c++))
done