-- Récupérer les attaques de tous les personnages ordonnées par perso
SELECT p.nom, p.surnom, p.level, a.nom, a.baseDegat
FROM attaque AS a INNER JOIN utilise AS u ON a.idAttaque = u.idAttaque
INNER JOIN personnage AS p ON p.idPersonnage = u.idPersonnage
ORDER BY p.idPersonnage

-- Pour chaque perso utilisant l'attaque 1, afficher le level utilisé
SELECT p.nom, u.levelAttaque
FROM personnage AS p INNER JOIN utilise AS u ON p.idPersonnage = u.idPersonnage
INNER JOIN attaque AS a ON a.idAttaque = u.idAttaque
WHERE a.nom = "attaque1"

-- Toutes les infos du perso wawaf
SELECT p.nom AS "Nom Personnage", c.nom AS "Classe", a.nom AS "Arme utilisée", t.libelle AS "Type arme utilisée", att.nom AS "Nom attaque", a2.nom AS "Arme dispose", t2.libelle AS "Type arme"
FROM personnage AS p INNER JOIN classe AS c ON p.idClasse = c.idClasse
INNER JOIN arme AS a ON p.idArmeUtilise = a.idArme
INNER JOIN typearme AS t ON t.idTypeArme = a.idTypeArme
INNER JOIN utilise AS u ON u.idPersonnage = p.idPersonnage
INNER JOIN attaque AS att ON att.idAttaque = u.idAttaque
INNER JOIN dispose AS d ON p.idPersonnage = d.idPersonnage
INNER JOIN arme AS a2 ON a2.idArme = d.idArme
INNER JOIN typearme AS t2 ON t2.idTypeArme = a2.idTypeArme
WHERE p.nom = "wawaf"
ORDER BY att.nom, a2.nom;

-- Moyenne des attaques de tous les joueurs
SELECT p.nom AS "Perso",c.nom AS "Classe" , AVG(a.baseDegat) AS "Moy Attaques"
FROM personnage as p INNER JOIN utilise AS u ON p.idPersonnage = u.idPersonnage
INNER JOIN attaque AS a ON a.idAttaque = u.idAttaque
INNER JOIN classe AS c ON c.idClasse = p.idClasse
GROUP BY p.nom, c.nom

-- Récupérer tous les personnages et pour chacun récupérer les attaque et afficher que les lignes 3 à 5
SELECT p.idPersonnage, p.nom AS "Perso", a.nom AS "Attaque"
FROM personnage as p LEFT JOIN utilise AS u ON p.idPersonnage = u.idPersonnage
LEFT JOIN attaque AS a ON a.idAttaque = u.idAttaque
LEFT JOIN classe AS c ON c.idClasse = p.idClasse
LIMIT 3 OFFSET 2

-- Afficher toutes les attaques des personnages utilisant des armes à distance
SELECT p.nom AS "Perso", att.nom AS "Attaque", att.baseDegat, a.nom AS "Arme"
FROM personnage AS p INNER JOIN utilise AS u ON u.idPersonnage = p.idPersonnage
INNER JOIN attaque AS att ON att.idAttaque = u.idAttaque
INNER JOIN arme AS a ON a.idArme = p.idArmeUtilise
INNER JOIN typearme AS t ON t.idTypeArme = a.idTypeArme
WHERE t.estDistance = 1

-- Récupérer le plus haut level d'utilisation de l'attaque 1
SELECT MAX(u.levelAttaque)
FROM attaque AS a INNER JOIN utilise AS u ON a.idAttaque = u.idAttaque
WHERE a.nom = "attaque1"

-- Récupérer le perso utilisant l'attaque 1 avec le level le plus haut
SELECT p.nom, a.nom, u.levelAttaque
FROM personnage AS p INNER JOIN utilise AS u ON p.idPersonnage = u.idPersonnage
INNER JOIN attaque AS a ON a.idAttaque = u.idAttaque
WHERE a.nom = "attaque1"
AND levelAttaque = (
    SELECT MAX(u.levelAttaque)
FROM attaque AS a INNER JOIN utilise AS u ON a.idAttaque = u.idAttaque
WHERE a.nom = "attaque1"
)

-- Calculer le nombre de dégats que fait chaque personnage (degat * (0,5 * level perso))
SELECT p.nom, a.nom, a.degat * (0.5 * p.level) AS "Degat par attaque"
FROM personnage AS p INNER JOIN arme AS a ON a.idArme = p.idArmeUtilise
ORDER BY degat DESC

-- Récupérer le nb de perso faisant moins de 100 de dégat
SELECT p.nom, a.nom, a.degat * (0.5 * p.level) AS "Degat"
FROM personnage AS p INNER JOIN arme AS a ON a.idArme = p.idArmeUtilise
HAVING Degat < 100
ORDER BY degat DESC

-- Nombre de lignes dans la table 'utilise'
SELECT COUNT(*) AS "nb d'attaques"
FROM utilise