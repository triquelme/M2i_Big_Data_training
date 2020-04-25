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


-- Coordonnées des compagnies qui embauchent des pilotes de moins de 500 h de vol
SELECT nomComp, nrue, rue, ville FROM Compagnie
WHERE comp IN(SELECT compa FROM Pilote WHERE nbHvol < 500);

-- Somme des heures de vol des pilotes placés sous la responsabilité des
-- pilotes de la compagnie de nom 'Air France'
SELECT SUM(nbHvol) FROM Pilote
WHERE chefPil 
	IN (SELECT brevet FROM Pilote WHERE compa = 
		  (SELECT comp FROM Compagnie WHERE nomComp='Air france'));
		  
-- Compagnies n'ayant pas de pilote
SELECT nomComp, nrue, rue, ville FROM Compagnie
WHERE comp NOT IN(SELECT compa FROM Pilote WHERE compa IS NOT NULL);

-- Avions dont le nombre d'heures de vol est inférieur à celui de
-- n'importe quel A320
SELECT immat, typeAv, nbHvol FROM Avions
WHERE nbHvol < ANY (SELECT nbHvol FROM Avions WHERE typeAv = 'A320');

-- Compagnies et leurs avions dont le nbHvol est supérieur à celui de
-- n'importe quel avion de la compagnie de code 'SING'
SELECT immat, typeAv, nbHvol, compa FROM Avions
WHERE nbHvol > ANY (SELECT nbHvol FROM Avions WHERE compa = 'SING');

-- Avions dont le nbHvol est inférieur à tous les A320
SELECT immat, typeAv, nbHvol FROM Avions
WHERE nbHvol < ALL (SELECT nbHvol FROM Avions WHERE typeAv = 'A320');

-- Compagnies et leurs avions dont le nbHvol est supérieur à tous les 
-- avions de la compagnie de code 'AF'
SELECT immat, typeAv, nbHvol, compa FROM Avions
WHERE nbHvol > ALL (SELECT nbHvol FROM Avions WHERE compa = 'AF');

