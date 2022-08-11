-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Regions" (
    "RegionID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "RegionID"
     )
);

CREATE TABLE "Users" (
    "UserID" int   NOT NULL,
    "RegionID" int   NOT NULL,
    "Username" string   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "UserID"
     )
);

CREATE TABLE "Posts" (
    "PostID" int   NOT NULL,
    "UserID" int   NOT NULL,
    "RegionID" int   NOT NULL,
    "Title" string   NOT NULL,
    "Text" string   NOT NULL,
    "Location" string   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "PostID"
     )
);

CREATE TABLE "Categories" (
    "CategoryID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "CategoryID"
     )
);

CREATE TABLE "Post-Category" (
    "ID" int   NOT NULL,
    "PostID" int   NOT NULL,
    "CategoryID" int   NOT NULL,
    CONSTRAINT "pk_Post-Category" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_RegionID" FOREIGN KEY("RegionID")
REFERENCES "Regions" ("RegionID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_UserID" FOREIGN KEY("UserID")
REFERENCES "Users" ("UserID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_RegionID" FOREIGN KEY("RegionID")
REFERENCES "Regions" ("RegionID");

ALTER TABLE "Post-Category" ADD CONSTRAINT "fk_Post-Category_PostID" FOREIGN KEY("PostID")
REFERENCES "Posts" ("PostID");

ALTER TABLE "Post-Category" ADD CONSTRAINT "fk_Post-Category_CategoryID" FOREIGN KEY("CategoryID")
REFERENCES "Categories" ("CategoryID");

