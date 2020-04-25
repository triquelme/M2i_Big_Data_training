class Maclasse:
	# Attribut statique 
	# (n'a pas besion d'un self)
	surnom = "Jo"
	def __init__(self, n):
		self.nom = n

	# Méthode statique 
	# (n'a pas besoin d'un self/objet pour être appelé)
	@staticmethod
	def direCoucou():
		print(Maclasse.surnom)

Maclasse.surnom # Rq: attribut de la classe et non de l'instance
# >>> 'Jo'
Maclasse.direCoucou()
# >>> Jo
o = Maclasse("zozo")
o.nom
# >>> 'zozo'
o.surnom # surnom est accessible aussi par l'instance
# >>> 'Jo'
# par contre sur je modifie o.surnom:
o.surnom = 'toto'
o.surnom
# >>> 'toto'
Maclasse.surnom
# >>> 'Jo'
# le surnom de l'instance est modifié mais pas celui de la classe

Maclasse.surnom = 'JOJO'
a = Maclasse("aa")                                             
b = Maclasse("bb")                                             
a.surnom                                                       
# >>> 'JOJO'
b.surnom                                                       
# >>> 'JOJO'

# permet de donner le même surnom à toutes les instances

