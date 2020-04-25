from JeuCartes import JeuCartes


class Paquet(JeuCartes):

    def __init__(self):
        super().__init__(True)

    def ajouter(self, carte):
        self.cartes.append(carte)

if __name__ == "__main__":
	j = JeuCartes()  # 52 cartes
	j.melanger()  # 52 cartes
	c = j.tirer()  # 1 carte

	p = Paquet()  # 0 carte
	p.ajouter(c)  # 1 carte
	print(p)

	c1 = j.tirer()
	p.ajouter(c1) # 2 cartes