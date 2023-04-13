CREATE TABLE Print_languages(
	PmID INT ,
	CID INT ,
	Print_language TEXT ,
	PRIMARY KEY (CID,PmID,Print_language),
	FOREIGN KEY (CID) REFERENCES Print_accessibility(CID) ,
	FOREIGN KEY (PmID) REFERENCES Print_accessibility(PmID) 
);

-- Inserting print languages

INSERT INTO Print_languages VALUES (9,1,'Hindi');
INSERT INTO Print_languages VALUES (3,2,'English');
INSERT INTO Print_languages VALUES (1,3,'English');
INSERT INTO Print_languages VALUES (3,4,'Japanese');
INSERT INTO Print_languages VALUES (4,5,'Chinese');
INSERT INTO Print_languages VALUES (5,6,'Russian');
INSERT INTO Print_languages VALUES (8,7,'German');
INSERT INTO Print_languages VALUES (10,8,'French');
INSERT INTO Print_languages VALUES (7,9,'Italian');
INSERT INTO Print_languages VALUES (10,10,'English');
INSERT INTO Print_languages VALUES (2,11,'English');
INSERT INTO Print_languages VALUES (6,12,'English');
INSERT INTO Print_languages VALUES (2,13,'English');
INSERT INTO Print_languages VALUES (9,14,'Mexican');
INSERT INTO Print_languages VALUES (2,15,'English');
--Next
CREATE TABLE Electronic_languages(
	EmID INT ,
	CID INT ,
	Electronic_language TEXT ,
	PRIMARY KEY (CID,EmID,Electronic_language),
	FOREIGN KEY (CID) REFERENCES Electronic_accessibility(CID) ,
	FOREIGN KEY (EmID) REFERENCES Electronic_accessibility(EmID) 
);

--Inserting electronic languages
INSERT INTO Electronic_languages VALUES (9,1,'Hindi');
INSERT INTO Electronic_languages VALUES (3,2,'English');
INSERT INTO Electronic_languages VALUES (1,3,'English');
INSERT INTO Electronic_languages VALUES (3,4,'Japanese');
INSERT INTO Electronic_languages VALUES (4,5,'Chinese');
INSERT INTO Electronic_languages VALUES (5,6,'Russian');
INSERT INTO Electronic_languages VALUES (8,7,'German');
INSERT INTO Electronic_languages VALUES (10,8,'French');
INSERT INTO Electronic_languages VALUES (7,9,'Italian');
INSERT INTO Electronic_languages VALUES (10,10,'English');
INSERT INTO Electronic_languages VALUES (2,11,'English');
INSERT INTO Electronic_languages VALUES (6,12,'English');
INSERT INTO Electronic_languages VALUES (2,13,'English');
INSERT INTO Electronic_languages VALUES (9,14,'Mexican');
INSERT INTO Electronic_languages VALUES (2,15,'English');
--Next
CREATE TABLE Electronic_accessibility(
	EmID INT UNIQUE ,
	CID INT UNIQUE ,
	Start_time TEXT,
	PRIMARY KEY (CID,EmID),
	FOREIGN KEY (CID) REFERENCES Country(CID) ,
	FOREIGN KEY (EmID) REFERENCES Electronic_media(EmID) 
);

--Inserting in Electronic_accessibility
INSERT INTO Electronic_accessibility VALUES (9,1,'14:30');
INSERT INTO Electronic_accessibility VALUES (3,2,'4:00');
INSERT INTO Electronic_accessibility VALUES (1,3,'19:00');
INSERT INTO Electronic_accessibility VALUES (3,4,'18:00');
INSERT INTO Electronic_accessibility VALUES (4,5,'17:00');
INSERT INTO Electronic_accessibility VALUES (5,6,'12:00');
INSERT INTO Electronic_accessibility VALUES (8,7,'10:00');
INSERT INTO Electronic_accessibility VALUES (10,8,'10:00');
INSERT INTO Electronic_accessibility VALUES (7,9,'10:00');
INSERT INTO Electronic_accessibility VALUES (10,10,'10:00');
INSERT INTO Electronic_accessibility VALUES (2,11,'4:00');
INSERT INTO Electronic_accessibility VALUES (6,12,'6:00');
INSERT INTO Electronic_accessibility VALUES (2,13,'11:00');
INSERT INTO Electronic_accessibility VALUES (9,14,'3:00');
INSERT INTO Electronic_accessibility VALUES (2,15,'10:00');
--Next
CREATE TABLE Print_accessibility(
	PmID INT UNIQUE,
	CID INT UNIQUE,
	Publishing_date_start TEXT,
    Publishing_date_end TEXT,
	PRIMARY KEY (CID,PmID),
	FOREIGN KEY (CID) REFERENCES Country(CID) ,
	FOREIGN KEY (PmID) REFERENCES Print_media(PmID) 
);
--Inserting in Print_accessibility
INSERT INTO Print_accessibility VALUES (9,1,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (3,2,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (1,3,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (3,4,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (4,5,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (5,6,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (8,7,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (10,8,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (7,9,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (10,10,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (2,11,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (6,12,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (2,13,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (9,14,'16-03-2023', '19-03-2023');
INSERT INTO Print_accessibility VALUES (2,15,'16-03-2023', '19-03-2023');




