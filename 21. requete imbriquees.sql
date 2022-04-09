-- Personnages ayant un level inférieur à la moyenne des levels des personnages
SELECT *
FROM personnage AS p
WHERE p.level <
(
    SELECT AVG(level)
    FROM personnage
)

-- Personnages ayant un level supérieur à la moyenne des archers
SELECT *
FROM personnage AS p
WHERE p.level >
(
    SELECT AVG(level)
    FROM personnage AS p
    INNER JOIN classe AS c ON c.idClasse = p.idClasse
    WHERE c.nom = 'archer'
)