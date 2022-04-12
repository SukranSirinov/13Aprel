CREATE DATABASE University
USE University
CREATE TABLE Groups
(
Id INT PRIMARY KEY IDENTITY,
No NVARCHAR(10) NOT NULL
)
CREATE TABLE Students
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30)NOT NULL,
Surname NVARCHAR(30)NOT NULL,
GroupId INT CONSTRAINT GI_CHECK FOREIGN KEY REFERENCES Groups(Id)
)
CREATE TABLE Subjects
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20)NOT NULL
)
CREATE TABLE Exams
(
Id INT PRIMARY KEY IDENTITY,
Date DATETIME2 ,
SubjectId INT CONSTRAINT SI_CHECK FOREIGN KEY REFERENCES Subjects(Id)
)
CREATE TABLE StudentExams
(
Id INT PRIMARY KEY IDENTITY,
Result TINYINT ,
StudentId INT CONSTRAINT SC_CHECK FOREIGN KEY REFERENCES Students(Id),
ExamId INT CONSTRAINT EI_CHECK FOREIGN KEY REFERENCES Exams(Id)
)
SELECT A.Name'StudensName',A.Surname'StudentsSurname',G.No'GroupsNo'
FROM Students AS A
JOIN Groups AS G
ON A.GroupId=G.Id


SELECT A.Name'StudensName',A.Surname'StudentsSurname',E.Id'ExamsId'
FROM Students AS A
JOIN StudentExams As SE
ON A.Id=SE.StudentId
JOIN Exams AS E
On E.Id=SE.ExamId


SELECT * FROM Subjects
WHERE (SELECT COUNT(Id)FROM Exams WHERE SubjectId=SubjectId)=0


SELECT   A.Name +''+A.Surname'FullName',G.No'GroupsNo'
FROM Students AS A
JOIN Groups AS G
ON A.GroupId=G.Id
JOIN StudentExams As SE
ON A.Id=SE.StudentId
JOIN Exams AS E
On E.Id=SE.ExamId

SELECT Id,Name,Surname,GroupId,(SELECT AVG(Result From StudentExams  )) FROM Students


