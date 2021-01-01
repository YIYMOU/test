/*
 Navicat Premium Data Transfer

 Source Server         : mp
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : yggl

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 29/11/2020 23:28:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `departmentID` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门编号，主键',
  `departmentName` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名',
  `note` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`departmentID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', '广告部', '负责推广产品');
INSERT INTO `departments` VALUES ('2', '人力资源部', NULL);
INSERT INTO `departments` VALUES ('3', '经理办公室', NULL);
INSERT INTO `departments` VALUES ('4', '研发部', NULL);
INSERT INTO `departments` VALUES ('5', '市场部', NULL);

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `Employees` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工编号，主键',
  `name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `education` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学历',
  `birthday` date NOT NULL COMMENT '出生日期',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `workyear` tinyint(1) NULL DEFAULT 123,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `phonenumber` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `departmentID` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工部门号，外键',
  PRIMARY KEY (`Employees`) USING BTREE,
  INDEX `departmentID`(`departmentID`) USING BTREE,
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `departments` (`departmentID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('000001', '王林', '大专', '1966-01-23', '1', 8, '中山路32-1-508', '83355668', '2');
INSERT INTO `employees` VALUES ('010008', '伍容华', '本科', '1976-03-28', '1', 3, '北京东路100-2', '833211321', '1');
INSERT INTO `employees` VALUES ('020018', '李丽', '大专', '1960-07-30', '0', 6, '中山东路102-2', '83413301', '1');
INSERT INTO `employees` VALUES ('102208', '朱俊', '硕士', '1965-09-28', '1', 2, '牌楼巷5-3-106', '84708817', '5');
INSERT INTO `employees` VALUES ('111006', '张石兵', '本科', '1974-10-01', '1', 1, '解放路34-1-203', '84563418', '5');
INSERT INTO `employees` VALUES ('210678', '林涛', '大专', '1977-04-02', '1', 2, '中山北路24-35', '83467336', '3');
INSERT INTO `employees` VALUES ('504209', '陈林琳', '大专', '1969-09-03', '0', 5, '汉中路120-4-12', '84468158', '4');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `employmeeID` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工编号，主键',
  `Income` float NOT NULL COMMENT '收入',
  `Outcome` float NOT NULL COMMENT '支出',
  PRIMARY KEY (`Income`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('010008', 1582.62, 88.03);
INSERT INTO `salary` VALUES ('102208', 1980, 100);
INSERT INTO `salary` VALUES ('111006', 1987.01, 79.58);
INSERT INTO `salary` VALUES ('504209', 2066.15, 108);
INSERT INTO `salary` VALUES ('000001', 2100.8, 123.09);
INSERT INTO `salary` VALUES ('210678', 2240, 121);
INSERT INTO `salary` VALUES ('020018', 2347.68, 180);
INSERT INTO `salary` VALUES ('308759', 2531.98, 199.08);
INSERT INTO `salary` VALUES ('102201', 2569.88, 185.65);
INSERT INTO `salary` VALUES ('020010', 2860, 298);
INSERT INTO `salary` VALUES ('302566', 2980.7, 210.2);
INSERT INTO `salary` VALUES ('108991', 3259.98, 281.52);

SET FOREIGN_KEY_CHECKS = 1;
