show DATABASES;
CREATE DATABASE IF NOT EXISTS YGGL CHARACTER SET utf8 COLLATE utf8_general_ci;
USE YGGL;
show TABLES;

DROP TABLE IF EXISTS `YGGL`.`Departments`;

CREATE TABLE `YGGL`.`Departments`(
`departmentID` CHAR(3) NOT NULL COMMENT'部门编号，主键',
`departmentName` CHAR(20) NOT NULL COMMENT'部门名',
`note` TEXT(16) COMMENT'备注',
PRIMARY KEY(`departmentID`)
);

DROP TABLE IF EXISTS `YGGL`.`Employees`;
CREATE TABLE `YGGL`.`Employees`(
`Employees` CHAR(6) NOT NULL COMMENT'员工编号，主键',
`name` CHAR(10) NOT NULL COMMENT'姓名',
`education` CHAR(4) NOT NULL COMMENT'学历',
`birthday` DATE NOT NULL COMMENT'出生日期',
`sex` CHAR(2) NOT NULL COMMENT'性别' DEFAULT'F',
`workyear` TINYINT(1) COMMENT'工作时间',
`address` VARCHAR(20) COMMENT'地址',
`phonenumber` CHAR(12) COMMENT'电话',
`departmentID` CHAR(3) NOT NULL COMMENT'员工部门号，外键',
PRIMARY KEY(`Employees`),
FOREIGN KEY(`departmentID`) REFERENCES `Departments`(`departmentID`)
);

DROP TABLE IF EXISTS `YGGL`.`Salary`;
CREATE TABLE `YGGL`.`Salary`(
`employmeeID` CHAR(6) NOT NULL COMMENT'员工编号，主键',
`Income` FLOAT(8) NOT NULL COMMENT'收入',
`Outcome` FLOAT(8) NOT NULL COMMENT'支出',
PRIMARY KEY(`Income`)
);

desc Employees;

SHOW CREATE TABLE `YGGL`.`Employees`;

ALTER TABLE `YGGL`.`Employees` ALTER `sex` SET DEFAULT'男';

ALTER TABLE `YGGL`.`Employees` DROP `workyear`;	--  删除workyear字段

ALTER TABLE `YGGL`.`Employees` ADD `workyear` TINYINT(1) COMMENT'工作时间' DEFAULT'123' AFTER`sex`;

ALTER TABLE `YGGL`.`Employees` CHANGE `workyear` `workyearrrr` TINYINT(1) DEFAULT'123';

ALTER TABLE `YGGL`.`Employees` CHANGE `workyearrrr` `workyear` TINYINT(1) DEFAULT'123';

ALTER TABLE `YGGL`.`Employees` MODIFY `workyear` CHAR(20);

ALTER TABLE `YGGL`.`Employees` MODIFY `workyear` TINYINT(1) DEFAULT'123';

ALTER TABLE `YGGL`.`Employees` CHANGE `workyear` `workyear` TINYINT(1) DEFAULT'123';

ALTER TABLE `YGGL`.`Employees` DROP FOREIGN KEY `employees_ibfk_1`;

ALTER TABLE `YGGL`.`Employees` ADD CONSTRAINT FOREIGN KEY(`departmentID`) REFERENCES `Departments`(`departmentID`);







