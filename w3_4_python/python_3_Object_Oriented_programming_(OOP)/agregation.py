# A (conteneur) <---- B (Contenu)
# Agrégation 

class B:
	print(" Je suis la classe B")

# Classe conteneur, A reçoit une instance oB de B
class A:
	def __init__(self, oB):
		print("Je suis la classe A")

b = B()
a = A(b)

# Rq: en détruisant a, b continue à exister
