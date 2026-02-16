cities = ['Australia' , 'india' , 'chile' , 'china' , 'canada']
for c in cities:
    cities.remove(c)
    print(cities)
# Iterate over a COPY of the list
cities = ['Australia' , 'china' , 'chile']
for c in cities[:]: 
    cities.remove(c)
    print(cities)

    