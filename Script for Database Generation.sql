CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL,
  `pdescription` varchar(45) NOT NULL,
  `quantity_on_hand` int NOT NULL,
  `Item_Type` varchar(45) NOT NULL,
  `Unit` varchar(45) NOT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1000,'Bennet Farm free-range eggs',29,'Dairy','dozen'),(1100,'Freshness White beans',13,'Canned','12 oz can'),(1222,'Freshness Green beans',59,'Canned','12 ounce can'),(1223,'Freshness Green beans',12,'Canned','36 ounce can'),(1224,'Freshness Wax beans',31,'Canned','12 ounce can'),(2000,'Ruby\'s Kale',3,'Produce','bunch'),(2001,'Ruby\'s Organic Kale',20,'Produce','bunch');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `Vendor_idVendor` int NOT NULL,
  `Product_idProduct` int NOT NULL,
  `Purchase_Date` date NOT NULL,
  `Quantity` int NOT NULL,
  `Cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Vendor_idVendor`,`Product_idProduct`),
  KEY `fk_Vendor_has_Product_Product2_idx` (`Product_idProduct`),
  KEY `fk_Vendor_has_Product_Vendor1_idx` (`Vendor_idVendor`),
  CONSTRAINT `fk_Vendor_has_Product_Product2` FOREIGN KEY (`Product_idProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_Vendor_has_Product_Vendor1` FOREIGN KEY (`Vendor_idVendor`) REFERENCES `vendor` (`idVendor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,1000,'2022-01-02',25,2.35),(2,1100,'2022-02-02',40,0.69),(3,1222,'2022-10-02',40,0.59),(3,1224,'2022-10-02',30,0.65),(4,1223,'2022-10-02',10,1.75),(5,2000,'2022-12-02',25,1.29),(6,2001,'2022-12-02',20,2.19);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `Vendor_idVendor` int NOT NULL,
  `Product_idProduct` int NOT NULL,
  `Date_Sold` date NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Quantity` int NOT NULL,
  `Customer` varchar(45) DEFAULT NULL,
  KEY `fk_Vendor_has_Product_Product1_idx` (`Product_idProduct`),
  KEY `fk_Vendor_has_Product_Vendor_idx` (`Vendor_idVendor`),
  CONSTRAINT `fk_Vendor_has_Product_Product1` FOREIGN KEY (`Product_idProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_Vendor_has_Product_Vendor` FOREIGN KEY (`Vendor_idVendor`) REFERENCES `vendor` (`idVendor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1000,'2022-02-02',5.49,2,'198765'),(2,1100,'2022-02-02',1.49,2,'202900'),(5,2000,'2022-02-02',3.99,2,NULL),(5,1000,'2022-02-04',5.99,2,'196777'),(2,1100,'2022-02-07',1.49,8,'198765'),(5,1000,'2022-02-11',5.49,4,'277177'),(2,1100,'2022-02-11',1.49,4,NULL),(3,1222,'2022-02-12',1.29,12,'111000'),(3,1224,'2022-02-12',1.55,8,NULL),(4,1223,'2022-02-13',3.49,5,'198765'),(6,2001,'2022-02-13',6.99,1,'100988'),(6,2001,'2022-02-14',6.99,12,'202900');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `idVendor` int NOT NULL,
  `Vendor_Name` varchar(150) NOT NULL,
  `Location` varchar(45) NOT NULL,
  PRIMARY KEY (`idVendor`,`Location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'Bennet Farms, Rt. 17 Evansville, IL 55446','D12'),(2,'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678','a2'),(3,'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678','a3'),(4,'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678','a7'),(5,'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567','P12'),(6,'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567','PO2');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-25 22:52:10
