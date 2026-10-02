CREATE DATABASE IF NOT EXISTS `online_bookstore`
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE `online_bookstore`;

-- Drop child tables first to avoid foreign key problems
DROP TABLE IF EXISTS `訂單明細`;
DROP TABLE IF EXISTS `訂單`;
DROP TABLE IF EXISTS `購物車`;
DROP TABLE IF EXISTS `會員電話`;
DROP TABLE IF EXISTS `書籍作者`;
DROP TABLE IF EXISTS `書籍`;
DROP TABLE IF EXISTS `會員`;
DROP TABLE IF EXISTS `作者`;
DROP TABLE IF EXISTS `出版社`;

-- Create the parent tables first
CREATE TABLE `出版社` (
  `出版社代號` INT AUTO_INCREMENT PRIMARY KEY,
  `名稱` VARCHAR(100) NOT NULL,
  `電話` VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE `作者` (
  `作者編號` INT AUTO_INCREMENT PRIMARY KEY,
  `姓名` VARCHAR(50) NOT NULL,
  `筆名` VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE `會員` (
  `會員編號` INT AUTO_INCREMENT PRIMARY KEY,
  `姓名` VARCHAR(50) NOT NULL,
  `生日` DATE,
  `住址` VARCHAR(200),
  `電子郵件` VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE `書籍` (
  `ISBN` VARCHAR(20) PRIMARY KEY,
  `書名` VARCHAR(100) NOT NULL,
  `單價` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `出版日期` DATE,
  `出版社代號` INT NOT NULL,
  FOREIGN KEY (`出版社代號`)
    REFERENCES `出版社`(`出版社代號`)
) ENGINE=InnoDB;

-- This table connects books and authors
-- One book can have more than one author
CREATE TABLE `書籍作者` (
  `ISBN` VARCHAR(20) NOT NULL,
  `作者編號` INT NOT NULL,
  PRIMARY KEY (`ISBN`, `作者編號`),
  FOREIGN KEY (`ISBN`)
    REFERENCES `書籍`(`ISBN`),
  FOREIGN KEY (`作者編號`)
    REFERENCES `作者`(`作者編號`)
) ENGINE=InnoDB;

-- Store member phone numbers in a separate table
CREATE TABLE `會員電話` (
  `會員編號` INT NOT NULL,
  `電話` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`會員編號`, `電話`),
  FOREIGN KEY (`會員編號`)
    REFERENCES `會員`(`會員編號`)
) ENGINE=InnoDB;

-- Shopping cart table
CREATE TABLE `購物車` (
  `會員編號` INT NOT NULL,
  `ISBN` VARCHAR(20) NOT NULL,
  `數量` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`會員編號`, `ISBN`),
  FOREIGN KEY (`會員編號`)
    REFERENCES `會員`(`會員編號`),
  FOREIGN KEY (`ISBN`)
    REFERENCES `書籍`(`ISBN`)
) ENGINE=InnoDB;

-- Order table
CREATE TABLE `訂單` (
  `訂單編號` INT AUTO_INCREMENT PRIMARY KEY,
  `會員編號` INT NOT NULL,
  `下單時間` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `配送地址` VARCHAR(200) NOT NULL,
  `狀態` VARCHAR(20) NOT NULL DEFAULT '處理中',
  FOREIGN KEY (`會員編號`)
    REFERENCES `會員`(`會員編號`)
) ENGINE=InnoDB;

-- Each row stores one book in an order
CREATE TABLE `訂單明細` (
  `訂單編號` INT NOT NULL,
  `ISBN` VARCHAR(20) NOT NULL,
  `單價` DECIMAL(10,2) NOT NULL,
  `數量` INT NOT NULL DEFAULT 1,
  `小計` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`訂單編號`, `ISBN`),
  FOREIGN KEY (`訂單編號`)
    REFERENCES `訂單`(`訂單編號`),
  FOREIGN KEY (`ISBN`)
    REFERENCES `書籍`(`ISBN`)
) ENGINE=InnoDB;
