-- creation de la base de donnée flotte
CREATE DATABASE IF NOT EXISTS flotte
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

-- création de la table compagnie
USE flotte;
CREATE TABLE Compagnie(
	comp CHAR(4) PRIMARY KEY, -- contrainte en ligne
	nrue INTEGER(3), -- 999 possibilités
	rue CHAR(20),
	ville CHAR(15) DEFAULT 'Paris' COMMENT 'Nom de ville',
	nomCompagnie CHAR(15) NOT NULL -- contrainte en ligne 
) ENGINE=innoDB; -- mode de stockage de table

-- supprimer la table Compagnie dans la BD flotte
USE flotte;
DROP TABLE Compagnie;

-- Contraintes : en ligne / CONSTRAINT
CREATE TABLE  Pilote(
	surnom CHAR(4) PRIMARY KEY, -- contrainte en ligne
	nomCompagnie CHAR(15) NOT NULL, -- contrainte en ligne
	CONSTRAINT maFK FOREIGN KEY(nomCléEtrangère) REFERENCES tblReference(colReference), -- contrainte avec le mot clé CONSTRAINT
	CONSTRAINT PK PRIMARY KEY(surnom) -- contrainte avec mot clé CONSTRAINT
)

-- Création table Pilote
use flotte;
CREATE TABLE Pilote(
	brevet CHAR(6) PRIMARY KEY, -- contrainte en ligne
	nom CHAR(15) UNIQUE, -- contrainte en ligne: 2 pilotes ne peuvent pas avoir le même nom
	nbHvol DECIMAL(7,2) CHECK(nbHvol BETWEEN 0 AND 20000), -- contrainte CHECK en ligne
	compa CHAR(4), -- FOREIGN KEY REFERENCES Compagnie(comp),
	
	-- CONSTRAINT pk_brevet PRIMARY KEY(brevet),
	-- CONSTRAINT un_nom UNIQUE(nom),
	CONSTRAINT fk_Compagnie_Pilote FOREIGN KEY(compa) REFERENCES Compagnie(comp)
	-- Rq: il est préférable de déclarer un FK avec le mot clé CONSTRAINT 
	-- comme ça elle a un nom et il sera plus facile de la supprimer si besoin
) ENGINE=InnoDB;

-- Supprimer l'index nom de la table Pilote
DROP INDEX nom ON Pilote;
ALTER TABLE Pilote DROP INDEX nom; -- alternative

-- Supprimer la contrainte FOREIGN key
ALTER TABLE Pilote DROP FOREIGN KEY fk_Compagnie_Pilote;
ALTER TABLE Pilote DROP INDEX fk_Compagnie_Pilote;
-- Attention: supprimer la contrainte de clé étrangère ne supprime pas l'index


-- Ajouter dans certaines colonnes
INSERT INTO flotte.Pilote(brevet, nom, compa)
VALUES('PL-4', 'GAMBA', 'AF');

-- Ajouter dans toutes les colonnes
INSERT INTO flotte.Pilote
VALUES('PL-5', 'MACRON', 4500, 'AF');

-- Ajouter plusieurs pilotes dans une seule instruction
INSERT INTO flotte.Pilote(brevet, nom, compa)
VALUES('PL-6', 'PIERRE', 'SING'),
('PL-7', 'JULIEN', 'AF'),
('PL-8', 'THOMAS', 'SING');

-- Ajouter 3 compagnies 
INSERT INTO flotte.Compagnie
VALUES('RAM', 5, 'Avenue Tadla', 'Rabat','Royal Air Maroc'),
('EJ', 14, 'Sesam Street', 'London','Easy Jet'),
('TUS', 9, 'Rue de la Paix', 'Tunis', 'Tunis air');

-- Illustration de l'auto incrément
CREATE TABLE flotte.Affreter(
	numAff SMALLINT(2) AUTO_INCREMENT,
	comp CHAR(4),
	immat CHAR(6),
	dateAff DATE,
	nbPax SMALLINT(3),
	CONSTRAINT pk_affreter PRIMARY KEY(numAff)
) ENGINE=innoDB;

-- Afrettement avec qqs colonnes
INSERT INTO flotte.Affreter(comp, immat, dateAff, nbPax)
VALUES('AF', 'GT-455', '2020-05-13', 5),
('SING', 'GT-799', '2019-09-19', 11);

-- Afrettement avec toutes les colonnes, y compris l'AI (Auto Incrément)
-- Mettre NULL sur le champ AI technique
INSERT INTO flotte.Affreter
VALUES(NULL, 'RAM', 'KT-455', '2018-05-13', 19);

-- Ajouter en indiquant l'AI soi même

INSERT INTO flotte.Affreter
VALUES(2, 'EJ', 'EJ-455', '2018-05-13', 19);

-- Modifier l'AI pour une table existante
ALTER TABLE Affreter AUTO_INCREMENT=100; -- commence l'incrementation à partir de 100
INSERT INTO flotte.Affreter(comp, immat, dateAff, nbPax)
VALUES('TUS','TU-455', '2017-05-01', 12)


-- Modifier les données avec UPDATE 
UPDATE flotte.Pilote
SET nom = 'PHILIPPE', nbHvol = 19000
WHERE brevet = 'PL-5';

-- nbHvol < 500 va passer à 800
UPDATE flotte.Pilote
SET nbHvol = 800
WHERE nbHvol < 500 OR nbHvol IS NULL;
-- LIMIT 2;

-- remplacer tout une ligne avec REPLACE
REPLACE INTO flotte.Pilote
VALUES('PL-7', 'DURAND', 14500, 'SING'); 
-- Rq: le REPLACE se fait selon la clé primaire qui permet d'identifier la ligne à remplacer


-- Supprimer un Pilote
DELETE FROM flotte.Pilote
WHERE BREVET='PL-8';

-- TRUNCATE = vide la table sans la supprimer
TRUNCATE flotte.Pilote


-- Intégrité référentielle
-- Garder la base de données intègre
-- 1) Supprimer la contrainte FOREIGN key
ALTER TABLE Pilote DROP FOREIGN KEY fk_Compagnie_Pilote;
ALTER TABLE Pilote DROP INDEX fk_Compagnie_Pilote;

-- 2) Exporter la table Pilote dans pilote.sql

-- 3) Supprimer la table Pilote
	DROP TABLE Pilote;

-- 3) Créer à nouveau Pilote mais avec l'intégrité référentielle
use flotte;
CREATE TABLE Pilote(
	brevet CHAR(6) PRIMARY KEY, 
	nom CHAR(15) UNIQUE, 
	nbHvol DECIMAL(7,2) CHECK(nbHvol BETWEEN 0 AND 20000),
	compa CHAR(4), 
	
	CONSTRAINT fk_Compagnie_Pilote 
	FOREIGN KEY(compa) 
	REFERENCES Compagnie(comp)
	ON DELETE SET NULL
	ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO `Pilote` (`brevet`, `nom`, `nbHvol`, `compa`) VALUES
('PL-1', 'DUPONT', '800.00', 'AF'),
('PL-2', 'GORGES', '800.00', 'SING'),
('PL-3', 'LEOPOLD', '1000.00', 'AF'),
('PL-5', 'PHILIPPE', '19000.00', 'AF'),
('PL-6', 'PIERRE', '800.00', 'SING'),
('PL-7', 'DURAND', '14500.00', 'SING');

-- Altérer les données
USE flotte;
CREATE TABLE maTable(
	id INT(2) PRIMARY KEY,
	nom CHAR(15) UNIQUE
) ENGINE=InnoDB;


-- Renommer une table
RENAME TABLE maTable 
TO leurTable;
-- équivalent:
ALTER TABLE maTable
RENAME TO leurTable;

ALTER TABLE flotte.Pilote
ADD CONSTRAINT fk_bla FOREIGN KEY bla REFERENCES table(column)















