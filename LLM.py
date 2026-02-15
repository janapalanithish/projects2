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
