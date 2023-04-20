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
	Temperature_C INT ,
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
	Streaming_duration_hrs INT 
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
	Report TEXT,
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
	Result NUMERIC (6,2),
	PRIMARY KEY (PID,EvID),
	FOREIGN KEY (PID) REFERENCES Player(PID) ,
	FOREIGN KEY (EvID) REFERENCES Events(EvID) 
);

CREATE TABLE Electronic_accessibility(
	EmID INT ,
	CID INT  ,
	Start_time TEXT,
	PRIMARY KEY (CID,EmID),
	FOREIGN KEY (CID) REFERENCES Country(CID) ,
	FOREIGN KEY (EmID) REFERENCES Electronic_media(EmID) 
);

CREATE TABLE Print_accessibility(
	PmID INT ,
	CID INT ,
	Publishing_date_start TEXT,
	Publishing_date_end TEXT,
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
	FOREIGN KEY (CID,PmID) REFERENCES Print_accessibility(CID,PmID) 
);

CREATE TABLE Electronic_languages(
	EmID INT ,
	CID INT ,
	Electronic_language TEXT ,
	PRIMARY KEY (CID,EmID,Electronic_language),
	FOREIGN KEY (CID,EmID) REFERENCES Electronic_accessibility(CID,EmID) 
);