with open("temperature.txt", "w") as fichier:
	temperature = ["chaud","froid","tempéré","glacial","brûlant"]
	for elt in temperature:
		fichier.write(str(elt) + "\n")