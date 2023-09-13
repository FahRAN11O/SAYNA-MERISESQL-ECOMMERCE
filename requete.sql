/*Creation de la base de données*/
CREATE DATABASE ecommerceDB;
/*Utilisation de ecommerceDB*/
USE ecommerceDB;

/*Creation du table clients*/
CREATE TABLE Clients(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50),
  prenom VARCHAR(50),
  ville VARCHAR(50),
  code_postal VARCHAR(50),
  rue VARCHAR(50),
  telephone VARCHAR(20));

/*Insertion des valeurs*/  
INSERT INTO Clients (prenom,nom, ville, rue, telephone, code_postal)
VALUES
	('John', 'Doe', 'New York', '123 Main St', '123-456-7890', '10001'),
	('Jane', 'Smith', 'Los Angeles', '456 Elm St', '987-654-3210', '90001'),
	('Isabel', 'Dos Santos', 'Luanda', 'Miramar', '244-926-123456', '1000');

/*Affichages des valeurs du clients*/
SELECT * FROM clients;

/***********************************************************************/
/*Création du table commandes*/
CREATE TABLE Commandes (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  date_commande DATETIME,
  etat VARCHAR(50),
  client_id INT,
  FOREIGN KEY (client_id) REFERENCES Clients (id));
  
/*insertion des valeurs*/
INSERT INTO commandes (date_commande, etat, client_id)
VALUES
('2023-08-01 10:00:00', 'en cours',3);

/*Affichages des valeurs du table commandes*/
SELECT * FROM commandes;


/*****************************************************/
/*Creation de la table utilisateurs*/
CREATE TABLE Utilisateurs(
  id int PRIMARY KEY NOT NULL,
  nom VARCHAR(50),
  rôle VARCHAR(50),
  client_id INT,
  FOREIGN KEY (client_id) REFERENCES Clients (id));

/*Ajouter une colonne dans utilisateurs*/
ALTER TABLE utilisateurs
ADD mot_de_passe VARCHAR(255);

/*********************************************************/
/*Creation du table categories*/
CREATE TABLE Categories(
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50),
  description VARCHAR(255));
  
 /*Insertion des valeurs*/ 
INSERT INTO categories(nom, description)
VALUES
('electronique', 'on trouve ici des produits tels que smartphones, appareils photos, gadgets electronique, etc');
/*Affichage des valeurs du categories*/
SELECT * FROM categories;

/************************************************************/
/*Creation du table produits*/
CREATE TABLE Produits (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50),
  description VARCHAR(255),
  prix DOUBLE,
  categorie_id INT,
  stock_disponible INT,
  FOREIGN KEY (categorie_id) REFERENCES Categories(id));

 /*insertion des valeurs sur produits*/
INSERT INTO produits (nom, description, prix, categorie_id, stock_disponible)
VALUES
('appareil photo','année 2018', 400.40, 1, 5);

/*Affichages des valeurs*/
SELECT * FROM produits;

/************************************************************/
/*Creation du table commandes_produits*/
CREATE TABLE Commandes_produits(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  commande_id INT,
  produit_id INT,
  FOREIGN KEY (commande_id) REFERENCES Commandes (id),
  FOREIGN KEY (produit_id) REFERENCES Produits (id)
);

/*Insertion des valeurs dans commandes_produits*/
INSERT INTO commandes_produits(commande_id, produit_id)
VALUES (1,1);

SELECT * FROM commandes_produits;

/*************************************************************/

Les autres requêtes demandées
INSERT INTO utilisateurs (nom, mot_de_passe, rôle, client_id)
VALUES 
('fameno', '1234', 'normal', 3);*/

/*Selectionner tout dans l'utilisateur*/
SELECT * FROM utilisateurs;

/*Selection de données spécifique*/
SELECT nom FROM produits;

/*Selection de données dans clients où id <=3 et trier par nom descendant*/
SELECT * FROM clients 
ORDER BY nom DESC
LIMIT 4;

/*fonction d'agrégation COUNT()*/
SELECT COUNT(*) AS nombre_clients
FROM clients;

/*jointure de deux tables*/
SELECT categories.nom, produits.nom
FROM categories
JOIN produits
ON
	produits.categorie_id = categories.id;

/*Groupement avec agregation*/
SELECT categorie_id, AVG(prix) AS moyen_prix
FROM produits
GROUP BY categorie_id;


/*Mise à jour de données*/
UPDATE clients
SET nom = 'RANDRIAMANANJARA', prenom='fameno'
WHERE id=4;

/*Afficher clients*/
SELECT * FROM clients;

/*Insertion de données*/
INSERT INTO commandes (date_commande, etat, client_id)
VALUES
	('2022-08-24 15:56:03', 'livrée', 4);

/*affichage commande*/
SELECT*FROM commandes;


/*suppresion de données*/
DELETE FROM clients
WHERE ID = 6;

/*Affichage clients*/
SELECT * FROM clients;







