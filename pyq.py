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

