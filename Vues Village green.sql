-- Vues MySQL

-- Facture

SELECT facture.fac_id, facture.fac_date, facture.fac_adresse, commande.com_id, commande.com_date, clients.cli_id, clients.cli_nom, clients.cli_adresse, clients.cli_contact 
FROM facture
	JOIN commande ON facture.fac_com_id = commande.com_id
	JOIN clients ON commande.com_cli_id = clients.cli_id;

-- Livraison

SELECT livraison.liv_id, commande.com_id, commande.com_date, livraison.liv_date, clients.cli_id, clients.cli_nom, clients.cli_adresse, clients.cli_contact, livraison.liv_adresse
FROM livraison
	JOIN commande_details ON livraison.liv_com_det_id = commande_details.com_det_id
	JOIN commande ON commande_details.com_det_id = commande.com_id
	JOIN clients ON commande.com_cli_id = clients.cli_id;

-- Commande

SELECT commande.com_id, commande.com_date, clients.cli_id, clients.cli_nom, clients.cli_adresse, clients.cli_contact, livraison.liv_adresse, facture.fac_adresse
FROM commande
	JOIN clients ON commande.com_cli_id = clients.cli_id
	JOIN facture ON commande.com_id = facture.fac_com_id
	JOIN commande_details ON commande.com_id = commande_details.com_det_com_id
	JOIN livraison ON commande_details.com_det_id = livraison.liv_com_det_id
ORDER BY commande.com_id asc;

-- Produits/Fournisseur

SELECT produits.pro_libelle, produits.pro_description, produits.pro_photo, produits.pro_prix_HT, produits.pro_stock, produits.pro_reference, fournisseur.four_nom
FROM produits
	JOIN produits_details ON produits_details.pro_det_pro_id = produits.pro_id
	JOIN fournisseur ON fournisseur.four_id = produits_details.pro_det_four_id
GROUP BY produits.pro_id