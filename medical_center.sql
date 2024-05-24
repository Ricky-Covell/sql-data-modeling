-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center



                    -- TABLES

CREATE TABLE doctors
(
     id SERIAL PRIMARY KEY,
     first_name TEXT NOT NULL,
     last_name TEXT NOT NULL
);


CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT UNIQUE NOT NULL
);


CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,  
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    doctor_id INTEGER NOT NULL REFERENCES doctors,
    diagnose_id INTEGER REFERENCES diagnoses,
    insurance TEXT NOT NULL
);


CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,  
    patient_id INTEGER NOT NULL REFERENCES patients,
    doctor_id INTEGER NOT NULL REFERENCES doctors,
    visit_date DATE NOT NULL,
    appointment_fullfilled BOOLEAN DEFAULT false
);


     





                    -- VALUES

INSERT INTO doctors 
    (first_name, last_name)
VALUES
('Christine', 'Christineson'),
('John', 'Johnson'),
('Jesse', 'Jesseson');   



INSERT INTO diagnoses
    (disease_name)
VALUES
('Toe Cancer'),
('Hair Cancer'),
('Friend Cancer');   


INSERT INTO patients
    (first_name, last_name, doctor_id, diagnose_id, insurance)
VALUES
('Rob', 'Roberts', 1, 1, 'BlueCrossBlueShield'),
('Cam', 'Camberts', 2, 2, 'Aetna'),
('Casper', 'Caspberts', 3, 3, 'GreenCrossOrangeShield');   




INSERT INTO visits
    (patient_id, doctor_id, visit_date, appointment_fullfilled)
VALUES
(1, 1, '10-10-2020', true),
(2, 2, '11-11-2031', false),
(3, 3, '06-03-2045', false);   
     













--          DESIGN
-- DOCTORS:
--      id SERIAL PRIMARY KEY
--      first_name TEXT NOT NULL
--      last_name TEXT NOT NULL
-- 
-- PATIENTS:
--      id SERIAL PRIMARY KEY  
--      doctor_id INTEGER NOT NULL REFERENCES doctors
--      diagnose_id INTEGER NOT NULL REFERENCES diagnoses
--      insurance TEXT NOT NULL
-- 
-- 
-- DIAGNOSES:
--      id SERIAL PRIMARY KEY
--      disease_name TEXT NOT NULL
--      
-- VISITS:
--      id SERIAL PRIMARY KEY  
--      patient_id INTEGER NOT NULL REFERENCES patients
--      doctor_id INTEGER NOT NULL REFERENCES doctors
--      date DATE NOT NULL


