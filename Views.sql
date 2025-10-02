CREATE DATABASE ViewDB;
USE ViewDB;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
)

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
(1, 'Engineering'),
(2, 'Human Resources'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
VALUES 
(101, 'Aarav', 'Sharma', 1, 85000.00),
(102, 'Meera', 'Iyer', 2, 62000.00),
(103, 'Rohan', 'Patel', 1, 78000.00),
(104, 'Sneha', 'Reddy', 3, 95000.00),
(105, 'Vikram', 'Kumar', 4, 72000.00),
(106, 'Divya', 'Singh', 1, 67000.00),
(107, 'Karthik', 'Menon', 3, 88000.00);

--Creating Complex View
CREATE VIEW vw_HighSalaryEmployees AS
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    d.DepartmentName,
    e.Salary
FROM 
    Employees e
INNER JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    e.Salary > 75000;

--Using the view
SELECT * FROM vw_HighSalaryEmployees;

-- Instead of writing complex joins repeatedly:
SELECT FirstName, LastName FROM vw_HighSalaryEmployees WHERE DepartmentName = 'Engineering';
