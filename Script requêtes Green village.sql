-- Script requêtes

-- Liste des livraisons incomplètes

SELECT commande.com_id, commande.com_date AS 'date de commande', clients.cli_id AS 'numéro client', clients.cli_nom AS 'nom du client'
FROM commande 
	JOIN clients    
	
WHERE commande.com_cli_id = clients.Cli_id 
	AND commande.com_livree = 0
ORDER BY `com_id` ASC

SELECT sum(produits.pro_prix_HT*commande_details.com_det_quantite) AS 'total hors taxes', sum(produits.pro_prix_HT*commande_details.com_det_quantite*commande_details.com_det_taxe/100) AS 'TVA', sum(produits.pro_prix_HT*commande_details.com_det_quantite*(1+commande_details.com_det_taxe/100)) as 'total TTC'
FROM produits
	JOIN commande_details ON produits.pro_id = com_det_pro_id
	JOIN commande ON  commande.com_id = com_det_com_id
	
WHERE commande_details.com_det_pro_id = produits.pro_id
	AND commande_details.com_det_com_id = commande.com_id
	
-- Chiffre d'affaire HT

	-- Pour l'ensemble
	
	SELECT sum(produits.pro_prix_HT*commande_details.com_det_quantite) as 'total hors taxes'
	FROM produits
		JOIN commande_details
		
	--¨Par fournisseur
	
	SELECT fournisseur.four_nom AS 'Fournisseur', sum(produits.pro_prix_HT*commande_details.com_det_quantite) AS 'total hors taxes'
	FROM produits
		JOIN commande_details
		JOIN produits_details ON produits_details.pro_det_pro_id = produits.pro_id
		JOIN fournisseur ON fournisseur.four_id = pro_det_four_id
	GROUP BY fournisseur.four_id
	
	-- Par type de client
	
	SELECT clients.cli_categorie AS 'categorie client', sum(produits.pro_prix_HT*commande_details.com_det_quantite) AS 'total hors taxes'
	FROM produits
		JOIN commande_details
		JOIN commande
		JOIN clients
	GROUP BY clients.cli_categorie
	
-- Liste commande client

SELECT commande.com_date AS 'Date commande', clients.cli_reference AS 'Reference client', sum(produits.pro_prix_HT*commande_details.com_det_quantite) AS 'total hors taxes', commande.com_livree AS 'Etat de la commande'
FROM clients
	JOIN commande
	JOIN produits
	JOIN commande_details 
	
WHERE commande.com_cli_id = clients.Cli_id 
	AND commande.com_id = com_det_com_id
GROUP BY commande.com_id
ORDER BY `Reference client` ASC

-- 

DELIMITER |

DROP PROCEDURE IF EXISTS `Liste_commande_client`|
CREATE PROCEDURE Liste_commande_client(IN p_cli_reference VARCHAR(6))

BEGIN

SELECT commande.com_date AS 'Date commande', clients.cli_reference AS 'Reference client', sum(produits.pro_prix_HT*commande_details.com_det_quantite) AS 'total hors taxes', commande.com_livree AS 'Etat de la commande'
FROM clients
	JOIN commande
	JOIN produits
	JOIN commande_details 
	
WHERE commande.com_cli_id = clients.Cli_id 
	AND commande.com_id = com_det_com_id
	AND clients.cli_reference = p_cli_reference
GROUP BY commande.com_id
ORDER BY `Reference client` ASC;

	END |
	
DELIMITER ;

-- Liste produits commandés par année

SELECT produits.pro_reference AS 'reference produit', produits.pro_libelle AS 'nom du produit', sum(commande_details.com_det_quantite) AS 'quantité commandée', fournisseur.four_nom AS 'Nom du fournisseur'
FROM produits
	JOIN commande_details ON produits.pro_id = commande_details.com_det_pro_id
	JOIN produits_details
	JOIN fournisseur
	JOIN commande
	
WHERE produits_details.pro_det_four_id = fournisseur.four_id
	AND produits_details.pro_det_pro_id = produits.pro_id
	AND commande.com_id = commande_details.com_det_com_id
GROUP BY produits.pro_reference
ORDER BY `Nom du fournisseur` ASC;

-- 

DELIMITER |

DROP PROCEDURE IF EXISTS `Liste_produits_commandés_annuel`|
CREATE PROCEDURE Liste_produits_commandés_annuel(IN p_annee INT(4))

BEGIN

SELECT produits.pro_reference AS 'reference produit', produits.pro_libelle AS 'nom du produit', sum(commande_details.com_det_quantite) AS 'quantité commandée', fournisseur.four_nom AS 'Nom du fournisseur'
FROM produits
	JOIN commande_details ON produits.pro_id = commande_details.com_det_pro_id
	JOIN produits_details
	JOIN fournisseur
	JOIN commande
	
WHERE produits_details.pro_det_four_id = fournisseur.four_id
	AND produits_details.pro_det_pro_id = produits.pro_id
	AND commande.com_id = commande_details.com_det_com_id
	AND LEFT(commande.com_date, 4) = p_annee
GROUP BY produits.pro_reference
ORDER BY `Nom du fournisseur` ASC;

	END |

DELIMITER ;

-- Délai moyen des commandes

DELIMITER |

DROP PROCEDURE IF EXISTS `Delai_moyen_commandes`|
CREATE PROCEDURE Delai_moyen_commandes()

BEGIN

SELECT AVG(DATEDIFF(facture.fac_date, commande.com_date)) AS 'Délai moyen'
FROM commande
	JOIN facture
	
WHERE commande.com_id = facture.fac_com_id;

	END |

DELIMITER ;
