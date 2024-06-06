-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: jobportal
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CertificationsDetail`
--

DROP TABLE IF EXISTS `CertificationsDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CertificationsDetail` (
  `certificationsDetailPKID` bigint NOT NULL AUTO_INCREMENT,
  `userModelPKID` varchar(255) DEFAULT NULL,
  `technology` varchar(255) DEFAULT NULL,
  `certificationName` varchar(255) DEFAULT NULL,
  `certificationId` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `uploadedCertificateName` varchar(1000) DEFAULT NULL,
  `certificateNeverExpires` varchar(255) DEFAULT NULL,
  `certificationFromYear` varchar(255) DEFAULT NULL,
  `certificationToYear` varchar(255) DEFAULT NULL,
  `certificationsDetailCreatedDate` datetime(6) NOT NULL,
  `certificationsDetailUpdatedDate` datetime(6) NOT NULL,
  PRIMARY KEY (`certificationsDetailPKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CertificationsDetail`
--

LOCK TABLES `CertificationsDetail` WRITE;
/*!40000 ALTER TABLE `CertificationsDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `CertificationsDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EducationDetail`
--

DROP TABLE IF EXISTS `EducationDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EducationDetail` (
  `educationDetailPKID` bigint NOT NULL AUTO_INCREMENT,
  `userModelPKID` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `modeOfLearning` varchar(255) DEFAULT NULL,
  `fromYear` varchar(255) DEFAULT NULL,
  `toYear` varchar(255) DEFAULT NULL,
  `educationDetailCreatedDate` datetime(6) NOT NULL,
  `educationDetailUpdatedDate` datetime(6) NOT NULL,
  PRIMARY KEY (`educationDetailPKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EducationDetail`
--

LOCK TABLES `EducationDetail` WRITE;
/*!40000 ALTER TABLE `EducationDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `EducationDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageTable`
--

DROP TABLE IF EXISTS `ImageTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ImageTable` (
  `imageTablePKID` bigint NOT NULL AUTO_INCREMENT,
  `imageName` varchar(255) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `imageStatus` varchar(255) DEFAULT NULL,
  `imageDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`imageTablePKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageTable`
--

LOCK TABLES `ImageTable` WRITE;
/*!40000 ALTER TABLE `ImageTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImageTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobSeekerProfile`
--

DROP TABLE IF EXISTS `JobSeekerProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JobSeekerProfile` (
  `jobSeekerProfilePKID` bigint NOT NULL AUTO_INCREMENT,
  `userModelPKID` varchar(255) DEFAULT NULL,
  `salutation` varchar(20) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `totalExperience` varchar(20) DEFAULT NULL,
  `trainingExp` varchar(20) DEFAULT NULL,
  `mobileNumber` varchar(20) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `currentLocationCountry` varchar(100) DEFAULT NULL,
  `currentLocationState` varchar(100) DEFAULT NULL,
  `profilePictureName` varchar(1000) DEFAULT NULL,
  `uploadedResumeName` varchar(1000) DEFAULT NULL,
  `S3BucketURL` varchar(255) DEFAULT NULL,
  `travelWithInYourCountry` varchar(25) DEFAULT NULL,
  `travelOutSideCountry` varchar(25) DEFAULT NULL,
  `workingTimeZone` varchar(2000) DEFAULT NULL,
  `skills` varchar(2000) DEFAULT NULL,
  `socialMedia` longtext,
  `profileCompleteScore` varchar(20) DEFAULT NULL,
  `jobSeekerProfileCreatedDate` datetime(6) NOT NULL,
  `jobSeekerProfileUpdatedDate` datetime(6) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`jobSeekerProfilePKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobSeekerProfile`
--

LOCK TABLES `JobSeekerProfile` WRITE;
/*!40000 ALTER TABLE `JobSeekerProfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `JobSeekerProfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonalDetail`
--

DROP TABLE IF EXISTS `PersonalDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersonalDetail` (
  `personalDetailPKID` bigint NOT NULL AUTO_INCREMENT,
  `userModelPKID` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `martialStatus` varchar(255) DEFAULT NULL,
  `secSalutation` varchar(255) DEFAULT NULL,
  `secFirstName` varchar(255) DEFAULT NULL,
  `secLastName` varchar(255) DEFAULT NULL,
  `secContactCountryCode` varchar(255) DEFAULT NULL,
  `secondaryNumber` varchar(255) DEFAULT NULL,
  `emgSalutation` varchar(255) DEFAULT NULL,
  `emgFirstName` varchar(255) DEFAULT NULL,
  `emgLastName` varchar(255) DEFAULT NULL,
  `emgContactCountryCode` varchar(255) DEFAULT NULL,
  `emergencyNumber` varchar(255) DEFAULT NULL,
  `aadharNumber` varchar(255) DEFAULT NULL,
  `panNumber` varchar(255) DEFAULT NULL,
  `passportNumber` longtext,
  `address` longtext,
  `languages` longtext,
  `visa` varchar(255) DEFAULT NULL,
  `visaInfo` longtext,
  `differentlyAbled` varchar(255) DEFAULT NULL,
  `personalDetailCreatedData` datetime(6) NOT NULL,
  `personalDetailUpdatedData` datetime(6) NOT NULL,
  PRIMARY KEY (`personalDetailPKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonalDetail`
--

LOCK TABLES `PersonalDetail` WRITE;
/*!40000 ALTER TABLE `PersonalDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersonalDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProfileScoreDetail`
--

DROP TABLE IF EXISTS `ProfileScoreDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProfileScoreDetail` (
  `ProfileScoreDetailPKID` bigint NOT NULL AUTO_INCREMENT,
  `sectionDescription` varchar(200) DEFAULT NULL,
  `score` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ProfileScoreDetailPKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProfileScoreDetail`
--

LOCK TABLES `ProfileScoreDetail` WRITE;
/*!40000 ALTER TABLE `ProfileScoreDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProfileScoreDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SkillsDetails`
--

DROP TABLE IF EXISTS `SkillsDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SkillsDetails` (
  `skillsDetailsPKID` bigint NOT NULL AUTO_INCREMENT,
  `skillName` varchar(2000) DEFAULT NULL,
  `skillStatus` varchar(20) DEFAULT NULL,
  `skillsDetailsCreatedDate` datetime(6) NOT NULL,
  `skillsDetailsUpdatedDate` datetime(6) NOT NULL,
  PRIMARY KEY (`skillsDetailsPKID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SkillsDetails`
--

LOCK TABLES `SkillsDetails` WRITE;
/*!40000 ALTER TABLE `SkillsDetails` DISABLE KEYS */;
INSERT INTO `SkillsDetails` VALUES (1,'Linux','active','2024-05-18 12:47:02.029903','2024-05-18 12:47:02.029997'),(2,'Git','active','2024-05-18 12:47:06.283644','2024-05-18 12:47:06.283737');
/*!40000 ALTER TABLE `SkillsDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrainingExperience`
--

DROP TABLE IF EXISTS `TrainingExperience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrainingExperience` (
  `trainingExperiencePKID` bigint NOT NULL AUTO_INCREMENT,
  `userModelPKID` varchar(255) DEFAULT NULL,
  `profileName` varchar(255) DEFAULT NULL,
  `trainingTechnology` varchar(255) DEFAULT NULL,
  `clientDelivered` varchar(255) DEFAULT NULL,
  `trainingDuration` varchar(255) DEFAULT NULL,
  `totalNoOfTrainings` varchar(255) DEFAULT NULL,
  `dateOfLastTraining` varchar(255) DEFAULT NULL,
  `totalTrainingExperience` varchar(255) DEFAULT NULL,
  `deliveryMethod` varchar(255) DEFAULT NULL,
  `demoLink` varchar(255) DEFAULT NULL,
  `uploadedFeedbackName` varchar(1000) DEFAULT NULL,
  `uploadedTocName` varchar(1000) DEFAULT NULL,
  `projectTitle` varchar(255) DEFAULT NULL,
  `projectDescription` varchar(255) DEFAULT NULL,
  `selectedCommercialsCurrency` varchar(255) DEFAULT NULL,
  `commercialsCurrency` varchar(255) DEFAULT NULL,
  `forLessThan4hrs` varchar(255) DEFAULT NULL,
  `for4hrs` varchar(255) DEFAULT NULL,
  `for8hrs` varchar(255) DEFAULT NULL,
  `trainingExperienceCreatedDate` datetime(6) NOT NULL,
  `trainingExperienceUpdatedDate` datetime(6) NOT NULL,
  PRIMARY KEY (`trainingExperiencePKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrainingExperience`
--

LOCK TABLES `TrainingExperience` WRITE;
/*!40000 ALTER TABLE `TrainingExperience` DISABLE KEYS */;
/*!40000 ALTER TABLE `TrainingExperience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkExperience`
--

DROP TABLE IF EXISTS `WorkExperience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkExperience` (
  `workExperiencePKID` bigint NOT NULL AUTO_INCREMENT,
  `userModelPKID` varchar(255) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `technology` varchar(255) DEFAULT NULL,
  `employmentType` varchar(255) DEFAULT NULL,
  `dateOfJoining` varchar(255) DEFAULT NULL,
  `dateOfLeaving` varchar(255) DEFAULT NULL,
  `jobProfile` varchar(255) DEFAULT NULL,
  `workExperienceCreatedDate` datetime(6) NOT NULL,
  `workExperienceUpdatedDate` datetime(6) NOT NULL,
  PRIMARY KEY (`workExperiencePKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkExperience`
--

LOCK TABLES `WorkExperience` WRITE;
/*!40000 ALTER TABLE `WorkExperience` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkExperience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkSample`
--

DROP TABLE IF EXISTS `WorkSample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkSample` (
  `workSamplePKID` bigint NOT NULL AUTO_INCREMENT,
  `userModelPKID` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(2550) DEFAULT NULL,
  `workUrl` varchar(2550) DEFAULT NULL,
  `uploadedWorkSampleName` varchar(1000) DEFAULT NULL,
  `workSampleCreatedDate` datetime(6) NOT NULL,
  `workSampleUpdatedDate` datetime(6) NOT NULL,
  PRIMARY KEY (`workSamplePKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkSample`
--

LOCK TABLES `WorkSample` WRITE;
/*!40000 ALTER TABLE `WorkSample` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkSample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'company'),(2,'jobseeker');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add certifications detail',6,'add_certificationsdetail'),(22,'Can change certifications detail',6,'change_certificationsdetail'),(23,'Can delete certifications detail',6,'delete_certificationsdetail'),(24,'Can view certifications detail',6,'view_certificationsdetail'),(25,'Can add education detail',7,'add_educationdetail'),(26,'Can change education detail',7,'change_educationdetail'),(27,'Can delete education detail',7,'delete_educationdetail'),(28,'Can view education detail',7,'view_educationdetail'),(29,'Can add image table',8,'add_imagetable'),(30,'Can change image table',8,'change_imagetable'),(31,'Can delete image table',8,'delete_imagetable'),(32,'Can view image table',8,'view_imagetable'),(33,'Can add job seeker profile',9,'add_jobseekerprofile'),(34,'Can change job seeker profile',9,'change_jobseekerprofile'),(35,'Can delete job seeker profile',9,'delete_jobseekerprofile'),(36,'Can view job seeker profile',9,'view_jobseekerprofile'),(37,'Can add personal detail',10,'add_personaldetail'),(38,'Can change personal detail',10,'change_personaldetail'),(39,'Can delete personal detail',10,'delete_personaldetail'),(40,'Can view personal detail',10,'view_personaldetail'),(41,'Can add profile score detail',11,'add_profilescoredetail'),(42,'Can change profile score detail',11,'change_profilescoredetail'),(43,'Can delete profile score detail',11,'delete_profilescoredetail'),(44,'Can view profile score detail',11,'view_profilescoredetail'),(45,'Can add skills details',12,'add_skillsdetails'),(46,'Can change skills details',12,'change_skillsdetails'),(47,'Can delete skills details',12,'delete_skillsdetails'),(48,'Can view skills details',12,'view_skillsdetails'),(49,'Can add training experience',13,'add_trainingexperience'),(50,'Can change training experience',13,'change_trainingexperience'),(51,'Can delete training experience',13,'delete_trainingexperience'),(52,'Can view training experience',13,'view_trainingexperience'),(53,'Can add work experience',14,'add_workexperience'),(54,'Can change work experience',14,'change_workexperience'),(55,'Can delete work experience',14,'delete_workexperience'),(56,'Can view work experience',14,'view_workexperience'),(57,'Can add work sample',15,'add_worksample'),(58,'Can change work sample',15,'change_worksample'),(59,'Can delete work sample',15,'delete_worksample'),(60,'Can view work sample',15,'view_worksample'),(61,'Can add user',16,'add_user'),(62,'Can change user',16,'change_user'),(63,'Can delete user',16,'delete_user'),(64,'Can view user',16,'view_user'),(65,'Can add Token',17,'add_token'),(66,'Can change Token',17,'change_token'),(67,'Can delete Token',17,'delete_token'),(68,'Can view Token',17,'view_token'),(69,'Can add Token',18,'add_tokenproxy'),(70,'Can change Token',18,'change_tokenproxy'),(71,'Can delete Token',18,'delete_tokenproxy'),(72,'Can view Token',18,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_myapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_myapp_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_myapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-05-18 12:47:02.035415','1','1 : Linux ',1,'[{\"added\": {}}]',12,1),(2,'2024-05-18 12:47:06.290812','2','2 : Git ',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(17,'authtoken','token'),(18,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(6,'myapp','certificationsdetail'),(7,'myapp','educationdetail'),(8,'myapp','imagetable'),(9,'myapp','jobseekerprofile'),(10,'myapp','personaldetail'),(11,'myapp','profilescoredetail'),(12,'myapp','skillsdetails'),(13,'myapp','trainingexperience'),(16,'myapp','user'),(14,'myapp','workexperience'),(15,'myapp','worksample'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-18 12:44:29.633042'),(2,'contenttypes','0002_remove_content_type_name','2024-05-18 12:44:29.943260'),(3,'auth','0001_initial','2024-05-18 12:44:30.990854'),(4,'auth','0002_alter_permission_name_max_length','2024-05-18 12:44:31.293866'),(5,'auth','0003_alter_user_email_max_length','2024-05-18 12:44:31.322405'),(6,'auth','0004_alter_user_username_opts','2024-05-18 12:44:31.357730'),(7,'auth','0005_alter_user_last_login_null','2024-05-18 12:44:31.393953'),(8,'auth','0006_require_contenttypes_0002','2024-05-18 12:44:31.419090'),(9,'auth','0007_alter_validators_add_error_messages','2024-05-18 12:44:31.453681'),(10,'auth','0008_alter_user_username_max_length','2024-05-18 12:44:31.483695'),(11,'auth','0009_alter_user_last_name_max_length','2024-05-18 12:44:31.519347'),(12,'auth','0010_alter_group_name_max_length','2024-05-18 12:44:31.601109'),(13,'auth','0011_update_proxy_permissions','2024-05-18 12:44:31.650957'),(14,'auth','0012_alter_user_first_name_max_length','2024-05-18 12:44:31.767610'),(15,'myapp','0001_initial','2024-05-18 12:44:34.253789'),(16,'admin','0001_initial','2024-05-18 12:44:34.670188'),(17,'admin','0002_logentry_remove_auto_add','2024-05-18 12:44:34.694521'),(18,'admin','0003_logentry_add_action_flag_choices','2024-05-18 12:44:34.723767'),(19,'authtoken','0001_initial','2024-05-18 12:44:35.010025'),(20,'authtoken','0002_auto_20160226_1747','2024-05-18 12:44:35.177896'),(21,'authtoken','0003_tokenproxy','2024-05-18 12:44:35.201639'),(22,'authtoken','0004_alter_tokenproxy_options','2024-05-18 12:44:35.242780'),(23,'sessions','0001_initial','2024-05-18 12:44:35.493087');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_user`
--

DROP TABLE IF EXISTS `myapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `userCreatedDate` datetime(6) NOT NULL,
  `userUpdatedDate` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `is_verified_tc` tinyint(1) NOT NULL,
  `is_verified_mobile` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `otp` varchar(6) DEFAULT NULL,
  `auth_provider` varchar(255) NOT NULL,
  `created_by_id` bigint DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile_number` (`mobile_number`),
  KEY `myapp_user_created_by_id_6d2c94fa_fk_myapp_user_id` (`created_by_id`),
  KEY `myapp_user_group_id_a0174ed3_fk_auth_group_id` (`group_id`),
  KEY `myapp_user_username_a1e18371` (`username`),
  CONSTRAINT `myapp_user_created_by_id_6d2c94fa_fk_myapp_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `myapp_user` (`id`),
  CONSTRAINT `myapp_user_group_id_a0174ed3_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_user`
--

LOCK TABLES `myapp_user` WRITE;
/*!40000 ALTER TABLE `myapp_user` DISABLE KEYS */;
INSERT INTO `myapp_user` VALUES (1,'pbkdf2_sha256$600000$Vstn7R7cLmwnO97ihDavBi$ZPPKvyYl6+Mmain09rgxLkbqf2k9w1z4EGIDCQCKiLs=','2024-05-18 12:46:56.549186',1,'2024-05-18 12:46:20.283547','2024-05-18 12:46:20.301342','e00049','silambarasancv.rajendran@gmail.com',NULL,0,0,0,1,1,NULL,'email',NULL,NULL);
/*!40000 ALTER TABLE `myapp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_user_groups`
--

DROP TABLE IF EXISTS `myapp_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_user_groups_user_id_group_id_1ef5feb7_uniq` (`user_id`,`group_id`),
  KEY `myapp_user_groups_group_id_488eb0fb_fk_auth_group_id` (`group_id`),
  CONSTRAINT `myapp_user_groups_group_id_488eb0fb_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `myapp_user_groups_user_id_925f87c5_fk_myapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_user_groups`
--

LOCK TABLES `myapp_user_groups` WRITE;
/*!40000 ALTER TABLE `myapp_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_user_user_permissions`
--

DROP TABLE IF EXISTS `myapp_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_user_user_permissions_user_id_permission_id_13102f46_uniq` (`user_id`,`permission_id`),
  KEY `myapp_user_user_perm_permission_id_4657f93a_fk_auth_perm` (`permission_id`),
  CONSTRAINT `myapp_user_user_perm_permission_id_4657f93a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `myapp_user_user_permissions_user_id_3f0ef5c3_fk_myapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_user_user_permissions`
--

LOCK TABLES `myapp_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `myapp_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-18 12:48:15
