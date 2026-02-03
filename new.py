import datetime
print(datetime.datetime.now())
print(datetime.datetime.now().year)
print(datetime.datetime.now().toordinal)

import math
print(math.pi)
print(math.log10(100))
print(math.sqrt(16))

x = input("Enter the number")
print(math.sqrt(int(x)))
import sys 
x = int(input("Enter the number:"))
print(sys.getsizeof(x))
print(datetime.date((now:=datetime.datetime.now()).year, now.month, now.day).toordinal())
#even or odd number
y = int(input("Enter the number:"))
if (y%2 == 0):
    print("Even number")
else:
    print("Odd number")
#divisible with 5 or not
n = int(input("Enter the number:"))
if(n%5 == 0):
    print("this is divisible with 5")
else:
    print("this is not divisble with 5")
#multiple of 7
z = int(input("Enter the number:"))
if(z%7 == 0):
    print("This is multiple of 7")
else:
    print("this is not multiple of 7")
#square and cube of a number
n = int(input("Enter the number:"))
sqr = n*n
print("The square of the number:", sqr)
cube = n*n*n
print("The cube of the number:", cube)
#area of circle and triangle
import math

rad = float(input("Enter the rad"))
base = float(input("Enter the base"))
height = float(input("Enter the height"))

area1 = 0.5*base*height
print("Area of the triangle:",area1)
print((math.pi)*rad*rad) 
#cofficient and the remainder of the number
divi = input("Enter the dividend")
divs = input("Enter the divisor")
que = int(divi) // int(divs)
rem = int(divi) % int(divs)
print(que)
print(rem)
#printing a table
g = int(input("Enter the number:"))
for i in range(1, 11):
    print(g*i)
#calculator with switch case
f = int(input("Enter the number1:"))
s = int(input("Enter the number2:"))
operation = input("Enter the operation")
match operation:
    case 1:
        print("addition" , f+s)
    case 2:
        print("substraction" , f-s)

    case 3:
        print("multiplication" , f*s)

    case 4:
        print("division" , f/s)
 
    case default:
        print("operation invalid")

input = 1234
while input != 0:
      digit = input%10
      last = input // 10


      print(digit)