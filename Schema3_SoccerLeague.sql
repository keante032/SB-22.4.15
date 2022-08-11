-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Teams" (
    "TeamID" int   NOT NULL,
    "TeamName" string   NOT NULL,
    "Ranking" int   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "TeamID"
     )
);

CREATE TABLE "Players" (
    "PlayerID" int   NOT NULL,
    "TeamID" int   NOT NULL,
    "PlayerName" string   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "PlayerID"
     )
);

CREATE TABLE "GameMatches" (
    "MatchID" int   NOT NULL,
    "HomeTeamID" int   NOT NULL,
    "AwayTeamID" int   NOT NULL,
    "RefID" int   NOT NULL,
    CONSTRAINT "pk_GameMatches" PRIMARY KEY (
        "MatchID"
     )
);

CREATE TABLE "Referees" (
    "RefID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "RefID"
     )
);

CREATE TABLE "GoalsScored" (
    "GoalsID" int   NOT NULL,
    "MatchID" int   NOT NULL,
    "PlayerID" int   NOT NULL,
    "NumGoals" int   NOT NULL,
    CONSTRAINT "pk_GoalsScored" PRIMARY KEY (
        "GoalsID"
     )
);

CREATE TABLE "Dates" (
    "ID" int   NOT NULL,
    "Season" string   NOT NULL,
    "StartDate" date   NOT NULL,
    "EndDate" date   NOT NULL,
    CONSTRAINT "pk_Dates" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_TeamID" FOREIGN KEY("TeamID")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "GameMatches" ADD CONSTRAINT "fk_GameMatches_HomeTeamID" FOREIGN KEY("HomeTeamID")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "GameMatches" ADD CONSTRAINT "fk_GameMatches_AwayTeamID" FOREIGN KEY("AwayTeamID")
REFERENCES "Teams" ("TeamID");

ALTER TABLE "GameMatches" ADD CONSTRAINT "fk_GameMatches_RefID" FOREIGN KEY("RefID")
REFERENCES "Referees" ("RefID");

ALTER TABLE "GoalsScored" ADD CONSTRAINT "fk_GoalsScored_MatchID" FOREIGN KEY("MatchID")
REFERENCES "GameMatches" ("MatchID");

ALTER TABLE "GoalsScored" ADD CONSTRAINT "fk_GoalsScored_PlayerID" FOREIGN KEY("PlayerID")
REFERENCES "Players" ("PlayerID");

