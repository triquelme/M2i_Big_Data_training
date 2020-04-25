CREATE TABLE Compagnie(
	comp CHAR(4), 
	nrue INTEGER(3),
	rue CHAR(20), 
	ville CHAR(15) DEFAULT 'Paris',
	nomComp CHAR(15) NOT NULL,
	CONSTRAINT pk_Compagnie PRIMARY KEY(comp)
)ENGINE=innoDB;

CREATE TABLE Pilote(
	brevet CHAR(6), 
	nom CHAR(15) NOT NULL,
	nbHVol REAL(7,2),
	prime INTEGER(7),
	embauche DATE,
	typeAvion CHAR(6),
	compa CHAR(4),
	chefPil CHAR(6),
	CONSTRAINT pk_Pilote PRIMARY KEY(brevet),
	CONSTRAINT fk_Pil_compa_Comp FOREIGN KEY (compa) REFERENCES Compagnie(comp)
) ENGINE=innoDB;

INSERT INTO Compagnie VALUES ('AF', 124, 'Port royal', 'Paris', 'Air France');
INSERT INTO Compagnie VALUES ('SING', 7, 'Camparols', 'Singapour', 'Singapore AL');
INSERT INTO Compagnie VALUES ('CAST', 1, 'G.Brassens', 'Blagnac', 'Castanet AL');

INSERT INTO Pilote VALUES ('PL-1', 'Gratien Viel', 450, 500,'1965-02-05','A320','AF','PL-4');
INSERT INTO Pilote VALUES ('PL-2', 'Didier Donsez', 0, NULL, '1965-05-13','A320','AF','PL-4');
INSERT INTO Pilote VALUES ('PL-3', 'Richard Grin', 1000,NULL, '2001-09-11','A320','SING',NULL);
INSERT INTO Pilote VALUES ('PL-4', 'Placide Fresnais', 2450,500,'2001-09-21','A330', 'CAST',NULL);
INSERT INTO Pilote VALUES ('PL-5', 'Daniel Vielle', 400,600, '1965-01-16','A340','AF',NULL);
INSERT INTO Pilote VALUES ('PL-6', 'Françoise TORT', NULL,0, '2000-12-24','A340','CAST',NULL);



-- Pilotes de la compagnie de nom 'Air France' ayant plus de 300 heures de vol.
SELECT brevet, nom FROM Pilote
WHERE compa =(SELECT comp FROM Compagnie WHERE nomComp = 'Air France')
AND nbHVol > 300;

-- Pilotes sous la responsabilité du pilote de nom 'Placide'.
SELECT brevet, nom FROM Pilote2
WHERE chefPil =(SELECT brevet FROM Pilote2 WHERE nom LIKE '%Placide%')

-- Pilotes ayant plus d'expérience que le pilote de brevet 'PL-5'
SELECT brevet, nom, nbHvol FROM Pilote2
WHERE nbHvol >(SELECT nbHvol FROM Pilote2 WHERE brevet = 'PL-5')































