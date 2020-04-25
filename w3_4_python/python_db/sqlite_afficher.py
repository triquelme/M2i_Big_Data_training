import sqlite3

try:
    db = sqlite3.connect('mabase.db')  # Connexion
    cursor = db.cursor()  # on a 1 curseur
    sql = "select * from personnage"
    cursor.execute(sql)  # cursor permet d'executer les requetes sql

    # Afficher les données ligne par ligne : chaque ligne est un tuple
    for ligne in cursor:
        print("id : {} , nom: {} , prénom: {}".format(*ligne))

    # db.commit()  # désactivé car on n'impacte pas la BDD

    # fermer
    cursor.close()  # ferme curseur
    db.close()  # ferme connexion

except Exception as e:
    print(e)
    exit(1)
