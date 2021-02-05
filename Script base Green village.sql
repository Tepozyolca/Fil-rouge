-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 28 jan. 2021 à 08:22
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
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `Cli_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Cli_nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cli_adresse` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cli_contact` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cli_coefficient` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `Cli_catégorie` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Professionnel',
  `Cli_reference` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cli_Emp_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`Cli_id`),
  KEY `Cli_Emp_id` (`Cli_Emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `Client_employé` FOREIGN KEY (`Cli_Emp_id`) REFERENCES `employes` (`Emp_id`);
COMMIT;


--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `Cat_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Cat_nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCat_id` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`Cat_id`),
  KEY `SCat_id` (`SCat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `Com_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Com_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Com_reduction` decimal(4,2) UNSIGNED NOT NULL DEFAULT '0',
  `Com_Cli_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`Com_id`),
  KEY `Com_Cli_id` (`Com_Cli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `Commande_client` FOREIGN KEY (`Com_Cli_id`) REFERENCES `clients` (`Cli_id`);
COMMIT;

--
-- Structure de la table `com_details`
--

DROP TABLE IF EXISTS `commande_details`;
CREATE TABLE IF NOT EXISTS `com_details` (
  `Com_det_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Com_det_com_id` int(11) UNSIGNED NOT NULL,
  `Com_det_pro_id` int(11) UNSIGNED NOT NULL,
  `Com_det_quantite` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `Com_det_taxe` decimal(4,2) UNSIGNED NOT NULL DEFAULT '0',
  `Com_det_quantite_livree` int(11) NOT NULL DEFAULT '0',
  `Com_det_livree` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Com_det_id`),
  KEY `Com_det_com_id` (`Com_det_com_id`),
  KEY `Com_det_pro_id` (`Com_det_pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `com_details`
--
ALTER TABLE `com_details`
  ADD CONSTRAINT `Commande_detail_commande` FOREIGN KEY (`Com_det_com_id`) REFERENCES `commande` (`Com_id`),
  ADD CONSTRAINT `Commande_detail_produit` FOREIGN KEY (`Com_det_pro_id`) REFERENCES `produits` (`Pro_id`);
COMMIT;

--
-- Base de données : `green village`
--

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

DROP TABLE IF EXISTS `employes`;
CREATE TABLE IF NOT EXISTS `employes` (
  `Emp_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `Fac_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Fac_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fac_adresse` varchar(250) 
  `Fac_edit` tinyint(1) NOT NULL DEFAULT '0',
  `fac_date_edit` datetime DEFAULT NULL,
  `Fac_date_paie` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fac_paie` decimal(10,2) UNSIGNED NOT NULL,
  `Fac_Com_id` int(11) UNSIGNED NOT NULL,
  `Fac_statut_paiement` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Fac_id`),
  UNIQUE KEY `Fac_Com_id` (`Fac_Com_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `Facture_commande` FOREIGN KEY (`Fac_Com_id`) REFERENCES `commande` (`Com_id`);
COMMIT;

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `Four_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Four_statut` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Constructeur',
  `Four_reference` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Four_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `Liv_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Liv_date` date NOT NULL,
  `Liv_adresse` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Liv_Com_det_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`Liv_id`),
  UNIQUE KEY `Liv_Com_det_id` (`Liv_Com_det_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `Livraison_commande` FOREIGN KEY (`Liv_Com_det_id`) REFERENCES `commande_details` (`Com_det_id`);
COMMIT;

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `Pro_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Pro_libelle` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pro_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pro_prix_HT` decimal(10,2) UNSIGNED NOT NULL,
  `Pro_photo` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pro_stock` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `Pro_reference` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

--
-- Structure de la table `pro_details`
--

DROP TABLE IF EXISTS `produits_details`;
CREATE TABLE IF NOT EXISTS `pro_details` (
  `Pro_det_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Pro_det_pro_id` int(11) UNSIGNED NOT NULL,
  `Pro_det_Cat_id` int(11) UNSIGNED NOT NULL,
  `Pro_det_Four_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`Pro_det_id`),
  KEY `Pro_det_pro_id` (`Pro_det_pro_id`),
  KEY `Pro_det_four_id` (`Pro_det_Four_id`),
  KEY `Pro_det_cat_id` (`Pro_det_Cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pro_details`
--
ALTER TABLE `pro_details`
  ADD CONSTRAINT `Produit_details_catégories` FOREIGN KEY (`Pro_details_Cat_id`) REFERENCES `categories` (`Cat_id`),
  ADD CONSTRAINT `Produit_details_fournisseur` FOREIGN KEY (`Pro_details_Four_id`) REFERENCES `fournisseur` (`Four_id`),
  ADD CONSTRAINT `Produit_details_produits` FOREIGN KEY (`Pro_details_pro_id`) REFERENCES `produits` (`Pro_id`);
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------

--
-- Privilèges pour ``@`%`
--
GRANT SELECT, SHOW VIEW ON *.* TO ''@'%';

GRANT SELECT, SHOW VIEW ON `green village`.* TO ''@'%';

--
-- Privilèges pour `Administrateur`@`%`
--
GRANT SELECT, INSERT, UPDATE, DELETE, SHOW DATABASES, SUPER, SHOW VIEW ON `green village`.* TO 'Admin'@'%';

--
-- Privilèges pour `Client`@`%`
--
GRANT SELECT (Cli_nom, Cli_adr, Cli_cont, Cli_catégorie), INSERT (Cli_nom, Cli_adr, Cli_cont, Cli_catégorie), UPDATE (Cli_nom, Cli_adr, Cli_cont, Cli_catégorie), DELETE, REFERENCES (Cli_nom, Cli_adr, Cli_cont, Cli_catégorie), SHOW VIEW ON `green village`.`clients` TO 'Client'@'%';

--
-- Privilèges pour `Développeur`@`%`
--
GRANT ALL PRIVILEGES ON `green village`.* TO 'Développeur'@'%' WITH GRANT OPTION;

--
-- Privilèges pour `Gestionnaire`@`%`
--
GRANT SELECT, UPDATE ON `green village`.* TO 'Gestionnaire'@'%';
