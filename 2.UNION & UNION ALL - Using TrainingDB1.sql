USE TrainingDB1
go

--CHECK DATA
SELECT * FROM MusicStudent
SELECT * FROM DanceStudent

--1.Using a simple UNION
SELECT * FROM MusicStudent
UNION
SELECT * FROM DanceStudent

--2.Using a simple UNION ALL
SELECT * FROM MusicStudent
UNION ALL
SELECT * FROM DanceStudent

--3.Using UNION of two SELECT statement with ORDER BY
--INCORRECT
SELECT * FROM MusicStudent
ORDER BY RollNo
UNION
SELECT * FROM DanceStudent
ORDER BY RollNo

--CORRECT
SELECT * FROM MusicStudent
UNION
SELECT * FROM DanceStudent
ORDER BY RollNo

--4.Using UNION ALL of two SELECT statement with ORDER BY
SELECT * FROM MusicStudent
UNION ALL
SELECT * FROM DanceStudent
ORDER BY RollNo

--5.Using UNION of three SELECT statement with ORDER BY
SELECT * FROM MusicStudent
UNION
SELECT * FROM DanceStudent
UNION
SELECT * FROM SingingStudent
ORDER BY RollNo

--6.Using UNION ALL of three SELECT statement with ORDER BY
SELECT * FROM MusicStudent
UNION ALL
SELECT * FROM DanceStudent
UNION ALL
SELECT * FROM SingingStudent
ORDER BY RollNo

--7.Add a static column in UNION to differentiate the result
SELECT *,'Music' Class FROM MusicStudent
UNION
SELECT *,'Dance' FROM DanceStudent
UNION
SELECT *,'Singing' FROM SingingStudent
ORDER BY RollNo

--8.Add a static column in UNION ALL and result will be same as previous UNION
SELECT *,'Music' Class FROM MusicStudent
UNION ALL
SELECT *,'Dance' FROM DanceStudent
UNION ALL
SELECT *,'Singing' FROM SingingStudent
ORDER BY RollNo


