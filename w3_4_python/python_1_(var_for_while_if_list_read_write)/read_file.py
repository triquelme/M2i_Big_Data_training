with open("loremipsum.txt", "r") as fichier:
	texte =fichier.read()
	print(texte)
	# dpour lire ligne par ligne:
	liste = fichier.readlines()
	print(liste)
	print("".join(liste))