DROP DATABASE jxgl;

CREATE DATABASE jxgl;

show DATABASES;

USE jxgl;

Create Table Student( 
Sno CHAR(5) NOT NULL ,PRIMARY KEY(Sno),
Sname VARCHAR(20),
Sage SMALLINT CHECK(Sage>=15 AND Sage<=45),
Ssex CHAR(8) DEFAULT 'man' CHECK (Ssex='男' OR Ssex='女'),
Sdept CHAR(2));

Create Table Course ( 
Cno CHAR(2) NOT NULL, PRIMARY KEY(Cno),
Cname VARCHAR(20),
Cpno CHAR(2),
Ccredit SMALLINT);

Create Table SC( 
Sno CHAR(5) NOT NULL, CONSTRAINT S_F FOREIGN KEY(Sno) REFERENCES Student(Sno),
Cno CHAR(2) NOT NULL,
Grade SMALLINT CHECK ((Grade IS NULL) OR (Grade BETWEEN 0 AND 100)),
PRIMARY KEY(Sno,Cno),
FOREIGN KEY(Cno) REFERENCES Course(Cno));

INSERT INTO Student VALUES('98001','钱横',18,'男','CS');
INSERT INTO Student VALUES('98002','王林',19,'女','CS');
INSERT INTO Student VALUES('98003','李民',20,'男','IS');
INSERT INTO Student VALUES('98004','赵三',16,'女','MA');
INSERT INTO Course VALUES('1','数据库系统', '5',4);
INSERT INTO Course VALUES('2','数学分析',null ,2);
INSERT INTO Course VALUES('3','信息系统导论','1',3);
INSERT INTO Course VALUES('4','操作系统原理','6',3);
INSERT INTO Course VALUES('5','数据结构','7',4);
INSERT INTO Course VALUES('6','数据处理基础',null,4);
INSERT INTO Course VALUES('7','C语言','6',3);
INSERT INTO SC VALUES('98001','1',87);
INSERT INTO SC VALUES('98001','2',67);
INSERT INTO SC VALUES('98001','3',90);
INSERT INTO SC VALUES('98002','2',95);
INSERT INTO SC VALUES('98002','3',88);

SELECT * FROM sc;
SELECT * FROM student;

#[1] 查考试成绩大于等于90的学生的学号。
SELECT s.Sno
FROM sc s
WHERE s.Grade>=90;
#[2] 查年龄大于18，并不是信息系（IS）与数学系（MA）的学生的姓名和性别。
SELECT s.Sname,s.Ssex
FROM student s
WHERE s.Sdept NOT IN('IS','MA');
#[3] 查以”SJ_”开头，且倒数第二个字为“X”字的课程的详细情况。
SELECT c.*
FROM course c
WHERE c.Cname LIKE '信息%导_';
#[4] 查询选修了课程的学生人数。
#方法一：
SELECT COUNT(DISTINCT sc.Sno)
FROM sc;
#方法二：
SELECT COUNT(DISTINCT st.Sno) 
FROM student st
LEFT OUTER JOIN sc
ON st.Sno=sc.Sno
WHERE sc.Cno IS NOT NULL;
#[5] 查询计算机系（CS）选修了2门及以上课程的学生的学号。
SELECT st.Sno
FROM sc 
INNER JOIN student st
ON sc.Sno=st.Sno
GROUP BY st.Sno
HAVING COUNT(st.Sno)>=2;
#[6] 查询Student表与SC表的广义笛卡尔积。
SELECT * 
FROM Student,Sc;
#[7] 查询Student表与SC表基于学号SNO的等值连接。
SELECT *
FROM student st
INNER JOIN sc
ON st.Sno=sc.Sno;
#[8] 查询Student表与SC表基于学号SNO的自然连接。
SELECT *
FROM student
NATURAL JOIN sc;
#[9] 查询性别为男、课程成绩及格的学生信息及课程号、成绩。
SELECT st.*,sc.Cno,sc.Grade
FROM sc
INNER JOIN student st
ON sc.Sno=st.Sno
WHERE sc.Grade>=60
AND st.Ssex='男';
#[10] 查询学生及其课程、成绩等情况（不管是否选课，均需列出学生信息）。
select *
from Student
left join SC on SC.Sno = Student.Sno
left join Course on SC.Cno = Course.Cno
