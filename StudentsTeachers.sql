CREATE DATABASE SchoolDB
USE SchoolDB
GO
CREATE TABLE Students (
Id INT PRIMARY KEY IDENTITY,
[FirstName] VARCHAR(16) NOT NULL,
[SurName] VARCHAR(16),
[LastName] VARCHAR(16) NOT NULL,
[GSM] VARCHAR(16) NOT NULL,
[Email] VARCHAR(32) NOT NULL UNIQUE,
[Addresses] VARCHAR(64) NOT NULL,
[Age] INT CONSTRAINT Age_range CHECK (Age BETWEEN 8 AND 20) NOT NULL,
[Gender] BIT,
[ClassID] INT CONSTRAINT FK_Students_Classes
FOREIGN KEY REFERENCES Classes(Id)
)
GO
CREATE TABLE Teachers (
Id INT PRIMARY KEY IDENTITY,                                     
[FirstName] VARCHAR(16) NOT NULL,
[LastName] VARCHAR(16) NOT NULL,
[Gender] BIT,
[Email] VARCHAR(32) NOT NULL UNIQUE,
[Subjects] VARCHAR(64),
[ManagedClassID] INT CONSTRAINT FK_ManagedClassID_Classes
FOREIGN KEY REFERENCES Classes(Id)

/*[ManagedClassID] INT CONSTRAINT FK_Towns_Countries
FOREIGN KEY REFERENCES Countries(Id) NOT NULL,
/*Препратка към Id, за да провери дали съществува*/
[Region] INT CONSTRAINT FK_Towns_Towns
FOREIGN KEY REFERENCES Towns(Id) */
)
/*GO
CREATE TABLE People (
Id NVARCHAR(64) PRIMARY KEY,
[FirstName] VARCHAR(16) NOT NULL,
[SurName] VARCHAR(16),
[LastName] VARCHAR(16) NOT NULL,
[Age] INT NOT NULL,
[Gender] BIT,
[Email] NVARCHAR(32) NOT NULL UNIQUE,
[Description] NVARCHAR(MAX),
[TownId] INT CONSTRAINT FK_People_Towns
FOREIGN KEY REFERENCES Towns(Id),
CONSTRAINT Age_range CHECK (Age BETWEEN 1 AND 105)
)*/
GO
CREATE TABLE Speciality (
Id INT PRIMARY KEY,
[Name] VARCHAR(16) NOT NULL UNIQUE,
[Description] NVARCHAR(1024),
[GraduatesTitle] VARCHAR(32) NOT NULL UNIQUE,
[StartGrade] INT CONSTRAINT startGrade CHECK (StartGrade BETWEEN 1 AND 12) NOT NULL,
[EndGrade] INT CONSTRAINT endGrade CHECK (EndGrade BETWEEN 1 AND 12) NOT NULL,
)

CREATE TABLE Classes (
Id INT PRIMARY KEY,
[Grade] INT CONSTRAINT startGrade CHECK (Grade BETWEEN 1 AND 12) NOT NULL,
[GradeLetter] VARCHAR(1),
CONSTRAINT letter CHECK (GradeLetter='A'OR GradeLetter='B'OR GradeLetter='C'OR GradeLetter='D'),
[SpeacialityId] INT CONSTRAINT FK_Classes_Speaciality
FOREIGN KEY REFERENCES Speciality(Id)
)
INSERT INTO Students(Id, FirstName, SurName, LastName, GSM, Email, Addresses, Age, Gender) VALUES
(1,'Akinori',' Yaguchi','Mamoru','+359 2 836 1769','akinori@gmail.com','169-1090, Tsukuriya', 15, 1),                                  
(2,'Yasuharu','Horii','Shiga','+359 2 879 4140','yasuharu@gmail.com','362-1011, Niijuku', 16, 1),
(3,'Kuniaki','Itahashi','Kozue','+359 2 257 7404','kuniaki@gmail.com','495-1253, Mukaihama,-shi',15, 0),
(4,'Shoichiro','Nagasawa','Kumamoto','+359 2 693 0948','yoshimitsu@gmail.com','498-1297, Uwaya',16, 1),
(5,'Yoshimitsu','Takei','Shuzo','+359 2 482 1733','ijima@gmail.com','344-1063, Aminocho Tawarano',16, 1),
(6,'Ken Ijima','Yozo','Yazawa','+359 2 875 6149','masayuki@gmail.com','342-1234, Umajicho',15, 1),
(7,'Masayuki','Onoda','Toyo','+359 2 186 5283','katsuzo@gmail.com','466-1107, Sumiyoshicho',15, 0),
(8,'Katsuzo','Yoshino','Yasukazu','+359 2 290 7819','akinori@gmail.com','305-1103, Nishiodori',15, 1),
(9,'Hana','Yoshiwara','Fujiki','+359 2 245 7821','hana@gmail.com','155-1067, Uchizato Furutameike',16, 0),
(10,'Kazumi','Maejima','Arakawa','+359 2 983 1239','kazumi@gmail.com','297-1042, Memambetsu Hongo',16, 0)

INSERT INTO Teachers VALUES
('Rosie', 'Redjep', 0, 'kmself@gmail.com', 'English'),
('Obraiam', 'Beycon', 1, 'uncle@outlook.com', 'Georgraphy'),
('Sofia','Eliona', 0, 'thiswood@abv.bg', 'Maths')

INSERT INTO Classes (Id, Grade, GradeLetter) VALUES
(10, 6, 'A'),
(11, 3, 'C')

INSERT INTO Speciality (Id, Name, Description, GraduatesTitle, StartGrade, EndGrade)
(345, 'Програмиране', 'Специалност, която развива приложното програмиране!','', 1, 6),
(346, 'Компоненти', null, '', 1, 6 ),
(347,'ЕЛ Техника', 'Електронна техника и технологии', '', 1, 6)

SELECT * FROM Students
SELECT * FROM Teachers
SELECT * FROM Classes
SELECT * FROM Speciality


INSERT INTO Towns(Name,PopulationMilions,PostalCode,CountryId,Region) VALUES
('Shumen',89,'9700', 1, 1),
('Plovdiv',343,'4000', 1, 2),
('Smiadovo',4,'9820', 1, 1),
('Richmond',229,'V4K',3 , NULL),
('Kampala',1500,'759125', 2, 5)

DELETE FROM Towns
DBCC CHECKIDENT ('Towns', RESEED, 0)
DROP TABLE People
DROP TABLE Towns





--/DROP TABLE People
delete from people


SELECT * FROM Countries
SELECT * FROM Towns
SELECT * FROM People

SELECT [FirstName] as 'Първо име',[LastName],[Gender] as 'Пол',[Id] FROM People

--/Opredelen izbor
--/SELECT TOP(2) [NAME], [PostalCode] as Post FROM Towns AS T

SELECT * FROM Countries
SELECT * FROM People