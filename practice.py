# Bank Details Class using three classes 
class bankdetails:
    def __init__(self , balance , accountno):
          self.balance = balance
          self.accountno = accountno
    def debit(self , n):
         self.balance -= n
         print("the amount debited" , self.display())
    def credit(self , m):
         self.balance += m
         print("the amount credited" , self.display())
    def display(self):
         return self.balance , self.accountno
s1 = bankdetails(1000 , 12345)
print(s1.display())
s1.debit(500)
s1.credit(2000)

class student:
    def __init__(self , name , marks):
        self.name = name 
        self.marks = marks
    def get_thug(self):
            sum = 0
            for i in range(len(self.marks)):
                sum += self.marks[i]
            print(sum / len(self.marks))
            print(self.name)
    @staticmethod
    def college():
         print("college")
s1 = student("kumar" , [85, 90, 78])
print(s1.name , s1.marks)
s1.name = "harish"
s1.get_thug()
student.college()


class members:
     def __init__(self , count , section):
          self.count = count 
          self.section = section
     def sectiona(self , n):
          count = self.count + n
          print("the count of section a is" , count)
     def sectionb(self , m):
          count = self.count + m
          print("the count of section b is" , count)
     def final(self):
          return self.count 
s2 = members(50 , "A")
print(s2.final())
s2.sectiona(10)
s2.sectionb(100)

# keep practicing oops 
class area:
     def __init__(self , length ,breadth):
          self.length = length
          self.breadth = breadth
     def rectangle(self , length , breadth):
        print("the area is " , length * breadth)
sm = area(10 ,5)
sm.rectangle(10 , 20)

class calc:
     def calc1(self , num1 , num2):
          self.num1 = num1
          self.num2 = num2
          print("the values of num1 , num2 is " , self.num1 , self.num2)
     def add(self  , num1 , num2):
          print("the values is " , num1 + num2)
sg = calc()
sg.add(10 , 5)

    



     
          