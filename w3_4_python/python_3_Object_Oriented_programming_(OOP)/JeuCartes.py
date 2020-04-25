# Importer la classe Carte du fichier Carte.py
from Carte import Carte
# Importer méthode shuffle() du module random
from random import shuffle


class JeuCartes:

    def __init__(self, vide = False):
        # Attribut cartes (liste)
        self.__cartes = []
        if not vide:
        	# Remplir la liste de vos 52 cartes
        	# # coul : 0 à 3, val : 2 à 14
        	# for coul in range(0,4):
        	# 	for val in range(2,15):
        	# 		self.cartes.append(Carte(val, coul))
        	self.__cartes = [Carte(val, coul) for coul in range(0, 4)
                       		for val in range(2, 15)]

    # getter et setter et property
    def getCartes(self):
    	return self.__cartes
    def setCartes(self, c):
    	self.__cartes = c
    cartes = property(getCartes, setCartes)

    def __str__(self):
        # Créer une chaine qui va contenir toutes les cartes
        # de la liste self.cartes
        # chaine = ""
        # for carte in self.cartes:
        # 	chaine += carte.__str__() + ", "
        # return chaine
        liste = [str(carte) for carte in self.cartes] # str() = carte.__str__()
        chaine = ', '.join(liste)
        return chaine

    def melanger(self):
        # Utiliser la fonction shuffle() du module random
        shuffle(self.cartes)

    def tirer(self):
    # Méthode pop() de la liste
    	try:
    		return self.cartes.pop(0)
    	except IndexError as e:
    		print("Plus rien à tirer :", e)
    		return None
    	except TypeError as p:
    		print(p)
    	except Exception as m:
    		print(m)

if __name__ == "__main__":
	# Test création objet carte pour vérifier import
	# c1 = Carte(8, 0)
	j = JeuCartes()
	print(j, "\n")

	print(len(j.cartes), "\n")

	j.melanger()
	print(j, "\n")

	macarte = j.tirer()
	print(macarte, "\n")

	print(j, "\n")









