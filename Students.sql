CREATE DATABASE SchoolDB
GO
USE SchoolDB
GO
CREATE TABLE Speciality 
(
[Id] INT PRIMARY KEY IDENTITY,
[Names] VARCHAR(16) NOT NULL UNIQUE,
[Description] NVARCHAR(1024),
[GraduatesTitle] VARCHAR(32) NOT NULL UNIQUE,
[StartGrade] INT CONSTRAINT startGrade CHECK (StartGrade BETWEEN 1 AND 12) NOT NULL,
[EndGrade] INT CONSTRAINT endGrade CHECK (EndGrade BETWEEN 1 AND 12) NOT NULL,
)
GO
CREATE TABLE Classes(
[Id] INT PRIMARY KEY IDENTITY,
[Grade] INT CONSTRAINT Grade CHECK (Grade BETWEEN 1 and 12) NOT NULL,
[GradeLetter] VARCHAR(1),
CONSTRAINT letter CHECK (GradeLetter='A' OR GradeLetter='B' OR GradeLetter='C' OR GradeLetter='D'),
[SpecialityID] INT
FOREIGN KEY REFERENCES Speciality(Id) 
)
GO
CREATE TABLE Teachers (
[Id] INT PRIMARY KEY IDENTITY,                                     
[FirstName] VARCHAR(16) NOT NULL,
[LastName] VARCHAR(16) NOT NULL,
[Gender] BIT,
[Email] VARCHAR(32) NOT NULL UNIQUE,
[Subjects] VARCHAR(64) NOT NULL,
[ManagedClassID] INT
FOREIGN KEY REFERENCES Classes(Id)
)
GO
CREATE TABLE Students 
(
[Id] INT PRIMARY KEY IDENTITY,
[FirstName] VARCHAR(16) NOT NULL,
[SurName] VARCHAR(16),
[LastName] VARCHAR(16) NOT NULL,
[GSM] VARCHAR(16) NOT NULL,
[Email] NVARCHAR(32) NOT NULL UNIQUE,
[Addresses] NVARCHAR(64) NOT NULL,
[Age] INT CONSTRAINT Age_range CHECK (Age BETWEEN 8 AND 20) NOT NULL,
[Gender] BIT NOT NULL,
[ClassID] INT 
FOREIGN KEY REFERENCES Teachers(Id)
)

INSERT INTO Speciality (Names, Description, GraduatesTitle, StartGrade, EndGrade) VALUES
('Програмиране', 'Специалност, която развива приложното програмиране!','Приложен програмист', 1, 6),
( 'Компоненти', 'Сглобяване на компютър', 'Компютърен техник', 1, 6 ),
( 'ЕЛ Техника', 'Електронна техника и технологии', 'Електротехник', 1, 6)

INSERT INTO Classes (Grade, GradeLetter, SpecialityId) VALUES
(2, 'A', 1),
(12, 'B', 2),
(8, 'C', 3)

INSERT INTO Teachers (FirstName, LastName, Gender, Email, Subjects, ManagedClassID) VALUES
('Rosie', 'Redjep', 0, 'kmself@gmail.com', 'English', 1),
('Obraiam', 'Beycon', 1, 'uncle@outlook.com', 'Georgraphy', 2),
('Sofia','Eliona', 0, 'thiswood@abv.bg', 'Maths', 3)

INSERT INTO Students (FirstName, Surname, LastName, GSM, Email, Addresses, Age, Gender, ClassID) VALUES
('Akinori',' Yaguchi','Mamoru','+359 2 836 1769','akinori@gmail.com','169-1090, Tsukuriya', 15, 1, 1),                                  
('Yasuharu','Horii','Shiga','+359 2 879 4140','yasuharu@gmail.com','362-1011, Niijuku', 16, 1, 2),
('Kuniaki','Itahashi','Kozue','+359 2 257 7404','kuniaki@gmail.com','495-1253, Mukaihama,-shi',15, 0 ,3),
('Shoichiro','Nagasawa','Kumamoto','+359 2 693 0948','yoshimitsu@gmail.com','498-1297, Uwaya',16, 1, 2),
('Yoshimitsu','Takei','Shuzo','+359 2 482 1733','ijima@gmail.com','344-1063, Aminocho Tawarano',16, 1, 1),
('Ken Ijima','Yozo','Yazawa','+359 2 875 6149','masayuki@gmail.com','342-1234, Umajicho',15, 1, 3),
('Masayuki','Onoda','Toyo','+359 2 186 5283','katsuzo@gmail.com','466-1107, Sumiyoshicho',15, 0, 1),
('Hana','Yoshiwara','Fujiki','+359 2 245 7821','hana@gmail.com','155-1067, Uchizato Furutameike',16, 0, 2),
('Kazumi','Maejima','Arakawa','+359 2 983 1239','kazumi@gmail.com','297-1042, Memambetsu Hongo',16, 0, 3),
('Miuki','Tacuya','Kadekawa', '+359 2 681 3826','miukitacuya@gmail.com', '657-1329 Merasu Fontanu', 15, 0, 2)



SELECT * FROM Students
SELECT * FROM Teachers
SELECT * FROM Classes
SELECT * FROM Speciality
