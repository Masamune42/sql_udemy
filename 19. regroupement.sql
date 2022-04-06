-- Nombre de personnage par classe
-- SELECT c.nom AS "Classe", c.description, COUNT(*) AS "Nb personnages"
-- FROM classe AS c
-- LEFT JOIN personnage AS p
-- ON c.idClasse = p.idClasse
-- GROUP BY c.nom

-- Nombre d'armes dont dispose chaque personnage
-- SELECT p.nom, COUNT(*) AS "Nb armes"
-- FROM personnage AS p
-- LEFT JOIN dispose AS d ON d.idPersonnage = p.idPersonnage
-- LEFT JOIN arme AS a ON d.idArme = a.idArme
-- GROUP BY p.nom

-- Nombre d'armes dont dispose chaque personnage / uniquement les guerriers
-- SELECT p.nom, COUNT(*) AS "Nb armes"
-- FROM personnage AS p
-- LEFT JOIN dispose AS d ON d.idPersonnage = p.idPersonnage
-- LEFT JOIN arme AS a ON d.idArme = a.idArme
-- LEFT JOIN classe AS c ON c.idClasse = p.idClasse
-- WHERE c.nom = "guerrier"
-- GROUP BY p.nom

-- Nombre de personnages par arme
-- COUNT(p.idPersonnage) => éviter les * dans les COUNT() et préciser sur quoi on veut compter
-- SELECT a.nom, COUNT(p.idPersonnage) AS "Nb d'armes"
-- FROM arme AS a
-- LEFT JOIN dispose AS d ON d.idArme = a.idArme
-- LEFT JOIN personnage AS p ON d.idPersonnage = p.idPersonnage
-- GROUP BY a.nom

-- NIveau moyen de chaque classe
SELECT c.nom AS "Classe", AVG(p.level) AS "Niveau Moyen"
FROM classe c
INNER JOIN personnage AS p ON c.idClasse = p.idClasse
GROUP BY c.nom