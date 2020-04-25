# création de la classe avec un constructeur dedans
class User:

    # L'initialisateur (= constructeur par abus de langage)
    def __init__(self, n, a):
        self.nom = n
        self.__age = a

    # Donnée privée : définir getter + setter + property
    def get_age(self):
        return self.__age

    def set_age(self, newAge):
        self.__age = newAge

    age = property(get_age, set_age)

    def __str__(self):
        return "Je suis " + self.nom + " et j'ai " + str(self.age) + " ans"

    def getIdentite(self):
        return "Je suis " + self.nom + " et j'ai " + str(self.age) + " ans"


# Héritage : Salarie est une sorte de User
class Salarie(User):

    def __init__(self, n, a, s):
        super().__init__(n, a)
        # initialisateur du parent va créer self.nom et self.age 
        self.salaire = s

    def getSalaire(self):
        return self.nom

    def __str__(self):
        # return "Je suis " + self.nom + ", j'ai " + str(self.age)
        # + " ans et je gagne " + str(self.salaire)
        return self.getIdentite() + ", je gagne " + str(self.salaire)


# Instanciation = créer des objets
s1 = Salarie("DUPONT", 45, 15400)
print(s1)
