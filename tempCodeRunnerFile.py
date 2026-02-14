import math

def is_prime(n):
    # 1. Handle the small cases
    if n <= 1:
        return False
    if n == 2:
        return True
    
    # 2. Filter out even numbers quickly
    if n % 2 == 0:
        return False
    
    # 3. Check odd numbers from 3 up to the square root of n
    # We use int(math.sqrt(n)) + 1 to ensure the loop includes the root
    limit = int(math.sqrt(n)) + 1
    
    for i in range(3, limit, 2):
        if n % i == 0:
            return False # We found a factor, so it's not prime
            
    return True # No factors found, it must be prime

# Testing the logic
for num in range(10,20):
    if is_prime(num):
        print(f"{num} is a prime number")
else:
    print(f"{num} is a prime not a prime number")