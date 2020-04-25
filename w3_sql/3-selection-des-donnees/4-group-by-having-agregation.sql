-- Créer la table Pilote1
DROP TABLE Pilote1;
CREATE TABLE Pilote1(
	brevet CHAR(6), 
	nom CHAR(30) NOT NULL,
	nbHVol REAL(7,2), 
	prime INTEGER(3),
	embauche DATE,
	typeAvion CHAR(6),
	compa CHAR(4),
	CONSTRAINT pk_Pilote1 PRIMARY KEY(brevet)
);

INSERT INTO Pilote1 VALUES ('PL-1', 'Gratien Viel', 450, 500,'1965-02-05','A320','AF');
INSERT INTO Pilote1 VALUES ('PL-2', 'Didier Donsez', 0, NULL, '1965-05-13','A320','AF');
INSERT INTO Pilote1 VALUES ('PL-3', 'Richard Grin', 1000,90, '2001-09-11','A320','SING');
INSERT INTO Pilote1 VALUES ('PL-4', 'Placide Fresnais', 2450,500, '2001-09-21','A330','CAST');
INSERT INTO Pilote1 VALUES ('PL-5', 'Daniel Viel', NULL,600, '1965-01-16','A340','AF');
INSERT INTO Pilote1 VALUES ('PL-6', 'Françoise TORT', NULL,0, '2000-12-24','A340','CAST');


-- Moyenne des heures de vol et des primes des pilotes de la compagnie AF
-- AVG(.) 
SELECT AVG(nbHVol) AS 'Moyenne H vol', AVG(prime) AS 'Moyenne prime' 
FROM Pilote1
WHERE compa = 'AF';

-- Nombre de pilotes, nbhvol, primes (toutes et distinctes dans Pilote1)
-- COUNT(.) pour compter nombre de lignes
SELECT COUNT(*) AS 'Tout', COUNT(nbHVol), COUNT(prime), COUNT(DISTINCT prime)
FROM Pilote1;

-- Nom des pilotes de la compagnie AF
SELECT compa, GROUP_CONCAT(nom) from Pilote1
GROUP BY compa;

-- Utiliser MAX(.), MIN(.)
SELECT MAX(nbHVol), MAX(embauche) AS "Date", MIN(prime)
FROM Pilote1;

-- Utiliser STDDEV, VARIANCE, SUM
SELECT STDDEV(prime), VARIANCE(prime), SUM(nbHVol) FROM Pilote1;

-- Compagnies (compa) et nb de leur pilotes ayant plus d'un Pilote1
SELECT compa, COUNT(brevet) AS 'Nb Pilotes' FROM Pilote1
GROUP BY compa
HAVING COUNT(brevet) >1;



































