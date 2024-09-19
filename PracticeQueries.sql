use EmployeeDB;
select * from EmployeeDetailsTable;
alter table EmployeeDetailsTable alter column Salary DECIMAL(10,2);
alter table EmployeeDetailsTable add constraint pk_EmployeeID PRIMARY KEY(EmployeeID);
alter table EmployeeDetailsTable alter column ManagerID VARCHAR(10) NULL;

INSERT INTO EmployeeDetailsTable (EmployeeID, EmployeeName, JobTitle, Department, Skills, HireDate, Salary, ManagerID)
VALUES
(1, 'John Doe', 'Software Engineer', 'IT', 'C#, SQL, Azure', '2020-01-15', 75000.00, 3),
(2, 'Jane Smith', 'Project Manager', 'IT', 'Project Management, Agile', '2018-03-22', 90000.00, 3),
(3, 'Emily Johnson', 'HR Manager', 'HR', 'Recruitment, Employee Relations', '2017-07-01', 85000.00, NULL),
(4, 'Michael Brown', 'Data Analyst', 'IT', 'SQL, Python, Power BI', '2019-11-12', 70000.00, 2),
(5, 'Jessica Davis', 'Marketing Specialist', 'Marketing', 'SEO, Content Marketing', '2021-05-30', 65000.00, 6),
(6, 'David Wilson', 'Sales Manager', 'Sales', 'Sales, CRM', '2016-09-10', 80000.00, NULL),
(7, 'Sarah Miller', 'Graphic Designer', 'Marketing', 'Photoshop, Illustrator', '2022-02-14', 60000.00, 5),
(8, 'James Anderson', 'Network Engineer', 'IT', 'Networking, Security', '2020-08-25', 72000.00, 3),
(9, 'Laura Martinez', 'Accountant', 'Finance', 'Accounting, Excel', '2019-04-18', 68000.00, 10),
(10, 'Robert Garcia', 'Finance Manager', 'Finance', 'Financial Analysis, Budgeting', '2015-12-05', 95000.00, NULL);

Update EmployeeDetailsTable SET HireDate='2023-10-14' Where EmployeeID=3;
--Retrieve all employee details--
SELECT * FROM EmployeeDetailsTable;

--Find employees with a specific job title --
SELECT * FROM EmployeeDetailsTable WHERE JobTitle LIKE '%Manager';
--Get the names and salaries of employees earning more than a certain amount--
SELECT EmployeeName,Salary FROM EmployeeDetailsTable WHERE Salary >= 81000.00;
--List employees hired in the last year--
SELECT * FROM EmployeeDetailsTable WHERE YEAR(HireDate)=YEAR(GetDate())-1;
--Count the number of employees in each department--
SELECT Department,COUNT(*) From EmployeeDetailsTable GROUP BY Department;
--Find the highest-paid employee--
Select EmployeeName, Salary from EmployeeDetailsTable Where Salary = (Select MAX(Salary) from EmployeeDetailsTable);
--Get the average salary by department--
SELECT Department, AVG(Salary) From EmployeeDetailsTable GROUP BY Department;
--Retrieve employees who do not have a manager--
SELECT EmployeeName AS EmployeeWITHOUTManager from EmployeeDetailsTable WHERE ManagerID IS NULL;
--List employees with a specific skill--
SELECT * FROM EmployeeDetailsTable WHERE Skills LIKE '%SQL%';
--Find employees who have been with the company for more than 5 years--
SELECT * FROM EmployeeDetailsTable WHERE YEAR(HireDate)<=YEAR(GetDate())-5;