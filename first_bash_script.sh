#!/bin/bash
dialog --title "WELCOME" --msgbox "PLEASE SELECT ANYONE FROM THE FOLLOWING OPTIONS\n
a.REGISTER_STUDENT\n
b.CALCULATER\n
c.CREATE NEW USER\n
d.VIEW ALL STUDENT DETAILS\n 
e.GRANT PERMISSIONS TO REGISTRATION\n
f.Exit from menu\n
PLEASE ENTER OK" 30 100


# Running a forever loop using while statement
# This loop will run untill select the exit option.
# User will be asked to select option again and again
while :
do

# reading choice
read choice

# case statement is used to compare one value with the multiple cases.
case $choice in
  # Pattern a
  a) 
# open fd
exec 6>&1

# Store data to $VALUES variable
VALUES=$(dialog --ok-label "Submit" \
	  --title "Registration Form" \
	  --form "Enter the student Details:" \
15 50 0 \
	"Name:"  	1 1	"$name" 	1 15 15 0 \
	"RollNo:"  	2 1	"$rollno" 	2 15 15 0 \
	"Course:"  	3 1	"$course" 	3 15 15 0 \
	"MobileNo:"  	4 1	"$mobileno" 	4 15 15 0 \
	"E-mail:"    	5 1	"$email"  	5 15 15 0 \
	"State :"  	6 1	"$state"  	6 15 15 0 \
	"City:"   	7 1	"$city" 	7 15 15 0 \
2>&1 1>&6)

# close fd
exec 6>&-

# display values just entered
touch registration.sh
echo -e $VALUES >> registration.sh
chmod 111 registration.sh>>!#:2
echo "-----------------------------------------------------------------------"
echo "PERMISSION DENIED TO ACCESS REGISTRSTION FILE"
echo "-----------------------------------------------------------------------"
echo "To grant permission press e"
echo "-----------------------------------------------------------------------"

;;
  # Pattern b
  b)  sum=0
	i="y"
	echo "Enter first number :"
	read n1
	echo "Enter second number :"
	read n2
	while [ $i = "y" ]
	do
	echo "1.Addition"
	echo "2.Subtraction"
	echo "3.Multiplication"
	echo "4.Division"
	echo "Enter your choice"
	read ch
	case $ch in
	1)sum=`expr $n1 + $n2`
	echo "Sum ="$sum;;
	2)sub=`expr $n1 - $n2`
	echo "Sub = "$sub;;
	3)mul=`expr $n1 \* $n2`
	echo "Mul = "$mul;;
	4)div=`echo $n1 / $n2 | bc -l`
	echo "Div = "$div;;
	*)echo "Invalid choice";;
	esac
	echo "Do u want to continue ?"
	read i
	if [ $i != "y" ]
	then
	exit
	fi 
	done ;;

  # Pattern c
  c)  echo "Enter Username: " 
read username
u="$USER"
if [ $u == $username ]
then
echo "user already exists!!"
else
sudo adduser $username
echo " user created!!"
fi ;;

  # Pattern d
  d)
  cat registration.sh ;;
  
  # Pattern e
  e)
  echo "-----------------------------------------------------------------------"
  echo "GRANTING PERMISSION :"
  echo "-----------------------------------------------------------------------"
  chmod 777 registration.sh>>!#:2 ;;
     
  # Pattern f
  f)  echo "Quitting ..."
      exit;;
  # Default Pattern
  *) echo "invalid option";;
  
esac
echo "WHAT DO YOU WANT TO DO";
echo "a. REGISTER-STUDENT"
echo "b. CALCULATOR"
echo "c. CREATE NEW USER"
echo "d. VIEW ALL STUDENT DETAILS "
echo "e. GRANT PERMISSION TO REGISTRATION  "
echo "f. Exit from menu "
echo -n "Enter your menu choice [a-f]: "
done
