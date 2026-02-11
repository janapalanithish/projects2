#adding all the digits in the number 1234
sum_digit = 0
import math
number = 1234
for i in range(4):
    digit = number % 10
    sum_digit = digit + sum_digit
    number = number // 10
    print(sum_digit)
#write a program to check wheater the given charecter is vowel or not
check = str(input("Enter the char"))
if (check == 'a'):
    print("This an vovel")
elif (check == 'o'):
    print("This is an vowel")
elif (check == 'i'):
    print("This is an vowel")
elif(check == 'e'):
    print("This is an vowel")
elif(check == 'u'):
    print("This is an vowel")
else:
    print("this is not a vowel")
#finding the ASCII value of the character


input1 = str(input("Enter the char"))
print("The ascii value is" , ord(input1))
#to print the triangle stars
for i in range(6):
    print(i*'*')
#to print the square of the stars
numbers2 = 5
for i in range(5,7):
    for j in range(5,7):
        print('*'*numbers2)
    print('*'*numbers2)
#inverted rectangle
for i in range(7,0,-1):
    print(i*'*')
    # to print the sqaure start pattern removing the middle satrs

# to print the total pattern 
for i in range(5):
    for j in range(5):
        print("#",end="")
    print()
#write a program to find the largest number of the give numbers 
x = int(input("ENTER THE NUMBER:"))
y = int(input("ENTER THE NUMBER:"))
z = int(input("ENTER THE NUMBER:"))

if (x>z and x>y):
    print("x is grater number than y and z ")
elif(y>z and y>x):
    print("y is grater than x and y")
else:
    print("Z is grater than x and y")


x = int(input("ENTER THE NUMBER:"))
y = int(input("ENTER THE NUMBER:"))
z = int(input("ENTER THE NUMBER:"))

if (x>z and x>y):
    print("x is grater number than y and z ")
elif(y>z and y>x):
    print("y is grater than x and y")
elif(z>x and z>y):
    print("Z is grater than x and y")
else:
    print("all the values are equal")
#check whether the given year is leap year or not
year = int(input("ENTER THE YEAR:"))
if (year%4 == 0 and year %400 == 0 and y%100 != 0):
    print("this is a leap year")
else:
    print("this is not a leap year")

#sum of n numbers
def sumall(n):
    sum = 0 
    for i in range(n):
        sum = sum + i
    return sum
n = int(input("ENTER THE NUMBER:"))
print(sumall(n))
