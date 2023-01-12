USE MyStoreDB
go
--CHECK THE DATA
SELECT * FROM Sales
SELECT * FROM Employee
SELECT * FROM Customer

SELECT FirstName,LastName,Email FROM Customer
SELECT FirstName,LastName,Email FROM Employee

--UNION
--1.Using a simple UNION
SELECT FirstName,LastName,Email FROM Customer
UNION
SELECT FirstName,LastName,Email FROM Employee
ORDER BY FirstName

--2.Using a simple UNION ALL
SELECT FirstName,LastName,Email FROM Customer
UNION ALL
SELECT FirstName,LastName,Email FROM Employee
ORDER BY FirstName

--3.REALTIME SCENARIO TO USE UNION: GET THE SALES TRANSACTION BY GIVEING 20% DISCOUNT TO THE CUSTOMER WHO ARE EMPLOYEES
SELECT S.InvoiceID
,S.CustomerID
,C.FirstName +' '+C.FirstName AS CustomerName
,S.SalesDate
,S.SalesAmount
FROM Sales AS S
INNER JOIN Customer AS C on S.CustomerID = c.CustomerID
LEFT JOIN Employee as E on e.Email = C.Email
WHERE E.Email IS NULL --CUSTOEMR
UNION
SELECT S.InvoiceID,S.CustomerID,C.FirstName +' '+C.FirstName AS CustomerName
,S.SalesDate,S.SalesAmount - (S.SalesAmount * 20/100)
FROM Sales AS S
INNER JOIN Customer AS C on S.CustomerID = c.CustomerID
LEFT JOIN Employee as E on e.Email = C.Email
WHERE E.Email IS NOT NULL --EMPLOYEE BEING CUSTOEMR
