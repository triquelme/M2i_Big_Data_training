devise = str(input("quel est votre devise? entrez '€'/'$' :"))
montant = float(input("quel est le montant à convertir :"))

if devise == '€':
	rslt = montant * 1.08
	print(montant, "€ = ", rslt, "$")
elif devise == '$':
	rslt = montant * 0.98
	print(montant, "$ = ", rslt, "€")
else:
	print("votre devise n'est pas prise en compte, veuillez saisir '€' ou '$'")