liste_animaux = ["lapin", "chat", "chien", "chiot", "dragon", "ornithorynque"]

liste_animaux.append("troll")

print(liste_animaux)

liste_animaux_domestiques = ["chat", "chien", "chiot"]

for animal in liste_animaux_domestiques:
	liste_animaux.remove(animal)

print(liste_animaux)