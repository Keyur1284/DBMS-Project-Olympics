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
	PmID INT ,
	CID INT ,
	Print_language TEXT ,
	PRIMARY KEY (CID,PmID,Print_language),
	FOREIGN KEY (CID) REFERENCES Print_accessibility(CID) ,
	FOREIGN KEY (PmID) REFERENCES Print_accessibility(PmID) 
);

CREATE TABLE Electronic_languages(
	EmID INT ,
	CID INT ,
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