-- Armes à distances, récupérer le nombre max d'occurrence du type d'arme
-- SELECT MAX(valeur) AS "NB d'arme max à distance"
-- FROM(
--     SELECT COUNT(*) AS "valeur"
--     FROM arme a
--     INNER JOIN typearme t ON t.idTypeArme = a.idTypeArme
--     WHERE t.estDistance = true
--     GROUP BY t.libelle
-- ) AS v

-- Récupére les types d'armes ayant le nombre égal d'occurrence de la précédente requête
-- Ne marche pas avec SQLtools
-- SELECT t.libelle AS "Type Arme", COUNT(*) AS "Nombre d'Arme"
-- FROM typearme AS t
-- INNER JOIN arme AS a ON t.idTypeArme = a.idTypeArme
-- GROUP BY t.libelle
-- HAVING COUNT(*) = (
--     SELECT MAX(valeur) AS "NB d'arme max à distance"
--     FROM(
--         SELECT COUNT(*) AS "valeur"
--         FROM arme a
--         INNER JOIN typearme t ON t.idTypeArme = a.idTypeArme
--         WHERE t.estDistance = true
--         GROUP BY t.libelle
--     ) AS v
-- )

-- Récupère les armes ayant un nombre de dégats supérieur au nombre de dégats des arcs
-- SELECT *
-- FROM arme AS a
-- WHERE a.degat > ALL(
--     SELECT a.degat
--     FROM arme AS a INNER JOIN typearme AS t on t.idTypeArme = a.idTypeArme
--     WHERE t.libelle = "Arc"
-- )

-- Récupérer les armes au corps à corps sans jointure
-- SELECT *
-- FROM arme
-- WHERE idTypeArme IN (
--     SELECT t.idTypeArme
--     FROM typearme AS t
--     WHERE t.estDistance = false
-- )
-- Equivalent avec jointure
SELECT *
FROM arme AS a
INNER JOIN typearme AS t ON a.idTypeArme = t.idTypeArme
WHERE t.estDistance = false