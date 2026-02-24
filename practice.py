class student:
    name = "nithish"
    def __init__(self , fullname , marks):
        self.marks = marks
        self.fullname = fullname

s1 = student("Nihish Kumar", 85)
print(s1.fullname , s1.marks)
s2 = student("John Doe", 90)
print(s2.marks , s2.fullname)
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