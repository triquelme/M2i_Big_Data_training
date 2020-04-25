import random

historique = []
x = random.randint(0,100)
y = None

while x != y :
	y = int(input("Quel est le nombre ? (0-100): "))
	historique.append(y)
	if x > y :
		print("le nombre est plus grand")
	elif x < y :
		print("le nombre est plus petit")	

nb_essai = len(historique)

print("Vous avez trouvé le nombre ! Le nombre était: ", x)
print("Vous avez trouvé le nombre en", nb_essai, "coups.")
print("Essayez de faire mieux la prochaine fois !")