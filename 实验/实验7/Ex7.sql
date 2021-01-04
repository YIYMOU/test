DROP DATABASE Company;
CREATE DATABASE Company DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
SHOW DATABASES;

USE Company;

DROP TABLE Departments;

CREATE TABLE Departments(
departmentID CHAR(3) NOT NULL COMMENT'部门编号，主键',
departmentName CHAR(20) NOT NULL COMMENT'部门名',
note text(16) COMMENT'备注',
PRIMARY KEY(departmentID));

CREATE TABLE Employees(
Employees CHAR(6) NOT NULL COMMENT'员工编号，主键',
`name` CHAR(10) NOT NULL COMMENT'姓名',
education CHAR(4) NOT NULL COMMENT'学历',
birthday DATE NOT NULL COMMENT'出生日期',
sex CHAR(2) NOT NULL COMMENT'性别',
workyear TINYINT(1) COMMENT'工作时间',
phonenumber CHAR(12) COMMENT'电话',
departmentID CHAR(3) NOT NULL COMMENT'员工部门号，外键',
PRIMARY KEY(Employees),
FOREIGN KEY(departmentID) REFERENCES Departments(departmentID));

CREATE TABLE Salary(
employmeeID CHAR(6) NOT NULL COMMENT'员工编号，主键',
Income FLOAT(8) NOT NULL COMMENT'收入',
Outcome FLOAT(8) NOT NULL COMMENT'支出',
PRIMARY KEY(employmeeID));

INSERT INTO Departments VALUES('1','财务部','null');
INSERT INTO Departments VALUES('2','人力资源部','null');
INSERT INTO Departments VALUES('3','经理办公室','null');

INSERT INTO Employees VALUES('000001','张三','大专','1966-01-23','1',8,'83355668','2');
INSERT INTO Employees VALUES('000002','李四','本科','1976-03-28','1',3,'823211321','1');
INSERT INTO Employees VALUES('000003','王五','硕士','1982-12-09','1',2,'83792361','3');
INSERT INTO Employees VALUES('000004','陈六','本科','1960-07-30','0',6,'82413301','1');

INSERT INTO Salary VALUES('000001',2100.8,123.09);
INSERT INTO Salary VALUES('000002',1582.62,88.03);
INSERT INTO Salary VALUES('000003',2569.88,185.65);
INSERT INTO Salary VALUES('000004',1987.01,79.58);

SELECT * FROM Salary;
SELECT * FROM Employees;

#（1）删除“王五”员工的员工信息和薪水记录。

DELETE FROM salary s
WHERE s.employmeeID=(
	SELECT E.Employees
	FROM Employees E
	WHERE E.`name`='王五'
);

DELETE FROM Employees E WHERE E.`name`='王五';

#（2）把“张三”员工的收入增加“200.00”，支出改为“100.00”

UPDATE salary s
SET s.Income=s.Income+200.00,s.Outcome=100.00
WHERE s.employmeeID=(
	SELECT E.Employees
	FROM Employees E
	WHERE E.`name`='张三'
);

#（3）把“收入”最低的员工收入增加“100”

UPDATE salary s
SET s.Income=s.Income+100
ORDER BY s.Income ASC
LIMIT 1

#（4）查询“财务部”的员工“姓名”和”学历”

SELECT E.name,E.education
FROM Employees E
INNER JOIN Departments D
ON E.departmentID=D.departmentID
WHERE D.departmentName='财务部';

#（5）查询“李四”的“学历”“性别”“部门名称”以及薪水（收入减支出）

SELECT E.education,E.sex,D.departmentName,s.Income-s.Outcome 薪水
FROM Employees E
INNER JOIN Departments D
ON E.departmentID=D.departmentID
INNER JOIN Salary s
ON s.employmeeID=E.Employees
WHERE E.`name`='李四';

#（6）查询“本科”中薪水最高的员工“姓名”、“工作时间”、“部门名称”

SELECT E.`name`,E.workyear,D.departmentName
FROM Employees E
INNER JOIN Departments D
ON E.departmentID=D.departmentID
INNER JOIN Salary s
ON s.employmeeID=E.Employees
WHERE E.education='本科'
ORDER BY s.Income-s.Outcome ASC
LIMIT 1;

#（7）查询手机尾号是“1”的员工“姓名”、“部门名称”，按照薪水降序排列

SELECT E.`name`,D.departmentName
FROM Employees E
INNER JOIN Departments D
ON E.departmentID=D.departmentID
INNER JOIN Salary s
ON s.employmeeID=E.Employees
WHERE E.phonenumber LIKE '%1'
ORDER BY s.Income-s.Outcome DESC;
