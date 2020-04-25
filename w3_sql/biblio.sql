--
-- Exercice Biblio:
--


-- 1) Entités: 

-- Livre, 
-- Auteur,
-- Editeur,
-- Categorie


-- 2) Attributs de chaque entité:

-- Livre(livre_id, titre, date_publi, fk_auteur_id, fk_editeur_id, fk_categorie_id) 

-- Auteur(auteur_id, nom, prénom)

-- Editeur(editeur_id, nom)

-- Categorie(categorie_id, categorie_type)


-- 3) Clés étrangères: fk_auteur_id, fk_editeur_id, fk_categorie_id


-- 4) Code:

-- création base de donnée Biblio
	
CREATE DATABASE IF NOT EXISTS Biblio
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

-- Création tables Auteur, Editeur, Categorie et Livre

CREATE TABLE Biblio.Auteur(
	auteur_id INT(3) AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(100) NOT NULL, 
	prénom VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE Biblio.Editeur(
	editeur_id INT(3) AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(100) NOT NULL,
) ENGINE=InnoDB;

CREATE TABLE Biblio.Categorie(
	categorie_id INT(3) AUTO_INCREMENT PRIMARY KEY,
	categorie_type VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Biblio.Livre(
	livre_id INT(3) AUTO_INCREMENT PRIMARY KEY,
	titre VARCHAR(250), 
	date_publi DATE,
	fk_auteur_id INT(3),
	fk_editeur_id INT(3),
	fk_categorie_id INT(3), 
	
	CONSTRAINT fk_Livre_Auteur 
	FOREIGN KEY(fk_auteur_id) 
	REFERENCES Auteur(auteur_id)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	
	CONSTRAINT fk_Livre_Editeur 
	FOREIGN KEY(fk_editeur_id) 
	REFERENCES Editeur(editeur_id)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	
	CONSTRAINT fk_Livre_Categorie 
	FOREIGN KEY(fk_categorie_id) 
	REFERENCES Categorie(categorie_id)
	ON DELETE SET NULL
	ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 5) Insertion données dans les tables

-- Ajouter catégories
INSERT INTO Biblio.Categorie VALUES
(NULL, 'Roman'),
(NULL, 'Bande Dessiné'),
(NULL, 'Littérature'),
(NULL, 'Informatique'),
(NULL, 'Fantastique');

-- Ajouter auteurs
INSERT INTO Biblio.Auteur VALUES
(NULL, 'Hugo', 'Victor'),
(NULL, 'Goscinny', 'René'),
(NULL, 'Voltaire', NULL),
(NULL, 'Lutz', 'Mark'),
(NULL, 'Tolkien', 'J.R.R.');

-- Ajouter éditeurs
INSERT INTO Biblio.Editeur VALUES
(NULL, 'Larousse Classique'),
(NULL, 'Dargaud'),
(NULL, 'Poche Classique'),
(NULL, 'O\'Reilly'),
(NULL, 'Gallimard');

-- Ajouter livres
INSERT INTO Biblio.Livre VALUES
(NULL, 'Les misérables', NULL, 1, 1, 1),
(NULL, 'Asterix', NULL, 2, 2, 2),
(NULL, 'Candide', NULL, 3, 3, 3),
(NULL, 'Learning Python', NULL, 4, 4, 4),
(NULL, 'Lord of the ring', NULL, 5, 5, 5);


-- 6) Vérifier l'intégrité référentiel:

-- Essayer de supprimer un auteur_id et regarder ce qu il se passe dans livre 
-- => le champ doit devenir NULL
-- de même si on update un auteur_id il doit s actualiser en cascade dans livre

 -- 7) Récupérer les infos sur un livre:

-- récupérer avec une jointure = interroger plusieurs tables 
SELECT Auteur.nom, Auteur.prénom, Categorie.categorie_type, Editeur.nom,Livre.*
FROM Auteur, Editeur, Categorie, Livre
WHERE Auteur.auteur_id = Livre.fk_auteur_id
AND Editeur.editeur_id = Livre.fk_editeur_id
AND Categorie.categorie_id = Livre.fk_categorie_id;

-- 8) Ajouter la colonne commentaire à la table Categorie
ALTER TABLE Biblio.Categorie
ADD Commentaire CHAR(32);

-- 9) Ajouter une contrainte unique à la colonne categorie_type 
-- de la table Categorie
ALTER TABLE Biblio.Categorie
ADD CONSTRAINT un_categorie UNIQUE(categorie_type); -- un_ pour unique
