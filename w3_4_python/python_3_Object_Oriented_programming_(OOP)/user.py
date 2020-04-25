# class User:
# 	pass

# création de la classe avec un constructeur dedans
class User:

	# L'initialisateur (= constructeur par abus de langage)
	def __init__(self, n, a):
		self.nom = n
		self.age = a

# Instanciation = créer des objets
# u1 = User()
u1 = User("Thomas", 28)

