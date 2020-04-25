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
	CONSTRAINT pk_Pilote PRIMARY KEY(brevet),
	CONSTRAINT fk_Pil_compa_Comp FOREIGN KEY (compa) REFERENCES Compagnie(comp)
) ENGINE=innoDB;

CREATE TABLE Qualifs(
	brevet CHAR(6), 
	typeAv CHAR(6),
	validite DATE
) ENGINE=innoDB;


INSERT INTO Compagnie VALUES ('AF', 124, 'Port royal', 'paris', 'Air France');
INSERT INTO Compagnie VALUES ('SING', 7, 'Camparols', 'Singapour', 'Singapore AL');
INSERT INTO Compagnie VALUES ('CAST', 1, 'G.Brassens', 'Blagnac', 'castanet AL');

INSERT INTO Pilote VALUES ('PL-1', 'Gratien Viel', 450,'AF');
INSERT INTO Pilote VALUES ('PL-2', 'Didier Donsez', 0,'AF');
INSERT INTO Pilote VALUES ('PL-3', 'Richard Grin', 1000,'SING');
INSERT INTO Pilote VALUES ('PL-4', 'Henri Alquié', 3400,'AF');
INSERT INTO Pilote VALUES ('PL-5', 'Michel castaings', NULL,NULL);

INSERT INTO Qualifs VALUES ('PL-4', 'A320','2005-06-24');
INSERT INTO Qualifs VALUES ('PL-4', 'A340','2005-06-24');
INSERT INTO Qualifs VALUES ('PL-2', 'A320', '2006-04-04');
INSERT INTO Qualifs VALUES ('PL-3', 'A330', '2006-05-13');
INSERT INTO Qualifs VALUES ('PL-7', 'A380', '2007-07-20');



-- Compagnies et leurs pilotes, incluant les compagnies n'ayant 
-- pas de pilote et les pilotes rattachés à aucune compagnie.
SELECT nomComp, brevet, nom 
FROM Pilote
FULL OUTER JOIN Compagnie
ON comp = compa;

-- équivalent à
SELECT nomComp, brevet, nom 
FROM Compagnie
FULL OUTER JOIN Pilote
ON comp = compa;

-- équivalent à
SELECT nomComp, brevet, nom  FROM Pilote
RIGHT OUTER JOIN Compagnie ON comp = compa
UNION
SELECT NULL, brevet, nom FROM Pilote
WHERE compa IS NULL
;


-- Pilotes et leurs qualifications, incluant les pilotes 
-- n'ayant pas encore d'expérience et les qualifications associées à des pilotes inconnus.
SELECT qua.typeAv, pil.brevet, pil.nom 
FROM Qualifs qua
FULL OUTER JOIN Pilote pil
ON pil.brevet = qua.brevet;

-- qui est équivalent à …
SELECT qua.typeAv, pil.brevet, pil.nom 
FROM Pilote pil
FULL OUTER JOIN Qualifs qua
ON pil.brevet = qua.brevet;

-- équivalent à
SELECT qua.typeAv, pil.brevet, pil.nom  FROM Pilote pil
LEFT OUTER JOIN Qualifs qua ON pil.brevet = qua.brevet
UNION
SELECT typeAv,NULL,NULL FROM Qualifs
WHERE brevet NOT IN(SELECT brevet FROM Pilote);