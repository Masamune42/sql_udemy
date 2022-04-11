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