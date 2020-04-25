""" Implémentation d'une queue FIFO : First In First Out """

file_a = []

def enfiler(element, file=[]):
	""" Ajoute un élément à la fin de la file """
	file.append(element)
	return file

def defiler(file=[]):
	""" Enlève un élément au début de la file """
	file.pop(0)
	return file

def estVide(file=[]):
	""" Teste si la file est vide """
	print("La file est vide: ", len(file) == 0)

def affiche(file=[]):
	""" Affiche le contenu de la file """
	print(file)

# Enfile des éléments à la fin de file_a
for element in ('a','b','c','d','e'):
	enfiler(element, file_a)
	affiche(file_a)

# Défile des élements au début de file_a
defiler(file_a)
affiche(file_a)
defiler(file_a)
affiche(file_a)

# Teste si la file est vide
estVide(file_a)

# On défile d'autres éléments jusqu'à vider la file
defiler(file_a)
affiche(file_a)
defiler(file_a)
affiche(file_a)
defiler(file_a)
affiche(file_a)

# Teste si la file est vide
estVide(file_a)







