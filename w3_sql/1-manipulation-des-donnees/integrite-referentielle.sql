-- Intégrité référentielle
CREATE TABLE Compagnie2(
	comp CHAR(4), 
	nrue INTEGER(3),
	rue CHAR(20), 
	ville CHAR(15) DEFAULT 'Paris',
	nomComp CHAR(15) NOT NULL,
	CONSTRAINT pk_Compagnie2 PRIMARY KEY(comp)
);

CREATE TABLE Pilote2(
	brevet CHAR(6), 
	nom CHAR(15) NOT NULL,
	nbHVol REAL(7,2), 
	compa CHAR(4),
	CONSTRAINT pk_Pilote2 PRIMARY KEY(brevet),
	CONSTRAINT ck_nbHVol CHECK (nbHVol BETWEEN 0 AND 20000),
	CONSTRAINT un_nom UNIQUE(nom),
	CONSTRAINT fk_Pil_compa_Comp2 FOREIGN KEY (compa) REFERENCES Compagnie2(comp)
	ON DELETE SET NULL  -- Ici : gestion de l'intégrité référentielle
);


INSERT INTO Compagnie2 
VALUES ('SING', 7, 'Camparols', 'Singapour', 'Singapore AL');

INSERT INTO Compagnie2 
VALUES ('AF', 10, 'Gambetta', DEFAULT, 'Air France');

INSERT INTO Compagnie2 
VALUES ('AN1', NULL, 'Hoche', 'Blagnac', 'Air Nul1');

INSERT INTO Compagnie2(comp, nrue, rue, nomComp) 
VALUES ('AC', 8, 'Champs Elysées','Castanet Air');

INSERT INTO Compagnie2(comp, rue, ville, nomComp) 
VALUES ('AN2', 'Foch', 'Blagnac', 'Air Nul2');

INSERT INTO Pilote2 
VALUES ('PL-1', 'Louise Ente', 450, 'AF');

INSERT INTO Pilote2 
VALUES ('PL-2', 'Jules Ente', 900, 'AF');

INSERT INTO Pilote2 
VALUES ('PL-3', 'Luc DUTOUR', 1000, 'SING');

-- Supprimons AF, alors le champ compa de Pilote2 reçoit NULL
DELETE FROM Compagnie2 WHERE comp = 'AF';
DELETE FROM Compagnie2 WHERE comp = 'SING';
SELECT * FROM Pilote2;
SELECT * FROM Compagnie2;







