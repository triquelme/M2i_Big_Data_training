import sqlite3

persos = [('Gamba', 'Leopold'), ('Jean','Luc')]
try:
    db = sqlite3.connect('mabase.db')  # Connexion
    cursor = db.cursor()  # on a 1 curseur
    # sql = """create table personnage(id integer primary key, nom text, prenom text)"""
    # cursor.execute(sql)
    sql = "insert into personnage(nom,prenom) values(?,?)"
    for data in persos:
    	cursor.execute(sql, data)  # data contient les données à insérer dans les colonne nom et prenom de la table personnage

    db.commit()  # on impacte la BDD

    # fermer
    cursor.close()  # ferme curseur
    db.close()  # ferme connexion

except Exception as e:
    #print("table non crée")
    print("personnages non créés", e)
    exit(1)
