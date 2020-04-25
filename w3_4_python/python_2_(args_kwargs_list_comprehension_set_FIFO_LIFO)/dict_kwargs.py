def unDictionnaire(**kwargs):
	return kwargs
	# for key, value in dictionnaire_longueur_variable_kwargs.items():
	# 	print(key, " == ", value)

print(unDictionnaire(alpha='ici', omega='maintenant'))

dico = {"France": "Paris", "Espagne": "Madrid", "Italie":"Rome", "Angleterre":"Londres"}

print(unDictionnaire(**dico))

# Rq: kwargs est un dictionnaire
# et args est un tuple