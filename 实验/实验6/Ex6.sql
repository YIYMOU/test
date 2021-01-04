DROP DATABASE jxgl;
CREATE DATABASE jxgl;
USE jxgl;

Create Table Student
( Sno CHAR(20) NOT NULL, PRIMARY KEY(Sno),
Sname VARCHAR(20),
Sage SMALLINT CHECK(Sage>=15 AND Sage<=45),
Ssex CHAR(8) DEFAULT 'man' CHECK (Ssex='man' OR Ssex='woman'),
Sdept CHAR(20));
Create Table Course 
( Cno CHAR(20) NOT NULL, PRIMARY KEY(Cno),
Cname VARCHAR(20),
Cpno CHAR(20),
Ccredit SMALLINT);
Create Table SC
( Sno CHAR(20) NOT NULL, CONSTRAINT S_F FOREIGN KEY(Sno) REFERENCES Student(Sno),
Cno CHAR(20) NOT NULL,
Grade SMALLINT CHECK ((Grade IS NULL) OR (Grade BETWEEN 0 AND 100)),
PRIMARY KEY(Sno,Cno),
FOREIGN KEY(Cno) REFERENCES Course(Cno));

INSERT INTO Student VALUES('5120150001','QH',18,'man','CS');
INSERT INTO Student VALUES('5120150002','WL',19,'woman','CS');
INSERT INTO Student VALUES('5120150003','LM',20,'man','IS');
INSERT INTO Student VALUES('5120150004','SDC',19,'woman','IS');
INSERT INTO Student VALUES('5120150005','ERS',21,'man','IS');
INSERT INTO Student VALUES('5120150006','HRD',18,'man','MA');
INSERT INTO Student VALUES('5120150007','XYK',17,'woman','MA');
INSERT INTO Student VALUES('5120150008','RB',19,'man','MA');
INSERT INTO Student VALUES('5120150009','DL',19,'woman','MA');
INSERT INTO Student VALUES('5220150008','RB',19,'man','MA');
INSERT INTO Student VALUES('5220150009','DL',19,'woman','MA');
INSERT INTO Student VALUES('5220150018','RB',19,'man','MA');
INSERT INTO Student VALUES('5320150009','DL',19,'woman','MA');
INSERT INTO Course VALUES('1','SJKXT', '5',4);
INSERT INTO Course VALUES('2','SXFX',null ,2);
INSERT INTO Course VALUES('3','XXXTDL','1',3);
INSERT INTO Course VALUES('4','CZXTYL','6',3);
INSERT INTO Course VALUES('5','SJKJG','7',4);
INSERT INTO Course VALUES('6','SJCLJC',null,4);
INSERT INTO Course VALUES('7','CProgram','6',3);
INSERT INTO SC VALUES('5120150002','1',87);
INSERT INTO SC VALUES('5120150002','2',67);
INSERT INTO SC VALUES('5120150002','3',90);
INSERT INTO SC VALUES('5120150003','2',95);
INSERT INTO SC VALUES('5120150004','3',88);

SELECT * FROM student;
SELECT * FROM SC;
SELECT * FROM course;

#1.给定一个学生（Sno=‘5020150001’）统计该生已经选了几门课程。
SELECT COUNT(*)
FROM sc
INNER JOIN course
ON sc.Cno=course.Cno
WHERE sc.sno='5120150002';

#2.给定一个学生（Sno=‘5120150001’），统计该生已经选修了哪些课程。
SELECT *
FROM sc
INNER JOIN course
ON sc.Cno=course.Cno
WHERE sc.sno='5120150002';

#3.给定一门课程（Cno=1）统计哪些学生选修了这门课程，给出学生所有信息。
SELECT student.*
FROM sc
INNER JOIN student
ON sc.Sno=student.Sno
WHERE sc.Cno='1';

#4.统计哪些课程没有人报选。
SELECT *
FROM course c
LEFT JOIN sc s
ON c.Cno=s.Cno
WHERE s.Cno IS NULL;

#5.统计选修课程少于3人的所有课程信息。
SELECT c.*,COUNT(s.Cno) 选修人数
FROM course c
LEFT JOIN sc s
ON c.Cno= s.Cno
GROUP BY c.Cno
HAVING COUNT(s.Cno)<3

#6.统计每一门课程已经有多少学生选修，如果限定每门课20人选择，还能供多少学生选修。
SELECT c.Cname,COUNT(s.Cno),20-COUNT(s.Cno)
FROM course c
LEFT JOIN sc s
ON c.Cno= s.Cno
GROUP BY c.Cno;

#7.检索含有“X”的课程信息。
SELECT *
FROM course c
WHERE c.Cname LIKE '%X%';

#8.检索以“FX”结尾的课程信息。
SELECT *
FROM course c
WHERE c.Cname LIKE '%FX';

#9.检索以“j”开头，以“程序设计”结尾的课程信息。
SELECT *
FROM course c
WHERE c.Cname LIKE 'j%Program';

#10.检索学生联系方式中以51开头或者18开头，且后面跟着10位数字的学生信息。
SELECT *
FROM student s
WHERE ((s.Sno like '51%') 
OR (s.Sno like '52%')) 
AND (LENGTH(s.Sno) - 2)>7;