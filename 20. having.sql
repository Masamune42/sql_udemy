-- Nombre de personnages par arme entre 1 et 2
-- SELECT a.nom, COUNT(p.idPersonnage) AS "Nb d'armes"
-- FROM arme AS a
-- LEFT JOIN dispose AS d ON d.idArme = a.idArme
-- LEFT JOIN personnage AS p ON d.idPersonnage = p.idPersonnage
-- GROUP BY a.nom
-- HAVING COUNT(p.idPersonnage) BETWEEN 1 AND 2;

-- Armes de corps à crops par type présentes 1 fois max
SELECT t.libelle AS "Type", COUNT(a.idArme) AS "Nb Arme"
FROM typearme AS t
LEFT JOIN arme a ON t.idTypeArme = a.idTypeArme
WHERE t.estDistance = false
GROUP BY t.libelle
HAVING COUNT(a.idArme) <= 1