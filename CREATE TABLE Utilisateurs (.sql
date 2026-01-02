CREATE TABLE Utilisateurs (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    motdepasse VARCHAR(255) NOT NULL,
    role ENUM('enseignant', 'etudiant') NOT NULL
) ;

--@block 
INSERT INTO Utilisateurs (nom,email,motdepasse,role) VALUES
('hiba sadiki','hiba@gmail.com',SHA2('passwordis2005',256),'etudiant'),
('yassmin sadiki','yassmin@gmail.com',SHA2('passwordis2005',256),'enseignant'),
('hidaya sadiki','hidaya@gmail.com',SHA2('passwordis2005',256),'etudiant'),
('hassan sadiki','hassan@gmail.com',SHA2('passwordis2005',256),'enseignant'),
('naima etazi','naima@gmail.com',SHA2('passwordis2005',256),'etudiant');

--@block
CREATE TABLE Categories (
    id_categorie INT AUTO_INCREMENT PRIMARY KEY,
    nom_categorie VARCHAR(200) NOT NULL
);

--@block
INSERT INTO categories (nom_categorie) VALUES
('Mathématiques'),
('Histoire'),
('Informatique');

--@block
CREATE TABLE Quiz (
    id_quiz INT AUTO_INCREMENT PRIMARY KEY,
    titre_quiz VARCHAR(250) NOT NULL,
    description VARCHAR(350)NOT NULL,
    duree_minutes INT NOT NULL,
    id_categorie INT NOT NULL,
    id_enseignant INT NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES Categories(id_categorie),
    FOREIGN KEY (id_enseignant) REFERENCES Utilisateurs(id_utilisateur)
);
--@block 
 INSERT INTO Quiz (titre_quiz, description, duree_minutes, id_categorie, id_enseignant) VALUES
('Quiz sur les équations', 'Un quiz pour tester vos connaissances sur les équations du premier degré.', 15, 1, 2),
('Quiz Histoire du Maroc', 'Questions sur les événements historiques importants du Maroc.', 20, 2, 4),
('Introduction au HTML', 'Quiz pour évaluer les bases du HTML et structure des pages.', 10, 3, 2),
('Programmation en Python', 'Vérifier la compréhension des bases du langage Python.', 25, 3, 4),
('Géométrie de base', 'Quiz pour réviser les formes géométriques et leurs propriétés.', 12, 1, 2);

--@block
CREATE TABLE Questions (
    id_question INT AUTO_INCREMENT PRIMARY KEY,
    texte_question VARCHAR(250) NOT NULL,
    reponse_correcte VARCHAR(250) NOT NULL,
    points INT NOT NULL,
    id_quiz INT NOT NULL,
    FOREIGN KEY (id_quiz) REFERENCES Quiz(id_quiz)
);

--@block
INSERT INTO Questions (texte_question, reponse_correcte, points, id_quiz) VALUES
-- Quiz 1 : Équations
('Quelle est la solution de 2x + 4 = 10 ?', 'x = 3', 5, 1),
('Résoudre : 5x = 20', 'x = 4', 5, 1),
('Quelle est la valeur de x dans 3x - 9 = 0 ?', 'x = 3', 5, 1),

-- Quiz 2 : Histoire du Maroc
('En quelle année a eu lieu l’indépendance du Maroc ?', '1956', 5, 2),
('Quel roi a lancé la Marche Verte ?', 'Hassan II', 5, 2),
('Quel peuple a fondé la ville de Fès ?', 'Les Idrissides', 5, 2),

-- Quiz 3 : HTML
('Que signifie HTML ?', 'HyperText Markup Language', 5, 3),
('Quelle balise permet d’afficher un titre principal ?', '<h1>', 5, 3),
('Quelle balise est utilisée pour créer un lien ?', '<a>', 5, 3),

-- Quiz 4 : Python
('Quelle fonction affiche un texte en Python ?', 'print()', 5, 4),
('Comment déclare-t-on une liste ?', '[]', 5, 4),
('Quelle est la valeur de 3 * 2 + 1 ?', '7', 5, 4),

-- Quiz 5 : Géométrie
('Combien de côtés a un hexagone ?', '6', 5, 5),
('La somme des angles d’un triangle est de… ?', '180 degrés', 5, 5),
('Quelle forme a 4 côtés égaux et 4 angles droits ?', 'Carré', 5, 5);

--@block
CREATE TABLE Resultats (
      id_resultat INT  AUTO_INCREMENT PRIMARY KEY,
      score INT NOT NULL,
      date_passage DATETIME NOT NULL,
      id_etudiant INT  NOT NULL,
      id_quiz INT NOT NULL,
      FOREIGN KEY (id_quiz) REFERENCES Quiz(id_quiz),
      FOREIGN KEY (id_etudiant) REFERENCES Utilisateurs(id_utilisateur)
);

--@block
INSERT INTO Resultats (score, date_passage, id_etudiant, id_quiz) VALUES
(76, '2025-01-14 10:30:00', 1, 1),
(25, '2025-01-14 11:00:00', 3, 1),
(58, '2025-01-15 09:45:00', 5, 2),
(40, '2025-01-15 10:20:00', 1, 3),
(64, '2025-01-16 14:10:00', 3, 4),
(10, '2025-01-16 15:30:00', 5, 5);

--@block Ajouter un nouveau quiz créé par un enseignant
INSERT INTO Quiz (titre_quiz, description, duree_minutes, id_categorie, id_enseignant)
VALUES ('Nouveau Quiz SQL', 'Quiz sur les bases du SQL', 30, 3, 2);

--@block Modifier la durée d'un quiz existant
UPDATE Quiz SET duree_minutes = 45 WHERE id_quiz = 1;

--@block
SELECT duree_minutes FROM
--@block Afficher tous les utilisateurs
SELECT * FROM Utilisateurs;

--@block Afficher uniquement les noms et emails des utilisateurs
SELECT nom, email FROM Utilisateurs;

--@block Afficher tous les quiz
SELECT * FROM Quiz;

--@block Afficher uniquement les titres des quiz
SELECT titre_quiz FROM Quiz;

 --@block Afficher toutes les catégories
 SELECT * FROM Categories;

--@block Afficher les utilisateurs enseignants
SELECT * FROM Utilisateurs
WHERE role = 'enseignant';
 
 --@block Afficher les utilisateurs étudiants
 SELECT * FROM Utilisateurs
 WHERE role = 'etudiant';

 --@block Afficher les quiz dont la durée > 30 minutes
 SELECT * FROM Quiz
WHERE duree_minutes > 30;

--@block Afficher les quiz dont la durée ≤ 45 minutes
SELECT * FROM Quiz
WHERE duree_minutes <= 45;

--@block Afficher les questions valant plus de 5 points
SELECT * FROM Questions
WHERE points > 5;

--@block Afficher les quiz de durée entre 20 et 40 minutes
SELECT * FROM Quiz
WHERE duree_minutes BETWEEN 20 AND 40;

--@block Afficher les résultats avec un score ≥ 60
SELECT * FROM Resultats
WHERE score >= 60;

--@block Afficher les résultats avec un score < 50
SELECT * FROM Resultats
WHERE score < 50;

--@block Afficher les questions entre 5 et 15 points
SELECT * FROM Questions
WHERE points BETWEEN 5 AND 15;

--@block Afficher les quiz créés par l’enseignant id = 1
SELECT * FROM Quiz
WHERE id_enseignant = 1;

--@block Afficher tous les quiz triés par durée (croissant)
SELECT * FROM Quiz
ORDER BY duree_minutes ASC;

--@block Afficher tous les résultats triés par score (décroissant)
SELECT * FROM Resultats
ORDER BY score DESC;

--@block Afficher les 5 meilleurs scores
SELECT * FROM Resultats
ORDER BY score DESC
LIMIT 5;

--@block Afficher les questions triées par points (du plus faible au plus élevé)
SELECT * FROM Questions
ORDER BY points ASC;

--@block  Afficher les 3 derniers résultats (triés par date_passage décroissante)
SELECT * FROM Resultats
ORDER BY date_passage DESC
LIMIT 3;

--@block Afficher le nom de chaque quiz avec sa catégorie
SELECT Quiz.titre_quiz, Categories.nom_categorie
FROM Quiz
JOIN Categories ON Quiz.id_categorie = Categories.id_categorie;
    



