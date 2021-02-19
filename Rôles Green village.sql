CREATE ROLE 'r_Green_village_visiteur'@'localhost', 'r_Green_village_client'@'localhost', 'r_Green_village_gestion'@'localhost', 'r_Green_village_administrateur'@'localhost', 'r_Green_village_développeur'@'localhost'

-- Privilèges pour `Administrateur'

GRANT SELECT, INSERT, UPDATE, DELETE, SHOW DATABASES, SUPER, SHOW VIEW ON green village.* TO 'Admin'@'localhost';

-- Privilèges pour `Client`

GRANT SELECT (clients.Cli_nom, clients.Cli_adr, clients.Cli_cont), 
	INSERT (clients.Cli_nom, clients.Cli_adr, clients.Cli_cont), 
	UPDATE (clients.Cli_nom, clients.Cli_adr, clients.Cli_cont), 
	REFERENCES (clients.Cli_nom, clients.Cli_adr, clients.Cli_cont), 
	SHOW VIEW ON `green village`.`clients` TO 'Client'@'localhost';

-- Privilèges pour `Développeur`

GRANT ALL PRIVILEGES ON green village.* TO 'Développeur'@'localhost' WITH GRANT OPTION;

-- Privilèges pour `Gestionnaire`

GRANT SELECT, UPDATE ON green village.* TO 'Gestionnaire'@'localhost';

-- Privilèges pour 'Visiteurs'

GRANT SELECT, SHOW VIEW ON green village.produits TO 'r_Green_village_visiteur'@'localhost';
