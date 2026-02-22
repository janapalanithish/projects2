total_price = 0
def discount(price):
    if price >= 100:
        return price * 0.9
    return price

bill_amounts = [120 , 80 , 200]

for i in range(len(bill_amounts)):
    total_price += discount(bill_amounts[i])
print(total_price)
def coupan(total_price):
    if total_price > 500:
        return total_price * 0.8
    return total_price
print(total_price)

final_bills = [ 123 , 125 ,642 , 563]

for i in range(len(final_bills)):
    print(coupan(final_bills[i]))
print(final_bills)