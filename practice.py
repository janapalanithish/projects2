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


     
          