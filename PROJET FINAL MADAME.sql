--CREATE BASE E DONNEES--
CREATE DATABASE Restaurant
USE Restaurant
-- Table des clients
CREATE TABLE Client (
    id INT PRIMARY KEY,
    nom VARCHAR(100),
    telephone VARCHAR(20)
);
--Insertion--
INSERT INTO Client VALUES (1, 'Alice Dupont', '90000001');
INSERT INTO Client VALUES (2, 'Jean Koffi', '90000002');
SELECT * FROM Client;

-- Table des serveurs
CREATE TABLE Serveur (
    id INT PRIMARY KEY,
    nom VARCHAR(100)
);
INSERT INTO Serveur VALUES (1, 'Marc');
INSERT INTO Serveur VALUES (2, 'Sarah');
SELECT * FROM Serveur;

-- Table des tables du restaurant
CREATE TABLE TableRestaurant (
    id INT PRIMARY KEY,
    numero INT,
    capacite INT
);
INSERT INTO TableRestaurant VALUES (1, 5, 4);
INSERT INTO TableRestaurant VALUES (2, 6, 2);
SELECT * FROM TableRestaurant;

-- Table des réservations
CREATE TABLE Reservation (
    id INT PRIMARY KEY,
    date_reservation DATE,
    client_id INT,
    table_id INT,
    FOREIGN KEY (client_id) REFERENCES Client(id),
    FOREIGN KEY (table_id) REFERENCES TableRestaurant(id)
);
INSERT INTO Reservation VALUES (1, '2026-03-14', 1, 1);
INSERT INTO Reservation VALUES (2, '2026-03-14', 2, 2);

SELECT * FROM Reservation;
-- Table des plats
CREATE TABLE Plat (
    id INT PRIMARY KEY,
    nom VARCHAR(100),
    prix DECIMAL(10,2)
);
INSERT INTO Plat VALUES (1, 'Pizza Margherita', 8.50);
INSERT INTO Plat VALUES (2, 'Spaghetti Bolognaise', 10.00);
INSERT INTO Plat VALUES (3, 'Salade César', 6.00);
SELECT * FROM Plat;

-- Table des commandes
CREATE TABLE Commande (
    id INT PRIMARY KEY,
    reservation_id INT,
    serveur_id INT,
    FOREIGN KEY (reservation_id) REFERENCES Reservation(id),
    FOREIGN KEY (serveur_id) REFERENCES Serveur(id)
);
INSERT INTO Commande VALUES (1, 1, 1);
INSERT INTO Commande VALUES (2, 2, 2);
SELECT * FROM Commande;

-- Table de liaison commande-plat
CREATE TABLE Commande_Plat (
    commande_id INT,
    plat_id INT,
    quantite INT,
    PRIMARY KEY (commande_id, plat_id),
    FOREIGN KEY (commande_id) REFERENCES Commande(id),
    FOREIGN KEY (plat_id) REFERENCES Plat(id)
);
INSERT INTO Commande_Plat VALUES (1, 1, 2); -- 2 pizzas
INSERT INTO Commande_Plat VALUES (1, 3, 1); -- 1 salade
INSERT INTO Commande_Plat VALUES (2, 2, 1); -- 1 spaghetti
SELECT * FROM Commande_Plat;

-- Table des ingrédients
CREATE TABLE Ingredient (
    id INT PRIMARY KEY,
    nom VARCHAR(100)
);
INSERT INTO Ingredient VALUES (1, 'Tomate');
INSERT INTO Ingredient VALUES (2, 'Pâtes');
INSERT INTO Ingredient VALUES (3, 'Laitue');
SELECT * FROM Ingredient;

-- Table du stock
CREATE TABLE Stock (
    ingredient_id INT PRIMARY KEY,
    quantite INT,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(id)
);
INSERT INTO Stock VALUES (1, 50);
INSERT INTO Stock VALUES (2, 100);
INSERT INTO Stock VALUES (3, 30);
SELECT * FROM Stock;


SELECT c.nom AS Client ,
       r.date_reservation,
       s.nom AS Serveur,
       cmd.id AS Commande,
       p.nom AS Plat, cp.quantite, p.prix,
       i.nom AS Ingrédient, st.quantite AS Stock
FROM Client c
JOIN Reservation r ON c.id = r.client_id
JOIN TableRestaurant t ON r.table_id = t.id
JOIN Commande cmd ON r.id = cmd.reservation_id
JOIN Serveur s ON cmd.serveur_id = s.id
JOIN Commande_Plat cp ON cmd.id = cp.commande_id
JOIN Plat p ON cp.plat_id = p.id
JOIN Ingredient i ON i.id IN (1,2) 
JOIN Stock st ON i.id = st.ingredient_id;