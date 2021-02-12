-- Vues MySQL

-- Facture

CREATE VIEW Bon_facture
AS
SELECT facture.fac_id, facture.fac_date, facture.fac_adresse, commande.com_id, commande.com_date, clients.cli_id, clients.cli_nom, clients.cli_adresse, clients.cli_contact 
FROM facture
	JOIN commande ON facture.fac_com_id = commande.com_id
	JOIN clients ON commande.com_cli_id = clients.cli_id;

-- Livraison

CREATE VIEW Bon_livraison
AS
SELECT livraison.liv_id, commande.com_id, commande.com_date, livraison.liv_date, clients.cli_id, clients.cli_nom, clients.cli_adresse, clients.cli_contact, livraison.liv_adresse
FROM livraison
	JOIN commande_details ON livraison.liv_com_det_id = commande_details.com_det_id
	JOIN commande ON commande_details.com_det_id = commande.com_id
	JOIN clients ON commande.com_cli_id = clients.cli_id;

-- Commande

CREATE VIEW Bon_commande
AS
SELECT commande.com_id, commande.com_date as 'date de commande', clients.cli_id as 'numéro client', clients.cli_nom as 'nom du client', clients.cli_adresse as 'adresse du client', clients.cli_contact as 'détails contact du client', facture.fac_adresse AS 'adresse de facturation'
FROM commande 
	JOIN clients 
    JOIN facture
    
WHERE commande.com_cli_id = clients.Cli_id  
	AND commande.com_id = facture.fac_com_id
ORDER BY `com_id` ASC

-- 

SELECT commande.com_id, commande.com_date as 'date de commande', clients.cli_id as 'numéro client', clients.cli_nom as 'nom du client', clients.cli_adresse as 'adresse du client', clients.cli_contact as 'détails contact du client', facture.fac_adresse AS 'adresse de facturation', livraison.Liv_adresse AS 'adresse de livraison'
FROM commande 
	JOIN clients 
    JOIN facture
    JOIN commande_details ON commande_details.Com_det_com_id = commande.Com_id
    JOIN livraison ON livraison.Liv_Com_det_id = commande_details.Com_det_id
    
WHERE commande.com_cli_id = clients.Cli_id  
	AND commande.com_id = facture.fac_com_id
    AND commande.com_id IN
    	(SELECT commande_details.Com_det_com_id FROM commande_details WHERE commande.com_id = commande_details.Com_det_com_id)
    AND commande_details.Com_det_id IN
    	(SELECT livraison.Liv_Com_det_id FROM livraison WHERE commande_details.com_det_id = livraison.Liv_Com_det_id)
ORDER BY `com_id` ASC

-- Produits/Fournisseur

DELIMITER |

CREATE PROCEDURE Reference_produits_fournisseurs()

BEGIN
	SELECT produits.pro_libelle, produits.pro_description, produits.pro_photo, produits.pro_prix_HT, produits.pro_stock, produits.pro_reference, fournisseur.four_nom
	FROM produits
		JOIN produits_details ON produits_details.pro_det_pro_id = produits.pro_id
		JOIN fournisseur ON fournisseur.four_id = produits_details.pro_det_four_id
	WHERE produits.pro_id IN
		(SELECT produits_details.pro_det_pro_id FROM produits_details WHERE produits_details.pro_det_pro_id = produits.pro_id)	
		AND fournisseur.four_id IN 
		(SELECT produits_details.pro_det_four_id FROM produits_details WHERE produits_details.Pro_det_Four_id = fournisseur.Four_id)		
	END |

DELIMITER ;