Gestion de Restaurants - Base de Données



&#x20;Membres du groupe

\- DJOBO Adjo Rébecca Dorcas  

\- N’SOUKPOE Adjovi Déla Honorine  

\- AMETONOU Tracy  



Unité d’Enseignement : Bases de Données  

Chargé d’UE : Mademoiselle SOGNON



&#x20; Introduction

Ce projet présente la modélisation et l’implémentation d’une base de données pour la gestion d’un restaurant.  

Les entités principales incluent les clients, serveurs, tables, réservations, commandes, plats, ingrédients et stock.  

L’objectif est de faciliter la gestion des opérations quotidiennes et d’assurer un suivi efficace des ressources.



&#x20; Structure de la base



Entités principales

\- Client: identifie les personnes qui réservent ou commandent.  

\- Serveur: représente les employés qui prennent les commandes.  

\- Table Restaurant: correspond aux tables physiques du restaurant.  

\- Réservation: relie un client à une table pour une date donnée.  

\- Commande: associe une réservation à un serveur et contient les plats commandés.  

\- Plat: éléments du menu avec leur prix.  

\- Commande\_Plat: détail des plats commandés avec les quantités.  

\- Ingrédient: composants utilisés pour préparer les plats.  

\- Stock: suivi des ingrédients disponibles en cuisine.  





&#x20;Données de test



Exemples de scénarios insérés pour valider le modèle :  

\- Alice a réservé une table le 17 mars 2026 et a commandé 2 pizzas et 1 salade, servie par Jean (chef de rang).  

\- Bob a réservé une autre table le même jour et a commandé 3 salades, servies par Marie (serveuse).  

\- Ingrédients disponibles : Tomate (50 unités) et Fromage (20 unités).  





&#x20;Requêtes typiques



Quelques requêtes SQL utiles :  

\- Calculer le chiffre d’affaires par plat : "prix × quantité".  

\- Afficher le planning des réservations pour une date donnée.  

\- Identifier les ingrédients dont le stock est inférieur à un seuil critique.  



&#x20;Conclusion

Ce modèle relationnel permet de gérer efficacement les opérations d’un restaurant.  

Il peut être étendu pour couvrir une chaîne de restaurants ou une plateforme de livraison.







