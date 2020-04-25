CREATE TABLE naviguant(
	brevet CHAR(6), 
	nom CHAR(15) NOT NULL,
	nbHVol REAL(7,2), 
	typeAv CHAR(5)
);

CREATE TABLE volsControle(
	brevet CHAR(6), 
	typeAv CHAR(5),
	validite DATE
);

INSERT INTO volsControle VALUES ('PL-1', 'A320','2005-06-24');
INSERT INTO volsControle VALUES ('PL-2', 'A320','2005-04-04');
INSERT INTO volsControle VALUES ('PL-2', 'A330', '2006-05-13');
INSERT INTO volsControle VALUES ('PL-3', 'A380', '2007-07-20');
INSERT INTO volsControle VALUES ('PL-3', 'A320', '2005-03-12');

INSERT INTO naviguant VALUES ('PL-1', 'Pierre lamothe', 450,NULL);
INSERT INTO naviguant VALUES ('PL-2', 'Didier Linxe', 900,'A320');
INSERT INTO naviguant VALUES ('PL-3', 'Henri Alquié', 3400,'A380');


-- Obtenir le produit cartésien
SELECT * FROM naviguant CROSS JOIN volsControle;






























