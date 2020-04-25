CREATE TABLE Compagnie2(
	comp CHAR(4), 
	nrue INTEGER(3),
	rue CHAR(20), 
	ville CHAR(15) DEFAULT 'Paris',
	nomComp CHAR(15) NOT NULL,
	CONSTRAINT pk_Compagnie2 PRIMARY KEY(comp)
)ENGINE=innoDB;

CREATE TABLE Pilote2(
	brevet CHAR(6), 
	nom CHAR(15) NOT NULL,
	nbHVol REAL(7,2), 
	prime INTEGER(8),
	embauche DATE,
	typeAvion CHAR(6),
	compa CHAR(4),
	chefPil CHAR(6),
	CONSTRAINT pk_Pilote2 PRIMARY KEY(brevet),
	CONSTRAINT fk_Pil_compa_Comp FOREIGN KEY (compa) REFERENCES Compagnie2(comp)
) ENGINE=innoDB;

INSERT INTO Compagnie2 VALUES ('AF', 124, 'Port royal', 'paris', 'Air France');
INSERT INTO Compagnie2 VALUES ('SING', 7, 'Camparols', 'Singapour', 'Singapore AL');
INSERT INTO Compagnie2 VALUES ('CAST', 1, 'G.Brassens', 'Blagnac', 'Castanet AL');

INSERT INTO Pilote2 VALUES ('PL-1', 'Gratien Viel', 450, 500,'1965-02-05','A320','AF','PL-4');
INSERT INTO Pilote2 VALUES ('PL-2', 'Didier Donsez', 0, NULL, '1965-05-13','A320','AF','PL-4');
INSERT INTO Pilote2 VALUES ('PL-3', 'Richard Grin', 1000,NULL, '2001-09-11','A320','SING',NULL);
INSERT INTO Pilote2 VALUES ('PL-4', 'Placide Fresnais', 2450,500, '2001-09-21','A330','CAST',NULL);
INSERT INTO Pilote2 VALUES ('PL-5', 'Daniel Vielle', 400,600, '1965-01-16','A340','AF',NULL);
INSERT INTO Pilote2 VALUES ('PL-6', 'Françoise TORT', NULL,0, '2000-12-24','A340','CAST',NULL);


-- Pilotes de 'Air France' ayant plus de 400h de vol
-- Equijointure car théta est une égalité (notation relationnelle Norme SQL 89)
SELECT brevet, nom FROM Pilote2, Compagnie2
WHERE compa = comp 
AND nomComp = 'Air France'
AND nbHVol > 400;

-- ou bien en SQL 2 (Notation SQL 92)
SELECT brevet, nom FROM Compagnie2 
INNER JOIN Pilote2 ON comp = compa
WHERE nomComp = 'Air France' AND nbHvol	> 400;

-- Coordonnées des compagnies qui embauchent des pilotes de moins de 1100h de vol
SELECT nomComp, nrue, rue, ville FROM Pilote2, Compagnie2
WHERE comp = compa AND Pilote2.nbHvol < 1100;

-- AUTOJOINTURE = 2 exemplaire de la même table
-- Identité des pilotes placés sous la responsabilité de 'Placide'
SELECT p1.brevet, p1.nom, p1.nbHVol FROM Pilote2 p1, Pilote2 p2
WHERE p1.chefPil = p2.brevet AND p2.nom LIKE '%Placide%'





















