with open("temperature.txt", "a") as fichier:
	temperature_english = ["hot","cold","moderate","icy","ardent"]
	for elt in temperature_english:
		fichier.write(str(elt) + "\n")
