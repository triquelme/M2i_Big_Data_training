""" Implémentation d'une pile LIFO: Last In First Out """

def pile(*args):
	""" Retourne une pile à partir d’une liste variable 
	d’éléments passés en paramètre
	"""
	pile = list(args)
	return pile

def empile(element, pile=[]):
	""" Empile un élément en « haut » de la pile """
	pile.append(element)
	return pile

def depile(pile=[]):
	""" Dépile un élément du « haut » de la pile """
	pile.pop()
	return pile

# création de la pile
pile_a = pile('a','b','c','d','e')

print(pile_a)
print(type(pile_a)) 

# empile un élément en haut de la pile
empile('A', pile_a)
print(pile_a)

# dépile un élément du haut de la pile
depile(pile_a)
print(pile_a)
