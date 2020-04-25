class Compte:

    def __init__(self, nom, solde=0):
        self.nom = nom
        self.__solde = solde  # l'attribut solde est privé

    #getter, setter, property
    def getSolde(self):
        print(self.__solde)

    def setSolde(self, newsolde):
        self.__solde = newsolde

    solde = property(getSolde, setSolde)

    def __str__(self):
        return "Mr " + self.nom + " a " + str(self.solde) + "€"

    def depotDe(self, montant):
        """ Ajoute montant au solde """
        print("solde + " + str(montant))
        self.solde += montant

    def retraitDe(self, montant):
        """ Soustrait montant au solde """
        print("solde - " + str(montant))
        self.solde -= montant

    def affiche(self):
        print(self)


c1 = Compte("Dupont", 2000)

# # Quand les attributs du compte sont publiques :
# #compte2 = Compte("Gaspard", 5000)
# print(c1)
# #c1.affiche()
# #compte2.affiche()
# c1.depotDe(2000)
# #c1.affiche()
# print(c1)
# c1.retraitDe(500)
# #c1.affiche()
# print(c1)
# #c1.affiche()
# #compte2.affiche()

# Si le solde est un attribut privé (__solde) du compte c1:
# print(c1.getSolde())
# c1.setSolde(7000)
# print(c1.getSolde())

# Une fois la property déclarée "solde = property(getSolde, setSolde)"
print(c1)
print(c1.solde)
c1.solde = 14000
print(c1)
print(c1.solde)
