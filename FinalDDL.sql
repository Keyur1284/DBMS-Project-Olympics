DROP SCHEMA Olympidb CASCADE;
CREATE SCHEMA Olympidb;
SET SEARCH_PATH TO Olympidb;

CREATE TABLE Brands(
	BID INT PRIMARY KEY,
	Brand_name TEXT ,
	Endorsed_money INT
);

CREATE TABLE Medical_test(
	MID INT PRIMARY KEY,
	Test_name TEXT
);

CREATE TABLE Events(
	EvID INT PRIMARY KEY,
	Event_name TEXT ,
	Sport_name TEXT ,
	World_record TEXT ,
	Olympic_record TEXT
);

CREATE TABLE Weather_condition(
	WID INT PRIMARY KEY,
	Temperature TEXT ,
	Air_quality TEXT ,
	Humidity NUMERIC (4,2) ,
	Wind_speed INT 
);

CREATE TABLE Country(
	CID INT PRIMARY KEY,
	Country_name TEXT ,
	Continent TEXT ,
	UTC TEXT 
);

CREATE TABLE Electronic_media(
	EmID INT PRIMARY KEY,
	Electronic_name TEXT ,
	Streaming_duration TEXT 
);

CREATE TABLE Print_media(
	PmID INT PRIMARY KEY,
	Print_name TEXT ,
	Copies_sold INT 
);

CREATE TABLE Player(
	PID INT PRIMARY KEY,
	Gender TEXT ,
	Name TEXT,
	Personal_best TEXT,
	Age INT,
	Height NUMERIC (5,2) ,
	Weight NUMERIC (5,2) ,
	CID INT ,
	FOREIGN KEY (CID) REFERENCES Country(CID)
);

CREATE TABLE Fitness_checkup(
	PID INT ,
	MID INT ,
	Result TEXT,
	PRIMARY KEY (PID,MID),
	FOREIGN KEY (PID) REFERENCES Player(PID) ,
	FOREIGN KEY (MID) REFERENCES Medical_test(MID) 
);

CREATE TABLE Player_association(
	PID INT ,
	BID INT ,
	Tenure INT,
	PRIMARY KEY (PID,BID),
	FOREIGN KEY (PID) REFERENCES Player(PID) ,
	FOREIGN KEY (BID) REFERENCES Brands(BID) 
);

CREATE TABLE Player_participation(
	PID INT ,
	EvID INT ,
	Year INT,
	Result NUMERIC (6,2),
	PRIMARY KEY (PID,EvID),
	FOREIGN KEY (PID) REFERENCES Player(PID) ,
	FOREIGN KEY (EvID) REFERENCES Events(EvID) 
);

CREATE TABLE Electronic_accessibility(
	CID INT UNIQUE ,
	EmID INT UNIQUE ,
	Start_time TEXT,
	PRIMARY KEY (CID,EmID),
	FOREIGN KEY (CID) REFERENCES Country(CID) ,
	FOREIGN KEY (EmID) REFERENCES Electronic_media(EmID) 
);

CREATE TABLE Print_accessibility(
	CID INT UNIQUE,
	PmID INT UNIQUE,
	Publishing_date TEXT,
	PRIMARY KEY (CID,PmID),
	FOREIGN KEY (CID) REFERENCES Country(CID) ,
	FOREIGN KEY (PmID) REFERENCES Print_media(PmID) 
);

CREATE TABLE Olympic_host(
	CID INT ,
	Year INT ,
	No_of_participants INT,
	No_of_stadium INT,
	Rating Numeric (3,2) ,
	WID INT ,
	PRIMARY KEY (CID,Year),
	FOREIGN KEY (CID) REFERENCES Country(CID) ,
	FOREIGN KEY (WID) REFERENCES Weather_Condition(WID) 
);

CREATE TABLE Olympic_staff(
	CID INT ,
	StID INT PRIMARY KEY,
	Staff_name TEXT,
	Duty TEXT,
	FOREIGN KEY (CID) REFERENCES Country(CID)  
);

CREATE TABLE Print_languages(
	CID INT ,
	PmID INT ,
	Print_language TEXT ,
	PRIMARY KEY (CID,PmID,Print_language),
	FOREIGN KEY (CID) REFERENCES Print_accessibility(CID) ,
	FOREIGN KEY (PmID) REFERENCES Print_accessibility(PmID) 
);

CREATE TABLE Electronic_languages(
	CID INT ,
	EmID INT ,
	Electronic_language TEXT ,
	PRIMARY KEY (CID,EmID,Electronic_language),
	FOREIGN KEY (CID) REFERENCES Electronic_accessibility(CID) ,
	FOREIGN KEY (EmID) REFERENCES Electronic_accessibility(EmID) 
);

-- INSERTING VALUES IN ALL TABLES

-- INSERTING IN BRANDS TABLE

INSERT INTO Brands VALUES (1,'Nike',1000000);
INSERT INTO Brands VALUES (2,'Adidas',3000000);
INSERT INTO Brands VALUES (3,'Puma',4000000);
INSERT INTO Brands VALUES (4,'Jalal',5000000);
INSERT INTO Brands VALUES (5,'Ceat',1000000);
INSERT INTO Brands VALUES (6,'MRF',3000000);
INSERT INTO Brands VALUES (7,'Amazon',8000000);
INSERT INTO Brands VALUES (8,'Virgin',9000000);
INSERT INTO Brands VALUES (9,'Ford',10000000);
INSERT INTO Brands VALUES (10,'Mercedes',35000000);
INSERT INTO Brands VALUES (11,'Red Bull',7000000);
INSERT INTO Brands VALUES (12,'Hyundai',9000000);
INSERT INTO Brands VALUES (13,'Nissan',2000000);
INSERT INTO Brands VALUES (14,'Tata',3000000);
INSERT INTO Brands VALUES (15,'Kingfisher',4000000);

-- INSERTING IN MEDICAL_TEST TABLE

INSERT INTO Medical_test VALUES (1,'Dopamine');
INSERT INTO Medical_test VALUES (2,'ECG');

-- INSERTING IN EVENTS TABLE

INSERT INTO Events VALUES (1,'Backstroke','Swimming','20.23 s','21.24 s');
INSERT INTO Events VALUES (2,'Butterfly','Swimming','40.23 s','41.24 s');

INSERT INTO Events VALUES (3,'100 metres','Sprint','9.42 s','9.94 s');
INSERT INTO Events VALUES (4,'400 metres','Sprint','40.19 s','40.84 s');

INSERT INTO Events VALUES (5,'Snatch','Weightlifting','150 kg','135 kg');
INSERT INTO Events VALUES (6,'Clean and Jerk','Weightlifting','166 kg','160 kg');

INSERT INTO Events VALUES (7,'Javelin','Track and Field','100 m','90 m');
INSERT INTO Events VALUES (8,'Shot Put','Track and Field','40 m','33 m');
INSERT INTO Events VALUES (9,'Long Jump','Track and Field','9.23 m','8.95 m');
INSERT INTO Events VALUES (10,'Pole Vault','Track and Field','7.12 m','6.03 m');

-- INSERTING IN WEATHER_CONDITION TABLE

INSERT INTO Weather_condition VALUES (1,'30 C','Good',5.23,10);
INSERT INTO Weather_condition VALUES (2,'24 C','Good',20.42,15);
INSERT INTO Weather_condition VALUES (3,'27 C','Moderate',15.78,12);
INSERT INTO Weather_condition VALUES (4,'32 C','Good',28.34,18);
INSERT INTO Weather_condition VALUES (5,'35 C','Moderate',14.62,9);

-- INSERTING IN COUNTRY TABLE

INSERT INTO Country VALUES (1,'India','Asia','UTC +5:30');
INSERT INTO Country VALUES (2,'USA','North America','UTC -5:00');
INSERT INTO Country VALUES (3,'Australia','Australia','UTC +10:00');
INSERT INTO Country VALUES (4,'Japan','Asia','UTC +9:00');
INSERT INTO Country VALUES (5,'China','Asia','UTC +8:00');
INSERT INTO Country VALUES (6,'Russia','Europe','UTC +3:00');
INSERT INTO Country VALUES (7,'Germany','Europe','UTC +1:00');
INSERT INTO Country VALUES (8,'France','Europe','UTC +1:00');
INSERT INTO Country VALUES (9,'Italy','Europe','UTC +1:00');
INSERT INTO Country VALUES (10,'UK','Europe','UTC +1:00');
INSERT INTO Country VALUES (11,'Canada','North America','UTC -5:00');
INSERT INTO Country VALUES (12,'Brazil','South America','UTC -3:00');
INSERT INTO Country VALUES (13,'South Africa','Africa','UTC +2:00');
INSERT INTO Country VALUES (14,'Mexico','North America','UTC -6:00');
INSERT INTO Country VALUES (15,'Netherlands','Europe','UTC +1:00');

-- INSERTING IN Electronic_media TABLE

INSERT INTO Electronic_media VALUES (1,'TV','8 hours');
INSERT INTO Electronic_media VALUES (2,'Radio','6 hours');
INSERT INTO Electronic_media VALUES (3,'Internet','12 hours');
INSERT INTO Electronic_media VALUES (4,'DVD','7 hours');
INSERT INTO Electronic_media VALUES (5,'CD','6 hours');
INSERT INTO Electronic_media VALUES (6,'Blu-ray','7 hours');
INSERT INTO Electronic_media VALUES (7,'VHS','6 hours');
INSERT INTO Electronic_media VALUES (8,'HDTV','8 hours');
INSERT INTO Electronic_media VALUES (9,'Laserdisc','4 hours');
INSERT INTO Electronic_media VALUES (10,'Ultraviolet','2 hours');

-- INSERTING IN Print_media TABLE

INSERT INTO Print_media VALUES (1,'New York Times',100000);
INSERT INTO Print_media VALUES (2,'Wall Street Journal',120000);
INSERT INTO Print_media VALUES (3,'USA Today',150000);
INSERT INTO Print_media VALUES (4,'The Washington Post',100000);
INSERT INTO Print_media VALUES (5,'Los Angeles Times',100000);
INSERT INTO Print_media VALUES (6,'Chicago Tribune',200000);
INSERT INTO Print_media VALUES (7,'The Boston Globe',150000);
INSERT INTO Print_media VALUES (8,'The New York Post',100000);
INSERT INTO Print_media VALUES (9,'Times of India',250000);
INSERT INTO Print_media VALUES (10,'The Britain Times',100000);


CREATE TABLE Player(
	PID INT PRIMARY KEY,
	Gender TEXT ,
	Name TEXT,
	Personal_best TEXT,
	Age INT,
	Height NUMERIC (5,2) ,
	Weight NUMERIC (5,2) ,
	CID INT ,
	FOREIGN KEY (CID) REFERENCES Country(CID)
);

-- INSERTING IN PLAYER TABLE

-- 1 to 5 -> swimming
-- 6 to 10 -> sprint
-- 11 to 15 -> weightlifting
-- 16 to 25 -> track and field

INSERT INTO Player VALUES (1,'F','Dhruvi Lad','23.69 s',170,50,1);
INSERT INTO Player VALUES (2,'F','Rajata Chauhan','22.42 s',175,52,6);
INSERT INTO Player VALUES (3,'F','Michel Sharma','24.71 s',169,55,7);
INSERT INTO Player VALUES (4,'F','Rasika Patel','26.48 s',173,58,11);
INSERT INTO Player VALUES (5,'F','Tulip Raj','27.32 s',166,53,3);

INSERT INTO Player VALUES (6,'F','Sakshi Lad','43.69 s',174,50,1);
INSERT INTO Player VALUES (7,'F','Priya Chauhan','42.42 s',175,52,6);
INSERT INTO Player VALUES (8,'F','Priyanshi Sharma','44.71 s',169,55,7);
INSERT INTO Player VALUES (9,'F','Tarika Patel','46.48 s',173,58,11);
INSERT INTO Player VALUES (10,'F','Tanisha Raj','47.32 s',167,53,3);

INSERT INTO Player VALUES (11,'M','Raj Tomar','10.22 s',180,59,14);
INSERT INTO Player VALUES (12,'M','Rana Sharma','11.74 s',163,50,2);
INSERT INTO Player VALUES (13,'M','Rajesh Kumar','13.12 s',175,55,4);
INSERT INTO Player VALUES (14,'M','Tanish Tayal','10.65 s',175,65,6);
INSERT INTO Player VALUES (15,'M','Tinku Patel','12.74 s',162,60,8);

INSERT INTO Player VALUES (16,'M','Vihar Tomar','40.22 s',180,59,14);
INSERT INTO Player VALUES (17,'M','Aryan Sharma','41.74 s',162,50,2);
INSERT INTO Player VALUES (18,'M','Dev Kumar','43.12 s',175,55,4);
INSERT INTO Player VALUES (19,'M','Darshan Tayal','40.65 s',175,65,6);
INSERT INTO Player VALUES (20,'M','Jay Patel','42.74 s',162,60,8);

INSERT INTO Player VALUES (21,'M','Rajat Kumar','150 kg',175,55,15);
INSERT INTO Player VALUES (22,'M','Yash Tayal','156 kg',180,65,2);
INSERT INTO Player VALUES (23,'M','Bhavya Patel','155 kg',162,60,8);
INSERT INTO Player VALUES (24,'M','Naman Kumar','153 kg',177,62,4);
INSERT INTO Player VALUES (25,'M','Vedant Surti','159 kg',174,63,1);

INSERT INTO Player VALUES (26,'M','Priyesh Kumar','167 kg',175,55,15);
INSERT INTO Player VALUES (27,'M','Paresh Tayal','166 kg',180,65,2);
INSERT INTO Player VALUES (28,'M','Jalp Parikh','168 kg',162,60,8);
INSERT INTO Player VALUES (29,'M','Nishith Kumar','169 kg',177,62,4);
INSERT INTO Player VALUES (30,'M','Sarvagna Surti','169 kg',174,63,1);

INSERT INTO Player VALUES (31,'F','Koyal Kumar','100 m',175,55,15);
INSERT INTO Player VALUES (32,'F','Yashvi Doshi','99.76 m',180,65,2);
INSERT INTO Player VALUES (33,'F','Sakshi Saraiya','98.44 m',162,60,8);
INSERT INTO Player VALUES (34,'F','Chavi Sanghvi','98.23 m',177,62,4);
INSERT INTO Player VALUES (35,'F','Kendell Jenner','96.52 m',174,63,1);

INSERT INTO Player VALUES (36,'F','Khushi Kumar','47.23 m',175,55,15);
INSERT INTO Player VALUES (37,'F','Yashi Doshi','46.11 m',180,65,2);
INSERT INTO Player VALUES (38,'F','Siya Saraiya','48.34 m',162,60,8);
INSERT INTO Player VALUES (39,'F','Charu Sanghvi','48.66 m',177,62,4);
INSERT INTO Player VALUES (40,'F','Disha Jenner','45.22 m',174,63,1);

INSERT INTO Player VALUES (41,'M','Abhinav Arya','9.23 m',170,50,3);
INSERT INTO Player VALUES (42,'M','Bhavesh Bhagat','10.43 m',162,55,5);
INSERT INTO Player VALUES (43,'M','Vraj Goti','10.17 m',159,69,7);
INSERT INTO Player VALUES (44,'M','Vasu Jogi','9.47 m',175,63,9);
INSERT INTO Player VALUES (45,'M','Suyash Surti','10.35 m',173,57,10);

INSERT INTO Player VALUES (46,'M','Jayvir Arya','7.23 m',170,50,3);
INSERT INTO Player VALUES (47,'M','Jigar Bhagat','8.43 m',162,55,5);
INSERT INTO Player VALUES (48,'M','Divyam Goti','7.71 m',159,69,7);
INSERT INTO Player VALUES (49,'M','Hardik Jogi','8.47 m',175,63,9);
INSERT INTO Player VALUES (50,'M','Tipendra Surti','7.35 m',173,57,10);

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






