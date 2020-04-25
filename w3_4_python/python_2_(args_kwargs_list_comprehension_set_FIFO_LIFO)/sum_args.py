def somme(*args):
	rslt = 0
	for arg in args:
		rslt += arg
	return rslt

def somme(*args):
	return sum(args)


print(somme(12,14,4))
print(somme(12,4.2,4.005))

# Rq: args est un tuple
