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

#factorial using loops 
n = int(input('enter the number: '))
fact = 1
for i in range(n):
    fact = fact * (i+1)
print(fact)


#factorial using recursion
def fact(n):
    fact = 1
    for i in range(n):
        fact = fact * (i+1)
    return fact
n = int(input('enter the number:'))
print(fact(5))


#checking the factors of two numbers and finding the hcf of the two numbers
n1 = int(input('enter the number1:'))
n2 = int(input('enter the number2:'))
for i in range(1,6):
    if (n1%i == 0 and n2%i == 0):
         print(f"{i} is the hcf of the n1 and n2")
    else:
        print(f"{i} is not the hcf of the n1 and n2")
#fibonacchi using simple calc
    a = 0
    b = 1
    for i in range(10):
        c = a + b
    a = b
    b = c
    print(c)
#printing lcm of the number
import math
n1 = int(input("ENTER THE NUMBER:"))
n2 = int(input("ENTER THE NUMBER:"))

for i in range(n1 , n1*n2):
    if (n1%i == 0 and n2%i == 0):
        print("the lcm of numnber is " , max(n1,n2))
else:
         print("the lcm is " , math.lcm(n1,n2))

# finding power of a number
exp = int(input("ENTER THE EXPONENT:"))
base = 2
print("the power of the number is " , base**exp)
# finding power of number by taking function
def pow(base,power):
      return base**power
print(pow(2,3))
# converting the number into the number digit 
numinp = input("ENTER THE NUMBER:")
my_dict = { '1': "one" , '2': "two" , '3': "three" , '4': "four" , '5': "five" , '6': "six" , '7': "seven" , '8': "eight" , '9': "nine" , '10':"ten"}

for i in range(len(numinp)):
    print(my_dict[numinp[i]])

# checking a number is palindrome or not 
num = int(input("ENTER THE NUMBER:"))

for i in range(2):
    n = num % 10
    m = num // 10
    y = m // 10
    x = m % 10
pali = ((x**3) + (n**3) + (y**3))
print(pali)
if(pali == num):
    print("this is a palindrome")
else:
    print("this is not a palindrome")


# writing factors of number 

for i in range(1,29):
    if (28%i == 0):
        print("the factors of 28" , i)

# reversing a number and convert it into letter 
#eg : input = 123 , output = three two one 

number = 321
rev = 0

while number > 0:
    digit = number % 10
    rev = rev * 10 + digit
    number = number // 10
while rev > 0:
    digit = rev % 10
    
    match digit:
        case 0:
            print("Zero", end=" ")
        case 1:
            print("One", end=" ")
        case 2:
            print("Two", end=" ")
        case 3:
            print("Three", end=" ")
        case 4:
            print("Four", end=" ")
        case 5:
            print("Five", end=" ")
        case 6:
            print("Six", end=" ")
        case 7:
            print("Seven", end=" ")
        case 8:
            print("Eight", end=" ")
        case 9:
            print("Nine", end=" ")

    rev = rev // 10


# priting factorial of a number by taking input of range
n = int(input("Enter the number:"))
fact = 1
for i in range(1,n):
    fact = fact *i
    print(fact)
# checking wheater a number is prime or not
import math

def is_prime(n):
    # 1. Handle the small cases
    if n <= 1:
        return False
    if n == 2:
        return True
    
    # 2. Filter out even numbers quickly
    if n % 2 == 0:
        return False
    
    # 3. Check odd numbers from 3 up to the square root of n
    # We use int(math.sqrt(n)) + 1 to ensure the loop includes the root
    limit = int(math.sqrt(n)) + 1
    
    for i in range(3, limit, 2):
        if n % i == 0:
            return False # We found a factor, so it's not prime
            
    return True # No factors found, it must be prime

# Testing the logic
num = 29
if is_prime(num):
    print(f"{num} is a prime number")
else:
    print(f"{num} is not a prime number")

# printing the range of prime numbers from 10 to 20 
import math

def is_prime(n):
    # 1. Handle the small cases
    if n <= 1:
        return False
    if n == 2:
        return True
    
    # 2. Filter out even numbers quickly
    if n % 2 == 0:
        return False
    
    # 3. Check odd numbers from 3 up to the square root of n
    # We use int(math.sqrt(n)) + 1 to ensure the loop includes the root
    limit = int(math.sqrt(n)) + 1
    
    for i in range(3, limit, 2):
        if n % i == 0:
            return False # We found a factor, so it's not prime
            
    return True # No factors found, it must be prime

# Testing the logic
for num in range(10,20):
    if is_prime(num):
        print(f"{num} is a prime number")
else:
    print(end="")

# checking weather the given input is palindrome or not
number = 121

pal = 0

while number >0:
    digit = number % 10
    pal = pal*10 + digit
    number = number//10
if(pal == 121):
        print("this is a plaindrome")
else:
      print("this is not a plaindrome")
# priting the numbers upto 10 and uppercase and lower case letters upto (A-Z) and (a-z)
import string
for i in range(10):
    print(i , end="")

for letter in string.ascii_uppercase:
    print(letter , end = "")
for letter in string.ascii_lowercase:
    print(letter , end="")


