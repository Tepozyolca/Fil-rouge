# Fil-rouge

  1 - Utiliser un outil de gestion de version
  
  2 - Mettre en place une base de données (2 semaine)
  
   2.2.1* - Réaliser le MCD du site e-commerce en tenant compte de toutes les contraintes fonctionnelles énoncées dans le cahier des charges (partie L'existant notamment).

   2.2.2* - Ecrivez le script de création de la base de données (vous pouvez utiliser le script de génération de la base précédemment obtenu).

   2.2.3* - Ce script doit prendre en compte l'ensemble des tables du schéma physique, les clés primaires et étrangères, les index et les droits d'accès.
  
     *(4 jours)
    
   2.2.4 - Pour la sécurité, vous devez prévoir plusieurs profils de connexion et décliner les autorisations nécessaires. (2 jour)
  
   2.2.5* - Alimenter la base de tests : créez un script d'insertion des données dans l'ensemble des tables de la base de données. Ces données seront compréhensibles par un utilisateur de base et devront donc avoir des valeurs en cohérence avec le domaine fonctionnel.
 
   2.2.6* - Décrivez les procédures que vous mettez en place pour assurer les sauvegardes de la base.

   2.2.7* - Testez une restauration.
  
    *(4 jours)
 
  3 - Manipuler la base de données (4 semaines)
  
   3.1 - Formaliser des requêtes à l'aide du langage SQL (2 semaines)
    3.1.1 - Pour chacune des interrogations demandées (voir cahier des charges), créez un script contenant la ou les requêtes nécessaires.
    
    3.1.2 - Exportez les tables principales (entité) vers des tableaux d'un tableur de votre choix ainsi que le contenu du résultat de vos requêtes.
    
    3.1.3 - chiffre d'affaires hors taxes généré pour l'ensemble et par fournisseur
    
    3.1.4 - liste des produits commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)
    
    3.1.5 - liste des commandes pour un client (date de commande, référence client, montant, état de la commande)
    
    3.1.6 - répartition du chiffre d'affaires hors taxes par type de client
    
    3.1.7 - lister les commandes en cours de livraison.  
    
   3.2 - Programmer des procédures stockées sur le SGBD (2 jours)
   
    3.2.1 - qui renvoie le délai moyen entre la date de commande et la date de facturation
  
   3.3 - Gérer les vues (3 jours)
   
  4 - Construire la maquette de l'application (7 jours)
  
   4.1 - Représentez le diagramme de cas d'utilisation d'une commande sur le site par un client particulier. La notion de panier doit y apparaître. (3 jours)
   4.2 - Avec un outil de maquettage (Draw.io, Balsamiq ou encore Pencil), réalisez la maquette de la page de connexion du site. (2 jours)
   
  5. Développer une application web (16 jours)
  
   5.0.1* - consulter le catalogue
   
   5.0.2* - saisir de nouvelles commandes
   
   5.0.3* - visualiser les anciennes commandes
   
    * (2 jours)
    
   5.1 - Développer des pages web statiques (HTML/CSS) (4 jours)
   
    5.1.1 - Réaliser une page d'accueil pour votre projet. Vous devez réaliser l'intégration HTML/CSS de votre page d'accueil à partir des éléments qui vous sont fournis dans la charte graphique. (1 jour)
    
    5.1.2 - Front-office : contient la partie publique du site (dont la page d'accueil) et un accès à la liste de produits et accès au formulaire d'inscription. Vous devez intégrer au mieux les éléments de la charte graphique. (3 jours)
    
    5.1.3 - Back-office : c'est la partie privée du site, réservée à l'administrateur, elle permet de gérer les produits et les commandes (si vous avez le temps...). (2 jours)
    
   5.2 - Intégrer des scripts clients (Javascript) (5 jours)
    
    5.2.1 - Votre application web doit comporter un formulaire d'inscription pour le client. (2 jours)
    
    5.2.2 - Vous devez empêcher l'utilisateur d'envoyer des informations erronées et lui indiquer les erreurs. (3 jours)
   
   5.3 - Développer des composants web d'accès aux données (5 jours)
    
    5.3.1 - Vous devez mettre en œuvre la gestion CRUD sur une table de votre choix. Ces pages devront être accessibles à partir de votre menu d'accueil. (3 jours)

    5.3.2 - Votre interface doit permettre d'afficher la liste des éléments, l'ajout, la modification et la suppression. (2 jour)

5.3.3 - Vous devez utiliser une architecture MVC pour réaliser ce travail.

  6 - Mettre en œuvre une solution de gestion de contenu ou d'ecommerce (11 jours)
  
   6.1 - Réalisez un thème responsive qui reprend les grandes lignes de la charte graphique du site e-commerce. (3 jours)
   
   6.2 - Les employés pourront écrire des articles sans les publier. Il n'y aura qu'un seul administrateur, lequel se chargera, entre autres tâches, de valider les articles. (3 jours)
   
   6.3 - Un plugin S.E.O. devra être configuré. (2 jours)
   
   6.4 - La sécurité devra bien sûr être prise en compte. (une semaine)
   
   6.5 - Publier le résultat de votre travail sur le serveur. Le site publié doit s'exécuter sans erreur. (un jour)
 
  7 - Publier l'application (1 jour)
   7.1 - Le projet Fil rouge (e-commerce et Wordpress) doit être hébergé sur votre compte dev.amorce.org.
   7.2 - L'exécution doit se dérouler sans erreurs.
