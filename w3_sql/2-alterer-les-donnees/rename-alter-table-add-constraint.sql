-- renommer la table Pilote en table Naviguant
RENAME Pilote TO Naviguant; -- Pas sur MySQL 5.6

-- Autre formulation
ALTER TABLE Pilote2 RENAME TO Naviguant;


-- ALTER TABLE et ses options
CREATE TABLE Pilote4(
	brevet VARCHAR(4),
	nom VARCHAR(20)
);

INSERT INTO Pilote4 
VALUES ('PL-1', 'Agnès Labat');

-- Ajouter les colonnes : nbHvol, compa, ville
ALTER TABLE Pilote4
ADD (nbHVol DECIMAL(7,2));

ALTER TABLE Pilote4
ADD (compa VARCHAR(4) DEFAULT 'AF', 
	 ville VARCHAR(30) DEFAULT 'PARIS' NOT NULL
);

-- Renommer la colonne ville en adresse
ALTER TABLE Pilote4 
CHANGE ville adresse VARCHAR(30) AFTER nbHVol;

-- Modifier le type compa
UPDATE pilote4
SET compa='AFCE'
WHERE brevet='PL-1'

-- Changer type d'une colonne
ALTER TABLE Pilote4 
MODIFY compa VARCHAR(3);

-- Modifier la valeur par défaut
ALTER TABLE Pilote4
ALTER COLUMN adresse SET DEFAULT 'Blagnac';


-- Supprimer la colonne adresse
ALTER TABLE Pilote4 
DROP COLUMN adresse;


-- Ajouter ou supprimer des contraintes
ALTER TABLE Pilote4 
ADD CONSTRAINT pk_brevet4 PRIMARY KEY (brevet);

ALTER TABLE Pilote4 
DROP PRIMARY KEY;


