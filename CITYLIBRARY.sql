-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "CITYLIBRARY" ---------------------------
CREATE DATABASE IF NOT EXISTS `CITYLIBRARY` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `CITYLIBRARY`;
-- ---------------------------------------------------------


-- CREATE TABLE "ADMIN" ----------------------------------------
CREATE TABLE `ADMIN`( 
	`A_ID` Int( 0 ) NOT NULL,
	`A_NAME` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`A_PASS` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `A_ID` ),
	CONSTRAINT `unique_A_ID` UNIQUE( `A_ID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "AUTHORS" --------------------------------------
CREATE TABLE `AUTHORS`( 
	`PID` Int( 0 ) NOT NULL,
	`DOCID` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `PID`, `DOCID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "BOOK" -----------------------------------------
CREATE TABLE `BOOK`( 
	`DOCID` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`ISBN` Int( 0 ) NULL,
	PRIMARY KEY ( `DOCID` ),
	CONSTRAINT `unique_DOCID` UNIQUE( `DOCID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 128;
-- -------------------------------------------------------------


-- CREATE TABLE "BORROWS" --------------------------------------
CREATE TABLE `BORROWS`( 
	`BID` Int( 0 ) NOT NULL,
	`COPYNO` Int( 0 ) NOT NULL,
	`DOCID` Int( 0 ) NOT NULL,
	`RID` Int( 0 ) NOT NULL,
	`BDTIME` Date NULL,
	`RDTIME` Date NULL,
	`BOR_NO` Int( 0 ) AUTO_INCREMENT NOT NULL,
	PRIMARY KEY ( `BOR_NO` ),
	CONSTRAINT `unique_BOR_NO` UNIQUE( `BOR_NO` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 30;
-- -------------------------------------------------------------


-- CREATE TABLE "BRANCH" ---------------------------------------
CREATE TABLE `BRANCH`( 
	`BID` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`LNAME` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`LOCATION` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `BID` ),
	CONSTRAINT `unique_BID` UNIQUE( `BID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 106;
-- -------------------------------------------------------------


-- CREATE TABLE "CHAIR" ----------------------------------------
CREATE TABLE `CHAIR`( 
	`PID` Int( 0 ) NOT NULL,
	`DOCID` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `PID`, `DOCID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "COPY" -----------------------------------------
CREATE TABLE `COPY`( 
	`DOCID` Int( 0 ) NOT NULL,
	`COPYNO` Int( 0 ) NOT NULL,
	`BID` Int( 0 ) NOT NULL,
	`POSITION` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `DOCID`, `COPYNO`, `BID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "DOCUMENT" -------------------------------------
CREATE TABLE `DOCUMENT`( 
	`DOCID` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`TITLE` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`PUBLISHERID` Int( 0 ) NULL,
	`PDATE` DateTime NULL,
	PRIMARY KEY ( `DOCID` ),
	CONSTRAINT `unique_DOCID` UNIQUE( `DOCID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 131;
-- -------------------------------------------------------------


-- CREATE TABLE "GEDITS" ---------------------------------------
CREATE TABLE `GEDITS`( 
	`DOCID` Int( 0 ) NOT NULL,
	`ISSUE_NO` Int( 0 ) NOT NULL,
	`PID` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `DOCID`, `ISSUE_NO`, `PID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "JOURNAL_ISSUE" --------------------------------
CREATE TABLE `JOURNAL_ISSUE`( 
	`DOCID` Int( 0 ) NOT NULL,
	`ISSUE_NO` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`SCOPE` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `DOCID`, `ISSUE_NO` ),
	CONSTRAINT `unique_ISSUE_NO` UNIQUE( `ISSUE_NO` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1010;
-- -------------------------------------------------------------


-- CREATE TABLE "JOURNAL_VOLUME" -------------------------------
CREATE TABLE `JOURNAL_VOLUME`( 
	`DOCID` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`VOLUME_NO` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`EDITOR` Int( 0 ) NULL,
	PRIMARY KEY ( `DOCID` ),
	CONSTRAINT `unique_DOCID` UNIQUE( `DOCID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 130;
-- -------------------------------------------------------------


-- CREATE TABLE "PERSON" ---------------------------------------
CREATE TABLE `PERSON`( 
	`PID` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`PNAME` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `PID` ),
	CONSTRAINT `unique_PID` UNIQUE( `PID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1120;
-- -------------------------------------------------------------


-- CREATE TABLE "PROCEEDINGS" ----------------------------------
CREATE TABLE `PROCEEDINGS`( 
	`DOCID` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`CDATE` DateTime NULL,
	`CLOCATION` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`CEDITOR` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `DOCID` ),
	CONSTRAINT `unique_DOCID` UNIQUE( `DOCID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 131;
-- -------------------------------------------------------------


-- CREATE TABLE "PUBLISHER" ------------------------------------
CREATE TABLE `PUBLISHER`( 
	`PUBLISHERID` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`PUBNAME` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`ADDRESS` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `PUBLISHERID` ),
	CONSTRAINT `unique_PUBLISHERID` UNIQUE( `PUBLISHERID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "READER" ---------------------------------------
CREATE TABLE `READER`( 
	`RID` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`RNAME` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`RTYPE` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`RADDRESS` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`PHONE_NO` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `RID` ),
	CONSTRAINT `unique_RID` UNIQUE( `RID` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 114;
-- -------------------------------------------------------------


-- CREATE TABLE "RESERVES" -------------------------------------
CREATE TABLE `RESERVES`( 
	`RID` Int( 0 ) NOT NULL,
	`RESERVATION_NO` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`DOCID` Int( 0 ) NOT NULL,
	`COPYNO` Int( 0 ) NOT NULL,
	`BID` Int( 0 ) NOT NULL,
	`DTIME` Date NULL,
	PRIMARY KEY ( `RESERVATION_NO` ),
	CONSTRAINT `unique_RESERVATION_NO` UNIQUE( `RESERVATION_NO` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 118;
-- -------------------------------------------------------------


-- Dump data of "ADMIN" ------------------------------------
BEGIN;

INSERT INTO `ADMIN`(`A_ID`,`A_NAME`,`A_PASS`) VALUES 
( '101', 'admin', 'admin' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "AUTHORS" ----------------------------------
BEGIN;

INSERT INTO `AUTHORS`(`PID`,`DOCID`) VALUES 
( '1113', '101' ),
( '1113', '102' ),
( '1114', '103' ),
( '1114', '104' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "BOOK" -------------------------------------
BEGIN;

INSERT INTO `BOOK`(`DOCID`,`ISBN`) VALUES 
( '101', '111100' ),
( '102', '111101' ),
( '103', '111102' ),
( '104', '111103' ),
( '111', '111222' ),
( '112', '124332' ),
( '113', '223222' ),
( '115', '57578998' ),
( '122', '7643374' ),
( '127', '33344466' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "BORROWS" ----------------------------------
BEGIN;

INSERT INTO `BORROWS`(`BID`,`COPYNO`,`DOCID`,`RID`,`BDTIME`,`RDTIME`,`BOR_NO`) VALUES 
( '1', '1', '103', '103', '2020-01-04', '2020-03-07', '1' ),
( '1', '1', '102', '103', '2021-04-19', '2021-04-22', '2' ),
( '1', '1', '101', '102', '2021-04-19', '2021-04-25', '3' ),
( '1', '1', '104', '103', '2021-04-22', NULL, '4' ),
( '1', '2', '125', '105', '2020-03-01', '2021-04-22', '5' ),
( '1', '1', '101', '103', '2021-04-22', NULL, '6' ),
( '1', '1', '103', '103', '2021-04-26', '2021-05-03', '7' ),
( '1', '1', '115', '101', '2021-04-29', '2021-04-29', '8' ),
( '1', '1', '105', '104', '2019-12-01', '2019-12-19', '9' ),
( '2', '1', '107', '104', '2019-11-01', '2019-12-19', '10' ),
( '2', '1', '108', '106', '2019-12-01', '2019-12-25', '11' ),
( '3', '1', '109', '106', '2019-10-01', '2019-12-19', '12' ),
( '3', '1', '110', '107', '2020-02-01', '2020-12-07', '13' ),
( '4', '1', '111', '104', '2019-08-01', '2019-09-19', '14' ),
( '4', '1', '112', '104', '2020-03-01', '2020-03-19', '15' ),
( '5', '1', '113', '107', '2020-04-01', '2020-12-01', '16' ),
( '3', '1', '122', '108', '2019-12-01', '2019-12-19', '17' ),
( '3', '1', '124', '108', '2020-05-01', '2020-06-01', '18' ),
( '1', '1', '105', '109', '2020-02-01', NULL, '19' ),
( '2', '1', '107', '109', '2019-12-20', '2019-12-29', '20' ),
( '2', '1', '108', '109', '2020-01-01', '2020-01-25', '21' ),
( '3', '1', '109', '109', '2020-10-01', '2020-12-19', '22' ),
( '3', '1', '110', '110', '2019-02-01', '2019-03-07', '23' ),
( '4', '1', '111', '110', '2019-10-01', '2019-12-19', '24' ),
( '4', '1', '112', '111', '2020-04-01', '2020-06-19', '25' ),
( '5', '1', '113', '111', '2020-04-01', '2020-12-01', '26' ),
( '3', '1', '122', '111', '2019-12-25', NULL, '27' ),
( '3', '1', '124', '111', '2020-09-01', NULL, '28' ),
( '4', '1', '111', '105', '2021-05-01', '2021-05-01', '29' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "BRANCH" -----------------------------------
BEGIN;

INSERT INTO `BRANCH`(`BID`,`LNAME`,`LOCATION`) VALUES 
( '1', 'LA', 'JERSEY CITY' ),
( '2', 'PA', 'HARRISON' ),
( '3', 'BA', 'NEWARK' ),
( '4', 'CA', 'HOBOKEN' ),
( '5', 'DA', 'EDISON' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "CHAIR" ------------------------------------
BEGIN;

INSERT INTO `CHAIR`(`PID`,`DOCID`) VALUES 
( '1117', '108' ),
( '1118', '109' ),
( '1119', '110' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "COPY" -------------------------------------
BEGIN;

INSERT INTO `COPY`(`DOCID`,`COPYNO`,`BID`,`POSITION`) VALUES 
( '101', '1', '1', 'ROW101' ),
( '102', '1', '1', 'ROW102' ),
( '103', '1', '1', 'ROW103' ),
( '104', '1', '1', 'ROW104' ),
( '104', '1', '5', 'ROW114' ),
( '105', '1', '1', 'ROW105' ),
( '106', '1', '1', 'ROW106' ),
( '107', '1', '2', 'ROW107' ),
( '108', '1', '2', 'ROW108' ),
( '109', '1', '3', 'ROW109' ),
( '110', '1', '3', 'ROW110' ),
( '111', '1', '4', 'ROW111' ),
( '112', '1', '4', 'ROW112' ),
( '113', '1', '5', 'ROW113' ),
( '115', '1', '1', 'ROW115' ),
( '122', '1', '3', 'ROW107' ),
( '124', '1', '3', 'ROW1' ),
( '125', '1', '2', 'ROW108' ),
( '125', '2', '1', 'ROW1' ),
( '126', '1', '1', 'ROW109' ),
( '127', '1', '2', 'ROW111' ),
( '129', '1', '5', 'ROW111' ),
( '130', '1', '3', 'Row2' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "DOCUMENT" ---------------------------------
BEGIN;

INSERT INTO `DOCUMENT`(`DOCID`,`TITLE`,`PUBLISHERID`,`PDATE`) VALUES 
( '101', 'ABC', '2111', '2021-01-01 00:00:00' ),
( '102', 'CS101', '2112', '2020-04-13 00:00:00' ),
( '103', 'IS201', '2113', '2020-09-14 00:00:00' ),
( '104', 'CS103', '2114', '2019-05-17 00:00:00' ),
( '105', 'CS202', '2111', '2021-04-13 00:00:00' ),
( '106', 'IS203', '2111', '2021-08-13 00:00:00' ),
( '107', 'CS403', '2112', '2018-01-06 00:00:00' ),
( '108', 'DS307', '2115', '2021-03-13 00:00:00' ),
( '109', 'DS102', '2116', '2016-04-13 00:00:00' ),
( '110', 'DS111', '2117', '2015-04-13 00:00:00' ),
( '111', 'CS631', '2118', '2021-09-03 00:00:00' ),
( '112', 'CS632', '2119', '2020-06-12 00:00:00' ),
( '113', 'CS630', '2112', '2019-03-13 00:00:00' ),
( '115', 'PS209', '2117', '2019-05-07 00:00:00' ),
( '121', 'TS201', '2115', '2018-09-07 00:00:00' ),
( '122', 'SD102', '2114', '2017-08-03 00:00:00' ),
( '124', 'GGGG', '2113', '2017-06-04 00:00:00' ),
( '125', 'RRR', '2114', '2018-04-07 00:00:00' ),
( '126', 'Proc', '2114', '2019-02-07 00:00:00' ),
( '127', 'RTUI', '2119', '2014-02-09 00:00:00' ),
( '129', 'PVVR', '2118', '2019-01-01 00:00:00' ),
( '130', 'Conf123', '2115', '2020-01-01 00:00:00' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "GEDITS" -----------------------------------
BEGIN;

INSERT INTO `GEDITS`(`DOCID`,`ISSUE_NO`,`PID`) VALUES 
( '105', '1001', '1115' ),
( '105', '1005', '1115' ),
( '106', '1002', '1115' ),
( '107', '1003', '1115' ),
( '105', '1001', '1116' ),
( '105', '1004', '1116' ),
( '106', '1006', '1116' ),
( '107', '1007', '1116' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "JOURNAL_ISSUE" ----------------------------
BEGIN;

INSERT INTO `JOURNAL_ISSUE`(`DOCID`,`ISSUE_NO`,`SCOPE`) VALUES 
( '105', '1001', 'XYZ' ),
( '105', '1004', 'XYZ' ),
( '105', '1005', 'REW' ),
( '106', '1002', 'PQR' ),
( '106', '1006', 'KKK' ),
( '107', '1003', 'LMN' ),
( '107', '1007', 'LLL' ),
( '125', '1008', 'rtyy' ),
( '129', '1009', 'XCT' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "JOURNAL_VOLUME" ---------------------------
BEGIN;

INSERT INTO `JOURNAL_VOLUME`(`DOCID`,`VOLUME_NO`,`EDITOR`) VALUES 
( '105', '101', '1111' ),
( '106', '102', '1111' ),
( '107', '103', '1112' ),
( '124', '104', '1111' ),
( '125', '105', '1113' ),
( '129', '107', '1113' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "PERSON" -----------------------------------
BEGIN;

INSERT INTO `PERSON`(`PID`,`PNAME`) VALUES 
( '1110', 'JOE' ),
( '1111', 'HANK' ),
( '1112', 'AERON' ),
( '1113', 'BECCA' ),
( '1114', 'HARLEY' ),
( '1115', 'ERICA' ),
( '1116', 'KYRA' ),
( '1117', 'SNEHA' ),
( '1118', 'KYLIE' ),
( '1119', 'KIM' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "PROCEEDINGS" ------------------------------
BEGIN;

INSERT INTO `PROCEEDINGS`(`DOCID`,`CDATE`,`CLOCATION`,`CEDITOR`) VALUES 
( '108', '2020-04-13 00:00:00', 'BA', 'XYZ' ),
( '109', '2019-01-09 00:00:00', 'ED', 'PQR' ),
( '110', '2015-03-07 00:00:00', 'BA', 'XYZ' ),
( '126', '2021-01-01 00:00:00', 'Mumbai', NULL ),
( '130', '2019-09-01 00:00:00', 'NJ', NULL );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "PUBLISHER" --------------------------------
BEGIN;

INSERT INTO `PUBLISHER`(`PUBLISHERID`,`PUBNAME`,`ADDRESS`) VALUES 
( '2111', 'RICK', '201 NJ' ),
( '2112', 'MAX', '202 NJ' ),
( '2113', 'JIYA', '203 NY' ),
( '2114', 'RAHUL', '204 NJ' ),
( '2115', 'ROCKY', '205 NY' ),
( '2116', 'MORTY', '206 CU' ),
( '2117', 'SID', '207 NJ' ),
( '2118', 'ZHEI', '208 NJ' ),
( '2119', 'ZORO', '209 CU' ),
( '2120', 'SHILPA', '210 ED' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "READER" -----------------------------------
BEGIN;

INSERT INTO `READER`(`RID`,`RNAME`,`RTYPE`,`RADDRESS`,`PHONE_NO`) VALUES 
( '101', 'RAJVI', 'STUDENT', '101 ABC', '9999666778' ),
( '102', 'SAI', 'STUDENT', '102 PQR', '9999666888' ),
( '103', 'SATYA', 'STUDENT', '103 ABC', '9999666718' ),
( '104', 'KOMAL', 'STUDENT', '101 ABC', '9999666778' ),
( '105', 'PRIYA', 'STUDENT', '101 ABC', '9999666778' ),
( '106', 'RAJ', 'STAFF', '106 ABC', '9999668478' ),
( '107', 'RANI', 'STAFF', '107 ABC', '9999222778' ),
( '108', 'SURYA', 'SENIOR CITIZEN', '108 PFE', '9945479778' ),
( '109', 'SMITH', 'SENIOR CITIZEN', '109 ABC', '9988766778' ),
( '110', 'ABHI', 'STAFF', '110 ABC', '9879666778' ),
( '111', 'Rahman', 'Staff', '123 street', '9998886762,' ),
( '112', 'Jane', 'Senior Citizen', 'Webster Ave 455', '5513490988,' ),
( '113', 'Jade', 'Student', '123 WallStreet', '7778684532,' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "RESERVES" ---------------------------------
BEGIN;

INSERT INTO `RESERVES`(`RID`,`RESERVATION_NO`,`DOCID`,`COPYNO`,`BID`,`DTIME`) VALUES 
( '101', '116', '106', '1', '1', '2021-04-29' ),
( '105', '117', '113', '1', '5', '2021-05-01' ),
( '103', '118', '102', '1', '1', '2021-05-03' );
COMMIT;
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_DOCUMENT_AUTHORS" -------------------------
CREATE INDEX `lnk_DOCUMENT_AUTHORS` USING BTREE ON `AUTHORS`( `DOCID` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_BID" ------------------------------------
CREATE INDEX `index_BID` USING BTREE ON `BORROWS`( `BID` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_COPYNO" ---------------------------------
CREATE INDEX `index_COPYNO` USING BTREE ON `BORROWS`( `COPYNO` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_DOCID" ----------------------------------
CREATE INDEX `index_DOCID` USING BTREE ON `BORROWS`( `DOCID` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_RID" ------------------------------------
CREATE INDEX `index_RID` USING BTREE ON `BORROWS`( `RID` );
-- -------------------------------------------------------------


-- CREATE INDEX "lnk_COPY_BORROWS" -----------------------------
CREATE INDEX `lnk_COPY_BORROWS` USING BTREE ON `BORROWS`( `DOCID`, `COPYNO`, `BID` );
-- -------------------------------------------------------------


-- CREATE INDEX "lnk_PROCEEDINGS_CHAIR" ------------------------
CREATE INDEX `lnk_PROCEEDINGS_CHAIR` USING BTREE ON `CHAIR`( `DOCID` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_BID2" -----------------------------------
CREATE INDEX `index_BID2` USING BTREE ON `COPY`( `BID` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_COPYNO2" --------------------------------
CREATE INDEX `index_COPYNO2` USING BTREE ON `COPY`( `COPYNO` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_DOCID1" ---------------------------------
CREATE INDEX `index_DOCID1` USING BTREE ON `COPY`( `DOCID` );
-- -------------------------------------------------------------


-- CREATE INDEX "lnk_PUBLISHER_DOCUMENT" -----------------------
CREATE INDEX `lnk_PUBLISHER_DOCUMENT` USING BTREE ON `DOCUMENT`( `PUBLISHERID` );
-- -------------------------------------------------------------


-- CREATE INDEX "lnk_JOURNAL_ISSUE_GEDITS_2" -------------------
CREATE INDEX `lnk_JOURNAL_ISSUE_GEDITS_2` USING BTREE ON `GEDITS`( `ISSUE_NO` );
-- -------------------------------------------------------------


-- CREATE INDEX "lnk_PERSON_GEDITS" ----------------------------
CREATE INDEX `lnk_PERSON_GEDITS` USING BTREE ON `GEDITS`( `PID` );
-- -------------------------------------------------------------


-- CREATE INDEX "lnk_PERSON_JOURNAL_VOLUME" --------------------
CREATE INDEX `lnk_PERSON_JOURNAL_VOLUME` USING BTREE ON `JOURNAL_VOLUME`( `EDITOR` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_BID1" -----------------------------------
CREATE INDEX `index_BID1` USING BTREE ON `RESERVES`( `BID` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_COPYNO1" --------------------------------
CREATE INDEX `index_COPYNO1` USING BTREE ON `RESERVES`( `COPYNO` );
-- -------------------------------------------------------------


-- CREATE INDEX "index_DOCID2" ---------------------------------
CREATE INDEX `index_DOCID2` USING BTREE ON `RESERVES`( `DOCID` );
-- -------------------------------------------------------------


-- CREATE INDEX "lnk_COPY_RESERVES" ----------------------------
CREATE INDEX `lnk_COPY_RESERVES` USING BTREE ON `RESERVES`( `DOCID`, `COPYNO`, `BID` );
-- -------------------------------------------------------------


-- CREATE INDEX "lnk_READER_RESERVES" --------------------------
CREATE INDEX `lnk_READER_RESERVES` USING BTREE ON `RESERVES`( `RID` );
-- -------------------------------------------------------------


-- CREATE LINK "lnk_BRANCH_COPY" -------------------------------
ALTER TABLE `COPY`
	ADD CONSTRAINT `lnk_BRANCH_COPY` FOREIGN KEY ( `BID` )
	REFERENCES `BRANCH`( `BID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_COPY_BORROWS" ------------------------------
ALTER TABLE `BORROWS`
	ADD CONSTRAINT `lnk_COPY_BORROWS` FOREIGN KEY ( `BID` )
	REFERENCES `COPY`( `BID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_COPY_BORROWS_2" ----------------------------
ALTER TABLE `BORROWS`
	ADD CONSTRAINT `lnk_COPY_BORROWS_2` FOREIGN KEY ( `DOCID` )
	REFERENCES `COPY`( `DOCID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_COPY_BORROWS_3" ----------------------------
ALTER TABLE `BORROWS`
	ADD CONSTRAINT `lnk_COPY_BORROWS_3` FOREIGN KEY ( `COPYNO` )
	REFERENCES `COPY`( `COPYNO` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_COPY_RESERVES" -----------------------------
ALTER TABLE `RESERVES`
	ADD CONSTRAINT `lnk_COPY_RESERVES` FOREIGN KEY ( `BID` )
	REFERENCES `COPY`( `BID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_COPY_RESERVES_2" ---------------------------
ALTER TABLE `RESERVES`
	ADD CONSTRAINT `lnk_COPY_RESERVES_2` FOREIGN KEY ( `COPYNO` )
	REFERENCES `COPY`( `COPYNO` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_COPY_RESERVES_3" ---------------------------
ALTER TABLE `RESERVES`
	ADD CONSTRAINT `lnk_COPY_RESERVES_3` FOREIGN KEY ( `DOCID` )
	REFERENCES `COPY`( `DOCID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_DOCUMENT_AUTHORS" --------------------------
ALTER TABLE `AUTHORS`
	ADD CONSTRAINT `lnk_DOCUMENT_AUTHORS` FOREIGN KEY ( `DOCID` )
	REFERENCES `DOCUMENT`( `DOCID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_DOCUMENT_BOOK" -----------------------------
ALTER TABLE `BOOK`
	ADD CONSTRAINT `lnk_DOCUMENT_BOOK` FOREIGN KEY ( `DOCID` )
	REFERENCES `DOCUMENT`( `DOCID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_DOCUMENT_COPY" -----------------------------
ALTER TABLE `COPY`
	ADD CONSTRAINT `lnk_DOCUMENT_COPY` FOREIGN KEY ( `DOCID` )
	REFERENCES `DOCUMENT`( `DOCID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_DOCUMENT_JOURNAL_VOLUME" -------------------
ALTER TABLE `JOURNAL_VOLUME`
	ADD CONSTRAINT `lnk_DOCUMENT_JOURNAL_VOLUME` FOREIGN KEY ( `DOCID` )
	REFERENCES `DOCUMENT`( `DOCID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_DOCUMENT_PROCEEDINGS" ----------------------
ALTER TABLE `PROCEEDINGS`
	ADD CONSTRAINT `lnk_DOCUMENT_PROCEEDINGS` FOREIGN KEY ( `DOCID` )
	REFERENCES `DOCUMENT`( `DOCID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_JOURNAL_ISSUE_GEDITS" ----------------------
ALTER TABLE `GEDITS`
	ADD CONSTRAINT `lnk_JOURNAL_ISSUE_GEDITS` FOREIGN KEY ( `DOCID` )
	REFERENCES `JOURNAL_ISSUE`( `DOCID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_JOURNAL_ISSUE_GEDITS_2" --------------------
ALTER TABLE `GEDITS`
	ADD CONSTRAINT `lnk_JOURNAL_ISSUE_GEDITS_2` FOREIGN KEY ( `ISSUE_NO` )
	REFERENCES `JOURNAL_ISSUE`( `ISSUE_NO` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_JOURNAL_VOLUME_JOURNAL_ISSUE" --------------
ALTER TABLE `JOURNAL_ISSUE`
	ADD CONSTRAINT `lnk_JOURNAL_VOLUME_JOURNAL_ISSUE` FOREIGN KEY ( `DOCID` )
	REFERENCES `JOURNAL_VOLUME`( `DOCID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_PERSON_AUTHORS" ----------------------------
ALTER TABLE `AUTHORS`
	ADD CONSTRAINT `lnk_PERSON_AUTHORS` FOREIGN KEY ( `PID` )
	REFERENCES `PERSON`( `PID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_PERSON_CHAIR" ------------------------------
ALTER TABLE `CHAIR`
	ADD CONSTRAINT `lnk_PERSON_CHAIR` FOREIGN KEY ( `PID` )
	REFERENCES `PERSON`( `PID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_PERSON_GEDITS" -----------------------------
ALTER TABLE `GEDITS`
	ADD CONSTRAINT `lnk_PERSON_GEDITS` FOREIGN KEY ( `PID` )
	REFERENCES `PERSON`( `PID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_PERSON_JOURNAL_VOLUME" ---------------------
ALTER TABLE `JOURNAL_VOLUME`
	ADD CONSTRAINT `lnk_PERSON_JOURNAL_VOLUME` FOREIGN KEY ( `EDITOR` )
	REFERENCES `PERSON`( `PID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_PROCEEDINGS_CHAIR" -------------------------
ALTER TABLE `CHAIR`
	ADD CONSTRAINT `lnk_PROCEEDINGS_CHAIR` FOREIGN KEY ( `DOCID` )
	REFERENCES `PROCEEDINGS`( `DOCID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_PUBLISHER_DOCUMENT" ------------------------
ALTER TABLE `DOCUMENT`
	ADD CONSTRAINT `lnk_PUBLISHER_DOCUMENT` FOREIGN KEY ( `PUBLISHERID` )
	REFERENCES `PUBLISHER`( `PUBLISHERID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_READER_BORROWS" ----------------------------
ALTER TABLE `BORROWS`
	ADD CONSTRAINT `lnk_READER_BORROWS` FOREIGN KEY ( `RID` )
	REFERENCES `READER`( `RID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "lnk_READER_RESERVES" ---------------------------
ALTER TABLE `RESERVES`
	ADD CONSTRAINT `lnk_READER_RESERVES` FOREIGN KEY ( `RID` )
	REFERENCES `READER`( `RID` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE VIEW "v_computefine" ---------------------------------
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_computefine`
AS select `citylibrary`.`borrows`.`RID` AS `RID`,`citylibrary`.`borrows`.`BID` AS `BID`,`citylibrary`.`borrows`.`BDTIME` AS `BDTIME`,`citylibrary`.`borrows`.`RDTIME` AS `RDTIME`,((`citylibrary`.`borrows`.`RDTIME` - `citylibrary`.`borrows`.`BDTIME`) * 20) AS `Fine` from `citylibrary`.`borrows` where ((`citylibrary`.`borrows`.`RDTIME` - `citylibrary`.`borrows`.`BDTIME`) > 20);
-- -------------------------------------------------------------


-- CREATE VIEW "v_fine" ----------------------------------------
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_fine`
AS select `Br`.`RID` AS `RID`,`Br`.`BID` AS `BID`,`B`.`LNAME` AS `lNAME`,`Br`.`BDTIME` AS `BDTIME`,`Br`.`RDTIME` AS `RDTIME`,((`Br`.`RDTIME` - `Br`.`BDTIME`) * 20) AS `FINE` from `citylibrary`.`borrows` `Br` join `citylibrary`.`branch` `B` where ((`Br`.`BID` = `B`.`BID`) and (`Br`.`RDTIME` > '2019-01-01') and (`Br`.`RDTIME` < '2021-05-03') and ((`Br`.`RDTIME` - `Br`.`BDTIME`) > 20));
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


