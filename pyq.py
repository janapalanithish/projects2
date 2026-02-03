#import sys

#y = input("Enter a value: ")

# try converting to int
#try:
  #  val = int(y)
#except ValueError:
 #   try:
   #     val = float(y)
    #except ValueError:
     #   val = y   # keep it as string

#print("Data type:", type(val))
#print("Number of bytes:", sys.getsizeof(val))

a = int(input("Enter the number"))
b = int(input("Enter the number"))
if a > b:
    print("a is grater than b")
elif a < b:
    print("b is grater than a")
else:
    print("They are equal")
    import sys

print(sys.getsizeof(10))        
print(sys.getsizeof(10.5))      
print(sys.getsizeof("hello"))   
print(sys.getsizeof('a'))       
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
divi = input("Enter the dividend")
divs = input("Enter the divisor")
que = int(divi) // int(divs)
rem = int(divi) % int(divs)
print(que)
print(rem)

g = int(input("Enter the number:"))
for i in range(1, 11):
    print(g*i)
