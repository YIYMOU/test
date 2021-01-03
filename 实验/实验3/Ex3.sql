INSERT INTO `Departments` VALUES ("1","财务部",null);
INSERT INTO `Departments` VALUES ("2","人力资源部",null);
INSERT INTO `Departments` VALUES ("3","经理办公室",null);
INSERT INTO `Departments` VALUES ("4","研发部",null);
INSERT INTO `Departments` VALUES ("5","市场部",null);
SELECT * FROM `departments`;

INSERT INTO `Employees` VALUES ("000001","王林","大专","1966-01-23","1",8,"中山路32-1-508","83355668","2");
INSERT INTO `Employees` VALUES ("010008","伍容华","本科","1976-03-28","1",3,"北京东路100-2","833211321","1");
INSERT INTO `Employees` VALUES ("020010","王向荣","硕士","1982-12-09","1",2,"四牌路10-0-108","83792361","1");
INSERT INTO `Employees` VALUES ("020018","李丽","大专","1960-07-30","0",6,"中山东路102-2","83413301","1");
INSERT INTO `Employees` VALUES ("102201","刘明","本科","1972-10-18","1",3,"虎踞路100-2","83606608","5");
INSERT INTO `Employees` VALUES ("102208","朱俊","硕士","1965-09-28","1",2,"牌楼巷5-3-106","84708817","5");
INSERT INTO `Employees` VALUES ("108991","钟敏","硕士","1979-08-10","0",4,"中山路10-3-105","83346722","3");
INSERT INTO `Employees` VALUES ("111006","张石兵","本科","1974-10-01","1",1,"解放路34-1-203","84563418","5");
INSERT INTO `Employees` VALUES ("210678","林涛","大专","1977-04-02","1",2,"中山北路24-35","83467336","3");
INSERT INTO `Employees` VALUES ("302566","李玉敏","本科","1968-09-20","1",3,"热河路209-3","58765991","4");
INSERT INTO `Employees` VALUES ("308759","叶凡","本科","1978-11-18","1",2,"北京西路3-7-52","83308901","4");
INSERT INTO `Employees` VALUES ("504209","陈林琳","大专","1969-09-03","0",5,"汉中路120-4-12","84468158","4");
SELECT * FROM `Employees`;

INSERT INTO `Salary` VALUES ("000001",2100.8,123.09);
INSERT INTO `Salary` VALUES ("010008",1582.62,88.03);
INSERT INTO `Salary` VALUES ("102201",2569.88,185.65);
INSERT INTO `Salary` VALUES ("111006",1987.01,79.58);
INSERT INTO `Salary` VALUES ("504209",2066.15,108.0);
INSERT INTO `Salary` VALUES ("302566",2980.7,210.2);
INSERT INTO `Salary` VALUES ("108991",3259.98,281.52);
INSERT INTO `Salary` VALUES ("020010",2860.0,298.0);
INSERT INTO `Salary` VALUES ("020018",2347.68,180.0);
INSERT INTO `Salary` VALUES ("308759",2531.98,199.08);
INSERT INTO `Salary` VALUES ("210678",2240.0,121.0);
INSERT INTO `Salary` VALUES ("102208",1980.0,100.0);
SELECT * FROM `Salary`;

DELETE FROM `departments` WHERE `departmentID`='6';
REPLACE INTO `Departments` VALUES ("6","广告部","负责推广产品");
REPLACE INTO `Departments` VALUES ("1","广告部","负责推广产品");

UPDATE `Departments` SET `departmentName`='广告部',`note`='负责推广产品' WHERE `departmentID`='1';

UPDATE `Salary` SET `Income`='2890' WHERE `employmeeID`='102201';
UPDATE `Salary` SET `Income`=`Income`+100;
DELETE FROM `Employees` WHERE `Employees`='102201';
DELETE FROM `Employees` WHERE `Employees` IN(SELECT `employmeeID` FROM `Salary` WHERE `Income` > 2500);
TRUNCATE TABLE `Salary`;