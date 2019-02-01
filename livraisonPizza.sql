/*
 Navicat Premium Data Transfer

 Source Server         : Personnel
 Source Server Type    : MySQL
 Source Server Version : 100217
 Source Host           : mysql-leandredelpivar.alwaysdata.net:3306
 Source Schema         : leandredelpivar_livraisonpizza

 Target Server Type    : MySQL
 Target Server Version : 100217
 File Encoding         : 65001

 Date: 31/01/2019 15:03:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Client
-- ----------------------------
DROP TABLE IF EXISTS `Client`;
CREATE TABLE `Client`  (
  `telClient` int(11) NOT NULL,
  `adresse` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code postal` int(11) NOT NULL,
  `ville` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nomCli` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prenomCli` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`telClient`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Detail
-- ----------------------------
DROP TABLE IF EXISTS `Detail`;
CREATE TABLE `Detail`  (
  `quantite` int(11) NOT NULL,
  `refPizza` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `refTaille` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `refLivraison` int(11) NOT NULL,
  PRIMARY KEY (`refPizza`, `refTaille`, `refLivraison`) USING BTREE,
  INDEX `refTaille`(`refTaille`) USING BTREE,
  INDEX `refLivraison`(`refLivraison`) USING BTREE,
  CONSTRAINT `refLivraison` FOREIGN KEY (`refLivraison`) REFERENCES `Livraison` (`idLivraison`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `refPizza` FOREIGN KEY (`refPizza`) REFERENCES `Tarif` (`refPizza`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `refTaille` FOREIGN KEY (`refTaille`) REFERENCES `Tarif` (`refTaille`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Livraison
-- ----------------------------
DROP TABLE IF EXISTS `Livraison`;
CREATE TABLE `Livraison`  (
  `idLivraison` int(11) NOT NULL,
  `heureDepart` datetime(0) NULL DEFAULT NULL,
  `refTelClient` int(11) NULL DEFAULT NULL,
  `refTelLivreur` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idLivraison`) USING BTREE,
  INDEX `refTelClient`(`refTelClient`) USING BTREE,
  INDEX `refTelLivreur`(`refTelLivreur`) USING BTREE,
  CONSTRAINT `refTelClient` FOREIGN KEY (`refTelClient`) REFERENCES `Client` (`telClient`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `refTelLivreur` FOREIGN KEY (`refTelLivreur`) REFERENCES `Livreur` (`telLivreur`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Livreur
-- ----------------------------
DROP TABLE IF EXISTS `Livreur`;
CREATE TABLE `Livreur`  (
  `telLivreur` int(11) NOT NULL,
  `nomLivreur` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prenomLivreur` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`telLivreur`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Pizza
-- ----------------------------
DROP TABLE IF EXISTS `Pizza`;
CREATE TABLE `Pizza`  (
  `nomPizza` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`nomPizza`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Taille
-- ----------------------------
DROP TABLE IF EXISTS `Taille`;
CREATE TABLE `Taille`  (
  `taille` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`taille`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Tarif
-- ----------------------------
DROP TABLE IF EXISTS `Tarif`;
CREATE TABLE `Tarif`  (
  `prix` int(11) NOT NULL,
  `refPizza` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `refTaille` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`refPizza`, `refTaille`) USING BTREE,
  INDEX `refPizza`(`refPizza`) USING BTREE,
  INDEX `refTaille`(`refTaille`) USING BTREE,
  CONSTRAINT `refePizza` FOREIGN KEY (`refPizza`) REFERENCES `Pizza` (`nomPizza`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `refeTaille` FOREIGN KEY (`refTaille`) REFERENCES `Taille` (`taille`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
