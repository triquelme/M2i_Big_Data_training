from math import sqrt

# sérialiser = objet --> chaine
# désérialsier = chaine --> objet
import pickle 

# Utilisation du module atexit 
# car le module --builtins__ est déchargé avant 
# l'appel de __del__
import atexit

class Vecteur:

	def __init__(self, abscisse , ordonnee):
		self.x = abscisse
		self.y = ordonnee
		atexit.register(self.recup)

	def __str__(self):
		""" méthode permettant d'imprimer un objet
			devra renvoyer obligatoirement une chaine
		"""
		return "(" + str(self.x) + "," + str(self.y) + ")"

	@property
	def norme(self):
		return sqrt(self.x**2 + self.y**2)

	# Surcharge de l'opérateur +
	def __add__(self, other):
		return Vecteur(self.x + other.x, self.y + other.y)

	# destructeur = appelé avant qu'un objet ne disparaisse
	# ou avant que le script ne se termine
	def __del__(self):
		print("Le vecteur (" + str(self.x) + "," + str(self.y) + ") va s'évanouir.")
		
	# Fonction recup() : récupérer les data avant destrcution
	def recup(self):
		with open("sauvegarde.txt", "wb") as p:
			pickle.dump(self, p)
		print("Votre vecteur a été sérialisé/placé dans un fichier")


# Instanciation = créer des objets
v1 = Vecteur(2,5)
print(v1)

# Afficher la norme
# n = v1.norme()
n = v1.norme
print("La norme du vecteur est: {:.3f}".format(n))

# Afficher x et y
print("Abscisse du vecteur:", v1.x)
print("Ordonnée du vecteur:", v1.y)

# Somme de 2 vecteurs
# v2 = Vecteur(3, 4)
# v = v1 + v2 # on utilise l'opératuer + et non pas add(v1,v2)
# print(v2)
# print(v)




