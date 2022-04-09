-- Récupérer toutes les armes existantes
SELECT * FROM arme;

-- Nombre de personnages
SELECT COUNT(*) AS "Nombre de personnages"
FROM personnage;

-- Récupérer la moyenne des niveaux des personnages du jeu
SELECT AVG(level) AS "Moyenne de niveau"
FROM personnage;

-- Somme des points de force, d'agilité et d'intel
SELECT SUM(baseForce) AS "Somme force", SUM(baseAgi) AS "Somme agilité", SUM(baseIntel) AS "Somme Intel"
FROM classe;