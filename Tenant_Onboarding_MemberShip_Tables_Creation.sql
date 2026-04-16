-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: eeqppx8794_concord_memberships
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `memberpaymentstatus`
--

DROP TABLE IF EXISTS `memberpaymentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberpaymentstatus` (
  `MembershipPaymentId` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime(6) DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime(6) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `MemberId` bigint NOT NULL,
  `paymentFailedMessage` varchar(500) DEFAULT NULL,
  `PaymentIntent` varchar(50) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `paymentOrderId` varchar(255) DEFAULT NULL,
  `PaymentResponse` longtext,
  `PaymentStatus` varchar(50) DEFAULT NULL,
  `PlanId` bigint DEFAULT NULL,
  PRIMARY KEY (`MembershipPaymentId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberpaymentstatus`
--

LOCK TABLES `memberpaymentstatus` WRITE;
/*!40000 ALTER TABLE `memberpaymentstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `memberpaymentstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Site` varchar(255) DEFAULT NULL,
  `TenantID` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime(6) DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK9d30a9u1qpg8eou0otgkwrp5d` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_fulfillment_schedule`
--

DROP TABLE IF EXISTS `membership_fulfillment_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_fulfillment_schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `membership_id` bigint NOT NULL,
  `fulfillment_date` date NOT NULL,
  `payment_due_date` date NOT NULL,
  `email_notification_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `payment_reference` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime(6) DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime(6) DEFAULT NULL,
  `Site` varchar(255) DEFAULT NULL,
  `TenantID` varchar(255) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mfs_membership` (`membership_id`),
  CONSTRAINT `fk_mfs_membership` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_fulfillment_schedule`
--

LOCK TABLES `membership_fulfillment_schedule` WRITE;
/*!40000 ALTER TABLE `membership_fulfillment_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_fulfillment_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_plan_fulfillment_dates`
--

DROP TABLE IF EXISTS `membership_plan_fulfillment_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_plan_fulfillment_dates` (
  `plan_id` bigint NOT NULL,
  `fulfillment_date` date DEFAULT NULL,
  KEY `FKq1if8ljk6eb6cik2uau8oipqs` (`plan_id`),
  CONSTRAINT `FKq1if8ljk6eb6cik2uau8oipqs` FOREIGN KEY (`plan_id`) REFERENCES `membership_plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membership_plans`
--

DROP TABLE IF EXISTS `membership_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_plans` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Site` varchar(255) DEFAULT NULL,
  `TenantID` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime(6) DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime(6) DEFAULT NULL,
  `complimentary` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `discountPercent` int DEFAULT NULL,
  `email_days` int DEFAULT NULL,
  `imageUrl` varchar(500) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `payment_days` int DEFAULT NULL,
  `perks` varchar(2000) DEFAULT NULL,
  `pickup_address` varchar(255) DEFAULT NULL,
  `productBundle` varchar(255) DEFAULT NULL,
  `productsPerShipment` int DEFAULT NULL,
  `productsPerYear` int DEFAULT NULL,
  `shipmentsPerYear` int DEFAULT NULL,
  `shippingPolicy` varchar(255) DEFAULT NULL,
  `termsAndConditions` varchar(2000) DEFAULT NULL,
  `tier` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKnconflq2x1uvxvs7sc0mnmh4` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberships` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Site` varchar(255) DEFAULT NULL,
  `TenantID` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime(6) DEFAULT NULL,
  `LastModifiedBy` varchar(255) DEFAULT NULL,
  `LastModifiedDate` datetime(6) DEFAULT NULL,
  `billing_city` varchar(255) DEFAULT NULL,
  `billing_country` varchar(255) DEFAULT NULL,
  `billing_postal_code` varchar(255) DEFAULT NULL,
  `billing_state` varchar(255) DEFAULT NULL,
  `billing_street` varchar(255) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `delivery_city` varchar(255) DEFAULT NULL,
  `delivery_country` varchar(255) DEFAULT NULL,
  `delivery_postal_code` varchar(255) DEFAULT NULL,
  `delivery_state` varchar(255) DEFAULT NULL,
  `delivery_street` varchar(255) DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `membershipStatus` enum('CANCELLED','CONFIRMED','EXPIRED','PAYMENT_FAILED','PENDING_PAYMENT') DEFAULT NULL,
  `stripe_payment_intent_id` varchar(150) DEFAULT NULL,
  `startDate` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `stripe_customer_id` varchar(150) DEFAULT NULL,
  `stripe_payment_method_id` varchar(150) DEFAULT NULL,
  `member_id` bigint NOT NULL,
  `plan_id` bigint NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `member_cart_id` bigint DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkv2gm8d7nl8u1nrfvxt6tbwhc` (`member_id`),
  KEY `FKltstb0n7ilare6ei97tafb7fw` (`plan_id`),
  CONSTRAINT `FKkv2gm8d7nl8u1nrfvxt6tbwhc` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `FKltstb0n7ilare6ei97tafb7fw` FOREIGN KEY (`plan_id`) REFERENCES `membership_plans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_job_instance`
--

DROP TABLE IF EXISTS `batch_job_instance`;
CREATE TABLE `batch_job_instance` (
  `JOB_INSTANCE_ID` BIGINT NOT NULL AUTO_INCREMENT,
  `VERSION` BIGINT,
  `JOB_NAME` VARCHAR(100) NOT NULL,
  `JOB_KEY` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`JOB_INSTANCE_ID`),
  UNIQUE KEY `job_inst_un` (`JOB_NAME`, `JOB_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `batch_job_execution`
--

DROP TABLE IF EXISTS `batch_job_execution`;
CREATE TABLE `batch_job_execution` (
  `JOB_EXECUTION_ID` BIGINT NOT NULL AUTO_INCREMENT,
  `VERSION` BIGINT,
  `JOB_INSTANCE_ID` BIGINT NOT NULL,
  `CREATE_TIME` DATETIME(6) NOT NULL,
  `START_TIME` DATETIME(6) DEFAULT NULL,
  `END_TIME` DATETIME(6) DEFAULT NULL,
  `STATUS` VARCHAR(10),
  `EXIT_CODE` VARCHAR(2500),
  `EXIT_MESSAGE` VARCHAR(2500),
  `LAST_UPDATED` DATETIME(6),
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  CONSTRAINT `job_inst_exec_fk` FOREIGN KEY (`JOB_INSTANCE_ID`)
  REFERENCES `batch_job_instance` (`JOB_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `batch_job_execution_params`
--

DROP TABLE IF EXISTS `batch_job_execution_params`;
CREATE TABLE `batch_job_execution_params` (
  `JOB_EXECUTION_ID` BIGINT NOT NULL,
  `PARAMETER_NAME` VARCHAR(100) NOT NULL,
  `PARAMETER_TYPE` VARCHAR(100) NOT NULL,
  `PARAMETER_VALUE` VARCHAR(2500),
  `IDENTIFYING` CHAR(1) NOT NULL,
  PRIMARY KEY (`JOB_EXECUTION_ID`, `PARAMETER_NAME`),
  CONSTRAINT `job_exec_params_fk` FOREIGN KEY (`JOB_EXECUTION_ID`)
  REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `batch_job_execution_context`
--

DROP TABLE IF EXISTS `batch_job_execution_context`;
CREATE TABLE `batch_job_execution_context` (
  `JOB_EXECUTION_ID` BIGINT NOT NULL,
  `SHORT_CONTEXT` VARCHAR(2500),
  `SERIALIZED_CONTEXT` TEXT,
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  CONSTRAINT `job_exec_ctx_fk` FOREIGN KEY (`JOB_EXECUTION_ID`)
  REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `batch_step_execution`
--

DROP TABLE IF EXISTS `batch_step_execution`;
CREATE TABLE `batch_step_execution` (
  `STEP_EXECUTION_ID` BIGINT NOT NULL AUTO_INCREMENT,
  `VERSION` BIGINT NOT NULL,
  `STEP_NAME` VARCHAR(100) NOT NULL,
  `JOB_EXECUTION_ID` BIGINT NOT NULL,
  `CREATE_TIME` DATETIME(6) NOT NULL,
  `START_TIME` DATETIME(6) DEFAULT NULL,
  `END_TIME` DATETIME(6) DEFAULT NULL,
  `STATUS` VARCHAR(10),
  `COMMIT_COUNT` BIGINT,
  `READ_COUNT` BIGINT,
  `FILTER_COUNT` BIGINT,
  `WRITE_COUNT` BIGINT,
  `READ_SKIP_COUNT` BIGINT,
  `WRITE_SKIP_COUNT` BIGINT,
  `PROCESS_SKIP_COUNT` BIGINT,
  `ROLLBACK_COUNT` BIGINT,
  `EXIT_CODE` VARCHAR(2500),
  `EXIT_MESSAGE` VARCHAR(2500),
  `LAST_UPDATED` DATETIME(6),
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  CONSTRAINT `job_exec_step_fk` FOREIGN KEY (`JOB_EXECUTION_ID`)
  REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `batch_step_execution_context`
--

DROP TABLE IF EXISTS `batch_step_execution_context`;
CREATE TABLE `batch_step_execution_context` (
  `STEP_EXECUTION_ID` BIGINT NOT NULL,
  `SHORT_CONTEXT` VARCHAR(2500),
  `SERIALIZED_CONTEXT` TEXT,
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  CONSTRAINT `step_exec_ctx_fk` FOREIGN KEY (`STEP_EXECUTION_ID`)
  REFERENCES `batch_step_execution` (`STEP_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `batch_job_seq`
--

DROP TABLE IF EXISTS `batch_job_seq`;
CREATE TABLE `batch_job_seq` (
  `ID` BIGINT NOT NULL,
  `UNIQUE_KEY` CHAR(1) NOT NULL,
  PRIMARY KEY (`ID`, `UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `batch_job_seq` (`ID`, `UNIQUE_KEY`) SELECT * FROM (SELECT 0 AS ID, '0' AS UNIQUE_KEY) AS tmp
WHERE NOT EXISTS (SELECT * FROM `batch_job_seq`);

--
-- Table structure for table `batch_job_execution_seq`
--

DROP TABLE IF EXISTS `batch_job_execution_seq`;
CREATE TABLE `batch_job_execution_seq` (
  `ID` BIGINT NOT NULL,
  `UNIQUE_KEY` CHAR(1) NOT NULL,
  PRIMARY KEY (`ID`, `UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `batch_job_execution_seq` (`ID`, `UNIQUE_KEY`) SELECT * FROM (SELECT 0 AS ID, '0' AS UNIQUE_KEY) AS tmp
WHERE NOT EXISTS (SELECT * FROM `batch_job_execution_seq`);

--
-- Table structure for table `batch_step_execution_seq`
--

DROP TABLE IF EXISTS `batch_step_execution_seq`;
CREATE TABLE `batch_step_execution_seq` (
  `ID` BIGINT NOT NULL,
  `UNIQUE_KEY` CHAR(1) NOT NULL,
  PRIMARY KEY (`ID`, `UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;