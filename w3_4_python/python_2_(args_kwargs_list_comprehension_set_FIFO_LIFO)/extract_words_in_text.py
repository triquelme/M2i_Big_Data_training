with open ("chanson.txt","r", encoding="utf8") as fichier:
	txt = fichier.read()
	txt = txt.lower()
	ponctuation = (";", ",", ".", ":", "«", "»", "'", "—", "?", "!", "-", "\n")
	for elt in ponctuation:
		txt = txt.replace(elt, " ")
	txt = txt.split(" ")
	# txt.remove("")
	txt = set(txt)
	print(txt)
	print("le nombre total de mots est: ", len(txt))