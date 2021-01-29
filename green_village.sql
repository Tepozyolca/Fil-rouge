-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 29 jan. 2021 à 11:09
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
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`Cat_id`, `Cat_nom`, `SCat_id`) VALUES
(1, 'batteries', NULL),
(2, 'cables', NULL),
(3, 'cases', NULL),
(4, 'guitares', NULL),
(5, 'micros', NULL),
(6, 'pianos', NULL),
(7, 'saxophones', NULL),
(8, 'sonos', NULL),
(9, 'accessoires', NULL);

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
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`Cli_id`, `Cli_nom`, `Cli_adresse`, `Cli_contact`, `Cli_coefficient`, `Cli_catégorie`, `Cli_reference`, `Cli_Emp_id`) VALUES
(111, 'Mark', 'Ap #409-6193 Convallis St.', 'dolor.tempus@semperauctor.net', 0, 'Professionnel', '0', 7),
(112, 'Kaye', '7639 Scelerisque Road', 'mauris@Crasloremlorem.org', 0, 'Professionnel', '0', 8),
(113, 'Alvin', '823-2314 Vel Ave', 'mauris@parturientmontes.org', 0, 'Professionnel', '0', 7),
(114, 'Quemby', '9049 Nec Ave', 'laoreet.posuere@eutempor.ca', 0, 'Professionnel', '0', 5),
(115, 'Roth', '6765 Blandit Rd.', 'velit.dui@congueIn.co.uk', 0, 'Particulier', '0', 3),
(116, 'Tana', 'Ap #279-6498 Amet Av.', 'Sed@arcu.co.uk', 0, 'Particulier', '0', 10),
(117, 'Bradley', 'P.O. Box 678, 356 Ut St.', 'blandit@pede.org', 0, 'Professionnel', '0', 3),
(118, 'Eden', 'Ap #326-4445 A, Road', 'diam.at@consectetuermauris.edu', 0, 'Professionnel', '0', 6),
(119, 'Owen', 'P.O. Box 681, 9186 Luctus Rd.', 'quam.vel@Nullam.com', 0, 'Professionnel', '0', 3),
(120, 'Audrey', 'P.O. Box 772, 3852 Magna St.', 'Mauris.ut@loremeget.edu', 0, 'Professionnel', '0', 2);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `Com_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Com_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Com_reduction` decimal(10,0) UNSIGNED NOT NULL DEFAULT '0',
  `Com_Cli_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`Com_id`),
  KEY `Com_Cli_id` (`Com_Cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`Com_id`, `Com_date`, `Com_reduction`, `Com_Cli_id`) VALUES
(11, '2017-07-29 06:24:55', '23', 118),
(12, '2017-06-21 23:01:56', '7', 119),
(13, '2016-12-05 19:12:14', '28', 120),
(14, '2017-02-02 22:31:34', '11', 111),
(15, '2019-07-24 02:28:16', '2', 117),
(16, '2019-05-04 13:57:39', '0', 111),
(17, '2015-10-28 14:38:07', '1', 117),
(18, '2015-02-24 18:50:38', '16', 120),
(19, '2021-03-04 18:32:56', '26', 118),
(20, '2015-06-03 20:46:55', '12', 111);

-- --------------------------------------------------------

--
-- Structure de la table `com_details`
--

DROP TABLE IF EXISTS `com_details`;
CREATE TABLE IF NOT EXISTS `com_details` (
  `Com_det_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Com_det_com_id` int(11) UNSIGNED NOT NULL,
  `Com_det_pro_id` int(11) UNSIGNED NOT NULL,
  `Com_det_quantite` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `Com_det_taxe` decimal(10,0) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`Com_det_id`),
  KEY `Com_det_com_id` (`Com_det_com_id`),
  KEY `Com_det_pro_id` (`Com_det_pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

DROP TABLE IF EXISTS `employes`;
CREATE TABLE IF NOT EXISTS `employes` (
  `Emp_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `employes`
--

INSERT INTO `employes` (`Emp_id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `Fac_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Fac_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fac_adresse` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fac_edit` tinyint(1) NOT NULL DEFAULT '0',
  `fac_date_edit` datetime DEFAULT NULL,
  `Fac_date_paie` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fac_paie` decimal(10,0) UNSIGNED NOT NULL,
  `Fac_Com_id` int(11) UNSIGNED NOT NULL,
  `Fac_statut_paiment` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Fac_id`),
  KEY `Fac_Com_id` (`Fac_Com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `Four_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Four_statut` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Constructeur',
  PRIMARY KEY (`Four_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `Liv_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Liv_date` date NOT NULL,
  `Liv_adresse` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Liv_Com_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`Liv_id`),
  KEY `Liv_Com_id` (`Liv_Com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `Pro_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Pro_libelle` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pro_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pro_prix_HT` decimal(10,0) UNSIGNED NOT NULL DEFAULT '0',
  `Pro_photo` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pro_stock` int(11) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`Pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`Pro_id`, `Pro_libelle`, `Pro_description`, `Pro_prix_HT`, `Pro_photo`, `Pro_stock`) VALUES
(11, 'aliquam,', 'fringilla cursus purus. Nullam scelerisque', '1020', '.jpeg', 2278),
(12, 'sagittis', 'eu arcu. Morbi sit amet massa. Quisque', '28', '.jpeg', 1612),
(13, 'arcu', 'eu, odio. Phasellus at augue id ante dictum cursus.', '356', '.jpeg', 1047),
(14, 'ultricies', 'faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.', '1975', '.png', 1223),
(15, 'Aliquam', 'Aliquam rutrum lorem ac risus. Morbi', '887', '.jpeg', 2143),
(16, 'semper', 'Aliquam nec enim. Nunc ut erat. Sed', '1936', '.jpeg', 2424),
(17, 'sollicitudin', 'faucibus orci luctus', '1683', '.jpeg', 2310),
(18, 'vitae', 'varius et, euismod et, commodo at, libero. Morbi accumsan laoreet', '467', '.jpeg', 382),
(19, 'Cras', 'amet orci. Ut sagittis lobortis', '2209', '.png', 507),
(20, 'massa.', 'consectetuer rhoncus. Nullam velit dui, semper', '2158', '.jpeg', 1830);

-- --------------------------------------------------------

--
-- Structure de la table `pro_details`
--

DROP TABLE IF EXISTS `pro_details`;
CREATE TABLE IF NOT EXISTS `pro_details` (
  `Pro_details_id` int(11) UNSIGNED NOT NULL,
  `Pro_details_pro_id` int(11) UNSIGNED NOT NULL,
  `Pro_details_Cat_id` int(11) UNSIGNED NOT NULL,
  `Pro_details_Four_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`Pro_details_id`),
  KEY `Pro_details_pro_id` (`Pro_details_pro_id`),
  KEY `Pro_details_Four_id` (`Pro_details_Four_id`),
  KEY `Pro_Cat_id` (`Pro_details_Cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `Client_employé` FOREIGN KEY (`Cli_Emp_id`) REFERENCES `employes` (`Emp_id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `Commande_client` FOREIGN KEY (`Com_Cli_id`) REFERENCES `clients` (`Cli_id`);

--
-- Contraintes pour la table `com_details`
--
ALTER TABLE `com_details`
  ADD CONSTRAINT `Commande_detail_commande` FOREIGN KEY (`Com_det_com_id`) REFERENCES `commande` (`Com_id`),
  ADD CONSTRAINT `Commande_detail_produits` FOREIGN KEY (`Com_det_pro_id`) REFERENCES `produits` (`Pro_id`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `Facture_commande` FOREIGN KEY (`Fac_Com_id`) REFERENCES `commande` (`Com_id`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `Livraison_commande` FOREIGN KEY (`Liv_Com_id`) REFERENCES `commande` (`Com_id`);

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
