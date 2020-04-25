import pymysql.cursors

try:
    params = {
        'host': 'localhost',
        'user': 'root',
        'password': '',
        'db': 'biblio',
        'charset': 'utf8mb4',
        'cursorclass': pymysql.cursors.DictCursor
    }

    db = pymysql.connect(**params)
    cursor = db.cursor()
    sql = "SELECT livre_id, titre FROM livre"
    cursor.execute(sql)

    # Résultats
    result = cursor.fetchall()
    # result = cursor.fetchone()  # récupère le 1er livre
    # result = cursor.fetchmany(3)  # récupère les 3 premiers livres  

    # print(result)

    for dico in result:
        print("{} : {}".format(dico['livre_id'], dico['titre']))

    cursor.close()
    db.close()

except Exception as e:
    print("Il y a un pb: ", e)
