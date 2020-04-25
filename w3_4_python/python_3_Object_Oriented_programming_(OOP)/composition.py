# A (conteneur) <---- B (Contenu)
# Composition

class B:
	print(" Je suis la classe B")

# Classe conteneur
class A:
	def __init__(self):
		# Créer une instance B dans A
		self.b = B()

a = A()

# Rq: un conteneur est un objet qui possède comme attributs 
# d'autres objets

# Rq2: en détruisant le conteneur a, je détruis le contenu b
