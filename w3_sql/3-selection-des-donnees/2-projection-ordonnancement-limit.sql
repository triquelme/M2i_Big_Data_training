-- Créer la table Pilote1
CREATE TABLE Pilote1(
	brevet CHAR(6), 
	nom CHAR(30) NOT NULL,
	nbHVol REAL(7,2), 
	compa CHAR(4),
	CONSTRAINT pk_Pilote1 PRIMARY KEY(brevet)
);

INSERT INTO Pilote1 VALUES ('PL-1', 'Gratien Viel', 450, 'AF');
INSERT INTO Pilote1 VALUES ('PL-2', 'Didier Donsez', 0, 'AF');
INSERT INTO Pilote1 VALUES ('PL-3', 'Richard Grin', 1000, 'SING');
INSERT INTO Pilote1 VALUES ('PL-4', 'Placide Fresnais', 2450, 'CAST');
INSERT INTO Pilote1 VALUES ('PL-5', 'Daniel Viel', NULL, 'AF');


-- Renvoyer toutes les colonnes
-- Projection
SELECT * FROM Pilote1;

-- Renvoyer juste quelques colonnes
-- Projection
SELECT compa, brevet 
FROM Pilote1;

-- Utiliser des alias sur les colonnes
SELECT compa AS c1, nom AS NometPrenom, brevet AS c3 
FROM Pilote1;

-- Utiliser des alias sur le nom de la table
SELECT aliasPilote1s.compa AS c1, aliasPilote1s.nom 
FROM Pilote1 aliasPilote1s;

-- Doublons ou pas
SELECT compa FROM Pilote1;  -- Avec doublons
SELECT DISTINCT (compa) FROM Pilote1; -- Sans doublons

-- Evaluer des expressions
SELECT brevet, nbHVol, nbHVol*nbHVol AS auCarre, 10*nbHVol+5/2 
FROM Pilote1;

SELECT SYSDATE()+0;

-- Ordonnancement
SELECT brevet, nom FROM Pilote1 ORDER BY nom; -- (par défaut ASC = ordre ascendant/alphabétique) 
SELECT brevet, nbHVol FROM Pilote1 ORDER BY nbHVol DESC; -- DESC = ordre descendant

-- Concaténation.
SELECT brevet, CONCAT(nom, 'vole pour ',compa) AS "Embauche" 
FROM Pilote1;

-- Insertion multiple
CREATE TABLE NomEtHVoldesPilote1s (
	nom VARCHAR(16), 
	nbHVol DECIMAL(7,2),
	compa CHAR(4)
);
INSERT INTO NomEtHVoldesPilote1s 
SELECT nom, nbHVol,compa FROM Pilote1;
-- avantage on peut modifier le type des colonnes

-- ou bien :
CREATE TABLE NomEtHVoldesPilote1s AS 
SELECT nom, nbHVol,compa FROM Pilote1;
--avantage code plus rapide et facile

-- LIMIT indice, nombre de ligne à afficher
SELECT * FROM Pilote1 LIMIT 1,2; -- les deux premiers résultats en commançant par l'indice 1
SELECT * FROM Pilote1 ORDER BY nbHVol DESC LIMIT 2;
























