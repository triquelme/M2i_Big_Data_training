class Carte:
    # Attributs statiques
    couleurs = ("Coeur", "Carreau", "Trefle", "Pique")

    valeurs = (None, None, 2, 3, 4, 5, 6, 7, 8, 9,
               10, "Valet", "Dame", "Roi", "As")

    def __init__(self, val, coul):
        # Vérifier si val, coul sont dans le bon créneau
        # val: entre 2 et 14, coul: entre 0 et 3
        if (2 <= val <= 14) and (0 <= coul <= 3):
            self.valeur = val
            self.couleur = coul
        else:
            print("La valeur ou la couleur de la carte est hors limite.\nVeuillez renseigner une valeur comprise entre 2 et 14\net une couleur comprise entre 0 et 3.")
            exit()

    def __str__(self):
        # return str(self.valeur) + " de " + str(self.couleur)
        return (str(Carte.valeurs[self.valeur]) + " de " + Carte.couleurs[self.couleur])

    def affiche(self):
        print(self)  # appelle le __str__()

if __name__ == "__main__":
    # c1 = Carte(8, "Coeur")
    c1 = Carte(8, 0)
    # print(c1)
    c1.affiche()
	
