CREATE TABLE Compagnie3(
	comp CHAR(4), 
	nrue INTEGER(3),
	rue CHAR(20), 
	ville CHAR(15) DEFAULT 'Paris',
	nomComp CHAR(15) NOT NULL,
	CONSTRAINT pk_Compagnie3 PRIMARY KEY(comp)
)ENGINE=innoDB;

CREATE TABLE Pilote3(
	brevet CHAR(6), 
	nom CHAR(15) NOT NULL,
	nbHVol REAL(7,2), 
	compa CHAR(4),
	CONSTRAINT pk_Pilote3 PRIMARY KEY(brevet),
	CONSTRAINT fk_Pil_compa_Comp FOREIGN KEY (compa) REFERENCES Compagnie3(comp)
) ENGINE=innoDB;

CREATE TABLE Qualifs(
	brevet CHAR(6), 
	typeAv CHAR(6),
	validite DATE
) ENGINE=innoDB;


INSERT INTO Compagnie3 VALUES ('AF', 124, 'Port royal', 'paris', 'Air France');
INSERT INTO Compagnie3 VALUES ('SING', 7, 'Camparols', 'Singapour', 'Singapore AL');
INSERT INTO Compagnie3 VALUES ('CAST', 1, 'G.Brassens', 'Blagnac', 'castanet AL');

INSERT INTO Pilote3 VALUES ('PL-1', 'Gratien Viel', 450,'AF');
INSERT INTO Pilote3 VALUES ('PL-2', 'Didier Donsez', 0,'AF');
INSERT INTO Pilote3 VALUES ('PL-3', 'Richard Grin', 1000,'SING');
INSERT INTO Pilote3 VALUES ('PL-4', 'Henri Alquié', 3400,'AF');

INSERT INTO Qualifs VALUES ('PL-4', 'A320','2005-06-24');
INSERT INTO Qualifs VALUES ('PL-4', 'A340','2005-06-24');
INSERT INTO Qualifs VALUES ('PL-2', 'A320', '2006-04-04');
INSERT INTO Qualifs VALUES ('PL-3', 'A330', '2006-05-13');


-- LEFT OUTER JOIN
-- Compagnies ET leurs Pilotes, MEME les Compagnies n'ayant pas de Pilote
-- Obligatoirement Jointure SQL2
-- les données absentes sont complétées avec NULL
SELECT nomComp, ville, nom AS 'Pilote' FROM Compagnie3
LEFT OUTER JOIN Pilote3 ON comp = compa;
-- la table qui est à gauche du left outer join sera prise entièrement

-- RIGHT OUTER JOIN
SELECT nomComp, ville, nom AS 'Pilote' FROM Compagnie3
RIGHT OUTER JOIN Pilote3 ON comp = compa; 
-- la table qui est à droite du right outer join sera prise entièrement

--pilotes et leurs qualifications, MEME les pilotes n'ayant pas de qualification encore
SELECT pil.brevet, pil.nom, qua.typeAv FROM Qualifs qua 
RIGHT OUTER JOIN Pilote3 pil ON qua.brevet = pil.brevet;







