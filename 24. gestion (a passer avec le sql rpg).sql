-- Création de la table attaque
CREATE TABLE attaque (
    idAttaque INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(60)
);

-- Quelques requêtes à tester
ALTER TABLE attaque
ADD baseDegat INT,
ADD test TINYINT;

ALTER TABLE attaque
MODIFY test VARCHAR(50);

ALTER TABLE attaque
CHANGE test toto INT;

ALTER TABLE attaque
DROP toto;

-- Création table utilise
CREATE TABLE utilise (
    idAttaque INT NOT NULL,
    idPersonnage INT NOT NULL,
    levelAttaque INT,
    PRIMARY KEY (idAttaque, idPersonnage),
    CONSTRAINT FK_ATTAQUE_UTILISE FOREIGN KEY (idAttaque) REFERENCES attaque(idAttaque),
    CONSTRAINT FK_PERSONNAGE_UTILISE FOREIGN KEY (idPersonnage) REFERENCES personnage(idPersonnage)
);