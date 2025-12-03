use hospitalmanagement;
--1.CRUD Operations : Insérer un nouveau patient nommé "Alex Johnson", né le 15 juillet 1990, de sexe masculin, avec le numéro de téléphone "1234567890".
INSERT into patient (firstName,lastName,gender,dateOfBirth,phoneNum)
values ('Alex','Johnson','male','1990-07-15','1234567890');
--2.SELECT Statement : Récupérez tous les départements avec leurs emplacements.
select departementName as Name,location from departement;
--3.ORDER BY Clause : Trier les patients par date de naissance Listez tous les patients, triés par date de naissance dans l'ordre croissant.
select * from patient order by dateOfBirth;
--4.Filtrer les patients uniques par sexe (DISTINCT) Récupérez tous les sexes des patients enregistrés, sans doublons.
select DISTINCT gender from patient;
--5.LIMIT Clause : Obtenir les 3 premiers médecins (Récupérez les trois premiers médecins) dans la table doctors.
select * from doctor limit 3;
--6.WHERE Clause : Récupérez les informations des patients nés après l'année 2000.
select * from patient where dateOfBirth >= '2000-01-01';
--7.Logical Operators : Médecins dans des départements spécifiques Récupérez les médecins des départements "Cardiology" et "Neurology".
select * from doctor where specialization = 'Cardiologist' Or specialization = 'Neurologist';
--8.Special Operators : Vérifier des plages de dates Listez les admissions entre le 1er décembre et le 7 décembre 2024.
select id,admissionDate from admission where admissionDate BETWEEN '2024-12-01' AND '2024-12-07';
--9.Conditional Expressions : Ajoutez une colonne catégorisant les patients en "Enfant", "Adulte", ou "Senior" selon leur âge.
ALTER TABLE patient
ADD ageCategory ENUM('enfant','adulte','senior');
update patient
SET ageCategory = CASE
    WHEN TIMESTAMPDIFF(YEAR, dateOfBirth, '2025-03-12') BETWEEN 0 AND 14 THEN 'enfant'
    WHEN TIMESTAMPDIFF(YEAR, dateOfBirth, '2025-03-12') BETWEEN 15 AND 64 THEN 'adulte'
    Else 'senior'
END;
SELECT id,Concat(firstName,' ',lastName),dateOfBirth,ageCategory from patient;
--10.Aggregate Functions : Comptez le nombre total de rendez-vous enregistrés.
select count(*) from appointment;
--11.COUNT avec GROUP BY : Comptez le nombre de médecins dans chaque département.
select count(firstName) as DoctorNum, d.location
from doctor as dr
inner join departement as d
on d.id = dr.departement_id
group by d.location;
--12.AVG : Calculez l'âge moyen des patients.
select Avg(TIMESTAMPDIFF(YEAR, dateOfBirth, '2025-03-12')) AS average_age from patient;
--13.MAX : Dernier rendez-vous Trouvez la date et l'heure du dernier rendez-vous enregistré.
select Concat(appointmentDate, ' with ', appointmentTime) as 'Last Appointment' from appointment order by appointmentDate desc,appointmentTime DESC limit 1;
--14.SUM : Total des admissions par chambre Calculez le total des admissions pour chaque chambre.
select count(a.id),r.roomNumber from admission as a
inner join room as r
on r.id = a.room_id
group by r.roomNumber;
-- 15.Constraints : Vérifier les patients sans e-mail Récupérez tous les patients dont le champ email est vide.
select id,firstName,lastName,email from patient where email IS NULL;
--16.Jointure : Liste des rendez-vous avec noms des médecins et patients.
select CONCAT(dr.firstName,' ',dr.lastName) as DoctorName, CONCAT(p.firstName,' ',p.lastName) as PatientName,ap.appointmentDate as Appointment
from appointment as ap
inner Join doctor as dr on dr.id = ap.doctor_id
inner join patient as p on ap.patient_id = p.id;
--17.DELETE : Supprimez tous les rendez-vous programmés avant 2024.
delete from appointment where appointmentDate<='2024-12-31';
-- 18.UPDATE : Changez le nom du département "Oncology" en "Cancer Treatment".
update departement set departementName = 'Cancer Treatment' where departementName = 'Oncology';
--19.HAVING Clause : Patients par sexe avec au moins 2 entrées / Listez les genres ayant au moins deux patients.
select concat(firstName, ' ', lastName) as fullName,gender from patient group by gender having ;
-- 20.Créer une vue : Admissions actives Créez une vue listant toutes les admissions en cours.
CREATE VIEW ActiveAdmissions AS
SELECT *
FROM admission
WHERE dischargeDate IS NULL OR dischargeDate > CURDATE();



-- Bonus 1: Patients et leurs médecins traitants
-- Récupérez les noms des patients et les noms de leurs médecins traitants à partir des tables patients, admissions, et doctors.
-- Bonus 2: Liste des rendez-vous par département
-- Récupérez la liste des rendez-vous avec les départements associés.
select appointment.appointmentDate,appointment.reason,departement.departementName
from appointment inner join doctor on appointment.doctor_id = doctor.id
inner join departement on doctor.id = doctor.departement_id;
-- Bonus 3: Médicaments prescrits par médecin

-- Listez les médicaments prescrits par chaque médecin.
-- Bonus 4: Admissions et leurs chambres associées

-- Récupérez les informations des admissions et des chambres où les patients sont placés.
-- Bonus 5: Statistiques des patients par département

-- Comptez le nombre de patients associés à chaque département via leurs admissions.