from maj import majuscule
from minus import mesfonctions

# Vérifie que l'on est dans le main (= point d'entrée des scripts)
# contenant les inctructions
# et non pas dans un module contenant des définitions
if __name__ == "__main__":
	print(majuscule("toto"))
	print(mesfonctions.minuscule("GAMBA"))
	print("Je suis le module: ", __name__) # __main__
	print("Module mesfonctions: ", mesfonctions.__name__) # minus.mesfonctions