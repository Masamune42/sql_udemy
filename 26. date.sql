SELECT *
FROM personnage AS p
WHERE p.dateNaissance > "2002-01-01";

-- Récupérer l'age de chaque personnage
SELECT nom, DATEDIFF(now(), dateNaissance)/365 AS "AGE"
FROM personnage;

SELECT nom, CONVERT(DATEDIFF(now(), dateNaissance)/365, INT) AS "AGE"
FROM personnage;

-- Calculer la moyenne d'age des personnages
SELECT AVG(DATEDIFF(now(), dateNaissance)/365) AS "Moyenne d'age"
FROM personnage;
-- OU
SELECT AVG(date1.AGE)
FROM
(
    SELECT nom, DATEDIFF(now(), dateNaissance)/365 AS "AGE"
    FROM personnage
) AS date1

-- Récupérer les personnages ayant plus de 17 ans
SELECT nom, DATEDIFF(now(), dateNaissance)/365 AS "AGE"
FROM personnage
WHERE DATEDIFF(now(), dateNaissance)/365 > 17;
-- OU
SELECT date1.nom, date1.AGE
FROM
(
    SELECT nom, DATEDIFF(now(), dateNaissance)/365 AS "AGE"
    FROM personnage
) AS date1
WHERE date1.AGE > 17
