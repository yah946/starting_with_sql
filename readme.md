# Unity Care Clinic – Base de Données & Exercices SQL

## 📌 Contexte du Projet

**Objectif Principal :**  
Développer une base de données performante et bien architecturée, capable de supporter toutes les fonctionnalités opérationnelles d'Unity Care Clinic et de garantir une gestion optimale des données.

## 🏥 Description Fonctionnelle

La base de données constitue le socle d’un **système complet de gestion hospitalière**. Elle centralise et gère de manière fiable et sécurisée les informations suivantes :

- Départements et personnel (médecins, administratif)
- Patients et admissions
- Gestion des chambres
- Planification des rendez-vous
- Gestion des médicaments et prescriptions

## 🛠️ Composantes Techniques

### 📘 Schéma de Base de Données
Les tables sont définies à partir du schéma fourni.

### 🎯 Exercices Pratiques SQL (20 exercices)

Les exercices couvrent :

- **CRUD** (Create, Read, Update, Delete)
- **SELECT, WHERE, ORDER BY, LIMIT, DISTINCT**
- Opérateurs logiques, fonctions d’agrégation (**COUNT, AVG, MAX, SUM**)
- Contraintes & jointures
- **GROUP BY, HAVING**
- Création de vues

### 🧩 Exercices Bonus (5 requêtes avancées)
Jointures complexes pour renforcer la maîtrise des relations entre les tables.

---

# 📚 Exercices SQL

### 1. CRUD Operation  
Insérer un nouveau patient nommé *Alex Johnson*, né le 15 juillet 1990, sexe masculin, téléphone "1234567890".

### 2. SELECT  
Récupérer tous les départements avec leurs emplacements.

### 3. ORDER BY  
Lister tous les patients triés par date de naissance (ascendant).

### 4. DISTINCT  
Afficher les sexes des patients sans doublon.

### 5. LIMIT  
Récupérer les 3 premiers médecins.

### 6. WHERE  
Patients nés après l’année 2000.

### 7. Logical Operators  
Médecins des départements **Cardiology** et **Neurology**.

### 8. Special Operators  
Admissions entre le 1er et le 7 décembre 2024.

### 9. Conditional Expressions  
Ajouter une colonne catégorisant les patients :  
*Enfant, Adulte, Senior* selon leur âge.

### 10. COUNT  
Compter le nombre total de rendez-vous.

### 11. COUNT + GROUP BY  
Nombre de médecins par département.

### 12. AVG  
Âge moyen des patients.

### 13. MAX  
Dernière date et heure de rendez-vous.

### 14. SUM  
Nombre total d’admissions par chambre.

### 15. Constraints  
Patients dont le champ *email* est vide.

### 16. Jointure  
Rendez-vous avec nom du médecin + nom du patient.

### 17. DELETE  
Supprimer tous les rendez-vous avant 2024.

### 18. UPDATE  
Renommer le département **Oncology** → **Cancer Treatment**.

### 19. HAVING  
Genres ayant au moins 2 patients.

### 20. View  
Créer une vue des admissions en cours.

---

# ⭐ Bonus – Jointures Avancées

### Bonus 1  
Patients et leurs médecins traitants (patients + admissions + doctors).

### Bonus 2  
Liste des rendez-vous avec leur département.

### Bonus 3  
Médicaments prescrits par chaque médecin.

### Bonus 4  
Admissions et chambres associées.

### Bonus 5  
Statistiques : nombre de patients par département via les admissions.

---

# 🔧 Recommandations & Bonnes Pratiques

### 🚀 Optimisation des Performances
- Index sur colonnes fréquemment requêtées (ID patient, ID médecin…)
- Optimisation régulière des requêtes

### 🗂️ Qualité des Données
- Contraintes d’intégrité (UNIQUE, CHECK…)
- Relations cohérentes entre les tables

### 🔒 Sécurité
- Chiffrement des données sensibles (email, mots de passe)
- Gestion d’accès via rôles utilisateurs

### 🛠️ Maintenance
- Tests de performance réguliers
- Suivi des logs et incident reports

---