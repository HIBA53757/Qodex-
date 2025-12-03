# Qodex-
Qodex – Base de Données SQL

Projet de modélisation et création d’une base de données relationnelle
Description du Projet

Ce projet consiste à concevoir et implémenter une base de données robuste destinée à la plateforme web Qodex, un système qui facilite l'organisation et la participation aux hackathons.
L’objectif est d’assurer une structure fiable, évolutive et performante afin de gérer l’ensemble des interactions entre organisateurs, participants, mentors et sponsors.

Le travail inclut :

La modélisation des données

Le diagramme entité-relation (ERD)

La création du schéma SQL

L’écriture des requêtes nécessaires à l’exploitation de la base

Contexte

Qodex est une plateforme permettant :

L’inscription aux hackathons

La formation des équipes

La soumission des projets

L’évaluation par des jurys

La distribution des récompenses

Une base de données bien structurée est indispensable pour garantir l’intégrité et la cohérence des informations tout au long du processus.

Objectif

Créer une base de données relationnelle complète permettant de gérer :

Les utilisateurs (enseignants, étudiants, etc.)

Les catégories de quiz

Les quiz créés par les enseignants

Les questions des quiz

Les résultats obtenus par les étudiants

Schéma de la Base de Données
1. Utilisateurs

id_utilisateur (PK)

nom

email

motdepasse

role (enseignant / etudiant)

2. Categories

id_categorie (PK)

nom_categorie

3. Quiz

id_quiz (PK)

titre_quiz

description

duree_minutes

id_categorie (FK)

id_enseignant (FK)

4. Questions

id_question (PK)

texte_question

reponse_correcte

points

id_quiz (FK)

5. Resultats

id_resultat (PK)

score

date_passage

id_etudiant (FK)

id_quiz (FK)

Relations

Un enseignant crée plusieurs quiz

Un quiz appartient à une catégorie

Un quiz contient plusieurs questions

Un étudiant passe plusieurs quiz → résultats enregistrés dans Resultats

Requêtes SQL Réalisées
Requêtes CRUD et Sélectives

Ajouter un nouveau quiz créé par un enseignant

Modifier la durée d’un quiz existant

Afficher tous les utilisateurs

Afficher uniquement les noms et emails des utilisateurs

Afficher tous les quiz

Afficher uniquement les titres des quiz

Afficher toutes les catégories

Afficher les utilisateurs enseignants

Afficher les utilisateurs étudiants

Afficher les quiz de durée > 30 min

Afficher les quiz de durée ≤ 45 min

Afficher les questions valant plus de 5 points

Afficher les quiz de durée entre 20 et 40 min

Afficher les résultats avec score ≥ 60

Afficher les résultats avec score < 50

Afficher les questions valant entre 5 et 15 points

Afficher les quiz créés par l’enseignant id=1

Trier les quiz par durée croissante

Trier les résultats par score décroissant

Afficher les 5 meilleurs scores

Afficher les questions triées par points (ASC)

Afficher les 3 derniers résultats par date_passage

Afficher chaque quiz avec sa catégorie associée

Conclusion

Ce projet met en place une base de données SQL complète et extensible, apte à soutenir le fonctionnement de la plateforme Qodex.
Il constitue une base solide pour une future intégration avec une application web ou mobile permettant la gestion complète des hackathons.