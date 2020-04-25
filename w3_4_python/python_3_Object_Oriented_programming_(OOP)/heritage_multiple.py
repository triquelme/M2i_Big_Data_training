class Animal:
	def __init__(self):
		print("Je suis un animal")

class Felin(Animal):
	def __init__(self):
		print("Je suis un felin")

class Domestique(Animal):
	def __init__(self):
		print("Je suis un animal domestique")

# heritage multiple:
class Chat(Felin, Domestique):
	def __init__(self):
		print("Je suis un chat")

chat = Chat()
# print(chat)

# si méthode m() dans felin et dans domestique
# et qu'on execute cette méthode héritée avec chat
# on utilise la méthode mro() pour savoir dans quel ordre 
# python va faire sa recherche dans les classes parentes
# et utilise la fonction qu'il trouve dans la première classe 
# parente de sa recherche
print(Chat.mro())
# résultat: 
# >>> [<class '__main__.Chat'>, <class '__main__.Felin'>, <class '__main__.Domestique'>, <class '__main__.Animal'>, <class 'object'>]
# Python va d'abord chercher les méthodes dans chat, puis dans les 
# classes parentes Felin puis Domestique puis Animal.
