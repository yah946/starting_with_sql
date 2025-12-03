create database hospitalmanagement;
use hospitalmanagement;
create table departement(
    id int(11) PRIMARY key AUTO_INCREMENT,
    departementName varchar(50),
    location VARCHAR(100)
);
create table medication(
    id int(11) PRIMARY key AUTO_INCREMENT,
    medicationName varchar(100),
    dosage VARCHAR(50)
);
create table patient(
    id int(11) PRIMARY key AUTO_INCREMENT,
    firstName varchar(50),
    lastName varchar(50),
    gender enum('male','female'),
    dateOfBirth DATE,
    phoneNum varchar(15),
    email VARCHAR(100),
    address VARCHAR(255) 
);
create table room(
    id int(11) PRIMARY key AUTO_INCREMENT,
    roomNumber VARCHAR(10),
    roomType ENUM('General','Private','ICU'),
    avilability TINYINT(1)
);
create table admission(
    id int(11) PRIMARY key AUTO_INCREMENT,
    patient_id int(11),
    room_id int(11),
    admissionDate date,
    dischargeDate date,
    foreign key (patient_id) references patient(id),
    foreign key (room_id) references room(id)
);
create table doctor(
    id int(11) PRIMARY key AUTO_INCREMENT,
    firstName varchar(50),
    lastName varchar(50),
    specialization varchar(50),
    phoneNum varchar(15),
    email VARCHAR(100),
    departement_id int(11),
    foreign key (departement_id) references departement(id)
);
create table prescription(
    id int(11) PRIMARY key AUTO_INCREMENT,
    patient_id int(11),
    doctor_id int(11),
    medication_id int(11),
    prescriptionDate date,
    dosageInstructions varchar(255),
    foreign key (patient_id) references patient(id),
    foreign key (doctor_id) references doctor(id),
    foreign key (medication_id) references medication(id)
);
create table staff(
    id int(11) PRIMARY key AUTO_INCREMENT,
    firstName varchar(50),
    lastName varchar(50),
    jobTitle varchar(50),
    phoneNum varchar(15),
    email VARCHAR(100),
    departement_id int(11),
    foreign key (departement_id) references departement(id)
);
create table appointment(
    id int(11) PRIMARY key AUTO_INCREMENT,
    appointmentDate date,
    appointmentTime time,
    patient_id int(11),
    doctor_id int(11),
    reason VARCHAR(255),
    foreign key (patient_id) references patient(id),
    foreign key (doctor_id) references doctor(id)
);
--Fake Data
--DEPARTEMENT Table
INSERT INTO departement (departementName, location) VALUES
('Cardiology', 'Block A'),
('Neurology', 'Block B'),
('Pediatrics', 'Block C'),
('Orthopedics', 'Block D'),
('Emergency', 'Block E'),
('Dermatology', 'Block F'),
('Radiology', 'Block G'),
('Oncology', 'Block H'),
('Urology', 'Block I'),
('Gastroenterology', 'Block J'),
('ENT', 'Block K'),
('Psychiatry', 'Block L'),
('Surgery', 'Block M'),
('Nephrology', 'Block N'),
('Pulmonology', 'Block O');
--MEDICATION Table
INSERT INTO medication (medicationName, dosage) VALUES
('Aspirin', '100 mg'),
('Ibuprofen', '200 mg'),
('Paracetamol', '500 mg'),
('Amoxicillin', '500 mg'),
('Metformin', '850 mg'),
('Lisinopril', '10 mg'),
('Atorvastatin', '20 mg'),
('Cetirizine', '10 mg'),
('Omeprazole', '20 mg'),
('Azithromycin', '250 mg'),
('Prednisone', '5 mg'),
('Ciprofloxacin', '500 mg'),
('Doxycycline', '100 mg'),
('Sertraline', '50 mg'),
('Losartan', '25 mg');
--PATIENT Table
INSERT INTO patient (firstName, lastName, gender, dateOfBirth, phoneNum, email, address) VALUES
('Mark', 'Lee', 'male', '1985-06-12', '555-3001', 'mark@mail.com', '12 River St'),
('Sophia', 'Hall', 'female', '1990-04-21', '555-3002', 'sophia@mail.com', '88 Maple Ave'),
('Daniel', 'Young', 'male', '1978-09-11', '555-3003', 'dan@mail.com', '55 Elm St'),
('Olivia', 'Clark', 'female', '1989-12-08', '555-3004', 'olivia@mail.com', '77 Oak Rd'),
('Lucas', 'Baker', 'male', '2001-02-17', '555-3005', 'lucas@mail.com', '90 Cedar Blvd'),
('Emma', 'Carter', 'female', '2005-07-28', '555-3006', 'emma@mail.com', '15 Birch Ln'),
('Henry', 'Scott', 'male', '1994-03-02', '555-3007', 'henry@mail.com', '4 Pine St'),
('Ava', 'Lewis', 'female', '1981-01-19', '555-3008', 'ava@mail.com', '100 Willow St'),
('Noah', 'King', 'male', '1999-06-30', '555-3009', 'noah@mail.com', '60 Lake Dr'),
('Isabella', 'Wright', 'female', '1975-11-14', '555-3010', 'isabella@mail.com', '33 Hill Rd'),
('Ethan', 'Lopez', 'male', '2003-09-22', '555-3011', 'ethan@mail.com', '120 Sunset Blvd'),
('Mia', 'Adams', 'female', '1991-10-01', '555-3012', 'mia@mail.com', '25 Cherry Ln'),
('Logan', 'Turner', 'male', '1983-05-26', '555-3013', 'logan@mail.com', '3 Forest Rd'),
('Ella', 'Parker', 'female', '1996-08-09', '555-3014', 'ella@mail.com', '5 Garden Way'),
('Jack', 'Evans', 'male', '1970-03-18', '555-3015', 'jack@mail.com', '17 Cypress Ave');
--ROOM Table
INSERT INTO room (roomNumber, roomType, avilability) VALUES
('101', 'General', 1),
('102', 'General', 0),
('103', 'Private', 1),
('104', 'Private', 0),
('105', 'ICU', 1),
('201', 'General', 1),
('202', 'General', 1),
('203', 'Private', 0),
('204', 'ICU', 1),
('301', 'General', 0),
('302', 'Private', 1),
('303', 'ICU', 1),
('304', 'General', 1),
('305', 'Private', 0),
('306', 'ICU', 1);
--ADMISSION Table
INSERT INTO admission (patient_id, room_id, admissionDate, dischargeDate) VALUES
(1, 1, '2025-01-01', '2025-01-05'),
(2, 2, '2025-01-03', NULL),
(3, 3, '2025-01-04', '2025-01-06'),
(4, 4, '2025-01-05', NULL),
(5, 5, '2025-01-06', '2025-01-08'),
(6, 6, '2025-01-07', NULL),
(7, 7, '2025-01-08', '2025-01-10'),
(8, 8, '2025-01-09', NULL),
(9, 9, '2025-01-10', '2025-01-12'),
(10, 10, '2025-01-11', NULL),
(11, 11, '2025-01-12', '2025-01-13'),
(12, 12, '2025-01-13', NULL),
(13, 13, '2025-01-14', '2025-01-17'),
(14, 14, '2025-01-15', NULL),
(15, 15, '2025-01-16', '2025-01-20');
--DOCTOR Table
INSERT INTO doctor (firstName, lastName, specialization, phoneNum, email, departement_id) VALUES
('Alice', 'Miller', 'Cardiologist', '555-2001', 'alice@hospital.com', 1),
('Robert', 'Davis', 'Neurologist', '555-2002', 'robert@hospital.com', 2),
('Linda', 'Martin', 'Pediatrician', '555-2003', 'linda@hospital.com', 3),
('James', 'Anderson', 'Orthopedic Surgeon', '555-2004', 'james@hospital.com', 4),
('Patricia', 'Thomas', 'Emergency Physician', '555-2005', 'patricia@hospital.com', 5),
('Oliver', 'Moore', 'Dermatologist', '555-2006', 'oliver@hospital.com', 6),
('Sophia', 'Clark', 'Radiologist', '555-2007', 'sophia@hospital.com', 7),
('Ethan', 'Bennett', 'Oncologist', '555-2008', 'ethan@hospital.com', 8),
('Mia', 'Reed', 'Urologist', '555-2009', 'mia@hospital.com', 9),
('Noah', 'Ward', 'Gastroenterologist', '555-2010', 'noah@hospital.com', 10),
('Ava', 'Rogers', 'ENT Specialist', '555-2011', 'ava@hospital.com', 11),
('Liam', 'Cook', 'Psychiatrist', '555-2012', 'liam@hospital.com', 12),
('Isabella', 'Murphy', 'Surgeon', '555-2013', 'isabella@hospital.com', 13),
('Mason', 'Bell', 'Nephrologist', '555-2014', 'mason@hospital.com', 14),
('Ella', 'Collins', 'Pulmonologist', '555-2015', 'ella@hospital.com', 15);
--PRESCRIPTION Table
INSERT INTO prescription (patient_id, doctor_id, medication_id, prescriptionDate, dosageInstructions) VALUES
(1, 1, 1, '2025-01-10', 'Take once daily'),
(2, 2, 2, '2025-01-11', 'Take twice daily'),
(3, 3, 3, '2025-01-12', 'Take after meals'),
(4, 4, 4, '2025-01-13', 'One tablet every 8 hours'),
(5, 5, 5, '2025-01-14', 'Take in the morning'),
(6, 6, 6, '2025-01-15', 'Take before bed'),
(7, 7, 7, '2025-01-16', 'Every 12 hours'),
(8, 8, 8, '2025-01-17', 'One tablet daily'),
(9, 9, 9, '2025-01-18', 'Two times a day'),
(10, 10, 10, '2025-01-19', 'After breakfast'),
(11, 11, 11, '2025-01-20', 'Every 6 hours'),
(12, 12, 12, '2025-01-21', 'Take once daily'),
(13, 13, 13, '2025-01-22', 'Before bed'),
(14, 14, 14, '2025-01-23', 'Take after lunch'),
(15, 15, 15, '2025-01-24', 'Take twice daily');
--STAFF Table
INSERT INTO staff (firstName, lastName, jobTitle, phoneNum, email, departement_id) VALUES
('John', 'Smith', 'Nurse', '555-1001', 'john@hospital.com', 1),
('Emily', 'Brown', 'Receptionist', '555-1002', 'emily@hospital.com', 5),
('Michael', 'Wilson', 'Technician', '555-1003', 'michael@hospital.com', 2),
('Sarah', 'Johnson', 'Head Nurse', '555-1004', 'sarah@hospital.com', 3),
('David', 'Taylor', 'Admin', '555-1005', 'david@hospital.com', 4),
('Anna', 'Scott', 'Nurse', '555-1006', 'anna@hospital.com', 1),
('Peter', 'Harris', 'Lab Tech', '555-1007', 'peter@hospital.com', 7),
('Julia', 'Adams', 'Receptionist', '555-1008', 'julia@hospital.com', 10),
('Kevin', 'Baker', 'Nurse', '555-1009', 'kevin@hospital.com', 13),
('Laura', 'Lopez', 'Assistant', '555-1010', 'laura@hospital.com', 8),
('George', 'King', 'Nurse', '555-1011', 'george@hospital.com', 11),
('Chloe', 'Young', 'Cleaner', '555-1012', 'chloe@hospital.com', 14),
('Frank', 'Price', 'Technician', '555-1013', 'frank@hospital.com', 9),
('Emma', 'Bell', 'Admin', '555-1014', 'emma@hospital.com', 15),
('Henry', 'Carter', 'Security', '555-1015', 'henry@hospital.com', 6);
--APPOINTMENT Table
INSERT INTO appointment (appointmentDate, appointmentTime, patient_id, doctor_id, reason) VALUES
('2025-02-01', '09:00', 1, 1, 'Heart Checkup'),
('2025-02-02', '10:30', 2, 2, 'Migraine'),
('2025-02-03', '11:15', 3, 3, 'Fever'),
('2025-02-04', '14:00', 4, 4, 'Fracture'),
('2025-02-05', '16:45', 5, 5, 'Emergency'),
('2025-02-06', '09:20', 6, 6, 'Skin Rash'),
('2025-02-07', '10:00', 7, 7, 'X-Ray Review'),
('2025-02-08', '13:30', 8, 8, 'Chemotherapy Follow-up'),
('2025-02-09', '15:00', 9, 9, 'Urinary Pain'),
('2025-02-10', '08:50', 10, 10, 'Stomach Pain'),
('2025-02-11', '09:40', 11, 11, 'ENT Infection'),
('2025-02-12', '11:00', 12, 12, 'Mental Health Consultation'),
('2025-02-13', '12:10', 13, 13, 'Surgery Review'),
('2025-02-14', '14:30', 14, 14, 'Kidney Pain'),
('2025-02-15', '16:00', 15, 15, 'Breathing Issue');
