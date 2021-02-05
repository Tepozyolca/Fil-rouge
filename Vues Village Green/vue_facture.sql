-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 02 fév. 2021 à 14:46
-- Version du serveur :  5.7.31-log
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `green village`
--

-- --------------------------------------------------------

--
-- Structure de la vue `vue facture`
--

DROP VIEW IF EXISTS `vue facture`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vue facture`  
	AS  select `facture`.`Fac_id` 
		AS `fac_id`,`commande`.`Com_id` 
		AS `com_id`,`commande`.`Com_date` 
		AS `com_date`,`facture`.`Fac_date` 
		AS `fac_date`,`clients`.`Cli_id` 
		AS `cli_id`,`clients`.`Cli_nom` 
		AS `cli_nom`,`clients`.`Cli_adresse` 
		AS `cli_adresse`,`clients`.`Cli_contact` 
		AS `cli_contact`,`facture`.`Fac_adresse` 
		AS `fac_adresse` 
	from ((`facture` join `commande` on((`facture`.`Fac_Com_id` = `commande`.`Com_id`))) join `clients` on((`commande`.`Com_Cli_id` = `clients`.`Cli_id`))) 
	where 1 order by `facture`.`Fac_id` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
