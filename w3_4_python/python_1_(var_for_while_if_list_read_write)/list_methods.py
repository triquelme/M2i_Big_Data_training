liste_animaux = ["lapin", "chat", "chien", "chiot", "dragon", "ornithorynque"]
print(liste_animaux)

# insert()
liste_animaux.insert(1, "éléphant") # insert "éléphant" avant l'élément en position 1
print(liste_animaux)

# Etendre une liste avec la liste [8, 11, 49] avec extend()
liste_riri = ["riri", "fifi", "loulou"]
liste_animaux.extend(liste_riri)
print(liste_animaux)

# Utiliser pop() et pop(index)
dernier_elt = liste_animaux.pop()
print(liste_animaux)
print(dernier_elt)

premier_elt = liste_animaux.pop(0)
print(liste_animaux)
print(premier_elt)

# Utiliser count(element)
l = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'e']
print(l.count("e"))
# > return 2 
# elt e apparait 2 fois

# Utiliser index()
l.index('g')
# > return 6
# elt e a la position d'index 6 dans la liste l
