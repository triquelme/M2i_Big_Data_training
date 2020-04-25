-- Créer la table AviondeAF
CREATE TABLE AviondeAF(
	immat CHAR(10), 
	typeAvion CHAR(15),
	nbHVol REAL(7,2), 
	CONSTRAINT pk_AviondeAF PRIMARY KEY(immat)
);

INSERT INTO AviondeAF VALUES ('F-WTSS', 'Concorde', 6570);
INSERT INTO AviondeAF VALUES ('F-GLFS', 'A320', 3500);
INSERT INTO AviondeAF VALUES ('F-GTMP', 'A340', NULL);


-- Créer la table AviondeSING
CREATE TABLE AviondeSING(
	immatriculation CHAR(10), 
	typeAv CHAR(15),
	prixAchat DECIMAL(8,2), 
	CONSTRAINT pk_AviondeSING PRIMARY KEY(immatriculation)
);

INSERT INTO AviondeSING VALUES ('S-ANSI', 'A320', 104500);
INSERT INTO AviondeSING VALUES ('S-AVEZ', 'A320', 156000);
INSERT INTO AviondeSING VALUES ('S-SMILE', 'A330', 198000);
INSERT INTO AviondeSING VALUES ('F-GTMP', 'A340', 204500);


-- Trouver les types d'avion que les 2 compagnies exploitent en commun 
-- INTERSECTION
SELECT DISTINCT typeAvion FROM AviondeAF
WHERE typeAvion IN (SELECT typeAv FROM AviondeSING);

-- ou bien:
--UNION (sans doublons)
SELECT typeAvion FROM AviondeAF
UNION SELECT typeAv FROM AviondeSING;

-- avec doublons
SELECT typeAvion FROM AviondeAF
UNION ALL SELECT typeAv FROM AviondeSING;

-- Trouver les types 'avions exploités par AF mais pas par SING
-- DIFFERENCE
SELECT DISTINCT typeAvion FROM AviondeAF
WHERE typeAvion NOT IN (SELECT typeAv from AviondeSING);


























