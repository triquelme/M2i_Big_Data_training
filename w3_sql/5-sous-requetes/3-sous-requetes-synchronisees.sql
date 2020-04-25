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
	compa CHAR(4),
	chefPil CHAR(6),
	CONSTRAINT pk_Pilote PRIMARY KEY(brevet),
	CONSTRAINT fk_Pil_compa_Comp FOREIGN KEY (compa) REFERENCES Compagnie(comp)
) ENGINE=innoDB;

CREATE TABLE Avions(
	immat CHAR(6), 
	typeAv CHAR(6),
	nbHVol REAL(7,2), 
	compa CHAR(4),
	CONSTRAINT pk_Avions PRIMARY KEY(immat),
	CONSTRAINT fk_Avions FOREIGN KEY (compa) REFERENCES Compagnie(comp)
) ENGINE=innoDB;

INSERT INTO Compagnie VALUES ('AF', 124, 'Port royal', 'paris', 'Air France');
INSERT INTO Compagnie VALUES ('SING', 7, 'Camparols', 'Singapour', 'Singapore AL');
INSERT INTO Compagnie VALUES ('CAST', 1, 'G.Brassens', 'Blagnac', 'castanet AL');

INSERT INTO Pilote VALUES ('PL-1', 'Pierre Lamothe', 450, 'AF','PL-4');
INSERT INTO Pilote VALUES ('PL-2', 'Didier Linxe', 900, 'AF','PL-4');
INSERT INTO Pilote VALUES ('PL-3', 'Daniel Atar', 1000,'SING',NULL);
INSERT INTO Pilote VALUES ('PL-4', 'Henri Alquié', 3400,'AF',NULL);

INSERT INTO Avions VALUES ('A1', 'A320', 1000, 'AF');
INSERT INTO Avions VALUES ('A2', 'A330', 1500, 'AF');
INSERT INTO Avions VALUES ('A3', 'A320', 550,'SING');
INSERT INTO Avions VALUES ('A4', 'A340', 1800,'SING');
INSERT INTO Avions VALUES ('A5', 'A340', 200,'AF');
INSERT INTO Avions VALUES ('A6', 'A330', 100,'AF');


-- Avions dont le nbHvol est > au nbHvol moyen des avions de leur compagnie
SELECT avi1.* FROM Avions avi1
WHERE avi1.nbHvol > (
SELECT AVG(avi2.nbHvol) FROM Avions avi2 WHERE avi2.compa = avi1.compa);

-- Pilotes ayant au moins un pilote sous leur responsabilité
SELECT pil1.brevet, pil1.nom, pil1.compa FROM Pilote pil1
WHERE EXISTS (SELECT pil2.* FROM Pilote pil2 WHERE pil2.chefPil = pil1.brevet);

-- Liste des compagnies n'ayant pas de pilotes
SELECT cpg.* FROM Compagnie cpg
WHERE NOT EXISTS (SELECT compa FROM Pilote WHERE compa = cpg.comp);



