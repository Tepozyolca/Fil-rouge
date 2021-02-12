-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 28 jan. 2021 à 10:17
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
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`Cat_id`, `Cat_nom`) VALUES
(1, 'batteries'),
(2, 'cables'),
(3, 'cases'),
(4, 'guitares'),
(5, 'micros'),
(6, 'pianos'),
(7, 'saxophones'),
(8, 'sonos'),
(9, 'accessoires');
COMMIT;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`Cli_nom`,`Cli_adresse`,`Cli_contact`,`Cli_catégorie`,`Cli_coefficient`,`Cli_statut_paiement`,`Cli_Emp_id`) VALUES 
	("Mark","Ap #409-6193 Convallis St.","dolor.tempus@semperauctor.net","Professionnel","0","Différé","7"),
	("Kaye","7639 Scelerisque Road","mauris@Crasloremlorem.org","Professionnel","0","Différé","8"),
	("Alvin","823-2314 Vel Ave","mauris@parturientmontes.org","Professionnel","0","Différé","7"),
	("Quemby","9049 Nec Ave","laoreet.posuere@eutempor.ca","Professionnel","0","Différé","5"),
	("Roth","6765 Blandit Rd.","velit.dui@congueIn.co.uk","Particulier","0","Différé","3"),
	("Tana","Ap #279-6498 Amet Av.","Sed@arcu.co.uk","Pparticulier","0","Différé","10"),
	("Bradley","P.O. Box 678, 356 Ut St.","blandit@pede.org","Professionnel","0","Différé","3"),
	("Eden","Ap #326-4445 A, Road","diam.at@consectetuermauris.edu","Professionnel","0","Différé","6"),
	("Owen","P.O. Box 681, 9186 Luctus Rd.","quam.vel@Nullam.com","Professionnel","0","Différé","3"),
	("Audrey","P.O. Box 772, 3852 Magna St.","Mauris.ut@loremeget.edu","Professionnel","0","Différé","2");
	
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
COMMIT;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`Com_id`, `Com_date`, `Com_reduction`, `Com_adresse`, `Com_Cli_id`) VALUES
(11, '2017-07-29 06:24:55', '23', '186-7046 Enim. Rd.', 118, 1),
(12, '2017-06-21 23:01:56', '7', '6229 Malesuada Avenue', 119, 0),
(13, '2016-12-05 19:12:14', '28', 'Ap #820-2987 Vivamus Ave', 120, 0),
(14, '2017-02-02 22:31:34', '11', 'P.O. Box 215, 4967 Donec Ave', 111, 0),
(15, '2019-07-24 02:28:16', '2', '666-2381 Aliquet Street', 117, 1),
(16, '2019-05-04 13:57:39', '0', 'P.O. Box 265, 7622 Amet, Road', 111, 0),
(17, '2015-10-28 14:38:07', '1', '9786 Auctor. St.', 117, 0),
(18, '2015-02-24 18:50:38', '16', 'Ap #733-5681 Ipsum St.', 120, 1),
(19, '2021-03-04 18:32:56', '26', '5603 Non Ave', 118, 1),
(20, '2015-06-03 20:46:55', '12', 'Ap #823-3150 Metus. Rd.', 111, 0);
COMMIT;

--
-- Déchargement des données de la table `commande_details`
--

INSERT INTO `commande_details` (`Com_det_id`, `Com_det_com_id`, `Com_det_pro_id`, `Com_det_quantite`, `Com_det_taxe`, `Com_det_quantite_livree`) VALUES
(1, 12, 18, 10, '2.00', 7),
(2, 19, 14, 9, '2.00', 8),
(3, 14, 15, 10, '8.00', 1),
(4, 12, 11, 7, '5.00', 10),
(5, 18, 19, 3, '3.00', 3),
(6, 18, 18, 1, '7.00', 2),
(7, 12, 17, 10, '8.00', 10),
(8, 20, 15, 9, '7.00', 3),
(9, 13, 17, 10, '9.00', 9),
(10, 11, 15, 10, '6.00', 2),
(11, 11, 14, 6, '9.11', 9),
(12, 17, 11, 3, '1.86', 9),
(13, 19, 17, 2, '4.48', 10),
(14, 15, 13, 1, '9.35', 1),
(15, 20, 17, 8, '3.40', 8),
(16, 17, 14, 4, '4.92', 3),
(17, 20, 20, 1, '5.10', 8),
(18, 12, 19, 4, '9.70', 6),
(19, 14, 12, 3, '0.37', 7),
(20, 13, 12, 4, '9.69', 10);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
