-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 05 fév. 2021 à 10:58
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
  `Com_reduction` decimal(4,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `Com_Cli_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`Com_id`),
  KEY `Com_Cli_id` (`Com_Cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`Com_id`, `Com_date`, `Com_reduction`, `Com_Cli_id`) VALUES
(11, '2017-07-29 06:24:55', '23.00', 118),
(12, '2017-06-21 23:01:56', '7.00', 119),
(13, '2016-12-05 19:12:14', '28.00', 120),
(14, '2017-02-02 22:31:34', '11.00', 111),
(15, '2019-07-24 02:28:16', '2.00', 117),
(16, '2019-05-04 13:57:39', '0.00', 111),
(17, '2015-10-28 14:38:07', '1.00', 117),
(18, '2015-02-24 18:50:38', '16.00', 120),
(19, '2021-03-04 18:32:56', '26.00', 118),
(20, '2015-06-03 20:46:55', '12.00', 111);

-- --------------------------------------------------------

--
-- Structure de la table `commande_details`
--

DROP TABLE IF EXISTS `commande_details`;
CREATE TABLE IF NOT EXISTS `commande_details` (
  `Com_det_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Com_det_com_id` int(11) UNSIGNED NOT NULL,
  `Com_det_pro_id` int(11) UNSIGNED NOT NULL,
  `Com_det_quantite` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `Com_det_taxe` decimal(4,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `Com_det_quantite_livree` int(11) NOT NULL DEFAULT '0',
  `Com_det_livree` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Com_det_id`),
  KEY `Com_det_com_id` (`Com_det_com_id`),
  KEY `Com_det_pro_id` (`Com_det_pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande_details`
--

INSERT INTO `commande_details` (`Com_det_id`, `Com_det_com_id`, `Com_det_pro_id`, `Com_det_quantite`, `Com_det_taxe`, `Com_det_quantite_livree`, `Com_det_livree`) VALUES
(1, 12, 18, 10, '2.00', 7, 1),
(2, 19, 14, 9, '2.00', 8, 1),
(3, 14, 15, 10, '8.00', 1, 0),
(4, 12, 11, 7, '5.00', 10, 0),
(5, 18, 19, 3, '3.00', 3, 1),
(6, 18, 18, 1, '7.00', 2, 1),
(7, 12, 17, 10, '8.00', 10, 1),
(8, 20, 15, 9, '7.00', 3, 1),
(9, 13, 17, 10, '9.00', 9, 0),
(10, 11, 15, 10, '6.00', 2, 1),
(11, 11, 14, 6, '9.11', 9, 1),
(12, 17, 11, 3, '1.86', 9, 0),
(13, 19, 17, 2, '4.48', 10, 0),
(14, 15, 13, 1, '9.35', 1, 0),
(15, 20, 17, 8, '3.40', 8, 1),
(16, 17, 14, 4, '4.92', 3, 0),
(17, 20, 20, 1, '5.10', 8, 1),
(18, 12, 19, 4, '9.70', 6, 1),
(19, 14, 12, 3, '0.37', 7, 1),
(20, 13, 12, 4, '9.69', 10, 1);

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
  `Fac_paie` decimal(10,2) UNSIGNED NOT NULL,
  `Fac_Com_id` int(11) UNSIGNED NOT NULL,
  `Fac_statut_paiment` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Fac_id`),
  UNIQUE KEY `Fac_Com_id` (`Fac_Com_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`Fac_id`, `Fac_date`, `Fac_adresse`, `Fac_edit`, `fac_date_edit`, `Fac_date_paie`, `Fac_paie`, `Fac_Com_id`, `Fac_statut_paiment`) VALUES
(2, '2019-03-29 00:00:00', 'P.O. Box 469, 7244 Etiam St.', 0, '2018-03-26 22:56:20', '2018-09-03 00:00:00', '5.22', 16, 'Différé'),
(4, '2017-03-04 00:00:00', 'P.O. Box 189, 6981 Justo St.', 1, '2015-08-23 23:27:00', '2017-09-01 00:00:00', '6.95', 13, 'Différé'),
(7, '2017-10-01 00:00:00', '7521 Ultrices Avenue', 1, '2020-12-25 04:52:44', '2021-10-07 00:00:00', '9.05', 11, 'Dû'),
(15, '2019-08-25 00:00:00', '502-8438 Amet, Av.', 0, '2015-10-20 01:27:17', '2017-08-22 00:00:00', '9.27', 12, 'Différé'),
(16, '2017-08-29 00:00:00', '116-8701 Gravida Av.', 0, '2021-01-12 13:59:59', '2019-04-14 00:00:00', '9.46', 17, 'Dû'),
(19, '2021-11-18 00:00:00', '1267 Bibendum Av.', 0, '2019-03-03 17:17:45', '2016-06-08 00:00:00', '5.29', 18, 'Différé'),
(21, '2021-09-01 00:00:00', 'P.O. Box 850, 2824 Etiam Road', 0, '2015-10-26 13:40:54', '2020-08-06 00:00:00', '3.45', 14, 'Différé'),
(23, '2016-06-12 00:00:00', '440-8117 Amet Street', 0, '2018-12-09 12:04:08', '2018-11-14 00:00:00', '3.47', 15, 'Dû'),
(24, '2015-11-19 00:00:00', 'Ap #567-9901 Donec Ave', 1, '2020-08-26 05:59:57', '2018-07-05 00:00:00', '2.35', 19, 'Dû'),
(26, '2018-12-29 00:00:00', '244-8918 Nunc Rd.', 0, '2017-12-18 18:05:40', '2017-08-26 00:00:00', '9.49', 20, 'Dû');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `Four_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Four_statut` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Constructeur',
  `Four_nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Four_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`Four_id`, `Four_statut`, `Four_nom`) VALUES
(1, 'constructeur', 'Construct\'musique'),
(2, 'importateur', 'De la note au salon');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `jonction produits/fournisseur`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `jonction produits/fournisseur`;
CREATE TABLE IF NOT EXISTS `jonction produits/fournisseur` (
`pro_libelle` varchar(25)
,`pro_description` varchar(250)
,`pro_photo` varchar(5)
,`pro_prix_HT` decimal(10,2) unsigned
,`pro_stock` int(11) unsigned
,`pro_reference` varchar(6)
,`four_nom` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `Liv_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Liv_date` date NOT NULL,
  `Liv_adresse` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Liv_Com_det_id` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`Liv_id`),
  UNIQUE KEY `Liv_Com_det_id` (`Liv_Com_det_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`Liv_id`, `Liv_date`, `Liv_adresse`, `Liv_Com_det_id`) VALUES
(1, '2021-08-30', 'Ap #400-9412 Nibh. Road', 1),
(2, '2017-03-14', '233-7150 Id, Rd.', 2),
(3, '2016-08-18', '109-353 Non Ave', 3),
(4, '2017-02-13', '3003 Mattis Av.', 4),
(5, '2021-06-04', 'Ap #666-748 Eu Ave', 5),
(6, '2021-05-31', 'Ap #679-7291 Et Road', 6),
(7, '2021-10-03', '952-9918 Pharetra, Street', 11),
(8, '2021-01-25', 'P.O. Box 981, 6086 Molestie St.', 12),
(9, '2019-05-17', 'P.O. Box 848, 3677 Eget Rd.', 14),
(10, '2015-10-12', 'Ap #761-7111 Euismod Avenue', 13);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `Pro_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Pro_libelle` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pro_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pro_prix_HT` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `Pro_photo` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pro_stock` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `Pro_reference` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`Pro_id`, `Pro_libelle`, `Pro_description`, `Pro_prix_HT`, `Pro_photo`, `Pro_stock`, `Pro_reference`) VALUES
(11, 'aliquam,', 'fringilla cursus purus. Nullam scelerisque', '1020.00', '.jpeg', 2278, 'gui001'),
(12, 'sagittis', 'eu arcu. Morbi sit amet massa. Quisque', '28.00', '.jpeg', 1612, 'bar001'),
(13, 'arcu', 'eu, odio. Phasellus at augue id ante dictum cursus.', '356.00', '.jpeg', 1047, 'fer001'),
(14, 'ultricies', 'faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.', '1975.00', '.png', 1223, 'gui002'),
(15, 'Aliquam', 'Aliquam rutrum lorem ac risus. Morbi', '887.00', '.jpeg', 2143, 'flu001'),
(16, 'semper', 'Aliquam nec enim. Nunc ut erat. Sed', '1936.00', '.jpeg', 2424, 'tro254'),
(17, 'sollicitudin', 'faucibus orci luctus', '1683.00', '.jpeg', 2310, 'acc247'),
(18, 'vitae', 'varius et, euismod et, commodo at, libero. Morbi accumsan laoreet', '467.00', '.jpeg', 382, 'son000'),
(19, 'Cras', 'amet orci. Ut sagittis lobortis', '2209.00', '.png', 507, 'Toc458'),
(20, 'massa.', 'consectetuer rhoncus. Nullam velit dui, semper', '2158.00', '.jpeg', 1830, 'cla874');

-- --------------------------------------------------------

--
-- Structure de la table `produits_details`
--

DROP TABLE IF EXISTS `produits_details`;
CREATE TABLE IF NOT EXISTS `produits_details` (
  `Pro_details_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Pro_det_pro_id` int(11) UNSIGNED NOT NULL,
  `Pro_det_Cat_id` int(11) UNSIGNED NOT NULL,
  `Pro_det_Four_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`Pro_details_id`),
  KEY `Pro_details_Four_id` (`Pro_det_Four_id`),
  KEY `Pro_details_Cat_id` (`Pro_det_Cat_id`) USING BTREE,
  KEY `Pro_details_pro_id` (`Pro_det_pro_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits_details`
--

INSERT INTO `produits_details` (`Pro_details_id`, `Pro_det_pro_id`, `Pro_det_Cat_id`, `Pro_det_Four_id`) VALUES
(1, 16, 7, 1),
(2, 20, 9, 2),
(3, 11, 8, 2),
(4, 12, 3, 1),
(5, 19, 7, 2),
(6, 14, 2, 2),
(7, 13, 4, 2),
(8, 18, 8, 1),
(9, 15, 4, 1),
(10, 17, 5, 2),
(12, 16, 7, 2);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue bon de livraison`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue bon de livraison`;
CREATE TABLE IF NOT EXISTS `vue bon de livraison` (
`liv_id` int(11) unsigned
,`com_id` int(11) unsigned
,`com_date` datetime
,`liv_date` date
,`cli_id` int(11) unsigned
,`cli_nom` varchar(30)
,`cli_adresse` varchar(250)
,`cli_contact` varchar(100)
,`liv_adresse` varchar(250)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue facture`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue facture`;
CREATE TABLE IF NOT EXISTS `vue facture` (
`fac_id` int(11) unsigned
,`com_id` int(11) unsigned
,`com_date` datetime
,`fac_date` datetime
,`cli_id` int(11) unsigned
,`cli_nom` varchar(30)
,`cli_adresse` varchar(250)
,`cli_contact` varchar(100)
,`fac_adresse` varchar(250)
);

-- --------------------------------------------------------

--
-- Structure de la vue `jonction produits/fournisseur`
--
DROP TABLE IF EXISTS `jonction produits/fournisseur`;

DROP VIEW IF EXISTS `jonction produits/fournisseur`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jonction produits/fournisseur`  AS  select `produits`.`Pro_libelle` AS `pro_libelle`,`produits`.`Pro_description` AS `pro_description`,`produits`.`Pro_photo` AS `pro_photo`,`produits`.`Pro_prix_HT` AS `pro_prix_HT`,`produits`.`Pro_stock` AS `pro_stock`,`produits`.`Pro_reference` AS `pro_reference`,`fournisseur`.`Four_nom` AS `four_nom` from ((`produits` join `produits_details` on((`produits_details`.`Pro_det_pro_id` = `produits`.`Pro_id`))) join `fournisseur` on((`fournisseur`.`Four_id` = `produits_details`.`Pro_det_Four_id`))) group by `produits`.`Pro_id` ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue bon de livraison`
--
DROP TABLE IF EXISTS `vue bon de livraison`;

DROP VIEW IF EXISTS `vue bon de livraison`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue bon de livraison`  AS  select `livraison`.`Liv_id` AS `liv_id`,`commande`.`Com_id` AS `com_id`,`commande`.`Com_date` AS `com_date`,`livraison`.`Liv_date` AS `liv_date`,`clients`.`Cli_id` AS `cli_id`,`clients`.`Cli_nom` AS `cli_nom`,`clients`.`Cli_adresse` AS `cli_adresse`,`clients`.`Cli_contact` AS `cli_contact`,`livraison`.`Liv_adresse` AS `liv_adresse` from (((`livraison` join `commande_details` on((`livraison`.`Liv_Com_det_id` = `commande_details`.`Com_det_id`))) join `commande` on((`commande_details`.`Com_det_id` = `commande`.`Com_id`))) join `clients` on((`commande`.`Com_Cli_id` = `clients`.`Cli_id`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue facture`
--
DROP TABLE IF EXISTS `vue facture`;

DROP VIEW IF EXISTS `vue facture`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue facture`  AS  select `facture`.`Fac_id` AS `fac_id`,`commande`.`Com_id` AS `com_id`,`commande`.`Com_date` AS `com_date`,`facture`.`Fac_date` AS `fac_date`,`clients`.`Cli_id` AS `cli_id`,`clients`.`Cli_nom` AS `cli_nom`,`clients`.`Cli_adresse` AS `cli_adresse`,`clients`.`Cli_contact` AS `cli_contact`,`facture`.`Fac_adresse` AS `fac_adresse` from ((`facture` join `commande` on((`facture`.`Fac_Com_id` = `commande`.`Com_id`))) join `clients` on((`commande`.`Com_Cli_id` = `clients`.`Cli_id`))) where 1 order by `facture`.`Fac_id` ;

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
-- Contraintes pour la table `commande_details`
--
ALTER TABLE `commande_details`
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
  ADD CONSTRAINT `Livraison_commande` FOREIGN KEY (`Liv_Com_det_id`) REFERENCES `commande_details` (`Com_det_id`);

--
-- Contraintes pour la table `produits_details`
--
ALTER TABLE `produits_details`
  ADD CONSTRAINT `Produit_details_catégories` FOREIGN KEY (`Pro_det_Cat_id`) REFERENCES `categories` (`Cat_id`),
  ADD CONSTRAINT `Produit_details_fournisseur` FOREIGN KEY (`Pro_det_Four_id`) REFERENCES `fournisseur` (`Four_id`),
  ADD CONSTRAINT `Produit_details_produits` FOREIGN KEY (`Pro_det_pro_id`) REFERENCES `produits` (`Pro_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
