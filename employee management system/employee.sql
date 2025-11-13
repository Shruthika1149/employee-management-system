CREATE TABLE Department (
  DeptID INT PRIMARY KEY,
  DeptName VARCHAR(50),
  Location VARCHAR(50)
);

CREATE TABLE Employee (
  EmpID INT PRIMARY KEY,
  EmpName VARCHAR(100),
  Gender CHAR(1),
  HireDate DATE,
  DeptID INT,
  Salary DECIMAL(10,2),
  FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

INSERT INTO Department VALUES
(1, 'HR', 'Chennai'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Hyderabad');

INSERT INTO Employee VALUES
(101, 'Ravi Kumar', 'M', '2022-03-15', 2, 60000),
(102, 'Priya Sharma', 'F', '2021-07-10', 1, 45000),
(103, 'Kiran Rao', 'M', '2023-01-05', 3, 55000),
(104, 'Anjali Mehta', 'F', '2020-12-20', 2, 70000);

SELECT * FROM Employee;

SELECT e.EmpName, d.DeptName
FROM Employee e
JOIN Department d ON e.DeptID = d.DeptID;

SELECT EmpName, Salary
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);

SELECT d.DeptName, COUNT(e.EmpID) AS TotalEmployees
FROM Department d
LEFT JOIN Employee e ON d.DeptID = e.DeptID
GROUP BY d.DeptName;

UPDATE Employee
SET Salary = Salary * 1.10
WHERE DeptID = (SELECT DeptID FROM Department WHERE DeptName = 'IT');
