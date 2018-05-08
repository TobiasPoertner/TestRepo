CREATE DATABASE dbs11;
USE dbs11;
CREATE TABLE Studenten
(MatrNr INTEGER PRIMARY KEY,
Name VARCHAR(20) NOT NULL,
Semester INTEGER,
GebDatum DATE);
CREATE TABLE Professoren
(PersNr INTEGER PRIMARY KEY,
Name VARCHAR(20) NOT NULL,
Rang CHAR(2) CHECK (Rang in ('C2', 'C3', 'C4')),
Raum INTEGER UNIQUE,
Gebdatum DATE);
CREATE TABLE Assistenten
(PersNr INTEGER PRIMARY KEY,
Name VARCHAR(20) NOT NULL,
Fachgebiet VARCHAR(20),
Boss INTEGER REFERENCES Professoren,
GebDatum DATE);
CREATE TABLE Vorlesungen
(VorlNr INTEGER PRIMARY KEY,
Titel VARCHAR(20),
SWS INTEGER,
gelesenVon INTEGER REFERENCES Professoren);
CREATE TABLE hoeren
(MatrNr INTEGER REFERENCES Studenten ON UPDATE CASCADE
ON DELETE CASCADE,
VorlNr INTEGER REFERENCES Vorlesungen ON UPDATE CASCADE,
PRIMARY KEY (MatrNr, VorlNr));
CREATE TABLE voraussetzen
(Vorgaenger INTEGER REFERENCES Vorlesungen ON UPDATE CASCADE,
Nachfolger INTEGER REFERENCES Vorlesungen,
PRIMARY KEY (Vorgaenger, Nachfolger));
CREATE TABLE pruefen
(MatrNr INTEGER REFERENCES Studenten ON UPDATE CASCADE
ON DELETE CASCADE,
VorlNr INTEGER REFERENCES Vorlesungen ON UPDATE CASCADE,
PersNr INTEGER REFERENCES Professoren,
Note NUMERIC(3,1) CHECK (Note between 0.7 and 5.0),
PRIMARY KEY (MatrNr, VorlNr));
INSERT INTO Studenten(MatrNr, Name, Semester, GebDatum)
VALUES (24002, 'Xenokrates', 18, '1975-10-23');
INSERT INTO Studenten(MatrNr, Name, Semester, GebDatum)
VALUES (25403, 'Jonas', 12,'1973-09-18');
INSERT INTO Studenten(MatrNr, Name, Semester, GebDatum)
VALUES (26120, 'Fichte', 10,'1967-12-04');
INSERT INTO Studenten(MatrNr, Name, Semester, GebDatum)
VALUES (26830, 'Aristoxenos', 8,'1943-08-05');
INSERT INTO Studenten(MatrNr, Name, Semester, GebDatum)
VALUES (27550, 'Schopenhauer', 6,'1954-06-22');
INSERT INTO Studenten(MatrNr, Name, Semester, GebDatum)
VALUES (28106, 'Carnap', 3,'1979-10-02');
INSERT INTO Studenten(MatrNr, Name, Semester, GebDatum)
VALUES (29120, 'Theophrastos', 2,'1948-04-19');
INSERT INTO Studenten(MatrNr, Name, Semester, GebDatum)
VALUES (29555, 'Feuerbach', 2,'1961-02-12');
INSERT INTO Professoren(PersNr, Name, Rang, Raum, GebDatum)
VALUES (2125, 'Sokrates', 'C4', 226,'1923-08-23');
INSERT INTO Professoren(PersNr, Name, Rang, Raum, GebDatum)
VALUES (2126, 'Russel', 'C4', 232,'1934-07-10');
INSERT INTO Professoren(PersNr, Name, Rang, Raum, GebDatum)
VALUES (2127, 'Kopernikus', 'C3', 310,'1962-03-12');
INSERT INTO Professoren(PersNr, Name, Rang, Raum, GebDatum)
VALUES (2133, 'Popper', 'C3', 052,'1949-09-03');
INSERT INTO Professoren(PersNr, Name, Rang, Raum, GebDatum)
VALUES (2134, 'Augustinus', 'C3', 309,'1939-04-19');
INSERT INTO Professoren(PersNr, Name, Rang, Raum, GebDatum)
VALUES (2136, 'Curie', 'C4', 036,'1929-05-10');
INSERT INTO Professoren(PersNr, Name, Rang, Raum, GebDatum)
VALUES (2137, 'Kant', 'C4', 007,'1950-04-04');
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss, GebDatum)
VALUES (3002, 'Platon', 'Ideenlehre', 2125, '1966-08-14');
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss, GebDatum)
VALUES (3003, 'Aristoteles', 'Syllogistik', 2125,'1970-12-23');
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss, GebDatum)
VALUES (3004, 'Wittgenstein', 'Sprachtheorie', 2126,'1968-08-02');
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss, GebDatum)
VALUES (3005, 'Rhetikus', 'Planetenbewegung', 2127,'1962-12-20');
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss, GebDatum)
VALUES (3006, 'Newton', 'Keplersche Gesetze', 2127,'1961-11-10');
INSERT INTO Assistenten(PersNr, Name, Fachgebiet, Boss, GebDatum)
VALUES (3007, 'Spinoza', 'Gott und Natur', 2134,'1963-02-08');
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon)
VALUES (5001, 'Grundzüge', 4, 2137);
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon)
VALUES (5041, 'Ethik', 4, 2125);
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon)
VALUES (5043, 'Erkenntnistheorie', 3, 2126);
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon)
VALUES (5049, 'Mäeutik', 2, 2125);
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon)
VALUES (4052, 'Logik', 4, 2125);
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon)
VALUES (5052, 'Wissenschaftstheorie', 3, 2126);
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon)
VALUES (5216, 'Bioethik', 2, 2126);
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon)
VALUES (5259, 'Der Wiener Kreis', 2, 2133);
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon)
VALUES (5022, 'Glaube und Wissen', 2, 2134);
INSERT INTO Vorlesungen(VorlNr, Titel, SWS, gelesenVon)
VALUES (4630, 'Die 3 Kritiken', 4, 2137);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (26120, 5001);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (27550, 5001);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (27550, 4052);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (27550, 5041);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (28106, 4052);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (28106, 5216);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (28106, 5259);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (27550, 4630);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (29120, 5041);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (29120, 5049);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (29555, 5022);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (25403, 5022);
INSERT INTO hoeren(MatrNr, VorlNr)
VALUES (29555, 5001);
INSERT INTO voraussetzen(Vorgaenger, Nachfolger)
VALUES (5001, 5041);
INSERT INTO voraussetzen(Vorgaenger, Nachfolger)
VALUES (5001, 5043);
INSERT INTO voraussetzen(Vorgaenger, Nachfolger)
VALUES (5001, 5049);
INSERT INTO voraussetzen(Vorgaenger, Nachfolger)
VALUES (5041, 5216);
INSERT INTO voraussetzen(Vorgaenger, Nachfolger)
VALUES (5043, 5052);
INSERT INTO voraussetzen(Vorgaenger, Nachfolger)
VALUES (5041, 5052);
INSERT INTO voraussetzen(Vorgaenger, Nachfolger)
VALUES (5052, 5259);
INSERT INTO pruefen(MatrNr, VorlNr, PersNr, Note)
VALUES (28106, 5001, 2126, 1.0);
INSERT INTO pruefen(MatrNr, VorlNr, PersNr, Note)
VALUES (25403, 5041, 2125, 2.0);
INSERT INTO pruefen(MatrNr, VorlNr, PersNr, Note)
VALUES (27550, 4630, 2137, 2.0);