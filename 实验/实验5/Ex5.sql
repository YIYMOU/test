DROP DATABASE JXGL;
CREATE DATABASE JXGL;
show DATABASES;
USE JXGL;

CREATE TABLE Student( 
Sno CHAR(5) NOT NULL ,
Sname VARCHAR(20),
Sage SMALLINT CHECK(Sage>=15 AND Sage<=45),
Ssex CHAR(2) DEFAULT '男' CHECK (Ssex='男' OR Ssex='女'),
Sdept CHAR(2),
PRIMARY KEY(Sno));

CREATE TABLE Course( 
Cno CHAR(2) NOT NULL ,
Cname VARCHAR(20),
Cpno CHAR(2),
Ccredit SMALLINT,
PRIMARY KEY(Cno));

CREATE TABLE SC( 
Sno CHAR(5) NOT NULL,
Cno CHAR(2) NOT NULL,
Grade SMALLINT CHECK ((Grade IS NULL) OR (Grade BETWEEN 0 AND 100)),
PRIMARY KEY(Sno,Cno),
FOREIGN KEY(Cno) REFERENCES Course(Cno),
FOREIGN KEY(Sno) REFERENCES Student(Sno));

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

SELECT * FROM SC;
SELECT * FROM student;
SELECT * FROM course;

#[1] 查询与“钱横”在同一个系学习的学生信息。

SELECT s.*
FROM student s
WHERE s.Sdept=(
	SELECT s.Sdept
	FROM student s
	WHERE s.Sname='钱横'
);

#[2] 查询选修了课程名为“数据库系统”的学生学号、姓名和所在系。

SELECT st.Sno,st.Sname,st.Sdept 
FROM student st
INNER JOIN sc 
ON st.Sno=sc.Sno
INNER JOIN course c
ON sc.Cno=c.Cno
WHERE c.Cname='数据库系统';

#[3] 检索至少不学2和4两门课程的学生学号与姓名。

SELECT st.Sno,st.Sname
FROM student st
WHERE st.Sno NOT IN(
	SELECT st.Sno
	FROM student st
	INNER JOIN sc
	ON st.Sno=sc.Sno
	AND sc.Cno IN('2','4')
);

#[4] 查询其他系中比信息系IS所有学生年龄均大的学生名单,并排序输出。

SELECT st.*
FROM student st
WHERE st.Sdept<>'IS'
AND st.Sage>(
	SELECT MAX(st.Sage)
	FROM student st
	WHERE st.Sdept='IS'
)
ORDER BY st.Sage DESC;

#[5] 查询哪些课程只有女生选读。

SELECT c.*
FROM course c
INNER JOIN sc
ON c.Cno=sc.Cno
WHERE c.Cno NOT IN(
	SELECT sc.Cno
	FROM student st
	INNER JOIN sc
	ON st.Sno=sc.Sno
	WHERE st.Ssex='男'
);

#[6] 查询所有未修1号课程的学生姓名。

SELECT st.Sname
FROM student st
WHERE st.Sno NOT IN(
	SELECT st.Sno
	FROM student st
	INNER JOIN sc
	ON st.Sno=sc.Sno
	AND sc.Cno='1'
);

#[7] 查询选修了全部课程的学生姓名

#思路：首先我们要知道一共有多少门课程。
#找到每一个学生选修的课程数，如果和总共的课程数相等，则说明该学生选修了全部课程
SELECT st.Sname
FROM student st
INNER JOIN sc
ON st.Sno=sc.Sno
GROUP BY sc.Sno
HAVING COUNT(*) = (
	SELECT count(*)
	FROM course c
);

#[8] 查询平均成绩大于85分的学号、姓名、平均成绩。

SELECT st.Sno,st.Sname,AVG(sc.Grade)
FROM student st
INNER JOIN sc
ON st.Sno=sc.Sno
GROUP BY sc.Sno
HAVING AVG(sc.Grade)>85;
