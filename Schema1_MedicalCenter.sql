-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "MedCenters" (
    "MedCenterID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Address1" string   NOT NULL,
    CONSTRAINT "pk_MedCenters" PRIMARY KEY (
        "MedCenterID"
     )
);

CREATE TABLE "Doctors" (
    "DoctorID" int   NOT NULL,
    "MedCenterID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Address" string   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "DoctorID"
     )
);

CREATE TABLE "Patients" (
    "PatientID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Address" string   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "PatientID"
     )
);

CREATE TABLE "DocPatientRelationship" (
    "RelationshipID" int   NOT NULL,
    "DoctorID" int   NOT NULL,
    "PatientID" int   NOT NULL,
    CONSTRAINT "pk_DocPatientRelationship" PRIMARY KEY (
        "RelationshipID"
     )
);

CREATE TABLE "Diseases" (
    "DiseaseID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "DiseaseID"
     )
);

CREATE TABLE "Diagnoses" (
    "DiagnosisID" int   NOT NULL,
    "PatientID" int   NOT NULL,
    "DiseaseID" int   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "DiagnosisID"
     )
);

ALTER TABLE "Doctors" ADD CONSTRAINT "fk_Doctors_MedCenterID" FOREIGN KEY("MedCenterID")
REFERENCES "MedCenters" ("MedCenterID");

ALTER TABLE "DocPatientRelationship" ADD CONSTRAINT "fk_DocPatientRelationship_DoctorID" FOREIGN KEY("DoctorID")
REFERENCES "Doctors" ("DoctorID");

ALTER TABLE "DocPatientRelationship" ADD CONSTRAINT "fk_DocPatientRelationship_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patients" ("PatientID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patients" ("PatientID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_DiseaseID" FOREIGN KEY("DiseaseID")
REFERENCES "Diseases" ("DiseaseID");

