# printing the upper triangle with the numbers
for i in range(1, 6):          # rows
    for j in range(1, i + 1):  # numbers per row
        print(j, end="")
    print()
#printing the inverted teinaflw with numbers 
for i in range(6,0,-1):
    for j in range(1,i+1):
        print(j , end="")
    print()
for i in range(6):          # rows
    for j in range(i ):  # numbers per row
        print(j, end="")
    print()