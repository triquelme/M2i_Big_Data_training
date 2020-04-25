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
	prixAchat DECIMAL(7,2), 
	CONSTRAINT pk_AviondeSING PRIMARY KEY(immatriculation)
);

INSERT INTO AviondeSING VALUES ('S-ANSI', 'A320', 104500);
INSERT INTO AviondeSING VALUES ('S-AVEZ', 'A320', 156000);
INSERT INTO AviondeSING VALUES ('S-SMILE', 'A330', 198000);
INSERT INTO AviondeSING VALUES ('F-GTMP', 'A340', 204500);
