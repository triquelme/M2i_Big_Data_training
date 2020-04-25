SELECT * from newbatting limit 30;

DESCRIBE EXTENDED newbatting;
-- DESCRIBE OU DESC

SHOW TBLPROPERTIES newbatting;

CREATE TABLE XYZ AS SELECT * FROM newbatting; 
-- permet de copier le contenu de la table newbatting dans la table XYZ
-- revient à faire unecopie de la table newbatting sous le nom XYZ

SELECT * FROM newbatting 
WHERE newbatting.yearid = "1956" 
AND newbatting.teamid = "DET";

SELECT * FROM (SELECT row_number() OVER (PARTITION BY 1) po, d.* 
-- Rq: on peut partitionner le décompte de ligne par teamid
-- nombre de CHN, BAL, etc
-- SELECT row_number() OVER (PARTITION BY newbatting.teamid)
FROM newbatting d) q
-- permet d'ajouter une colonne d'alias po contenant le nombre de ligne,
-- devant la table newbatting d'alias d
-- po + d = q
WHERE q.po = 3;
-- tout cela pour faire une sélection de la ligne 3 de la table newbatting