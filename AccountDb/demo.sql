/*
 Navicat Premium Data Transfer

 Source Server         : DB-01
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 127.0.0.1:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 02/03/2023 08:43:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for coinlevel
-- ----------------------------
DROP TABLE IF EXISTS `coinlevel`;
CREATE TABLE `coinlevel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `SumCoin` int NOT NULL,
  `LvVip` int NOT NULL,
  `Gold` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coinlevel
-- ----------------------------
INSERT INTO `coinlevel` VALUES (1, 50, 1, 5000);
INSERT INTO `coinlevel` VALUES (2, 120, 2, 10000);
INSERT INTO `coinlevel` VALUES (3, 220, 3, 17500);
INSERT INTO `coinlevel` VALUES (4, 370, 4, 25000);
INSERT INTO `coinlevel` VALUES (5, 570, 5, 48500);
INSERT INTO `coinlevel` VALUES (6, 800, 6, 50000);
INSERT INTO `coinlevel` VALUES (7, 1100, 7, 60000);
INSERT INTO `coinlevel` VALUES (8, 1500, 8, 75000);
INSERT INTO `coinlevel` VALUES (9, 2000, 9, 90000);
INSERT INTO `coinlevel` VALUES (10, 2200, 10, 100000);

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `idaccount` int NOT NULL,
  `iditem` int NOT NULL,
  `time` datetime(0) NOT NULL,
  `status` int NOT NULL,
  `expired` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE,
  INDEX `idaccount_idx`(`idaccount`) USING BTREE,
  INDEX `iditem_idx`(`iditem`) USING BTREE,
  CONSTRAINT `idaccount` FOREIGN KEY (`idaccount`) REFERENCES `tblaccount` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `iditem` FOREIGN KEY (`iditem`) REFERENCES `tblitem` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (1, 2, 3, '2023-01-11 15:30:13', 0, NULL);
INSERT INTO `inventory` VALUES (2, 1, 3, '2023-01-11 15:31:02', 0, NULL);
INSERT INTO `inventory` VALUES (3, 1, 11, '2023-01-11 15:33:50', 0, NULL);
INSERT INTO `inventory` VALUES (4, 1, 14, '2023-01-11 16:50:58', 1, NULL);
INSERT INTO `inventory` VALUES (5, 1, 6, '2023-01-12 08:48:15', 1, '2023-01-19 08:48:15');
INSERT INTO `inventory` VALUES (6, 2, 1, '2023-01-13 09:19:42', 1, '2023-01-20 09:19:42');
INSERT INTO `inventory` VALUES (7, 2, 10, '2023-01-15 17:20:44', 0, NULL);
INSERT INTO `inventory` VALUES (8, 1, 8, '2023-01-16 13:37:23', 0, NULL);
INSERT INTO `inventory` VALUES (9, 1, 10, '2023-01-16 13:46:25', 0, NULL);
INSERT INTO `inventory` VALUES (10, 2, 6, '2023-01-16 14:35:23', 1, '2023-01-19 14:35:23');
INSERT INTO `inventory` VALUES (11, 2, 4, '2023-03-02 03:15:47', 0, NULL);
INSERT INTO `inventory` VALUES (12, 3, 1, '2023-03-02 03:22:45', 1, NULL);
INSERT INTO `inventory` VALUES (13, 3, 5, '2023-03-02 03:53:34', 0, '2023-03-05 03:53:34');
INSERT INTO `inventory` VALUES (14, 1, 3, '2023-03-02 04:42:45', 0, NULL);
INSERT INTO `inventory` VALUES (15, 1, 8, '2023-03-02 04:42:45', 0, NULL);

-- ----------------------------
-- Table structure for log_err
-- ----------------------------
DROP TABLE IF EXISTS `log_err`;
CREATE TABLE `log_err`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ErrNo` int NULL DEFAULT NULL COMMENT 'M?? L???i',
  `ErrMessage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Chi ti???t l???i',
  `NameFunction` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'T??n ch???c n??ng',
  `TimeCreate` datetime(0) NOT NULL COMMENT 'Th???i gian ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_err
-- ----------------------------
INSERT INTO `log_err` VALUES (1, NULL, NULL, 'CreateGuild', '2023-02-02 11:11:04');
INSERT INTO `log_err` VALUES (2, NULL, NULL, 'CreateGuild', '2023-02-02 11:11:57');
INSERT INTO `log_err` VALUES (3, NULL, NULL, 'CreateGuild', '2023-02-02 11:15:19');
INSERT INTO `log_err` VALUES (4, NULL, NULL, 'CreateGuild', '2023-02-02 11:16:10');
INSERT INTO `log_err` VALUES (5, 0, NULL, 'CreateGuild', '2023-02-02 11:18:48');
INSERT INTO `log_err` VALUES (6, NULL, NULL, 'CreateGuild', '2023-02-02 11:19:41');
INSERT INTO `log_err` VALUES (7, NULL, NULL, 'CreateGuild', '2023-02-02 11:20:32');
INSERT INTO `log_err` VALUES (8, NULL, NULL, 'CreateGuild', '2023-02-02 11:21:48');
INSERT INTO `log_err` VALUES (9, NULL, NULL, 'CreateGuild', '2023-02-02 11:23:28');
INSERT INTO `log_err` VALUES (10, NULL, NULL, 'CreateGuild', '2023-02-02 11:24:12');
INSERT INTO `log_err` VALUES (11, NULL, NULL, 'CreateGuild', '2023-02-02 11:26:05');
INSERT INTO `log_err` VALUES (12, NULL, NULL, 'CreateGuild', '2023-02-02 11:33:04');
INSERT INTO `log_err` VALUES (13, NULL, NULL, 'CreateGuild', '2023-02-02 13:32:18');
INSERT INTO `log_err` VALUES (14, NULL, NULL, 'CreateGuild', '2023-02-02 13:33:13');
INSERT INTO `log_err` VALUES (15, NULL, NULL, 'CreateGuild', '2023-02-02 13:41:21');
INSERT INTO `log_err` VALUES (16, 1146, 'Table \'demo.tblguildaccounts\' doesn\'t exist', 'CreateGuild', '2023-02-02 13:44:24');
INSERT INTO `log_err` VALUES (17, 1146, 'Table \'demo.tblguildaccounts\' doesn\'t exist', 'CreateGuild', '2023-02-02 13:44:48');
INSERT INTO `log_err` VALUES (18, 1146, NULL, 'CreateGuild', '2023-02-02 13:46:34');
INSERT INTO `log_err` VALUES (19, 1146, NULL, 'CreateGuild', '2023-02-02 13:47:37');
INSERT INTO `log_err` VALUES (20, 1146, 'Exception42S02 | 1146 | Table \'demo.tblguildaccounts\' doesn\'t exist', 'CreateGuild', '2023-02-02 13:55:51');
INSERT INTO `log_err` VALUES (21, 1146, 'Exception 42S02 | 1146 | Table \'demo.tblaccounts\' doesn\'t exist', 'ApproveRegisterGuild', '2023-02-02 14:01:16');
INSERT INTO `log_err` VALUES (22, 1054, 'Exception 42S22 | 1054 | Unknown column \'u_idguild\' in \'where clause\'', 'GetMembersGuild', '2023-02-02 14:32:32');
INSERT INTO `log_err` VALUES (23, 1054, 'Exception 42S22 | 1054 | Unknown column \'a.idguilds\' in \'field list\'', 'ExpendMaxMember', '2023-02-02 15:14:24');
INSERT INTO `log_err` VALUES (24, 1146, 'Exception 42S02 | 1146 | Table \'demo.tblaccounts\' doesn\'t exist', 'ExpendMaxMember', '2023-02-02 15:36:56');
INSERT INTO `log_err` VALUES (25, 1146, 'Exception 42S02 | 1146 | Table \'demo.tblrollguilds\' doesn\'t exist', 'ExpandTableGuild', '2023-02-02 15:43:41');
INSERT INTO `log_err` VALUES (26, 1146, 'Exception 42S02 | 1146 | Table \'demo.tblaccounts\' doesn\'t exist', 'ChangeNoficationGuild', '2023-02-02 16:29:46');
INSERT INTO `log_err` VALUES (27, 1054, 'Exception 42S22 | 1054 | Unknown column \'u_idguild\' in \'field list\'', 'ChangeDescriptionGuild', '2023-02-02 16:36:26');
INSERT INTO `log_err` VALUES (28, 1054, 'Exception 42S22 | 1054 | Unknown column \'u_idguild\' in \'where clause\'', 'ChangeDescriptionGuild', '2023-02-02 16:37:19');
INSERT INTO `log_err` VALUES (29, 1054, 'Exception 42S22 | 1054 | Unknown column \'idacc\' in \'field list\'', 'CreateGuild', '2023-02-02 17:21:24');
INSERT INTO `log_err` VALUES (30, 1054, 'Exception 42S22 | 1054 | Unknown column \'p_idguild\' in \'where clause\'', 'GetListInvite', '2023-02-03 11:12:28');
INSERT INTO `log_err` VALUES (31, 1146, 'Exception 42S02 | 1146 | Table \'demo.tblaccounts\' doesn\'t exist', 'ApproveRegisterGuild', '2023-02-03 14:51:19');
INSERT INTO `log_err` VALUES (32, 1054, 'Exception 42S22 | 1054 | Unknown column \'idroll\' in \'field list\'', 'SetRollMember', '2023-02-06 09:23:35');
INSERT INTO `log_err` VALUES (33, 1054, 'Exception 42S22 | 1054 | Unknown column \'a.Name\' in \'field list\'', 'GetListRegister', '2023-02-06 13:58:54');
INSERT INTO `log_err` VALUES (34, 1111, 'Exception HY000 | 1111 | Invalid use of group function', 'GetListInvite', '2023-02-07 09:52:01');
INSERT INTO `log_err` VALUES (35, 1054, 'Exception 42S22 | 1054 | Unknown column \'TotalPoint\' in \'order clause\'', 'GetListRegister', '2023-02-07 10:07:39');
INSERT INTO `log_err` VALUES (36, 1054, 'Exception 42S22 | 1054 | Unknown column \'TotalPoint\' in \'order clause\'', 'GetListRegister', '2023-02-07 10:07:56');
INSERT INTO `log_err` VALUES (37, 1054, 'Exception 42S22 | 1054 | Unknown column \'total\' in \'order clause\'', 'GetListRegister', '2023-02-07 10:15:49');
INSERT INTO `log_err` VALUES (38, 1054, 'Exception 42S22 | 1054 | Unknown column \'TotalPoint\' in \'order clause\'', 'GetListRegister', '2023-02-07 10:16:43');
INSERT INTO `log_err` VALUES (39, 1054, 'Exception 42S22 | 1054 | Unknown column \'TotalPoint\' in \'order clause\'', 'GetListRegister', '2023-02-07 10:16:54');
INSERT INTO `log_err` VALUES (40, 1109, 'Exception 42S02 | 1109 | Unknown table \'t\' in order clause', 'GetListRegister', '2023-02-07 10:17:40');
INSERT INTO `log_err` VALUES (41, 1109, 'Exception 42S02 | 1109 | Unknown table \'t\' in order clause', 'GetListRegister', '2023-02-07 10:18:43');
INSERT INTO `log_err` VALUES (42, 1054, 'Exception 42S22 | 1054 | Unknown column \'g.TotalPoint\' in \'order clause\'', 'GetListRegister', '2023-02-07 10:21:39');
INSERT INTO `log_err` VALUES (43, 1054, 'Exception 42S22 | 1054 | Unknown column \'g.Total\' in \'order clause\'', 'GetListRegister', '2023-02-07 10:22:53');
INSERT INTO `log_err` VALUES (44, 1054, 'Exception 42S22 | 1054 | Unknown column \'g.Total\' in \'order clause\'', 'GetListRegister', '2023-02-07 10:23:02');
INSERT INTO `log_err` VALUES (45, 1054, 'Exception 42S22 | 1054 | Unknown column \'Total\' in \'order clause\'', 'GetListRegister', '2023-02-07 10:23:10');
INSERT INTO `log_err` VALUES (46, 1054, 'Exception 42S22 | 1054 | Unknown column \'a.Total\' in \'order clause\'', 'GetListRegister', '2023-02-07 10:25:09');
INSERT INTO `log_err` VALUES (47, 1146, 'Exception 42S02 | 1146 | Table \'demo.a\' doesn\'t exist', 'GetListRegister', '2023-02-07 10:27:13');
INSERT INTO `log_err` VALUES (48, 1146, 'Exception 42S02 | 1146 | Table \'demo.a\' doesn\'t exist', 'GetListRegister', '2023-02-07 10:28:28');
INSERT INTO `log_err` VALUES (49, 1054, 'Exception 42S22 | 1054 | Unknown column \'$.TotalPoint\' in \'order clause\'', 'GetListRegister', '2023-02-07 10:31:16');
INSERT INTO `log_err` VALUES (50, 1172, 'Exception 42000 | 1172 | Result consisted of more than one row', 'CreateGuild', '2023-02-07 16:37:20');
INSERT INTO `log_err` VALUES (51, 1172, 'Exception 42000 | 1172 | Result consisted of more than one row', 'CreateGuild', '2023-02-07 16:39:20');
INSERT INTO `log_err` VALUES (52, 1172, 'Exception 42000 | 1172 | Result consisted of more than one row', 'CreateGuild', '2023-02-07 16:40:43');
INSERT INTO `log_err` VALUES (53, 1172, 'Exception 42000 | 1172 | Result consisted of more than one row', 'CreateGuild', '2023-02-07 16:42:18');
INSERT INTO `log_err` VALUES (54, 1172, 'Exception 42000 | 1172 | Result consisted of more than one row', 'CreateGuild', '2023-02-07 16:43:47');
INSERT INTO `log_err` VALUES (55, 1172, 'Exception 42000 | 1172 | Result consisted of more than one row', 'CreateGuild', '2023-02-07 16:46:23');
INSERT INTO `log_err` VALUES (56, 1172, 'Exception 42000 | 1172 | Result consisted of more than one row', 'CreateGuild', '2023-02-07 16:47:21');
INSERT INTO `log_err` VALUES (57, 1054, 'Exception 42S22 | 1054 | Unknown column \'x.Name\' in \'order clause\'', 'GetMembersGuild', '2023-02-07 17:12:17');
INSERT INTO `log_err` VALUES (58, 1109, 'Exception 42S02 | 1109 | Unknown table \'jsonx\' in order clause', 'GetMembersGuild', '2023-02-07 17:18:16');
INSERT INTO `log_err` VALUES (59, 1054, 'Exception 42S22 | 1054 | Unknown column \'Name\' in \'order clause\'', 'GetMembersGuild', '2023-02-07 17:18:36');
INSERT INTO `log_err` VALUES (60, 1054, 'Exception 42S22 | 1054 | Unknown column \'p_type\' in \'field list\'', 'Search_guild', '2023-02-09 13:44:00');
INSERT INTO `log_err` VALUES (61, 1048, 'Exception 23000 | 1048 | Column \'GuildName\' cannot be null', 'ChangeNameGuild', '2023-02-13 15:42:53');
INSERT INTO `log_err` VALUES (62, 1048, 'Exception 23000 | 1048 | Column \'GuildName\' cannot be null', 'ChangeNameGuild', '2023-02-13 15:46:00');
INSERT INTO `log_err` VALUES (63, 1048, 'Exception 23000 | 1048 | Column \'GuildName\' cannot be null', 'ChangeNameGuild', '2023-02-13 15:46:22');
INSERT INTO `log_err` VALUES (64, 1048, 'Exception 23000 | 1048 | Column \'GuildName\' cannot be null', 'ChangeNameGuild', '2023-02-13 15:46:24');
INSERT INTO `log_err` VALUES (65, 1048, 'Exception 23000 | 1048 | Column \'GuildName\' cannot be null', 'ChangeNameGuild', '2023-02-13 15:47:26');
INSERT INTO `log_err` VALUES (66, 1048, 'Exception 23000 | 1048 | Column \'Description\' cannot be null', 'ChangeDescriptionGuild', '2023-02-13 16:04:42');
INSERT INTO `log_err` VALUES (67, 1292, 'Exception 22007 | 1292 | Truncated incorrect DOUBLE value: \'Kick th??nh vi??n id = \'', 'KickMember', '2023-02-13 17:28:11');
INSERT INTO `log_err` VALUES (68, 1292, 'Exception 22007 | 1292 | Truncated incorrect DOUBLE value: \'Kick th??nh vi??n id = \'', 'KickMember', '2023-02-13 17:28:25');
INSERT INTO `log_err` VALUES (69, 1146, 'Exception 42S02 | 1146 | Table \'demo.tblaccount1\' doesn\'t exist', 'GetListInvite', '2023-02-14 13:43:18');
INSERT INTO `log_err` VALUES (70, 1054, 'Exception 42S22 | 1054 | Unknown column \'v_songay\' in \'field list\'', 'BuyItem', '2023-03-02 03:08:07');
INSERT INTO `log_err` VALUES (71, 1054, 'Exception 42S22 | 1054 | Unknown column \'v_sotien\' in \'field list\'', 'BuyItem', '2023-03-02 03:08:39');
INSERT INTO `log_err` VALUES (72, 1048, 'Exception 23000 | 1048 | Column \'Content\' cannot be null', 'BuyItem', '2023-03-02 03:09:52');
INSERT INTO `log_err` VALUES (73, 1048, 'Exception 23000 | 1048 | Column \'Content\' cannot be null', 'BuyItem', '2023-03-02 03:10:49');
INSERT INTO `log_err` VALUES (74, 1048, 'Exception 23000 | 1048 | Column \'Content\' cannot be null', 'BuyItem', '2023-03-02 03:11:58');
INSERT INTO `log_err` VALUES (75, 1048, 'Exception 23000 | 1048 | Column \'Content\' cannot be null', 'BuyItem', '2023-03-02 03:12:52');
INSERT INTO `log_err` VALUES (76, 1048, 'Exception 23000 | 1048 | Column \'Content\' cannot be null', 'BuyItem', '2023-03-02 03:14:35');
INSERT INTO `log_err` VALUES (77, 1048, 'Exception 23000 | 1048 | Column \'Content\' cannot be null', 'BuyItem', '2023-03-02 03:15:23');
INSERT INTO `log_err` VALUES (78, 1054, 'Exception 42S22 | 1054 | Unknown column \'i.p_accountIdount\' in \'where clause\'', 'ReceiveGiftVip', '2023-03-02 04:41:35');

-- ----------------------------
-- Table structure for logguild
-- ----------------------------
DROP TABLE IF EXISTS `logguild`;
CREATE TABLE `logguild`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `idaccount` int NULL DEFAULT NULL COMMENT 'id T??i kho???n ???????c n??i t???i',
  `idguild` int NULL DEFAULT NULL COMMENT 'Id C??ng h???i',
  `NameProcedure` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'T??n Procedure',
  `Message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'N???i dung log',
  `Time` datetime(0) NOT NULL COMMENT 'Th???i gian t???o',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logguild
-- ----------------------------
INSERT INTO `logguild` VALUES (1, 1, 2, 'TaoHoi', 'T???o m???i c??ng h???i th??nh c??ng', '0000-00-00 00:00:00');
INSERT INTO `logguild` VALUES (2, 1, 2, 'TaoHoi', 'C???p nh???t quy???n ch??? h???i cho ng?????i t???o', '0000-00-00 00:00:00');
INSERT INTO `logguild` VALUES (3, 2, 2, 'RegisterGuild', '????ng k?? v??o h???i th??nh c??ng ', '0000-00-00 00:00:00');
INSERT INTO `logguild` VALUES (4, 2, 2, 'RegisterGuild', '???? ????ng k?? tr?????c ???? ', '0000-00-00 00:00:00');
INSERT INTO `logguild` VALUES (5, 2, 2, 'RejectRegisterGuild', 'T??? ch???i ????ng k?? th??nh c??ng ', '2023-01-30 09:42:49');
INSERT INTO `logguild` VALUES (6, 2, 2, 'ApproveRegisterGuild', 'Duy???t th??nh c??ng ', '2023-01-30 09:53:16');
INSERT INTO `logguild` VALUES (7, 2, 2, 'ApproveRegisterGuild', 'Duy???t th??nh c??ng ', '2023-01-30 09:53:22');
INSERT INTO `logguild` VALUES (8, NULL, NULL, 'RejectRegisterGuild', 'T??? ch???i ????ng k?? th??nh c??ng ', '2023-01-30 10:08:19');
INSERT INTO `logguild` VALUES (9, 2, 2, 'ApproveRegisterGuild', 'Duy???t th???t b???i do t??i kho???n ???? c?? c??ng h???i', '2023-01-30 10:14:59');
INSERT INTO `logguild` VALUES (10, 2, 2, 'RejectRegisterGuild', 'T??? ch???i ????ng k?? th??nh c??ng ', '2023-01-30 10:15:35');
INSERT INTO `logguild` VALUES (11, 2, 2, 'ApproveRegisterGuild', 'Duy???t th???t b???i SQLEXCEPTION ', '2023-01-30 10:15:42');
INSERT INTO `logguild` VALUES (12, 2, 2, 'ApproveRegisterGuild', 'Duy???t th???t b???i SQLEXCEPTION ', '2023-01-30 10:18:13');
INSERT INTO `logguild` VALUES (13, 2, 2, 'ApproveRegisterGuild', 'Duy???t th???t b???i SQLEXCEPTION ', '2023-01-30 10:19:22');
INSERT INTO `logguild` VALUES (14, 2, 2, 'ApproveRegisterGuild', 'Duy???t th???t b???i SQLEXCEPTION ', '2023-01-30 10:21:18');
INSERT INTO `logguild` VALUES (15, 2, 2, 'ApproveRegisterGuild', 'Duy???t th???t b???i SQLEXCEPTION ', '2023-01-30 10:23:26');
INSERT INTO `logguild` VALUES (16, 2, 2, 'ApproveRegisterGuild', 'Duy???t th???t b???i do ???? x??? l?? r???i', '2023-01-30 10:23:50');
INSERT INTO `logguild` VALUES (17, 2, 2, 'RegisterGuild', '????ng k?? v??o h???i th??nh c??ng ', '2023-01-30 10:29:38');
INSERT INTO `logguild` VALUES (18, 2, 2, 'RegisterGuild', '???? ????ng k?? tr?????c ???? ', '2023-01-30 10:29:49');
INSERT INTO `logguild` VALUES (19, 2, 2, 'RejectRegisterGuild', 'T??? ch???i ????ng k?? th??nh c??ng ', '2023-01-30 10:30:12');
INSERT INTO `logguild` VALUES (20, 2, 2, 'RegisterGuild', '????ng k?? v??o h???i th??nh c??ng ', '2023-01-30 10:30:42');
INSERT INTO `logguild` VALUES (21, 2, 2, 'RejectRegisterGuild', 'T??? ch???i ????ng k?? th??nh c??ng ', '2023-01-30 10:30:48');
INSERT INTO `logguild` VALUES (22, 2, 2, 'RegisterGuild', 'T??i kho???n b??? t??? ch???i 3 l???n trong v??ng 7 ng??y ', '2023-01-30 10:30:53');
INSERT INTO `logguild` VALUES (23, 2, 2, 'ApproveRegisterGuild', 'Duy???t th???t b???i do ???? x??? l?? r???i', '2023-01-30 10:31:23');
INSERT INTO `logguild` VALUES (24, 2, 2, 'ApproveRegisterGuild', 'Duy???t th??nh c??ng ', '2023-01-30 10:32:38');
INSERT INTO `logguild` VALUES (25, 1, NULL, 'TaoHoi', 'ErrorSQLEXCEPTION ', '2023-01-30 14:33:36');
INSERT INTO `logguild` VALUES (26, 1, NULL, 'TaoHoi', 'T??i kho???n kh??ng ????? s??? coin ', '2023-01-30 14:36:57');
INSERT INTO `logguild` VALUES (27, 1, NULL, 'TaoHoi', 'ErrorSQLEXCEPTION ', '2023-01-30 14:37:18');
INSERT INTO `logguild` VALUES (28, 1, NULL, 'TaoHoi', 'ErrorSQLEXCEPTION ', '2023-01-30 14:38:30');
INSERT INTO `logguild` VALUES (29, 1, 1, 'TaoHoi', 'T???o m???i c??ng h???i th??nh c??ng', '2023-01-30 14:39:47');
INSERT INTO `logguild` VALUES (30, 1, 1, 'TaoHoi', 'C???p nh???t quy???n ch??? h???i cho ng?????i t???o', '2023-01-30 14:39:47');
INSERT INTO `logguild` VALUES (31, 1, 1, 'RegisterGuild', 'T??i kho???n ???? c?? c??ng h???i ', '2023-01-30 14:43:49');
INSERT INTO `logguild` VALUES (32, 2, 1, 'RegisterGuild', '????ng k?? v??o h???i th??nh c??ng ', '2023-01-30 15:00:03');
INSERT INTO `logguild` VALUES (33, 2, 1, 'RegisterGuild', '???? ????ng k?? tr?????c ???? ', '2023-01-30 15:00:22');
INSERT INTO `logguild` VALUES (34, 2, 1, 'RejectRegisterGuild', 'T??? ch???i ????ng k?? th??nh c??ng ', '2023-01-30 15:47:06');
INSERT INTO `logguild` VALUES (35, 2, 1, 'RejectRegisterGuild', 'Reject th???t b???i do ???? x??? l?? r???i', '2023-01-30 15:51:29');
INSERT INTO `logguild` VALUES (36, 2, 1, 'RegisterGuild', '????ng k?? v??o h???i th??nh c??ng ', '2023-01-30 15:51:45');
INSERT INTO `logguild` VALUES (37, 2, 1, 'ApproveRegisterGuild', 'Duy???t th??nh c??ng ', '2023-01-30 16:08:48');
INSERT INTO `logguild` VALUES (38, NULL, NULL, 'GetMembersGuild', 'L???i SQLEXCEPTION ', '2023-01-30 16:13:21');
INSERT INTO `logguild` VALUES (39, NULL, NULL, 'GetMembersGuild', 'L???i SQLEXCEPTION ', '2023-01-30 16:14:01');
INSERT INTO `logguild` VALUES (40, NULL, NULL, 'GetMembersGuild', 'L???y danh s??ch th??nh vi??n th??nh c??ng ', '2023-01-30 16:16:03');
INSERT INTO `logguild` VALUES (41, 2, 1, 'SetNoficationGuild', 'SQLEXCEPTION error', '2023-01-30 16:26:58');
INSERT INTO `logguild` VALUES (42, 2, 1, 'SetNoficationGuild', 'Thay ?????i th??ng b??o th???t b???i v?? kh??ng ????? quy???n', '2023-01-30 16:27:36');
INSERT INTO `logguild` VALUES (43, 1, 1, 'SetNoficationGuild', 'Thay ?????i th??ng b??o th??nh c??ng ', '2023-01-30 16:27:50');
INSERT INTO `logguild` VALUES (44, 1, 1, 'KickMember', 'SQLEXCEPTION error', '2023-01-30 17:11:06');
INSERT INTO `logguild` VALUES (45, 1, 1, 'KickMember', 'SQLEXCEPTION error', '2023-01-30 17:11:43');
INSERT INTO `logguild` VALUES (46, 1, 1, 'KickMember', 'SQLEXCEPTION error', '2023-01-30 17:12:49');
INSERT INTO `logguild` VALUES (47, 1, 1, 'KickMember', 'SQLEXCEPTION error', '2023-01-30 17:14:46');
INSERT INTO `logguild` VALUES (48, 1, 1, 'KickMember', 'SQLEXCEPTION error', '2023-01-30 17:15:05');
INSERT INTO `logguild` VALUES (49, 1, 1, 'KickMember', 'SQLEXCEPTION error', '2023-01-30 17:15:14');
INSERT INTO `logguild` VALUES (50, 1, 1, 'KickMember', 'SQLEXCEPTION error', '2023-01-30 17:15:26');
INSERT INTO `logguild` VALUES (51, 2, 1, 'KickMember', 'Kick kh???i h???i th??nh c??ng', '2023-01-30 17:17:46');
INSERT INTO `logguild` VALUES (52, 2, 1, 'RegisterGuild', '????ng k?? v??o h???i th??nh c??ng ', '2023-01-30 17:23:13');
INSERT INTO `logguild` VALUES (53, 2, 1, 'RegisterGuild', '???? ????ng k?? tr?????c ???? ', '2023-01-31 08:43:42');
INSERT INTO `logguild` VALUES (54, 2, 1, 'ApproveRegisterGuild', 'Duy???t th??nh c??ng ', '2023-01-31 08:44:10');
INSERT INTO `logguild` VALUES (55, 2, 1, 'KickMember', 'Kick kh???i h???i th??nh c??ng', '2023-01-31 08:59:24');
INSERT INTO `logguild` VALUES (56, NULL, NULL, 'GetMembersGuild', 'L???y danh s??ch th??nh vi??n th??nh c??ng ', '2023-01-31 08:59:46');
INSERT INTO `logguild` VALUES (57, 1, NULL, 'TaoHoi', 'ErrorSQLEXCEPTION ', '2023-01-31 15:09:14');
INSERT INTO `logguild` VALUES (58, 1, NULL, 'TaoHoi', 'ErrorSQLEXCEPTION ', '2023-01-31 15:16:18');
INSERT INTO `logguild` VALUES (59, 1, NULL, 'TaoHoi', 'ErrorSQLEXCEPTION ', '2023-01-31 15:19:23');
INSERT INTO `logguild` VALUES (60, 1, NULL, 'TaoHoi', 'ErrorSQLEXCEPTION ', '2023-01-31 15:31:56');
INSERT INTO `logguild` VALUES (61, 1, NULL, 'TaoHoi', 'ErrorSQLEXCEPTION ', '2023-01-31 15:32:07');
INSERT INTO `logguild` VALUES (62, 1, NULL, 'TaoHoi', 'ErrorSQLEXCEPTION ', '2023-01-31 15:37:28');
INSERT INTO `logguild` VALUES (63, 1, NULL, 'TaoHoi', 'ErrorSQLEXCEPTION ', '2023-01-31 15:38:04');
INSERT INTO `logguild` VALUES (64, 1, NULL, 'TaoHoi', 'T??n nh??m t???i thi???u c?? 6 k?? t???', '2023-01-31 15:44:57');
INSERT INTO `logguild` VALUES (65, 1, NULL, 'TaoHoi', 'T??n nh??m t??? 6 ?????n 16 k?? t???', '2023-01-31 15:45:05');
INSERT INTO `logguild` VALUES (66, 1, 1, 'TaoHoi', 'T???o m???i c??ng h???i th??nh c??ng', '2023-01-31 15:45:14');
INSERT INTO `logguild` VALUES (67, 1, 1, 'TaoHoi', 'C???p nh???t quy???n ch??? h???i cho ng?????i t???o', '2023-01-31 15:45:14');
INSERT INTO `logguild` VALUES (68, 1, NULL, 'TaoHoi', 'T??i kho???n ???? c?? c??ng h???i ', '2023-01-31 15:57:35');
INSERT INTO `logguild` VALUES (69, NULL, NULL, 'GetMembersGuild', 'L???i SQLEXCEPTION ', '2023-01-31 16:08:34');
INSERT INTO `logguild` VALUES (70, NULL, NULL, 'GetMembersGuild', 'L???i SQLEXCEPTION ', '2023-01-31 16:10:37');
INSERT INTO `logguild` VALUES (71, NULL, NULL, 'GetMembersGuild', 'L???y danh s??ch th??nh vi??n th??nh c??ng ', '2023-01-31 16:13:48');
INSERT INTO `logguild` VALUES (72, 2, 1, 'RegisterGuild', 'ErrorSQLEXCEPTION ', '2023-02-01 09:02:23');
INSERT INTO `logguild` VALUES (73, 2, 1, 'RegisterGuild', '????ng k?? v??o h???i th??nh c??ng ', '2023-02-01 09:02:57');
INSERT INTO `logguild` VALUES (74, 2, 1, 'RejectRegisterGuild', 'T??? ch???i ????ng k?? th??nh c??ng ', '2023-02-01 10:21:38');
INSERT INTO `logguild` VALUES (75, 2, 1, 'RegisterGuild', '????ng k?? v??o h???i th??nh c??ng ', '2023-02-01 10:29:45');
INSERT INTO `logguild` VALUES (76, NULL, NULL, 'ApproveRegisterGuild', 'Duy???t th???t b???i do ???? t??? ch???i r???i', '2023-02-01 10:29:52');
INSERT INTO `logguild` VALUES (77, 2, 1, 'RegisterGuild', '???? ????ng k?? tr?????c ???? ', '2023-02-01 10:31:12');
INSERT INTO `logguild` VALUES (78, NULL, NULL, 'ApproveRegisterGuild', 'Duy???t th???t b???i do ???? t??? ch???i r???i', '2023-02-01 10:31:17');
INSERT INTO `logguild` VALUES (79, 2, 1, 'ApproveRegisterGuild', 'Duy???t th??nh c??ng ', '2023-02-01 10:32:48');
INSERT INTO `logguild` VALUES (80, 1, 1, 'SetNoficationGuild', 'SQLEXCEPTION error', '2023-02-01 10:52:35');
INSERT INTO `logguild` VALUES (81, 1, 1, 'SetNoficationGuild', 'Thay ?????i th??ng b??o th??nh c??ng ', '2023-02-01 10:53:47');
INSERT INTO `logguild` VALUES (82, 1, 1, 'ChangeDescriptionGuild', 'Thay ?????i th??ng b??o th??nh c??ng ', '2023-02-01 11:33:53');
INSERT INTO `logguild` VALUES (83, 2, 1, 'ExpendMaxMember', 'Kh??ng ????? quy???n h???n', '2023-02-01 14:39:02');
INSERT INTO `logguild` VALUES (84, 1, 1, 'ExpendMaxMember', 'Error SQL Exception', '2023-02-01 14:39:22');
INSERT INTO `logguild` VALUES (85, 1, 1, 'ExpendMaxMember', 'N??ng c???p t???i ??a th??nh vi??n th??nh c??ng', '2023-02-01 14:40:08');
INSERT INTO `logguild` VALUES (86, 1, 1, 'ExpandTableGuild', 'Error SQL Exception', '2023-02-01 15:00:16');
INSERT INTO `logguild` VALUES (87, 1, 1, 'ExpandTableGuild', 'N??ng c???p gi???i h???n th??nh vi??n th??nh c??ng', '2023-02-01 15:00:50');
INSERT INTO `logguild` VALUES (88, 1, 1, 'ExpandTableGuild', 'N??ng c???p gi???i h???n b??n th??nh c??ng', '2023-02-01 15:01:42');
INSERT INTO `logguild` VALUES (89, 1, NULL, 'TaoHoi', 'Thanh to??n ti???n t???o C??ng h???i th??nh c??ng', '2023-02-01 16:42:48');
INSERT INTO `logguild` VALUES (90, 1, 2, 'TaoHoi', 'T???o m???i c??ng h???i th??nh c??ng', '2023-02-01 16:42:48');
INSERT INTO `logguild` VALUES (91, 1, 2, 'TaoHoi', 'C???p nh???t quy???n cho ch??? h???i', '2023-02-01 16:42:48');
INSERT INTO `logguild` VALUES (92, 1, NULL, 'TaoHoi', 'T??i kho???n ???? c?? c??ng h???i ', '2023-02-01 16:43:31');
INSERT INTO `logguild` VALUES (93, 2, NULL, 'TaoHoi', 'T??i kho???n kh??ng ????? s??? gold ', '2023-02-01 16:44:11');
INSERT INTO `logguild` VALUES (94, 2, 2, 'RegisterGuild', '????ng k?? v??o h???i th??nh c??ng ', '2023-02-02 09:14:34');
INSERT INTO `logguild` VALUES (95, 1, 2, 'RejectRegisterGuild', 'T??? ch???i ????ng k?? th??nh c??ng ', '2023-02-02 09:35:50');
INSERT INTO `logguild` VALUES (96, 2, 2, 'RegisterGuild', '????ng k?? v??o h???i th??nh c??ng ', '2023-02-02 09:36:21');
INSERT INTO `logguild` VALUES (97, 2, 2, 'RegisterGuild', '???? ????ng k?? tr?????c ???? ', '2023-02-02 09:36:23');
INSERT INTO `logguild` VALUES (98, 1, NULL, 'ApproveRegisterGuild', 'Error SQL Exception  ', '2023-02-02 09:36:34');
INSERT INTO `logguild` VALUES (99, 1, 2, 'ApproveRegisterGuild', 'Duy???t th??nh c??ng ', '2023-02-02 09:37:00');
INSERT INTO `logguild` VALUES (100, NULL, NULL, 'GetMembersGuild', 'L???y danh s??ch th??nh vi??n th??nh c??ng ', '2023-02-02 14:25:19');
INSERT INTO `logguild` VALUES (101, 2, 2, 'ExpandTableGuild', 'Kh??ng ????? quy???n h???n', '2023-02-02 15:43:51');
INSERT INTO `logguild` VALUES (102, 1, 2, 'ExpandTableGuild', 'N??ng c???p gi???i h???n b??n th??nh c??ng', '2023-02-02 15:43:55');
INSERT INTO `logguild` VALUES (103, 2, 2, 'RegisterGuild', '????ng k?? v??o h???i th??nh c??ng ', '2023-02-03 14:37:43');
INSERT INTO `logguild` VALUES (104, 1, 2, 'ExpendMaxMember', 'Tr??? ti???n th??nh c??ng', '2023-02-07 11:13:15');
INSERT INTO `logguild` VALUES (112, 6, NULL, 'CreateGuild', 'Thanh to??n ti???n t???o C??ng h???i th??nh c??ng', '2023-02-07 16:47:58');
INSERT INTO `logguild` VALUES (113, 8, NULL, 'CreateGuild', 'Thanh to??n ti???n t???o C??ng h???i th??nh c??ng', '2023-02-07 16:49:16');
INSERT INTO `logguild` VALUES (114, 5, NULL, 'CreateGuild', 'Thanh to??n ti???n t???o C??ng h???i th??nh c??ng', '2023-02-10 10:32:46');
INSERT INTO `logguild` VALUES (115, 7, NULL, 'CreateGuild', 'Thanh to??n ti???n t???o C??ng h???i th??nh c??ng', '2023-02-10 10:36:22');
INSERT INTO `logguild` VALUES (116, 0, NULL, 'CreateGuild', 'Thanh to??n ti???n t???o C??ng h???i th??nh c??ng', '2023-02-10 11:02:17');
INSERT INTO `logguild` VALUES (117, 1, NULL, 'CreateGuild', 'Thanh to??n ti???n t???o C??ng h???i th??nh c??ng', '2023-02-10 11:26:00');
INSERT INTO `logguild` VALUES (118, 2, NULL, 'CreateGuild', 'Thanh to??n ti???n t???o C??ng h???i th??nh c??ng', '2023-02-13 14:23:30');
INSERT INTO `logguild` VALUES (119, 1, 1, 'ChangeNameGuild', 'Tr??? Gold ?????i t??n c??ng h???i th??nh c??ng', '2023-02-13 15:37:57');
INSERT INTO `logguild` VALUES (120, 2, 2, 'ChangeNameGuild', 'Tr??? Gold ?????i t??n c??ng h???i th??nh c??ng', '2023-02-13 15:38:23');
INSERT INTO `logguild` VALUES (121, 2, 2, 'ChangeNameGuild', 'Tr??? Gold ?????i t??n c??ng h???i th??nh c??ng', '2023-02-13 15:38:51');
INSERT INTO `logguild` VALUES (122, 2, 2, 'ChangeNameGuild', 'Tr??? Gold ?????i t??n c??ng h???i th??nh c??ng', '2023-02-13 15:39:56');
INSERT INTO `logguild` VALUES (123, 1, 1, 'ChangeNameGuild', 'Tr??? Gold ?????i t??n c??ng h???i th??nh c??ng', '2023-02-13 15:42:22');
INSERT INTO `logguild` VALUES (129, 1, 1, 'ExpendMaxMember', 'Tr??? ti???n th??nh c??ng', '2023-02-13 16:32:39');
INSERT INTO `logguild` VALUES (130, 1, 1, 'KickMember', 'Kick th??nh vi??n id = 3 th??nh c??ng', '2023-02-13 17:28:48');
INSERT INTO `logguild` VALUES (131, 2, 2, 'KickMember', 'Kick th??nh vi??n id = 3 th??nh c??ng', '2023-02-14 08:47:10');
INSERT INTO `logguild` VALUES (132, 2, NULL, 'CreateGuild', 'Thanh to??n ti???n t???o C??ng h???i th??nh c??ng', '2023-02-14 08:52:53');
INSERT INTO `logguild` VALUES (133, 2, 3, 'KickMember', 'Kick th??nh vi??n id = 5 th??nh c??ng', '2023-02-14 11:24:26');

-- ----------------------------
-- Table structure for logtransaction
-- ----------------------------
DROP TABLE IF EXISTS `logtransaction`;
CREATE TABLE `logtransaction`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `NameProcedure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AccountId` int NOT NULL,
  `Content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Time` datetime(0) NOT NULL,
  `VipBonusLv` int NULL DEFAULT NULL,
  `NumberCoin` int NULL DEFAULT NULL,
  `IditemBuy` int NULL DEFAULT NULL,
  `IdInventoryUse` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logtransaction
-- ----------------------------
INSERT INTO `logtransaction` VALUES (1, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 1', '2023-01-16 11:39:13', 3, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (2, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 3 qu?? Vip 1', '2023-01-16 11:39:13', 3, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (3, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n qu?? Vip 1 th??nh c??ng !!!', '2023-01-16 11:39:13', 3, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (4, 'ConvertCoin', 1, 'T??i kho???n id= 1 ?????i 20 coin th??nh c??ng !! ', '2023-01-16 13:15:04', NULL, 20, NULL, NULL);
INSERT INTO `logtransaction` VALUES (5, 'ConvertCoin', 1, 'T??i kho???n id= 1 ?????i 50 coin sang 50000 gold  !! ', '2023-01-16 13:20:32', NULL, 50, NULL, NULL);
INSERT INTO `logtransaction` VALUES (6, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 2', '2023-01-16 13:37:23', 8, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (7, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 8 qu?? Vip 2', '2023-01-16 13:37:23', 8, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (8, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n qu?? Vip 2 th??nh c??ng !!!', '2023-01-16 13:37:23', 8, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (9, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 3', '2023-01-16 13:46:25', 3, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (10, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 10 qu?? Vip 3', '2023-01-16 13:46:25', 3, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (11, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n qu?? Vip 3 th??nh c??ng !!!', '2023-01-16 13:46:25', 3, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (12, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 1', '2023-01-16 13:48:58', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (13, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 3 qu?? Vip 1', '2023-01-16 13:48:58', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (14, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n qu?? Vip 1 th??nh c??ng !!!', '2023-01-16 13:48:58', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (15, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 2', '2023-01-16 13:51:48', 2, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (16, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 8 qu?? Vip 2', '2023-01-16 13:51:48', 2, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (17, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n qu?? Vip 2 th??nh c??ng !!!', '2023-01-16 13:51:48', 2, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (18, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 1', '2023-01-16 13:52:33', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (19, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 3 qu?? Vip 1', '2023-01-16 13:52:33', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (20, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n qu?? Vip 1 th??nh c??ng !!!', '2023-01-16 13:52:33', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (21, 'ConvertCoin', 2, 'T??i kho???n id= 2 ?????i 10 coin sang 10000 gold  !! ', '2023-01-16 14:02:29', NULL, 10, NULL, NULL);
INSERT INTO `logtransaction` VALUES (22, 'BuyItem', 2, 'T??i kho???n id = 2 ???? b??? tr??? 176700 Gold', '2023-01-16 14:35:23', NULL, NULL, 6, NULL);
INSERT INTO `logtransaction` VALUES (23, 'BuyItem', 2, 'T??i kho???n id = 2 t???o transaction', '2023-01-16 14:35:23', NULL, NULL, 6, NULL);
INSERT INTO `logtransaction` VALUES (24, 'BuyItem', 2, 'T??i kho???n id = 2 ???? thu?? item id = 6 trong 3 ng??y', '2023-01-16 14:35:23', NULL, NULL, 6, NULL);
INSERT INTO `logtransaction` VALUES (25, 'UseItemInventory', 2, '?????i status c???a c??c item c??ng idtype = 2 v??? 0 th??nh c??ng', '2023-01-16 14:49:08', NULL, NULL, NULL, 10);
INSERT INTO `logtransaction` VALUES (26, 'UseItemInventory', 2, 'idinventory = 10 ???? set status = 1 th??nh c??ng', '2023-01-16 14:49:08', NULL, NULL, NULL, 10);
INSERT INTO `logtransaction` VALUES (27, 'UseItemInventory', 2, '?????i status c???a c??c item c??ng idtype = 1 v??? 0 th??nh c??ng', '2023-01-16 14:50:16', NULL, NULL, NULL, 6);
INSERT INTO `logtransaction` VALUES (28, 'UseItemInventory', 2, 'idinventory = 6 ???? set status = 1 th??nh c??ng', '2023-01-16 14:50:16', NULL, NULL, NULL, 6);
INSERT INTO `logtransaction` VALUES (29, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 1', '2023-01-17 10:04:10', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (30, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 3 qu?? Vip 1', '2023-01-17 10:04:10', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (31, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 8 qu?? Vip 1', '2023-01-17 10:04:10', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (32, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n qu?? Vip 1 th??nh c??ng !!!', '2023-01-17 10:04:10', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (33, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 2', '2023-01-17 10:14:05', 2, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (34, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n qu?? Vip 2 th??nh c??ng !!!', '2023-01-17 10:14:05', 2, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (35, 'UseItemInventory', 2, '?????i status c???a c??c item c??ng idtype = 1 v??? 0 ', '2023-01-17 10:34:43', NULL, NULL, NULL, 6);
INSERT INTO `logtransaction` VALUES (36, 'UseItemInventory', 2, 'idinventory = 6 ???? set status = 1 th??nh c??ng', '2023-01-17 10:34:43', NULL, NULL, NULL, 6);
INSERT INTO `logtransaction` VALUES (37, 'ConvertCoin', 2, 'T??i kho???n id= 2 ?????i 10 coin sang 10000 gold  !! ', '2023-01-17 11:00:17', NULL, 10, NULL, NULL);
INSERT INTO `logtransaction` VALUES (38, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 3', '2023-01-17 14:10:47', 3, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (39, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 10 qu?? Vip 3', '2023-01-17 14:10:47', 3, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (40, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n qu?? Vip 3 th??nh c??ng !!!', '2023-01-17 14:10:47', 3, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (41, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 4', '2023-01-17 14:11:36', 4, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (42, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 11 qu?? Vip 4', '2023-01-17 14:11:36', 4, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (43, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n qu?? Vip 4 th??nh c??ng !!!', '2023-01-17 14:11:36', 4, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (44, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 1', '2023-01-17 14:13:53', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (45, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 3 qu?? Vip 1', '2023-01-17 14:13:53', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (46, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n item id = 8 qu?? Vip 1', '2023-01-17 14:13:53', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (47, 'ReceiveGiftVip', 1, 'T??i kho???n id =1 nh???n qu?? Vip 1 th??nh c??ng !!!', '2023-01-17 14:13:53', 1, NULL, NULL, NULL);
INSERT INTO `logtransaction` VALUES (48, 'ConvertCoin', 1, 'T??i kho???n id= 1 ?????i 40 coin sang 40000 gold  !! ', '2023-01-17 14:17:47', NULL, 40, NULL, NULL);
INSERT INTO `logtransaction` VALUES (49, 'ConvertCoin', 1, 'T??i kho???n id= 1 ?????i 10 coin sang 10000 gold  !! ', '2023-01-17 14:18:07', NULL, 10, NULL, NULL);
INSERT INTO `logtransaction` VALUES (50, 'ConvertCoin', 1, 'T??i kho???n id= 1 ?????i 500 coin sang 500000 gold  !! ', '2023-01-17 14:18:39', NULL, 500, NULL, NULL);
INSERT INTO `logtransaction` VALUES (51, 'ConvertCoin', 1, 'T??i kho???n id= 1 ?????i 10 coin sang 10000 gold  !! ', '2023-03-01 22:19:00', NULL, 10, NULL, NULL);
INSERT INTO `logtransaction` VALUES (52, 'ConvertCoin', 1, 'T??i kho???n id= 1 ?????i 10 coin sang 10000 gold  !! ', '2023-03-01 23:07:06', NULL, 10, NULL, NULL);
INSERT INTO `logtransaction` VALUES (53, 'ConvertCoin', 1, 'T??i kho???n id= 1 ?????i 10 coin sang 10000 gold  !! ', '2023-03-01 23:41:28', NULL, 10, NULL, NULL);
INSERT INTO `logtransaction` VALUES (55, 'ReceiveGiftVip', 1, 'T??i kho???n id = 1 nh???n gold qu?? Vip 1', '2023-03-02 04:42:45', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tblaccount
-- ----------------------------
DROP TABLE IF EXISTS `tblaccount`;
CREATE TABLE `tblaccount`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'T??n',
  `Username` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'T??i kho???n',
  `Passwd` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'M???t kh???u',
  `Dob` date NOT NULL COMMENT 'Ng??y Sinh',
  `Sex` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Gi???i T??nh',
  `Gold` bigint NOT NULL COMMENT 'V??ng',
  `Level` int NOT NULL COMMENT 'C???p ?????',
  `Exp` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Kinh nghi???m hi???n t???i',
  `VipLevel` int NOT NULL COMMENT 'C???p Vip',
  `GiftVip` int NOT NULL COMMENT 'Qu?? vip ???? nh???n',
  `coin` int NOT NULL COMMENT 'S??? Coin',
  `CurRank` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Rank hi???n t???i',
  `Point` int NOT NULL COMMENT 'S??? ??i???m elo',
  `Win` int NOT NULL COMMENT 'S??? tr???n th???ng',
  `Lose` int NOT NULL COMMENT 'S??? tr???n thua',
  `Draw` int NOT NULL COMMENT 'S??? tr???n h??a',
  `TotalPlay` int NOT NULL COMMENT 'T???ng s??? tr???n ???? ch??i',
  `TotalCoinConvert` int NOT NULL DEFAULT 0 COMMENT 'T???ng coin convert sang gold',
  `CreateTime` datetime(0) NOT NULL COMMENT 'Th???i gian t???o',
  `LastLogin` datetime(0) NOT NULL COMMENT 'Time Login l???n tr?????c',
  `IsActive` int NOT NULL COMMENT 'C??n ho???t ?????ng hay kh??ng',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblaccount
-- ----------------------------
INSERT INTO `tblaccount` VALUES (1, 'thaind228', 'ngodangthai22820001', 'Thaivippro', '2000-08-22', 'Nam', 7445000, 99, '150000', 5, 1, 0, 'challenger', 1200, 270, 76, 15, 361, 580, '2020-03-21 13:17:15', '2023-01-06 10:45:12', 1);
INSERT INTO `tblaccount` VALUES (2, 'caychay', 'nongdan', '12345', '2000-01-01', 'Nam', 4475000, 15, '250', 0, 0, 0, 'Broze', 170, 5, 1, 0, 6, 0, '2023-01-11 14:37:56', '2023-01-11 14:38:00', 1);
INSERT INTO `tblaccount` VALUES (3, 'account3', 'thaivip', '12345678', '1929-02-23', 'Nam', 661300, 50, '15000', 0, 0, 0, 'bronze', 120, 6, 1, 0, 7, 0, '2023-02-02 17:20:58', '2023-02-02 17:21:03', 1);
INSERT INTO `tblaccount` VALUES (4, 'acc4', '123456', '123456', '2023-01-30', 'N???', 15000000, 10, '45000', 0, 0, 0, 'bronze', 150, 6, 6, 2, 14, 0, '2023-02-07 16:23:09', '2023-02-07 16:23:12', 1);
INSERT INTO `tblaccount` VALUES (5, 'acc5', 'napvip2k', 'thaivip2k', '2003-07-23', 'Nam', 441000, 1, '0', 0, 0, 0, 'Gold', 1500, 7, 1, 12, 20, 0, '2023-02-07 16:27:48', '2023-02-20 16:27:54', 1);
INSERT INTO `tblaccount` VALUES (6, 'acc6', 'accountso6', 'account', '2023-02-14', 'Nam', 800000, 2, '12', 0, 0, 0, 'Gold', 1000, 15, 2, 10, 27, 0, '2023-02-07 16:28:58', '2023-02-06 16:29:01', 1);
INSERT INTO `tblaccount` VALUES (7, 'account7', 'account7', 'testguild', '2023-02-01', 'N???', 56420, 12, '3522', 0, 0, 0, 'Iron', 500, 10, 2, 1, 13, 0, '2023-02-01 16:31:57', '2023-02-02 16:32:00', 1);
INSERT INTO `tblaccount` VALUES (8, 'test8', 'accso8 ', '12345678', '2023-02-07', 'N???', 50000, 1, '10', 0, 0, 0, 'Iron', 10, 2, 2, 1, 5, 0, '2023-01-30 16:36:30', '2023-02-07 16:36:37', 1);
INSERT INTO `tblaccount` VALUES (9, 'test9', 'abc1234567', '12345678', '2023-02-15', 'Nam', 5000000, 5, '10', 0, 0, 0, 'Bronze', 1500, 2, 3, 1, 6, 0, '2023-02-07 10:41:03', '2023-02-14 10:41:08', 1);

-- ----------------------------
-- Table structure for tblconvertvalue
-- ----------------------------
DROP TABLE IF EXISTS `tblconvertvalue`;
CREATE TABLE `tblconvertvalue`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `donvi` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ConvertTo` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Value` int NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblconvertvalue
-- ----------------------------
INSERT INTO `tblconvertvalue` VALUES (1, 'coin', 'gold', 1000);

-- ----------------------------
-- Table structure for tblguild
-- ----------------------------
DROP TABLE IF EXISTS `tblguild`;
CREATE TABLE `tblguild`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `IdenCode` int NOT NULL DEFAULT 100000 COMMENT 'M?? ?????nh Danh',
  `GuildName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'T??n C??ng H???i',
  `Description` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'L???i ch??o c??ng h???i',
  `MaxMembers` int NOT NULL DEFAULT 30 COMMENT 'S??? th??nh vi??n t???i ??a',
  `NumTables` int NOT NULL DEFAULT 10 COMMENT 'S??? l?????ng b??n c???a h???i',
  `Nofication` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Th??ng b??o c???a h???i',
  `CreateTime` datetime(0) NOT NULL COMMENT 'Ng??y t???o',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblguild
-- ----------------------------
INSERT INTO `tblguild` VALUES (1, 777557, 'thai   228', 'abc', 40, 15, NULL, '2023-02-10 11:26:00');
INSERT INTO `tblguild` VALUES (3, 396950, 'funny668', 'Vao cho vui', 30, 10, NULL, '2023-02-14 08:52:53');

-- ----------------------------
-- Table structure for tblguildaccount
-- ----------------------------
DROP TABLE IF EXISTS `tblguildaccount`;
CREATE TABLE `tblguildaccount`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `idaccount` int NOT NULL COMMENT 'ID ng?????i xin v??o c??ng h???i',
  `idguild` int NOT NULL COMMENT 'Id C??ng h???i',
  `Status` int NOT NULL DEFAULT 0 COMMENT 'Tr???ng th??i ????ng k?? (0 : ??ang x??t, 1 : ch???p nh???n, 2: m???i v??o)',
  `idRoll` int NOT NULL DEFAULT 0 COMMENT 'Id Ch???c v???',
  `Point` int NOT NULL DEFAULT 0 COMMENT '??i???m c???ng hi???n ',
  `TimeAdd` datetime(0) NOT NULL COMMENT 'Th???i gian xin v??o',
  `TimeModify` datetime(0) NULL DEFAULT NULL COMMENT 'Th???i gian ch???nh s???a',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idconghoi`(`idguild`) USING BTREE,
  CONSTRAINT `idconghoi` FOREIGN KEY (`idguild`) REFERENCES `tblguild` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblguildaccount
-- ----------------------------
INSERT INTO `tblguildaccount` VALUES (1, 1, 1, 1, 1, 0, '2023-02-10 11:26:00', NULL);
INSERT INTO `tblguildaccount` VALUES (9, 2, 3, 1, 1, 0, '2023-02-14 08:52:53', NULL);
INSERT INTO `tblguildaccount` VALUES (11, 3, 1, 1, 3, 0, '2023-02-14 09:10:24', '2023-02-14 10:29:33');
INSERT INTO `tblguildaccount` VALUES (13, 4, 3, 1, 3, 0, '2023-02-14 09:31:57', '2023-02-14 11:13:05');

-- ----------------------------
-- Table structure for tblguildservice
-- ----------------------------
DROP TABLE IF EXISTS `tblguildservice`;
CREATE TABLE `tblguildservice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `NameService` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'T??n d???ch v??? Guild',
  `Gold` int NOT NULL COMMENT 'Gi?? ti???n ',
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'M?? t??? t??c d???ng v???t d???ng',
  `TimeAdd` datetime(0) NOT NULL COMMENT 'Th???i gian th??m',
  `Number` int NULL DEFAULT NULL COMMENT 'S??? l?????ng m??? r???ng',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblguildservice
-- ----------------------------
INSERT INTO `tblguildservice` VALUES (1, 'CreateGuild', 100000, 'Th??? t???o c??ng h???i', '0000-00-00 00:00:00', NULL);
INSERT INTO `tblguildservice` VALUES (2, 'ExpandMaxMembers', 500000, 'Th??? n??ng c???p gi???i h???n th??nh vi??n', '2023-02-01 13:54:12', 10);
INSERT INTO `tblguildservice` VALUES (3, 'ExpendMaxTable', 200000, 'Th??? m??? r???ng s??? l?????ng b??n c??ng h???i', '2023-02-01 14:00:27', 5);
INSERT INTO `tblguildservice` VALUES (4, 'ChangeNameGuild', 50000, 'Th??? ?????i t??n c??ng h???i', '2023-02-01 14:01:09', NULL);

-- ----------------------------
-- Table structure for tblitem
-- ----------------------------
DROP TABLE IF EXISTS `tblitem`;
CREATE TABLE `tblitem`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(105) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `gold` int NULL DEFAULT NULL,
  `brrgold` int NULL DEFAULT NULL,
  `isvalid` int NOT NULL,
  `idtype` int NOT NULL,
  `isbought` int NULL DEFAULT NULL,
  `Isborrowed` int NULL DEFAULT NULL,
  `vipbonus` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE,
  INDEX `item_idx`(`idtype`) USING BTREE,
  CONSTRAINT `idtype` FOREIGN KEY (`idtype`) REFERENCES `tbltype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblitem
-- ----------------------------
INSERT INTO `tblitem` VALUES (1, 'Gi??o ph??p', 'V?? kh?? main class th????ng th???', 169000, 16000, 1, 1, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (2, 'Ki???m', 'V?? kh?? main ?????u s??', 299000, 30000, 1, 1, 1, 1, 5);
INSERT INTO `tblitem` VALUES (3, 'Cung g???', 'V?? kh?? ch??nh cung th???', 74000, 7500, 1, 1, 1, 1, 1);
INSERT INTO `tblitem` VALUES (4, 'G???y', 'V?? kh?? ch??nh ph??p s??', 175000, 18000, 1, 1, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (5, 'Khi??n', 'V?? kh?? ch??nh tanker', 499000, 42000, 1, 1, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (6, 'Emoji c?????i ', 'Hahahehehehe', 623000, 62000, 1, 2, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (7, 'Emoji gi???n d???', 'Ggzzzzzzzz', 623000, 45010, 1, 2, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (8, 'Emoji vui v???', 'Hihihihi', 343000, 15000, 1, 2, 1, 1, 1);
INSERT INTO `tblitem` VALUES (9, 'Emoji bu???n ng???', 'zz zzzzzzzz', 150000, 21000, 1, 2, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (10, 'Emoji khinh b???', 'Uhmm uhm uhm', 623000, 15000, 1, 2, 1, 1, 3);
INSERT INTO `tblitem` VALUES (11, 'Avaatar trung thu', 'https://localhost:4100/swagger/index.html', 30000, 4500, 1, 3, 1, 1, 4);
INSERT INTO `tblitem` VALUES (12, 'Avatar New Year', 'https://localhost:4100/swagger/index.html', 82000, 6500, 1, 3, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (13, 'Avatar Gi??ng Sinh', 'https://localhost:4100/swagger/index.html', 35000, 5000, 1, 3, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (14, 'Avatar ????m kinh ho??ng', 'https://localhost:4100/swagger/index.html', 52000, 7500, 1, 3, 1, 1, 6);
INSERT INTO `tblitem` VALUES (15, 'Avatar tr???ng m???ng m??', 'https://localhost:4100/swagger/index.html', 49000, 12000, 1, 3, 1, 1, 7);
INSERT INTO `tblitem` VALUES (16, 'Background nh???t nh??a', 'https://localhost:4100/swagger/background1.html', 29000000, 274000, 1, 4, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (17, 'Background m??u l???a', 'https://localhost:4100/swagger/background2.html', 1500000, 154000, 1, 4, 1, 1, 8);
INSERT INTO `tblitem` VALUES (18, 'Background m???t m??', 'https://localhost:4100/swagger/background3.html', 1900000, 167000, 1, 4, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (19, 'Background m??y xanh', 'https://localhost:4100/swagger/background4.html', 18500000, 153000, 1, 4, 1, 1, 10);
INSERT INTO `tblitem` VALUES (20, 'Background n??i l???a', 'https://localhost:4100/swagger/background5.html', 15300000, 143000, 1, 4, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (21, 'Trang ph???c ki???m hi???p', 'https://localhost:4100/swagger/kiemhiep.html', 806000, 76000, 1, 5, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (22, 'Trang ph???c maid', 'https://localhost:4100/swagger/maid.html', 764000, 75000, 1, 5, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (23, 'Trang ph???c ????ng ??u', 'https://localhost:4100/swagger/dongau.html', 807000, 64000, 1, 5, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (24, 'Trang ph???c th??? d??n', 'https://localhost:4100/swagger/dantoc.html', 492000, 54000, 1, 5, 1, 1, NULL);
INSERT INTO `tblitem` VALUES (25, 'Trang ph???c d??n t???c', 'https://localhost:4100/swagger/thodan.html', 254000, 25000, 1, 5, 1, 1, NULL);

-- ----------------------------
-- Table structure for tblrollguild
-- ----------------------------
DROP TABLE IF EXISTS `tblrollguild`;
CREATE TABLE `tblrollguild`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `Rollname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'T??n quy???n ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblrollguild
-- ----------------------------
INSERT INTO `tblrollguild` VALUES (1, 'Hoitruong');
INSERT INTO `tblrollguild` VALUES (2, 'Hoipho');
INSERT INTO `tblrollguild` VALUES (3, 'Thanhvien');

-- ----------------------------
-- Table structure for tblsale
-- ----------------------------
DROP TABLE IF EXISTS `tblsale`;
CREATE TABLE `tblsale`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `days` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `saleoff` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tblsale
-- ----------------------------
INSERT INTO `tblsale` VALUES (1, 'gold', '3', 5);
INSERT INTO `tblsale` VALUES (2, 'gold', '7', 7);
INSERT INTO `tblsale` VALUES (3, 'gold', '15', 10);
INSERT INTO `tblsale` VALUES (4, 'gold', '30', 15);
INSERT INTO `tblsale` VALUES (5, 'gold', '60', 30);

-- ----------------------------
-- Table structure for tbltransaction
-- ----------------------------
DROP TABLE IF EXISTS `tbltransaction`;
CREATE TABLE `tbltransaction`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `idacc` int NOT NULL,
  `iditem` int NOT NULL,
  `sotien` bigint NOT NULL,
  `tiente` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `time` datetime(0) NOT NULL,
  `type` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbltransaction
-- ----------------------------
INSERT INTO `tbltransaction` VALUES (1, 2, 3, 74000, 'gold', '2023-01-11 15:30:13', 'mua');
INSERT INTO `tbltransaction` VALUES (2, 1, 3, 1887000, 'gold', '2023-01-11 15:31:02', 'thu??');
INSERT INTO `tbltransaction` VALUES (3, 1, 11, 30, 'diamond', '2023-01-11 15:33:50', 'mua');
INSERT INTO `tbltransaction` VALUES (4, 1, 14, 52000, 'gold', '2023-01-11 16:50:58', 'mua');
INSERT INTO `tbltransaction` VALUES (5, 1, 6, 4056, 'diamond', '2023-01-12 08:48:15', 'thu??');
INSERT INTO `tbltransaction` VALUES (6, 2, 1, 1100190, 'gold', '2023-01-13 09:19:42', 'mua');
INSERT INTO `tbltransaction` VALUES (7, 2, 10, 623000, 'gold', '2023-01-15 17:20:44', 'mua');
INSERT INTO `tbltransaction` VALUES (8, 2, 6, 176700, 'gold', '2023-01-16 14:35:23', 'thu??');

-- ----------------------------
-- Table structure for tbltype
-- ----------------------------
DROP TABLE IF EXISTS `tbltype`;
CREATE TABLE `tbltype`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbltype
-- ----------------------------
INSERT INTO `tbltype` VALUES (1, 'Equipment');
INSERT INTO `tbltype` VALUES (2, 'Emoji');
INSERT INTO `tbltype` VALUES (3, 'Avatar');
INSERT INTO `tbltype` VALUES (4, 'ChatBackground');
INSERT INTO `tbltype` VALUES (5, 'Costume');
INSERT INTO `tbltype` VALUES (6, 'Th???');

-- ----------------------------
-- Procedure structure for ApproveRegisterGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `ApproveRegisterGuild`;
delimiter ;;
CREATE PROCEDURE `ApproveRegisterGuild`(in p_accId_approve INT ,in p_idacc INT ,out p_code int , out p_message varchar(125))
while_proc: BEGIN
	DECLARE v_idconghoi ,v_MaxMembers int;
	DECLARE v_log ,v_roll_accId varchar(55);
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
						SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						ROLLBACK;
						SET v_log =  WritelogErr(@errno,p_message,"ApproveRegisterGuild");
			end;
		
		IF NOT EXISTS (Select 1 from tblaccount where id = p_accId_approve) then 
					SET p_code = -1;
					SET p_message = "T??i kho???n kh??ng t???n t???i";
					Leave while_proc;
		end if;
			
		IF NOT  EXISTS (select 1 from tblguildaccount where idaccount = p_accId_approve and `Status` = 1) then
					SET p_code = -1;
					SET p_message = "T??i kho???n ch??a gia nh???p bang h???i ";
				
					LEAVE while_proc ;
		end if;
	
		
		
		Select idguild,idRoll into v_idconghoi,v_roll_accId from tblguildaccount where idaccount = p_accId_approve and `Status` = 1;
	

	if v_roll_accId not in (1,2) then
			SET p_code = -1;
			SET p_message = "T??i kho???n kh??ng ????? quy???n h???n";
			LEAVE while_proc ;
	end if;
			
		IF NOT EXISTS (select 1 from tblguildaccount where idaccount = p_idacc and idguild = v_idconghoi and `Status` = 0 )  then
					SET p_code  = -1;
					SET p_message = "????n ????ng k?? kh??ng t???n t???i";
					
					leave while_proc; 
		end if;
			
		Select g.MaxMembers into v_MaxMembers from tblguild g where g.id = v_idconghoi;
		
		If(select count(*) from tblguildaccount where idguild = v_idconghoi and `Status` = 1 )  >= v_MaxMembers  then 
				SET p_message= "C??ng h???i ???? ?????t t???i ??a th??nh vi??n";
					SET p_code  = -1;
				
					leave while_proc;
		end if;	
			
		if EXISTS (Select 1 from tblguildaccount where idaccount = p_idacc and  `Status` =1 ) then
					SET p_message= "T??i kho???n ????ng k?? ???? c?? C??ng h???i ";
					SET p_code  = -1;
					 
					leave while_proc;
		end if;
		
		
		
	Start TRANSACTION ;
			Update tblguildaccount g
			SET g.`Status` = 1,
				g.idRoll= 3,
				g.TimeModify =sysdate()
			WHERE g.idaccount =  p_idacc
			and g.idguild   =  v_idconghoi	
			and g.`Status` = 0 ;
			
			Delete from tblguildaccount g
			where g.idaccount = p_idacc 
			and g.`Status` in (0,2);
			
	commit;
		
			
			SET p_code = 0;
			SET p_message = "Duy???t v??o h???i th??nh c??ng";
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for BuyItem
-- ----------------------------
DROP PROCEDURE IF EXISTS `BuyItem`;
delimiter ;;
CREATE PROCEDURE `BuyItem`(IN p_accountId INT,IN p_ItemId INT,IN p_Days INT, OUT p_ResponseText varchar(250),OUT p_ResponseStatus INT)
while_proc:BEGIN

-- khai b??o m?? l???i

    DECLARE v_success INT DEFAULT 1;							     -- Success
		DECLARE v_exception INT DEFAULT -99;							 -- SQL Exception 
		DECLARE v_not_enough_monney INT DEFAULT -80;			 -- Kh??ng ????? ti???n
		DECLARE v_account_not_exists INT DEFAULT -81;			 -- T??i kho???n kh??ng t???n t???i
		DECLARE v_item_not_exists INT DEFAULT -82;			   -- Item kh??ng t???n t???i
		DECLARE v_item_already_bought INT DEFAULT -83;		 -- Item ???? mua 
		DECLARE v_brrow_day_invalid INT DEFAULT -85;			 -- S??? ng??y thu?? kh??ng h???p l???
		
		
		-- Khai b??o bi???n
		DECLARE v_sodu INT;																					-- s??? d?? kh??? d???ng
		DECLARE v_sale INT;																					-- gi???m gi?? khi thu?? th???i gian l??u
		DECLARE v_sotienthue INT;																		-- So tien neu thue
		DECLARE v_procedurename varchar(25) default "BuyItem";
		DECLARE v_log varchar(25) default null;


DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN
		SET p_ResponseStatus = v_exception;
		 GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
		SET p_ResponseText = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
		ROLLBACK;
		SET v_log =  WritelogErr(@errno,p_ResponseText,"BuyItem");
END;
	 -- Check account info
		IF NOT EXISTS (SELECT 1 FROM tblaccount WHERE id = p_accountId AND IsActive = 1) THEN
					SET p_ResponseText = "T??i kho???ng kh??ng t???n t???i";
					SET p_ResponseStatus = v_account_not_exists;
					leave while_proc;
		END IF;
	
	  -- check input so ngay
		  IF(p_Days Not in (0,3,7,15,30,60)) then
					SET p_ResponseText = "S??? ng??y thu?? kh??ng h???p l??? !";
					SET p_ResponseStatus = v_brrow_day_invalid;
					leave while_proc;
		 end if;
		 
		 -- check item c?? t???n t???i kh??ng
		 if NOT EXISTS (SELECT 1 from tblitem as t where t.id = p_ItemId and t.isvalid =1)
		  then 
				SET p_ResponseText = "item kh??ng t???n t???i !";
				SET p_ResponseStatus =v_item_not_exists;
				leave while_proc;
		 end if;
		 
		 -- item ???? mua hay ch??a
		 if EXISTS ( SELECT 1 from inventory t 
			where t.iditem = p_ItemId 
			and t.idaccount = p_accountId 
			and (t.expired  is null or  t.expired > now())) THEN
			
				SET p_ResponseText = "Item ???? c?? trong t??i ?????!";
				SET p_ResponseStatus = v_item_already_bought;
				leave while_proc;
				
		 END IF;
		  -- L???y s??? d?? kh??? d???ng trong t??i kho???n
			SELECT a.Gold into v_sodu FROM tblaccount as a WHERE a.id = p_accountId;
			
			-- check c?? ????? ti???n chi tr??? ko (mua)
			IF p_Days = 0 AND v_sodu < (Select t.gold from tblitem t where t.id= p_ItemId) THEN 
				SET p_ResponseText = "B???n kh??ng ????? ti???n mua v???t ph???m n??y";
				SET p_ResponseStatus = v_not_enough_monney;
				leave while_proc;
			END IF;
			
			-- check c?? ????? ti???n chi tr??? ko (thu??)
			IF p_Days != 0  THEN 
				-- L???y gi???m gi??
				Select t.saleoff into v_sale from tblsale t where t.days = p_Days and t.type= "gold";
				
				-- Tinh s??? ti???n thu?? sau sale 
				Select ((t.brrgold *( 100 - v_sale) / 100 )*p_Days) into v_sotienthue from tblitem t where t.id= p_ItemId ;
				IF( v_sodu < v_sotienthue   ) THEN 
						SET p_ResponseText = "B???n kh??ng ????? ti???n thu?? v???t ph???m n??y";
						SET p_ResponseStatus = v_not_enough_monney;
						leave while_proc;
				END IF;
				
			END IF;
			
		 start transaction;
			-- buy
		if p_Days = 0 then
		 
								-- tru tien 
                update tblaccount a
                set a.Gold =  a.Gold  - (Select t.gold from tblitem t where t.id= p_ItemId)
                where a.id= p_accountId;
								
--      SET v_log= LogTransaction (v_procedurename,p_accountId,CONCAT("T??i kho???n id = ",convert(p_accountId,char)," ???? b??? tr??? ", convert(v_sotienthue,char)," Gold"	),null,null,p_ItemId,null);
							
               
				-- cho vao inventory 
				if EXISTS ( SELECT 1 from inventory t where t.iditem = p_ItemId and t.idaccount = p_accountId ) then 
							update inventory t
							set t.expired = null
							where t.iditem = p_ItemId
							and  t.idaccount = p_accountId ;
							
				else 
						insert into inventory(idaccount,iditem,time,status)
              values(p_accountId,p_ItemId,now(),0);
				end if;
				
		END IF;
	
		-- borrow
		if p_Days != 0 then
			
			
              update tblaccount a
              set a.Gold = a.Gold  - v_sotienthue
              where a.id= p_accountId;
-- 							
-- 							 SET v_log= LogTransaction(v_procedurename,p_accountId,concat("T??i kho???n id = ",convert(p_accountId,char)," ???? b??? tr??? ", convert(v_sotienthue,char)," Gold"),null,null,p_ItemId,null);
--               
             
						
			
				
				if EXISTS ( SELECT 1 from inventory t where t.iditem = p_ItemId and t.idaccount = p_accountId ) then 
								update inventory
							 set expired = adddate(now(),p_Days)
							 where t.iditem = p_ItemId
							 and  t.idaccount = p_accountId; 
				else 
						insert into inventory(idaccount,iditem,time,status,expired)
                values(p_accountId,p_ItemId,now(),0,adddate(now(),p_Days));
				end if;
	
     end if;
	
		COMMIT;
    SET p_ResponseText ="Mua Item th??nh c??ng";
		SET p_ResponseStatus = v_success;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ChangeDescriptionGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `ChangeDescriptionGuild`;
delimiter ;;
CREATE PROCEDURE `ChangeDescriptionGuild`(in p_accountId INT ,in p_description varchar(250), out p_code int , out p_message varchar(250))
while_proc: BEGIN
	#Routine body goes here...
	DECLARE v_log,v_roll_accId varchar(50);
	DECLARE v_guildId int;
	DECLARE exit HANDLER for SQLEXCEPTION 
	begin 
			SET p_code  = -999;
			GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
			SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
			ROLLBACK;
			SET v_log =  WritelogErr(@errno,p_message,"ChangeDescriptionGuild");
	end ;
	
	IF NOT EXISTS (Select 1 from tblaccount where id = p_accountId) then 
					SET p_code = -1;
					SET p_message = "T??i kho???n kh??ng t???n t???i";
					Leave while_proc ;
		end if;
	IF p_description is null then
			SET p_code = -1;
			SET p_message = "M?? t??? kh??ng ???????c ????? tr???ng";
			Leave while_proc ;
	end if;
	
	If NOT exists (select 1 from tblguildaccount where idaccount = p_accountId and `Status` = 1) then 
			SET p_message = "T??i kho???n ch??a gia nh???p c??ng h???i n??o";
			SET p_code  = -1;
			LEAVE while_proc;
	end IF;

	#Routine body goes here...
	Select idguild,idRoll into v_guildId,v_roll_accId from tblguildaccount where idaccount = p_accountId and `Status` = 1;
	

	if v_roll_accId not in (1,2) then
			SET p_code = -1;
			SET p_message = "T??i kho???n kh??ng ????? quy???n h???n";
			LEAVE while_proc ;
	end if;
	
	Start transaction;
	Update tblguild 
	SET  Description  = p_description
	WHERE id = v_guildId;
	
	commit ;
	SET p_code = 0;
	SET p_message = "Thay ?????i th??ng b??o th??nh c??ng ";
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ChangeNameGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `ChangeNameGuild`;
delimiter ;;
CREATE PROCEDURE `ChangeNameGuild`(in p_accountId int, in p_nameguild varchar(55) , out p_code int, out p_message varchar(155))
while_proc : BEGIN
		DECLARE v_guildId, v_roll_accId ,v_changeName_cost int;
	DECLARE v_log  varchar(55);
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
						SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						ROLLBACK;
						SET v_log =  WritelogErr(@errno,p_message,"ChangeNameGuild");
			end;
			
			if Not exists (Select 1 from tblguildaccount where idaccount = p_accountId and `Status` = 1) then 
					SET p_code = -1;
					SET p_message = "T??i kho???n hi???n kh??ng c?? trong c??ng h???i";
					LEAVE while_proc;
			end if;
			
			IF p_nameguild is null then 
					SET p_code = -1;
					SET p_message = "T??n c??ng h???i kh??ng ???????c ????? tr???ng";
					LEAVE while_proc;
			end if;
			
			Select idguild, idRoll into v_guildId,v_roll_accId from tblguildaccount where idaccount = p_accountId and `Status` = 1;
			
			if v_roll_accId != 1 then 
				SET p_code = -1;
				SET p_message = "T??i kho???n kh??ng ????? quy???n h???n";
				LEAVE while_proc;
			end if;	
			
			
			Select Gold into v_changeName_cost 
			from tblguildservice 
			where NameService = "ChangeNameGuild";
			
			If(Select Gold from tblaccount where id = p_accountId ) < v_changeName_cost then
					SET p_message= "T??i kho???n kh??ng ????? s??? gold";
					SET p_code  =-1;	
		
					LEAVE while_proc;	
			end if;
			
			
			IF(LENGTH(TRIM(p_nameguild)) <  6 ) then
					SET p_message= "T??n nh??m t???i thi???u c?? 6 k?? t???";
					SET p_code  =-1;	
					
					LEAVE while_proc;	
			end if;
			
			IF(LENGTH(TRIM(p_nameguild))>16  ) then
					SET p_message= "T??n nh??m t??? 6 ?????n 16 k?? t???";
					SET p_code  =-1;	
					
					LEAVE while_proc;	
			end if;
			
			If EXISTS (Select 1 from tblguild where GuildName = TRIM(p_nameguild)) then 
					SET p_message= "T??n C??ng h???i ???? t???n t???i";
					SET p_code  =-1;	
					
					LEAVE while_proc;	
			end if;
			
			Start TRANSACTION;
						 
						Update tblaccount a
						SET a.Gold = a.Gold - v_changeName_cost
						WHERE a.id =p_accountId;
						
						SET v_log = WriteLogGuild(v_guildId, p_accountId, "ChangeNameGuild", "Tr??? Gold ?????i t??n c??ng h???i th??nh c??ng");
						
			
						update tblguild g
						SET g.GuildName = TRIM(p_nameguild)
						where g.id = v_guildId;
			commit;
			SET p_code = 0;
			SET p_message = "?????i t??n c??ng h???i th??nh c??ng";
			
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ChangeNoficationGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `ChangeNoficationGuild`;
delimiter ;;
CREATE PROCEDURE `ChangeNoficationGuild`(in p_accountId INT ,in p_nofi varchar(250), out p_code int , out p_message varchar(250))
while_proc: BEGIN

	DECLARE v_log varchar(50);
	DECLARE v_guildId ,v_roll_accId int;
	DECLARE exit HANDLER for SQLEXCEPTION 
	begin 
			SET p_code  = -999;
			GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
			SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
			ROLLBACK;
			SET v_log =  WritelogErr(@errno,p_message,"ChangeNoficationGuild");
	end ;
		
	If NOT exists (select 1 from tblguildaccount where idaccount = p_accountId  and `Status` = 1) then 
			SET p_message = "T??i kho???n kh??ng c?? c??ng h???i";
			SET p_code  = -1;
		
			LEAVE while_proc;
	end IF;
	
	Select idguild,idRoll into v_guildId,v_roll_accId from tblguildaccount where idaccount = p_accountId and `Status` = 1;
	

	if v_roll_accId not in (1,2) then
			SET p_code = -1;
			SET p_message = "T??i kho???n kh??ng ????? quy???n h???n";
			LEAVE while_proc ;
	end if;
	
	Start transaction;
	Update tblguild 
	SET  Nofication  = p_nofi
	WHERE id = v_guildId;
	
	commit ;
	SET p_code = 0;
	SET p_message = "Thay ?????i th??ng b??o th??nh c??ng ";
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for checklogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `checklogin`;
delimiter ;;
CREATE PROCEDURE `checklogin`(IN username varchar(35) , IN passwd varchar(35), out _result VARCHAR(50))
BEGIN
declare v_active,v_id int;
declare message varchar(50);

DECLARE exit HANDLER FOR SQLEXCEPTION 
begin
SET _result = "Error : SQLEXCEPTION";
end;
	Select  t.IsActive into v_active from tblaccount t where  t.Username = username and t.Passwd =  passwd ;
    if  v_active = 0 then
			set  message = 'Error : T??i kho???n hi???n ??ang b??? kh??a !!!';
		elseif v_active = 1 then
			select a.id into v_id from tblaccount  a where  a.Username = username and a.Passwd =  passwd ;
			set  message = convert(v_id,char);  
    else   
			set message ='Error : T??i kho???n ho???c m???t kh???u kh??ng ????ng !!!';
    end if;
		SET _result = message;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ConvertCoin
-- ----------------------------
DROP PROCEDURE IF EXISTS `ConvertCoin`;
delimiter ;;
CREATE PROCEDURE `ConvertCoin`(IN p_accountId int, IN p_number_coin int,OUT p_ResponseText varchar(250),OUT p_ResponseStatus INT)
while_pro : BEGIN
	
	-- error code
	DECLARE v_success INT DEFAULT 1;							     -- Success
	DECLARE v_exception INT DEFAULT -99;							 -- SQL Exception 
	DECLARE v_number_coin_invalid INT DEFAULT -10;     -- L???i do s??? coin kh??ng h???p l???
	DECLARE v_number_coin_not_enough INT DEFAULT -11;  -- L???i do s??? coin kh??ng ?????
	DECLARE v_account_not_exists INT DEFAULT -20;			 -- T??i kho???n kh??ng t???n t???i
	
	
 -- khai b??o bi???n
	DECLARE v_total_coin_convert INT;														-- S??? coin ???? convert sang gold tr?????c ????
	DECLARE v_coin_acc INT;                                     -- S??? coin trong t??i kho???n 
	DECLARE v_convert_value INT  ;															-- Gi?? tr??? quy ?????i
	DECLARE v_procedurename VARCHAR(25) DEFAULT 'ConvertCoin';		
	DECLARE v_log  VARCHAR(150) ;
	
	
	DECLARE exit HANDLER FOR SQLEXCEPTION 
	begin
			SET p_ResponseStatus  = v_exception ;
		  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
			SET p_ResponseText = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
			ROLLBACK;
			SET v_log =  WritelogErr(@errno,p_message,"ConvertCoin");
	end;
	
	-- Ki???m tra th??ng tin t??i kho???n
	IF NOT EXISTS (SELECT 1 FROM tblaccount WHERE id = p_accountId AND IsActive = 1 ) THEN 
			SET p_ResponseText = "T??i kho???n kh??ng t???n t???i";
			SET p_ResponseStatus =  v_account_not_exists;
			leave while_pro;
	END IF;
	
	-- Ki???m tra s??? coin c?? h???p l??? kh??ng
	If(p_number_coin <= 0) then 
			SET p_ResponseText = "S??? Coin kh??ng h???p l??? !";
			SET p_ResponseStatus = v_number_coin_invalid;
			leave while_pro;
	end if;		
	
	-- L???y s??? coin d?? trong t??i kho???n			
	SELECT coin into v_coin_acc FROM tblaccount WHERE id = p_accountId ;
		
	-- Ki???m tra xem c?? ????? coin ????? ?????i sang gold kh??ng
	IF v_coin_acc < p_number_coin THEN
			SET p_ResponseText = "S??? Coin kh??ng ????? !";
			SET p_ResponseStatus = v_number_coin_not_enough;
			leave while_pro;
	END IF;
	
	-- L???y gi?? tr??? quy ?????i			
	Select c.`Value` INTO v_convert_value FROM tblconvertvalue c WHERE c.donvi = "coin" AND  c.ConvertTo =  "gold" ;
	-- L???y t???ng s?? coin ???? chuy???n ?????i tr?????c ????
	Select a.TotalCoinConvert into v_total_coin_convert from tblaccount a where a.id= p_accountId;
	
	
			START TRANSACTION;
        
				-- tr??? coin trong t??i kho???n , update gold, s??? coin convert, vip level					
					
				update tblaccount  a
				SET a.Gold = a.Gold + (p_number_coin * v_convert_value) ,
						a.coin = a.coin - p_number_coin,
						a.TotalCoinConvert = a.TotalCoinConvert + p_number_coin,
					a.VipLevel = ((Select c.LvVip from coinlevel c where c.SumCoin > (v_total_coin_convert+p_number_coin) LiMIT 1)-1) 
				where a.id = p_accountId;
	
				-- log transaction
				SET v_log= LogTransaction(v_procedurename,p_accountId,CONCAT("T??i kho???n id= ",convert(p_accountId,char)," ?????i ",convert(p_number_coin,char)," coin sang ",convert((p_number_coin * v_convert_value),char)," gold  !! "),null,p_number_coin,null,null);
				
			COMMIT;
			
			SET p_ResponseText = "?????i coin sang Gold th??nh c??ng";
			SET p_ResponseStatus = v_success;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for CreateGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `CreateGuild`;
delimiter ;;
CREATE PROCEDURE `CreateGuild`(IN p_accountId int,IN p_name_guild varchar(25), IN p_description varchar(125),out p_code int,out p_message VARCHAR(255))
while_pro:BEGIN
	DECLARE v_idconghoi,v_cost_createGuild,v_madinhdanh int;
	DECLARE v_log  varchar(55);
	-- DECLARE msg VARCHAR(255);
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
					
						SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						ROLLBACK;
						SET v_log =  WritelogErr(@errno,p_message,"CreateGuild");
			end;
			
			If NOT EXISTS (Select 1 from tblaccount where id = p_accountId and IsActive = 1) then 
					SET p_message= "T??i kho???n kh??ng t???n t???i";
					SET p_code  =-1;	
					LEAVE while_pro;	
			end if;
			
			
			If EXISTS (Select 1 from tblguildaccount where idaccount = p_accountId and `Status` = 1) then 
					SET p_message= "T??i kho???n ???? c?? c??ng h???i";
					SET p_code  =-1;	
					LEAVE while_pro;	
			end if;
			
			
			Select Gold into v_cost_createGuild 
			from tblguildservice 
			where NameService = "CreateGuild";
			
			If(Select Gold from tblaccount where id = p_accountId ) < v_cost_createGuild then
					SET p_message= "T??i kho???n kh??ng ????? s??? gold";
					SET p_code  =-1;	
					LEAVE while_pro;	
			end if;
			-- validate Name
			
			
			IF(LENGTH(TRIM(p_name_guild)) <  6 ) then
					SET p_message= "T??n nh??m t???i thi???u c?? 6 k?? t???";
					SET p_code  =-1;	
					LEAVE while_pro;	
			end if;
			
			IF(LENGTH(TRIM(p_name_guild))>16  ) then
					SET p_message= "T??n nh??m t??? 6 ?????n 16 k?? t???";
					SET p_code  =-1;	
					LEAVE while_pro;	
			end if;
			
			If EXISTS (Select 1 from tblguild where GuildName = TRIM(p_name_guild)) then 
					SET p_message= "T??n C??ng h???i ???? t???n t???i";
					SET p_code  =-1;	
					
					LEAVE while_pro;	
			end if;
			
			
			select a.num into v_madinhdanh from (Select CONVERT((RAND()* (999999 -100000 +1) + 100000 ),SIGNED)as num )  a 
			where a.num not in (Select g.IdenCode from tblguild g );


			Start TRANSACTION;
			
			update tblaccount a
			SET a.Gold = a.Gold - v_cost_createGuild where id = p_accountId;
			
			SET v_log =  WriteLogGuild(v_idconghoi,p_accountId,"CreateGuild","Thanh to??n ti???n t???o C??ng h???i th??nh c??ng");	
			
			
			Insert into tblguild(IdenCode,GuildName,CreateTime,Description) 
			values(v_madinhdanh,TRIM(p_name_guild),sysdate(),p_description);
				
			
			SELECT Distinct LAST_INSERT_ID() from tblguild into v_idconghoi ; 
			
				
			
			
			Insert into tblguildaccount
			(
			idaccount,
			idguild,
			`Status`,
			IdRoll,
			Point,
			TimeAdd
			)
			values
			(
			p_accountId,
			v_idconghoi,
			1,
			1,
			0,
			sysdate()
			);
			
			if exists (select 1 from tblguildaccount where idaccount = p_accountId and `Status`in (0,2) ) then 
						DELETE  from tblguildaccount where  idaccount = p_accountId and `Status`in (0,2);
			end if;
			
			
			commit;
				
			SET p_message= "T???o c??ng h???i th??nh c??ng";
			SET p_code = 0 ;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ExpandTableGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `ExpandTableGuild`;
delimiter ;;
CREATE PROCEDURE `ExpandTableGuild`(in p_accountId int , out p_code int, out p_message varchar(250))
while_proc : BEGIN
	#Routine body goes here...
	DECLARE v_log,v_roll_accId varchar(50);
	DECLARE v_guildId ,v_expand_cost ,v_expand_numbers int;
	DECLARE exit handler for SQLEXCEPTION 
	begin
			SET p_code  = -999;
			GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
			SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
			ROLLBACK;
			SET v_log =  WritelogErr(@errno,p_message,"ExpandTableGuild");
	end ;
	
	IF NOT EXISTS (Select 1 from tblguildaccount where idaccount = p_accountId and `Status` = 1) then 
			SET p_code =-1;
			SET p_message  = "T??i kho???n kh??ng c?? c??ng h???i";
			LEAVE while_proc ;
	end if;
	
	Select  a.idRoll ,a.idguild into v_roll_accId,v_guildId from tblguildaccount a 
	where 
	 a.idaccount = p_accountId 
	and  a.`Status` = 1	;
	
	if v_roll_accId not in (1,2)then
	
			SET p_code =-1;
			SET p_message  = "Kh??ng ????? quy???n h???n";
			
			LEAVE while_proc ;
	end if;
	
	Select Gold,Number into v_expand_cost,v_expand_numbers from tblguildservice where NameService= "ExpendMaxTable"; 
	
	
	
	IF (Select Gold  from tblaccount where id = p_accountId) < v_expand_cost then
			SET p_code =-1;
			SET p_message  = "S??? d?? trong t??i kho???n kh??ng ?????";	
			
			LEAVE while_proc ;
	end if;
	
	If(Select g.NumTables from tblguild g where g.id = v_guildId) >= 30 then
			SET p_code =-1;
			SET p_message  = "???? n??ng c???p t???i ??a gi???i h???n b??n trong h???i";	
			
			LEAVE while_proc ;
	end if;

	
	Start TRANSACTION ;
					Update tblaccount
					SET Gold = Gold - v_expand_cost
					WHERE id = p_accountId;
	
					update tblguild g
					SET g.NumTables = g.NumTables + v_expand_numbers
					WHERE  g.id = v_guildId;
	commit;
	
	
		SET p_code = 0;
		SET p_message  = "N??ng c???p s??? b??n th??nh c??ng";	
		
		LEAVE while_proc ;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ExpendMaxMember
-- ----------------------------
DROP PROCEDURE IF EXISTS `ExpendMaxMember`;
delimiter ;;
CREATE PROCEDURE `ExpendMaxMember`(in p_accountId int, out p_code int, out p_message varchar(250))
while_proc : BEGIN
	#Routine body goes here...
	DECLARE v_log,v_roll_accId varchar(50);
	DECLARE v_guildId ,v_cost_expand,v_expend_number int;
	DECLARE exit handler for SQLEXCEPTION 
	begin
			SET p_code  = -999;
			GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
			SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
			ROLLBACK;
			SET v_log =  WritelogErr(@errno,p_message,"ExpendMaxMember");
	end ;
	
	IF NOT EXISTS (Select 1 from tblguildaccount where idaccount = p_accountId and `Status` = 1) then 
			SET p_code =-1;
			SET p_message  = "T??i kho???n kh??ng c?? c??ng h???i";
			LEAVE while_proc ;
	end if;
	
	Select  a.idRoll ,a.idguild into v_roll_accId,v_guildId from tblguildaccount a 
	where 
	 a.idaccount = p_accountId 
	and  a.`Status` = 1	;
	
	if v_roll_accId not in (1,2)then
	
			SET p_code =-1;
			SET p_message  = "Kh??ng ????? quy???n h???n";
			LEAVE while_proc ;
	end if;
	
	Select Gold,Number into v_cost_expand,v_expend_number from tblguildservice where NameService= "ExpandMaxMembers"; 
	
	
	
	IF (Select Gold  from tblaccount where id = p_accountId) < v_cost_expand then
			SET p_code =-1;
			SET p_message  = "S??? d?? trong t??i kho???n kh??ng ?????";	
			LEAVE while_proc ;
	end if;
	
	
	if( Select g.MaxMembers  from tblguild g where g.id = v_guildId) >= 100 then
			SET p_code =-1;
			SET p_message  = "???? n??ng c???p t???i ??a gi???i h???n s??? th??nh vi??n";	
			LEAVE while_proc ;
	end if;
	
	
	Start TRANSACTION ;
	
					Update tblaccount
					SET Gold = Gold - v_cost_expand
					WHERE id = p_accountId;
					-- log 
					set v_log = WriteLogGuild(v_guildId, p_accountId, "ExpendMaxMember", "Tr??? ti???n th??nh c??ng");
					
					update tblguild g
					SET g.MaxMembers = g.MaxMembers + v_expend_number
					WHERE  g.id = v_guildId;
	commit;
	
	
		SET p_code = 0;
		SET p_message  = "N??ng c???p t???i ??a th??nh vi??n th??nh c??ng";	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getinventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `getinventory`;
delimiter ;;
CREATE PROCEDURE `getinventory`(IN p_accountId INT)
while_proc:BEGIN
    
		Select  i.id, i.iditem,i.status,t.name,t.description ,i.expired
    from inventory as i, tblitem as t 
		where i.idaccount = p_accountId  
		and i.iditem = t.id 
		and t.isvalid =1 
		and (i.expired > now() or i.expired is null);
    
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetListGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetListGuild`;
delimiter ;;
CREATE PROCEDURE `GetListGuild`(out p_code int , out p_message varchar(125))
while_proc:BEGIN
	DECLARE v_guildId int;
	DECLARE v_roll ,v_log varchar(75);
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
						SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						SET v_log =  WritelogErr(@errno,v_message,"GetListGuild");
			end;
	
			Select g.id, g.IdenCode ,g.GuildName,g.Description,(Select count(*) from tblguildaccount where idguild = g.id and `Status`= 1 ) as CurMembers,g.MaxMembers,(				Select sum(t.Point)+ sum(a.Point) from tblguildaccount t,tblaccount a where t.idguild = g.id and t.`Status` = 1 and a.id = t.idaccount) as Totalpoint
					from tblguild g order by TotalPoint desc limit 50 ;
			
			SET p_code = 0;
			SET p_message = "Th??nh c??ng";
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetListInvite
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetListInvite`;
delimiter ;;
CREATE PROCEDURE `GetListInvite`(in p_idacc int,out p_code int, out p_message varchar(255))
while_proc : BEGIN
	#Routine body goes here...
	DECLARE v_idconghoi int;
	DECLARE v_log varchar(55);
	
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
						SET p_code  = -999;
						SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					 
						SET v_log =  WritelogErr(@errno,p_message,"GetListInvite");
			end;
			
			if not exists (Select 1 from tblaccount where id = p_idacc and IsActive = 1 ) then 
						SET p_code = -1 ;
						SET p_message =  "T??i kho???n kh??ng t???n t???i";
						
						leave while_proc ;
			end if;
			
			if  exists( select 1 from tblguildaccount where idaccount = p_idacc and `Status` = 1 ) then 
						SET p_code = -1 ;
						SET p_message =  "T??i kho???n ???? gia nh???p c??ng h???i";
						
						leave while_proc ;
			end if;
			
	
			Select g.idguild, a.GuildName, a.Description,(Select sum(x.Point)+ sum(y.Point) from tblguildaccount x ,tblaccount y  where x.idguild = a.id and x.`Status` = 1 and y.id = x.idaccount) as TotalPoint,g.TimeAdd  
			from tblguildaccount g, tblguild a  where  g.`Status` = 2 and g.idaccount = p_idacc and a.id = g.idguild order by g.TimeAdd desc;
			
			SET p_code= 0;
			SET p_message= "Th??nh c??ng";
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetListRegister
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetListRegister`;
delimiter ;;
CREATE PROCEDURE `GetListRegister`(IN p_accountId int ,OUT p_code int,OUT p_message varchar(55))
while_proc: BEGIN
	#Routine body goes here...
	DECLARE v_guildId,v_roll_accId int;
	DECLARE v_log varchar(75);
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
						SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						SET v_log =  WritelogErr(@errno,v_message,"GetListRegister");
					
			end;
		
	if NOT EXISTS (Select 1 from tblguildaccount where idaccount = p_accountId and `Status` = 1 ) then
			SET p_code= -1;
			SET p_message = "T??i kho???n kh??ng thu???c c??ng h???i n??o";
			LEAVE while_proc ;
	end if;
	
	Select idguild,idRoll into v_guildId,v_roll_accId from tblguildaccount where idaccount = p_accountId and `Status` = 1; 
	
	
	
	if v_roll_accId not in (1,2) then
			SET p_code= -1;
			SET p_message = "T??i kho???n kh??ng ????? quy???n h???n";
			LEAVE while_proc ;
	end if;

	
	Select  g.idaccount,g.TimeAdd,a.`Name`,a.Point 
	from tblguildaccount g, tblaccount a  where g.idguild = v_guildId and g.`Status` = 0 and g.idaccount = a.id  ;
	
	SET p_code = 0;
	SET p_message = "Th??nh c??ng";

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetMembersGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetMembersGuild`;
delimiter ;;
CREATE PROCEDURE `GetMembersGuild`(in p_accountId INT ,out p_code int , out p_message varchar(125))
while_proc : BEGIN
	DECLARE v_log varchar (25);
	DECLARE v_guildId int;
	
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
					SET p_code  = -999;
					 GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						SET v_log =  WritelogErr(@errno,v_message,"GetMembersGuild");
					
			end;
		IF NOT EXISTS (Select 1 from	 tblaccount where id = p_accountId and IsActive = 1 ) then 
				SET p_code  = -1;
				SET p_message = "T??i kho???n kh??ng t???n t???i";
					leave while_proc;
		end if;	
			
		IF NOT EXISTS (Select 1 from tblguildaccount where idaccount = p_accountId  and `Status` = 1  ) then 
				SET p_code  = -1;
				SET p_message = "T??i kho???n ch??a gia nh???p guild n??o";
				leave while_proc;
		end if;
			
		Select 	idguild into v_guildId from tblguildaccount where idaccount = p_accountId and `Status` = 1 ;
			
			
	Select  a.idaccount,(Select t.`Name` from tblaccount t where t.id = a.idaccount) as `name`,r.Rollname,((Select Point from tblaccount where id = a.idaccount and IsActive = 1 )+ a.Point) as `Points` 
					from tblrollguild r , tblguildaccount a  
					where a.idguild = v_guildId 
					and r.id = a.idRoll and a.`Status` =1 order by r.id ;
					
					
			SET p_code = 0;
			SET p_message = "Th??nh c??ng";
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getshop
-- ----------------------------
DROP PROCEDURE IF EXISTS `getshop`;
delimiter ;;
CREATE PROCEDURE `getshop`()
BEGIN
		
		 SELECT t.id,  t.name,t.description,t.gold,t.brrgold,
		(Select n.name from tbltype n where n.id= t.idtype ) as type,t.isbought,t.Isborrowed from tblitem as t where  t.isvalid =1;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetUserInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetUserInfo`;
delimiter ;;
CREATE PROCEDURE `GetUserInfo`(IN p_accountId int)
BEGIN
	Select a.id,a.`Name`,a.Dob,a.Sex,a.Gold,a.`Level`,a.Exp,a.CurRank,a.VipLevel,a.GiftVip,a.Win,a.Lose,a.Draw 
	from tblaccount a  
	where  a.id = p_accountId and a.IsActive =1 ; 
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetVipBonus
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetVipBonus`;
delimiter ;;
CREATE PROCEDURE `GetVipBonus`(IN p_accountId int,OUT p_ResponseStatus INT,OUT p_ResponseText varchar(250),OUT p_Goldvip INT)
while_pro: BEGIN

	 -- khai b??o m?? l???i 
    DECLARE v_success INT DEFAULT 1;							     -- Success
		DECLARE v_exception INT DEFAULT -99;							 -- SQL Exception 
		DECLARE v_account_vip_0 INT DEFAULT -90;					 -- Vip 0 kh??ng c?? qu??
		DECLARE v_account_vip_max INT DEFAULT -91;				 -- ???? nh???n max qu?? vip
		DECLARE v_account_not_exists INT DEFAULT -97;			-- Account kh??ng t???n t???i
	
	
		-- khai b??o bi???n
		DECLARE v_gold,v_iditem,v_LvVipBonus int;
		DECLARE v_name VARCHAR(25);
		
		
		-- Ki???m tra t??i kho???n c?? t???n t???i kh??ng
		IF NOT EXISTS (SELECT 1 FROM tblaccount WHERE id = p_accountId and IsActive = 1 ) THEN
				SET p_ResponseText = "T??i kho???n kh??ng t???n t???i";	
				SET p_ResponseStatus = v_account_not_exists;
				Leave while_pro;
		END IF;
			
		-- C???p vip =0
		if(Select VipLevel from tblaccount where id= p_accountId) = 0 then
				
				SET p_ResponseStatus = v_account_vip_0;
				SET p_ResponseText = "Vip 0 kh??ng c?? qu?? vip";
				Leave while_pro;
		end if;
		
		Select GiftVip into v_LvVipBonus from tblaccount where id= p_accountId;
		-- Nh???n h???t qu?? vip
		if v_LvVipBonus = (Select VipLevel from tblaccount where id= p_accountId) then 
				
				SET p_ResponseStatus = v_account_vip_0;
				SET p_ResponseText = "???? nh???n h???t qu?? vip";
				Leave while_pro;
		end if;
		
		-- L???y gold ???????c t???ng vip
		Select Gold into v_gold from coinlevel where LvVip = v_LvVipBonus +1 ;
		SET p_Goldvip = v_gold;
		
		Select t.id ,t.name,t.description from  tblitem as t where t.vipbonus = v_LvVipBonus+1 ;
		
		
			SET p_ResponseStatus = v_success;
			SET p_ResponseText = "L???y th??ng tin qu?? vip th??nh c??ng";
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for HandleInviteGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `HandleInviteGuild`;
delimiter ;;
CREATE PROCEDURE `HandleInviteGuild`(in p_accountId int, in p_guildId int,in p_status int, out p_code int, out  p_message varchar (250))
while_proc: BEGIN
	#Routine body goes here...
	DECLARE v_Max_Members int;
	DECLARE v_log  varchar(55);
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
						SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						ROLLBACK;
						SET v_log =  WritelogErr(@errno,p_message,"HandleInviteGuild");
			end;
			If not exists (Select 1 from tblaccount where id = p_accountId and isActive = 1 ) then
					SET p_code  = -1;
					SET p_message = "T??i kho???n kh??ng t???n t???i";
					LEAVE while_proc;
			end if;	
			
			IF exists( Select 1 from tblguildaccount where idaccount = p_accountId and `Status` = 1 ) then
					SET p_code  = -1;
					SET p_message = "T??i kho???n ???? gia nh???p c??ng h???i";
					LEAVE while_proc;
			end if;
			
			if not exists (select 1 from tblguild where id = p_guildId ) then 
					SET p_code  = -1;
					SET p_message = "C??ng h???i kh??ng t???n t???i";
					LEAVE while_proc;	
			end if;
			if not exists (Select 1 from tblguildaccount where idguild =	p_guildId and idaccount = p_accountId and `Status` = 2 ) then 
					SET p_code  = -1;
					SET p_message = "L???i m???i kh??ng t???n t???i";
					LEAVE while_proc;	
			end if;
			
			Select g.MaxMembers into v_Max_Members from tblguild g where id = p_guildId;
			If p_status not in(-1, 1) then
					SET p_code  = -1;
					SET p_message = "Tr???ng th??i kh??ng h???p l???";
					LEAVE while_proc;
			end if;
			
			
			if (Select count(*)from tblguildaccount where idguild = p_guildId and `Status`  = 1 ) >= v_Max_Members  and p_status = 1 then 
							SET p_code  = -1;
							SET p_message = "C??ng h???i ???? ?????t s??? th??nh vi??n t???i ??a";
							LEAVE while_proc;
					end if;
					
					
			start TRANSACTION;
			if p_status = 1 then
					
					
					Update tblguildaccount g
						SET g.`Status` = 1,
							g.idRoll= 3,
							g.TimeModify =sysdate()
						WHERE g.idaccount =  p_accountId
						and g.idguild   =  p_guildId	
						and g.`Status` = 2 ;
						
						
						if exists (Select 1 from tblguildaccount where idaccount = p_accountId and `Status` in (0,2)) then
								Delete from tblguildaccount g
								where g.idaccount = p_accountId 
								and g.`Status` in (0,2);
						end if;
						
						SET p_message = "Gia nh???p c??ng h???i th??nh c??ng";
			else  
					
					Delete from tblguildaccount g
						where g.idaccount = p_accountId 
						and g.idguild = p_guildId
						and g.`Status` = 2;
					
					SET p_message = "T??? ch???i gia nh???p c??ng h???i";
					
			end if;
			
			commit;
			
			SET p_code =0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InviteGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `InviteGuild`;
delimiter ;;
CREATE PROCEDURE `InviteGuild`(in p_accountId INT,in p_accId_IsInvited INT ,out p_code int , out p_message varchar(250))
while_proc : BEGIN
	#Routine body goes here...
	DECLARE v_idconghoi ,v_Max_Members int;
	DECLARE v_log,v_roll_accid varchar(55);
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
					SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						ROLLBACK;
						SET v_log =  WritelogErr(@errno,p_message,"InviteGuild");
			end;
		
		IF NOT EXISTS (Select 1 from tblaccount where id = p_accountId and isActive = 1) then 
					SET p_code = -1;
					SET p_message = "T??i kho???n kh??ng t???n t???i";
					LEAVE while_proc ;
		end if;
			
	
			
		IF NOT EXISTS (select 1 from tblguildaccount where idaccount = p_accountId and `Status` = 1) then
					SET p_code = -1;
					SET p_message = "T??i kho???n ch??a gia nh???p guild";
					LEAVE while_proc ;
		end if;
		
		
		Select  a.idRoll, a.idguild into v_roll_accid ,v_idconghoi
		from tblguildaccount a 
		where a.idaccount = p_accountId
		and a.`Status` =1
		;
		Select g.MaxMembers into v_Max_Members from tblguild g where g.id = v_idconghoi;
		
		if v_roll_accid not in (1,2) then
					SET p_code = -1;
					SET p_message = "T??i kho???n kh??ng ????? quy???n h???n ";
					LEAVE while_proc ;
			end if;	
		
		IF (Select count(*) from tblguildaccount where idguild = v_idconghoi and `Status`= 1) >= v_Max_Members then 
					SET p_code = -1;
					SET p_message = "C??ng h???i ???? c?? t???i ??a th??nh vi??n";
					LEAVE while_proc ;
		end if;
		
		IF NOT EXISTS (Select 1 from tblaccount where id = p_accId_IsInvited and isActive =1 ) then 
					SET p_code = -1;
					SET p_message = "T??i kho???n ???????c m???i kh??ng t???n t???i";
					
					LEAVE while_proc ;
		end if;
		
		IF  EXISTS (select 1 from tblguildaccount where idaccount = p_accId_IsInvited and `Status` = 1) then
					SET p_code = -1;
					SET p_message = "T??i kho???n ???????c m???i ???? gia nh???p c??ng h???i";
					LEAVE while_proc ;
		end if;
		
		IF  EXISTS (select 1 from tblguildaccount where idaccount = p_accId_IsInvited and idguild = v_idconghoi and `Status` = 0) then
					SET p_code = -1;
					SET p_message = "T??i kho???n ???????c m???i ??ang xin v??o h???i, vui l??ng ki???m tra";
					LEAVE while_proc ;
		end if;
		
		IF  EXISTS (select 1 from tblguildaccount where idaccount = p_accId_IsInvited and idguild = v_idconghoi and `Status` = 2) then
					SET p_code = -1 ;
					SET p_message = "T??i kho???n ???? ???????c m???i v??o h???i";
					LEAVE while_proc ;
		end if;
					
		start TRANSACTION;
				
			INsert into tblguildaccount 
			(
			idaccount,
			idguild,
			TimeAdd,
			`Status`
			)
			values
			(p_accId_IsInvited,
			v_idconghoi,
			SYSDATE(),
			2
			);
			
			commit;
			SET p_message =   "M???i th??nh c??ng,vui l??ng ch??? ?????ng ??" ;
			SET p_code  = 0 ;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for JoinGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `JoinGuild`;
delimiter ;;
CREATE PROCEDURE `JoinGuild`(IN p_accId_join int, IN p_guildId int,OUT p_code int ,OUT p_message varchar(125))
while_proc :BEGIN
	Declare v_cur_members int ;
	DECLARE v_log varchar(55);
	
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
						SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						ROLLBACK;
						SET v_log =  WritelogErr(@errno,p_message,"JoinGuild");
			end;
	IF NOT EXISTS (Select 1 from tblaccount where id = p_accId_join ) then
			SET p_message = "T??i kho???n kh??ng t???n t???i";
			SET p_code  = -1;

			LEAVE while_proc;
	end if;
	
	If exists (select 1 from tblguildaccount where idaccount = p_accId_join and `Status` = 1) then 
			SET p_message = "T??i kho???n ???? gia nh???p c??ng h???i";
			SET p_code  = -1;
			
			LEAVE while_proc;
	end IF;
	
	IF NOT EXISTS (Select 1 from tblguild where id = p_guildId) then 
				SET p_code = -1;
				SET p_message = "C??ng h???i kh??ng t???n t???i";
				LEAVE while_proc;
	end if;
	
	If exists (select 1 from tblguildaccount where idaccount = p_accId_join and idguild= p_guildId  and `Status` = 2) then 
			SET p_message = "T??i kho???n ???????c c??ng h???i m???i v??o, vui l??ng x??c nh???n";
			SET p_code  = -1;
			LEAVE while_proc;
	end IF;
	
	Select count(*) into v_cur_members from tblguildaccount where idguild = p_guildId and `Status` = 1;
	
	If(select  g.MaxMembers from tblguild g where g.id = p_guildId ) <= v_cur_members then 
			SET p_message = "C??ng h???i ???? ?????t t???i ??a th??nh vi??n";
			SET p_code  = -1;
			LEAVE while_proc;
	end if;
	
	If EXISTS (select 1 from tblguildaccount where idaccount = p_accId_join and idguild = p_guildId and `Status` = 0 ) then
			SET p_message = "???? ????ng k?? r???i ,Vui l??ng ch??? c??ng h???i duy???t";
			SET p_code  = -1;
			LEAVE while_proc;
 end if;
	
	start TRANSACTION;
	

			INsert into tblguildaccount 
			(
			idaccount,
			idguild,
			TimeAdd,
			`Status`
			)
			values
			(p_accId_join,
			p_guildId,
			SYSDATE(),
			0
			);
			
			
	commit;
	SET p_message = "????ng k?? th??nh c??ng,vui l??ng ch??? duy???t";
	SET p_code  = 0;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for KickMember
-- ----------------------------
DROP PROCEDURE IF EXISTS `KickMember`;
delimiter ;;
CREATE PROCEDURE `KickMember`(in p_accountId int, in p_kick_accId int , out p_code int, out p_message varchar(250))
while_proc :BEGIN
DECLARE v_log varchar(50);
DECLARE v_roll_accId,v_guildId int;
	
	DECLARE exit HANDLER for SQLEXCEPTION 
	begin 
				SET p_code  = -999;
				GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
				SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
				ROLLBACK;
				SET v_log =  WritelogErr(@errno,p_message,"KickMember");
	end ;
	
	IF NOT EXISTS (Select 1 from tblguildaccount where idaccount = p_accountId and `Status` = 1) then 
				SET p_code = -1;
				SET p_message = "T??i kho???n ch??a gia nh???p c??ng h???i";
				LEAVE while_proc;
	end if;
	
	Select idguild, idRoll into v_guildId, v_roll_accId from tblguildaccount where idaccount = p_accountId and `Status` = 1;
	
	if v_roll_accId not in (1,2) then 
				SET p_code = -1;
				SET p_message = "T??i kho???n kh??ng ????? quy???n h???n";
				LEAVE while_proc;
	end if;
	
	
	-- tk bi kick
	
	
	IF NOT EXISTS (Select 1 from tblguildaccount where idaccount = p_kick_accId and idguild = v_guildId and `Status` = 1 ) then 
				SET p_code = -1;
				SET p_message = "?????i t?????ng kh??ng ??? trong c??ng h???i";
				LEAVE while_proc;
	end if;
	

	Select  idRoll into v_roll_accId from tblguildaccount where idaccount = p_kick_accId and  idguild = v_guildId  and `Status` = 1;
	
	if v_roll_accId in (1,2) then 
			SET p_code = -1;
				SET p_message = "Kh??ng th??? kich h???i tr?????ng v?? h???i ph??";
				LEAVE while_proc;
	end if;
	
	
	start TRANSACTION;
	
	Delete from tblguildaccount 
	Where idguild = v_guildId 
	and idaccount = p_kick_accId 
	and `Status` =1 ;
	
	SET v_log = WriteLogGuild(v_guildId, p_accountId,"KickMember" , Concat("Kick th??nh vi??n id = ",convert(p_kick_accId,char) ," th??nh c??ng"));
	commit;
	SET p_code = 0;
	SET p_message = "Kick kh???i h???i th??nh c??ng ";
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for LeaveGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `LeaveGuild`;
delimiter ;;
CREATE PROCEDURE `LeaveGuild`(in p_accId_leave int , out p_code int, out p_message varchar(155))
while_proc :BEGIN
		DECLARE v_guildId, v_roll_accId ,v_total_members,v_idhoipho int;
	DECLARE v_log  varchar(55);
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
						SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						ROLLBACK;
						SET v_log =  WritelogErr(@errno,p_message,"LeaveGuild");
			end;
			
			if Not exists (Select 1 from tblguildaccount where idaccount = p_accId_leave and `Status` = 1) then 
					SET p_code = -1;
					SET p_message = "T??i kho???n hi???n kh??ng c?? trong c??ng h???i";
					LEAVE while_proc;
			end if;
			
			
			Select idguild, idRoll into v_guildId,v_roll_accId from tblguildaccount where idaccount = p_accId_leave and `Status` = 1;
			-- So thanh vien hien tai trong guild		
			Select  count(*) into v_total_members from tblguildaccount where  idguild = v_guildId and `Status` = 1;
			Start TRANSACTION;
					
				 Delete from tblguildaccount
				 Where idguild = v_guildId 
				 and idaccount = p_accId_leave
				 and `Status` = 1;
			
				if v_total_members <= 1 then 
							
							if exists (Select 1 from tblguildaccount where idguild = v_guildId ) then
										Delete from tblguildaccount 
										where idguild = v_guildId;
							end if;
							
							Delete from tblguild
							where id = v_guildId;
							
				else
					
						 if v_roll_accId = 1  then 
										if exists (Select 1  from tblguildaccount where idguild = v_guildId and `Status` = 1 and idRoll = 2) then 
													
											Update tblguildaccount 
											SET idRoll = 1,
											TimeModify = sysdate()
											WHERE  idguild = v_guildId 
											and  idRoll = 2 
											and `Status` = 1;
											
										else
								
											Update tblguildaccount 
											SET idRoll = 1,
											TimeModify = sysdate()
											WHERE  idguild = v_guildId 
											and  idaccount = (select   a.id 
																				from tblaccount a, tblguildaccount g 
																				where idguild = v_guildId 
																				and a.id = g.idaccount
																				and g.`Status`= 1   order by (a.Point + g.Point) desc LIMIT 1) 
											and `Status` = 1; 
											
										end if;
										
							end if;
						 
				 end if;	
				 
			commit;
			SET p_code = 0;
			SET p_message = "Tho??t c??ng h???i th??nh c??ng";
END
;;
delimiter ;

-- ----------------------------
-- Function structure for LogTransaction
-- ----------------------------
DROP FUNCTION IF EXISTS `LogTransaction`;
delimiter ;;
CREATE FUNCTION `LogTransaction`(`u_procedure` varchar(25),`u_idacc` int,`u_value` varchar(255),`u_viplv` int,`u_num` int,`u_iditembuy` int ,`u_idinventoryuse` int)
 RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
  DETERMINISTIC
BEGIN
			DECLARE result VARCHAR(50);
			
			Insert into logtransaction(NameProcedure,Accountid,Content,Time,VipBonusLv,NumberCoin,IditemBuy,IdinventoryUse) values (u_procedure,u_idacc,u_value,SYSDATE(),u_viplv,u_num,u_iditembuy,u_idinventoryuse);
			
			
	RETURN "Ghi log transaction";
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ReceiveGiftVip
-- ----------------------------
DROP PROCEDURE IF EXISTS `ReceiveGiftVip`;
delimiter ;;
CREATE PROCEDURE `ReceiveGiftVip`(IN p_accountId int,OUT p_ResponseText varchar(250),OUT p_ResponseStatus INT)
while_pro :BEGIN

	-- khai b??o m?? l???i 
    DECLARE v_success INT DEFAULT 1;							     -- Success
		DECLARE v_exception INT DEFAULT -99;							 -- SQL Exception 
		DECLARE v_account_vip_0 INT DEFAULT -90;					 -- Vip 0 kh??ng c?? qu??
		DECLARE v_account_not_exists INT DEFAULT -97;			-- Account kh??ng t???n t???i
		DECLARE v_account_vip_max INT DEFAULT -91 ;        -- ???? nh???n max qu?? vip



  -- Khai b??o bi???n
	DECLARE v_giftgold INT ;																						-- qu?? gold vip
	DECLARE v_lastlvvip INT ;																						-- C???p vip nh???n qu?? l???n tr?????c
	DECLARE v_giftiditem int  ;																					-- Id item qu?? vip
	DECLARE done int DEFAULT FALSE;																			-- Tr???ng th??i d??ng ????? tho??t cursor
	DECLARE v_procedurename VARCHAR(25) DEFAULT "ReceiveGiftVip";
	DECLARE v_log VARCHAR(125);

	DECLARE  vipgiftitem CURSOR FOR 	Select id  
						from tblitem i 
						where i.vipbonus = (Select GiftVip from tblaccount WHERE id = p_accountId) +1 ;
						
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	
	DECLARE exit HANDLER FOR SQLEXCEPTION 
	begin
			SET p_ResponseStatus = v_exception;
			GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
			SET p_ResponseText = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
			ROLLBACK;
			SET v_log =  WritelogErr(@errno,p_ResponseText,v_procedurename);
	END;
		
		-- Ki???m tra t??i kho???n c?? t???n t???i kh??ng
		IF NOT EXISTS (SELECT 1 FROM tblaccount WHERE id = p_accountId and IsActive = 1 ) THEN
				SET p_ResponseText = "T??i kho???n kh??ng t???n t???i";	
				SET p_ResponseStatus = v_account_not_exists;
				Leave while_pro;
		END IF;
		
    -- C???p vip =0
		if(Select VipLevel from tblaccount where id= p_accountId) = 0 then
				SET p_ResponseText = "Vip 0 kh??ng c?? qu??";	
				SET p_ResponseStatus = v_account_vip_0;
				Leave while_pro;
		end if;	
    -- l???y c???p vip ???? nh???n g???n nh???t	
		Select GiftVip into v_lastlvvip  from tblaccount WHERE id = p_accountId; -- C???p vip ???? nh???n qu??
		
		
			-- Nh???n h???t qu?? vip
		if v_lastlvvip = (Select VipLevel from tblaccount where id= p_accountId) then 
				SET p_ResponseText = "T??i kho???n ???? nh???n h???t qu?? vip";	
				SET p_ResponseStatus = v_account_vip_max  ;
				Leave while_pro;
		end if;
		
		-- L???y gold ???????c t???ng vip c???p ti???p theo
		Select t.Gold into v_giftgold from coinlevel as t
		where t.LvVip = v_lastlvvip +1;
		
	
	
	start TRANSACTION;
		if v_giftgold is not null then
				update tblaccount a
				SET a.Gold =a.Gold + v_giftgold
				where a.id =p_accountId;
				
		SET v_log= LogTransaction(v_procedurename,p_accountId,CONCAT("T??i kho???n id = ",convert(p_accountId,char)," nh???n gold qu?? Vip ",convert(v_lastlvvip+1,char)),convert(v_lastlvvip +1,char),null,null,null);
		end if;
		
		
		open vipgiftitem;
		-- loop them moi item cua vipbonus
		read_loop: LOOP
		FETCH  vipgiftitem into v_giftiditem;
		
		IF done THEN
      LEAVE read_loop;
    END IF;
		
		if v_giftiditem is not null then
				
				IF EXISTS (Select 1 from inventory i where i.iditem = v_giftiditem and i.idaccount = p_accountId and i.expired is not null ) then
									
							Update inventory  i
							set i.expired = null
							where i.iditem = v_giftiditem 
							and i.idaccount= p_accountId;
				else
							
							Insert into inventory(idaccount,iditem,time,status) values (p_accountId,v_giftiditem,now(),0);
				end if;
				
				
		end if;
		END LOOP;
		-- end loop
		close vipgiftitem;
		
		update tblaccount a
		SET a.GiftVip = v_lastlvvip +1
		where a.id= p_accountId;
		
	
	commit;
	
	SET p_ResponseText =CONCAT("Nh???n qu?? Vip ",convert(v_lastlvvip+1,char)," th??nh c??ng");
	SET p_ResponseStatus = v_success;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for RejectRegisterGuild
-- ----------------------------
DROP PROCEDURE IF EXISTS `RejectRegisterGuild`;
delimiter ;;
CREATE PROCEDURE `RejectRegisterGuild`(in p_accountid INT, in p_accJoinId INT ,out p_code int , out p_message varchar(50))
while_proc: BEGIN
	DECLARE v_idconghoi,v_rollaccId int;
	DECLARE v_log varchar(55);
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
						SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						ROLLBACK;
						SET v_log =  WritelogErr(@errno,p_message,"RejectRegisterGuild");
			end;
		
		
			
		IF NOT EXISTS (select 1 from tblguildaccount where idaccount = p_accountid and `Status` = 1) then
					SET p_code = -1;
					SET p_message = "T??i kho???n kh??ng c?? guild";
					LEAVE while_proc ;
		end if;
		
		Select  a.idRoll, a.idguild into v_rollaccId ,v_idconghoi
		from tblguildaccount a 
		where a.idaccount = p_accountid
		and a.`Status` =1 ;
			
		if v_rollaccId not in (1,2) then
					SET p_code = -1;
					SET p_message = "T??i kho???n kh??ng ????? quy???n ";
					LEAVE while_proc ;
			end if;	
			
		IF NOT EXISTS (select 1 from tblguildaccount where idaccount = p_accJoinId and idguild = v_idconghoi and `Status` = 0 )  then
					SET p_code  = -1;
					SET p_message = "????n ????ng k?? kh??ng t???n t???i";
					leave while_proc; 
		end if;
	
	Start TRANSACTION ;
	
			DELETE from tblguildaccount g
			WHERE g.idguild = v_idconghoi 
			and g.idaccount = p_accJoinId and g.`Status` = 0;
			
		commit;		
			SET p_code = 0;
			SET p_message = "T??? ch???i ????ng k?? th??nh c??ng";
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Search_guild
-- ----------------------------
DROP PROCEDURE IF EXISTS `Search_guild`;
delimiter ;;
CREATE PROCEDURE `Search_guild`(in p_search varchar(16),out p_code int, out p_message varchar(125))
while_proc :BEGIN
DECLARE v_log varchar(50);
	-- p_type 0: m?? ?????nh danh, 1 : T??n c??ng h???i
	
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
						SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						SET v_log =  WritelogErr(@errno,p_message,"Search_guild");
			end;
			
			if LENGTH(TRIM(p_search)) < 1 or LENGTH(TRIM(p_search))> 16 then
						SET P_code = -1;
						SET p_message = "T??n t??m ki???m kh??ng h???p l???";
						LEAVE while_proc;
			end if;
			
			
			
		SELECT g.id,g.GuildName, g.Description,g.IdenCode,g.MaxMembers,
		( Select count(*)  
			from tblguildaccount a 
			where a.idguild = g.id 
			and a.`Status` = 1  ) as CurMembers 
		,(Select sum(a.Point)+ sum(t.Point) 
		from tblguildaccount a,tblaccount t 
		where a.idguild= g.id 
		and a.idaccount= t.id 
		and a.`Status`= 1) as TotalPoint   
 		
		FROM tblguild g
		where  GuildName like concat('%',TRIM(p_search),'%') OR  IdenCode like concat('%',TRIM(p_search),'%')   ;
			
			SET p_code = 0;
			SET p_message= "Th??nh c??ng";
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SetRollMember
-- ----------------------------
DROP PROCEDURE IF EXISTS `SetRollMember`;
delimiter ;;
CREATE PROCEDURE `SetRollMember`(IN p_accountid int , IN p_accidchange int ,IN p_status int,out p_code int, out p_message varchar(155))
while_proc : BEGIN   
	-- p_status : 1 : th??ng ch???c ,  -1 : gi??ng ch???c . 
	DECLARE v_idguild, v_rollid ,v_idhoipho int;
	DECLARE v_log  varchar(55);
	DECLARE exit HANDLER FOR SQLEXCEPTION
			Begin
						SET p_code  = -999;
					  GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
					  SET p_message = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
						ROLLBACK;
						SET v_log =  WritelogErr(@errno,p_message,"SetRollMember");
			end;
			
			
			
			
			if Not exists (Select 1 from tblguildaccount where idaccount = p_accountid and `Status` = 1) then 
					SET p_code = -1;
					SET p_message = "T??i kho???n hi???n kh??ng c?? trong c??ng h???i" ;
					LEAVE while_proc;
			end if;
			
			Select idguild, idRoll into v_idguild,v_rollid from tblguildaccount where idaccount = p_accountid and `Status` = 1;
			
			if v_rollid != 1 then 
					SET p_code = -1;
					SET p_message = "T??i kho???n kh??ng c?? ????? quy???n h???n";
					LEAVE while_proc;
			end if;
			
			
			IF p_status not in (1,-1) then 
					SET p_code = -1;
					SET p_message = "Tr???ng th??i kh??ng h???p l??";
					LEAVE while_proc;
				end if;
			-- doi tuong 
			
				if p_accountid  =  p_accidchange then 
						SET p_code = -1;
						SET p_message = "?????i t?????ng kh??ng h???p l??? ";
						LEAVE while_proc;
				end if;
					
				
				if Not exists (Select 1 from tblguildaccount where idaccount = p_accidchange and idguild = v_idguild  and `Status` = 1) then 
					SET p_code = -1;
					SET p_message = "?????i t?????ng hi???n kh??ng ??? trong c??ng h???i";
					LEAVE while_proc;
				end if;
				
				
				
				
				Select  idRoll into v_rollid from tblguildaccount where idaccount = p_accidchange and idguild = v_idguild and `Status` = 1;
				
				if v_rollid not in (2,3) then 
						SET p_code = -1;
						SET p_message = "Ch???c v??? c???a ?????i t?????ng hi???n kh??ng h???p l???";
						LEAVE while_proc;	
				end if;
				
				if v_rollid = 3 and p_status = -1 then 
						SET p_code = -1;
						SET p_message = "Kh??ng th??? gi??ng ch???c th??nh vi??n xu???ng n???a";
						LEAVE while_proc;
				end if;
				
				start TRANSACTION;	
				
				if v_rollid = 3 and p_status = 1 and EXISTS (Select 1 from tblguildaccount where idguild = v_idguild and idRoll = 2 and `Status` = 1) then 
						
									Update tblguildaccount 
									SET idRoll = 3,
									TimeModify = sysdate()
									WHERE  idguild = v_idguild and  idRoll = 2 and `Status` = 1;
						
				end if;
				
				if v_rollid = 2 and p_status = 1 then 
									Update tblguildaccount 
									SET idRoll = 2,
									TimeModify = sysdate()
									WHERE  idguild = v_idguild and  idaccount = p_accountid and `Status` = 1;
				end if;
				

				
					Update tblguildaccount 
					SET idRoll = (case  when p_status =  1 then v_rollid-1 else v_rollid+1 end),
					TimeModify = sysdate()
					WHERE  idguild = v_idguild and  idaccount = p_accidchange and `Status` = 1;
					
				commit;
				SET p_code = 0;
				if p_status = 1 then 
					SET p_message = "Th??ng ch???c th??nh c??ng";
				ELSEIF p_status = -1 then 
					SET p_message = "Gi??ng ch???c th??nh c??ng";
				end if;
				
				
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for UseItemInventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `UseItemInventory`;
delimiter ;;
CREATE PROCEDURE `UseItemInventory`(IN p_inventoryId int,IN p_status int,OUT p_ResponseText VARCHAR(250),OUT p_ResponseStatus INT)
while_pro: BEGIN

  -- khai b??o m?? l???i

    DECLARE v_success INT DEFAULT 1;							     -- Success
		DECLARE v_exception INT DEFAULT -99;							 -- SQL Exception 
		DECLARE v_not_enough_monney INT DEFAULT -80;			 -- Kh??ng ????? ti???n
		DECLARE v_account_not_exists INT DEFAULT -81;			 -- T??i kho???n kh??ng t???n t???i
		DECLARE v_item_expired INT DEFAULT -89;			        -- Item h???t h???n
		DECLARE v_item_already_bought INT DEFAULT -83;		 -- Item ???? mua 
		DECLARE v_inventoryId_not_Exist INT DEFAULT -85;	 -- Inventory kh??ng t???n t???i
		DECLARE v_status_invalid INT DEFAULT -88;			     -- S??? tr???ng th??i kh??ng h???p l???


	-- Khai b??o bi???n
	
	DECLARE v_idtype,v_idacc int;
	DECLARE v_procedurename VARCHAR(25) DEFAULT "UseItemInventory";
	DECLARE v_log VARCHAR(25);

	DECLARE exit HANDLER FOR SQLEXCEPTION 
	begin
	
		SET p_ResponseStatus = v_exception;
		GET STACKED DIAGNOSTICS CONDITION 1 @errno = MYSQL_ERRNO,  @state = RETURNED_SQLSTATE, @msg= MESSAGE_TEXT;
		SET p_ResponseText = CONCAT('Exception ', @state, ' | ', @errno,  ' | ',@msg) ;
		ROLLBACK;
		SET v_log =  WritelogErr(@errno,p_ResponseText,v_procedurename);
		
	END;
	
	IF NOT EXISTS (SELECT 1 FROM inventory WHERE id = p_inventoryId ) THEN 
			SET p_ResponseText = "Id inventory kh??ng t???n t???i !";
			SET p_ResponseStatus= v_inventoryId_not_Exist;
			LEAVE while_pro;
		
	END IF;
	-- L???y th??ng tin ng?????i d??ng v?? lo???i item
	Select t.idtype,i.idaccount into v_idtype,v_idacc from inventory i, tblitem t where i.iditem = t.id  and i.id= p_inventoryId;
	
	-- Ki???m tra th??ng tin tr???ng th??i (0 : th??o ,  1 : m???c)
	IF (p_status != 0 && p_status != 1) then 
		SET p_ResponseText = "Status kh??ng h???p l??? !";
		SET p_ResponseStatus= v_status_invalid;
		LEAVE while_pro;
	end if;
	
	
	if(Select i.expired from inventory i where i.id= p_inventoryId AND i.expired is not null ) < now() then 
				SET p_ResponseText = "????? ???? h???t h???n !";
				SET p_ResponseStatus = v_item_expired;
				LEAVE while_pro;
	end if;
	
	
	
	start transaction;
	
	
	if p_status  = 1 then 
		update inventory i
		SET i.`status` = 0
		where i.idaccount = v_idacc 
		and (i.expired is null or i.expired >now())
		and i.iditem in (Select id from tblitem where idtype = v_idtype and isvalid =1  );
		
	end if;
					

	update  inventory as i
	SET i.`status` =  p_status
	where i.id = p_inventoryId;
	
	
	COMMIT;
	Set p_ResponseText = "Thay ?????i th??nh c??ng";
	SET p_ResponseStatus = v_success;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for WriteLogErr
-- ----------------------------
DROP FUNCTION IF EXISTS `WriteLogErr`;
delimiter ;;
CREATE FUNCTION `WriteLogErr`(`p_errno` int ,`p_message` varchar(255), `p_name` varchar(35))
 RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
  DETERMINISTIC
BEGIN
			DECLARE result VARCHAR(50);
			
			Insert into log_err(ErrNo,ErrMessage,NameFunction,TimeCreate) values (p_errno,p_message,p_name,SYSDATE());
			
			
	RETURN "Ghi log l???i";
END
;;
delimiter ;

-- ----------------------------
-- Function structure for WriteLogGuild
-- ----------------------------
DROP FUNCTION IF EXISTS `WriteLogGuild`;
delimiter ;;
CREATE FUNCTION `WriteLogGuild`(`u_idguild` int ,`u_idacc` int , `u_name` varchar(35),`u_message` varchar(255))
 RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
  DETERMINISTIC
BEGIN
			DECLARE result VARCHAR(50);
			
			Insert into logguild(idaccount,idguild,NameProcedure,Message,Time) values (u_idacc,u_idguild,u_name,u_message,SYSDATE());
			
			
	RETURN "Ghi log transaction";
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
