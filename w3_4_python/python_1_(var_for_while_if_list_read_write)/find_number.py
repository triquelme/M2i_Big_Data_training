import random

x = random.randint(0,100)
print(x)
y = None

while x != y :
	y = int(input("Quel est le nombre ? (0-100): "))
	if x > y :
		print("le nombre est plus grand")
	elif x < y :
		print("le nombre est plus petit")

print("Vous avez trouvé le nombre ! Le nombre était: ", x)