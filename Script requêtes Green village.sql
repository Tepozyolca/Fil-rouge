-- Script requêtes

-- Liste des livraisons incomplètes

SELECT commande.com_id, commande.com_date as 'date de commande', clients.cli_id as 'numéro client', clients.cli_nom as 'nom du client'
FROM commande 
	JOIN clients    
WHERE commande.com_cli_id = clients.Cli_id 
	AND commande.com_livree = 0
ORDER BY `com_id` ASC

SELECT sum(produits.pro_prix_HT*commande_details.com_det_quantite) as 'total hors taxes', sum(produits.pro_prix_HT*commande_details.com_det_quantite*commande_details.com_det_taxe/100) as 'TVA', sum(produits.pro_prix_HT*commande_details.com_det_quantite*(1+commande_details.com_det_taxe/100)) as 'total TTC'
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
	
	SELECT fournisseur.four_nom as 'Fournisseur', sum(produits.pro_prix_HT*commande_details.com_det_quantite) as 'total hors taxes'
	FROM produits
		JOIN commande_details
		JOIN produits_details ON produits_details.pro_det_pro_id = produits.pro_id
		JOIN fournisseur ON fournisseur.four_id = pro_det_four_id
	GROUP BY fournisseur.four_id
	
-- Liste commande client
