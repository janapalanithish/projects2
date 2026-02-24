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