-- Insérer quelques colonnes
INSERT INTO Compagnie(comp, nrue, rue, nomComp)	
VALUES ('AC', 8, 'Champs Elysées', 'Castanet Air');

INSERT INTO Compagnie(comp, rue, ville, nomComp) 
VALUES ('AN2', 'Foch', 'Blagnac', 'Air Nul2');


-- Insérer toutes les colonnes
INSERT INTO Compagnie   
VALUES ('SING', 7, 'Camparols', 'Singapour', 'Singapore AL');

INSERT INTO Compagnie	
VALUES ('AF', 10, 'Gambetta', DEFAULT, 'Air France');

INSERT INTO Compagnie	
VALUES ('AN1', NULL, 'Hoche', 'Blagnac', 'Air Nul1');


-- Insérer plusieurs lignes
INSERT INTO Compagnie
VALUES('LUFT',9,'Salas','Munich','Luftansa'),
      ('QUAN',1,'Kangouroo','Sydney','Quantas'),
      ('SNCM',3,'Paoli','Bastia','Corse Air');