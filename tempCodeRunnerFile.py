class calc:
     def calc1(self , num1 , num2):
          self.num1 = num1
          self.num2 = num2
          print("the values of num1 , num2 is " , self.num1 , self.num2)
     def add(self  , num1 , num2):
          print("the values is " , num1 + num2)
sg = calc()
sg.add(10 , 5)