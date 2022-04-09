INSERT INTO attaque (nom, baseDegat) VALUES ('attaque1', 5);
INSERT INTO attaque (nom, baseDegat) VALUES ('attaque2', 10);
INSERT INTO attaque (nom, baseDegat) VALUES ('attaque3', 15);
INSERT INTO attaque (nom, baseDegat) VALUES ('attaque4', 20);

INSERT INTO utilise (idAttaque, idPersonnage, levelAttaque) VALUES (1, 1, 2), (2, 1, 2), (2, 2, 1), (4, 3, 2), (1, 4, 3), (4, 5, 3);

UPDATE attaque
SET baseDegat = 10;

UPDATE attaque
SET baseDegat = 50
WHERE idAttaque = 2 OR idAttaque = 3;

DELETE FROM attaque
WHERE idAttaque = 4;

ALTER TABLE personnage
ADD dateNaissance DATE;
UPDATE personnage SET dateNaissance = "2000-01-01" WHERE idPersonnage=1;
UPDATE personnage SET dateNaissance = "2001-02-01" WHERE idPersonnage=2;
UPDATE personnage SET dateNaissance = "2002-03-01" WHERE idPersonnage=3;
UPDATE personnage SET dateNaissance = "2003-06-01" WHERE idPersonnage=4;
UPDATE personnage SET dateNaissance = "2001-04-01" WHERE idPersonnage=5;
UPDATE personnage SET dateNaissance = "2007-02-01" WHERE idPersonnage=6;
UPDATE personnage SET dateNaissance = "2003-05-01" WHERE idPersonnage=7;