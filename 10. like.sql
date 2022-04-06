-- On récupère les lignes où le nom de l'arme comment par a, une lettre et un b
SELECT *
FROM arme
WHERE nom LIKE 'a_b%';