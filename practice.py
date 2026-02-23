temp_list = [123 ,212 ,43 , 23 ,56]
x=[]
def analyze_templist(temp_list):
    for temp in temp_list:
        if temp < 100 and temp > 0:
            print("Temperature is within the normal range:", temp)
            x.append(temp)

def main():
    data = [10, -5, 25, 110, -2, 98, 300]
    results = analyze_templist(data)
    print(results)
main()

x = "abc"
for i in x:
    x = x + i
print(x)

y = "nithish"
y.replace("n" , "y")
print(y)

y = "nithish"
x = y.replace("n" , "y")
print(x)