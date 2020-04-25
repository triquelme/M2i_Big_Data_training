chaine_1 = input("entrez chaine_1 :")
chaine_2 = input("entrez chaine_2 :")

if len(chaine_1) > len(chaine_2):
	print("La plus plus grande des deux chaines est :", chaine_1)
elif len(chaine_2) > len(chaine_1):
	print("La plus plus grande des deux chaines est :", chaine_2)
else:
	print("Les 2 chaines font la même taille")