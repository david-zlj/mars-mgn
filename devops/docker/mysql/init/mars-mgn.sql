-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mars-mgn
-- ------------------------------------------------------
-- Server version	8.0.39

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add system users',6,'add_systemusers'),(22,'Can change system users',6,'change_systemusers'),(23,'Can delete system users',6,'delete_systemusers'),(24,'Can view system users',6,'view_systemusers'),(25,'Can add system dept',7,'add_systemdept'),(26,'Can change system dept',7,'change_systemdept'),(27,'Can delete system dept',7,'delete_systemdept'),(28,'Can view system dept',7,'view_systemdept'),(29,'Can add system menu',8,'add_systemmenu'),(30,'Can change system menu',8,'change_systemmenu'),(31,'Can delete system menu',8,'delete_systemmenu'),(32,'Can view system menu',8,'view_systemmenu'),(33,'Can add system post',9,'add_systempost'),(34,'Can change system post',9,'change_systempost'),(35,'Can delete system post',9,'delete_systempost'),(36,'Can view system post',9,'view_systempost'),(37,'Can add system role',10,'add_systemrole'),(38,'Can change system role',10,'change_systemrole'),(39,'Can delete system role',10,'delete_systemrole'),(40,'Can view system role',10,'view_systemrole'),(41,'Can add system role menu',11,'add_systemrolemenu'),(42,'Can change system role menu',11,'change_systemrolemenu'),(43,'Can delete system role menu',11,'delete_systemrolemenu'),(44,'Can view system role menu',11,'view_systemrolemenu'),(45,'Can add system user post',12,'add_systemuserpost'),(46,'Can change system user post',12,'change_systemuserpost'),(47,'Can delete system user post',12,'delete_systemuserpost'),(48,'Can view system user post',12,'view_systemuserpost'),(49,'Can add system user role',13,'add_systemuserrole'),(50,'Can change system user role',13,'change_systemuserrole'),(51,'Can delete system user role',13,'delete_systemuserrole'),(52,'Can view system user role',13,'view_systemuserrole'),(53,'Can add crontab',14,'add_crontabschedule'),(54,'Can change crontab',14,'change_crontabschedule'),(55,'Can delete crontab',14,'delete_crontabschedule'),(56,'Can view crontab',14,'view_crontabschedule'),(57,'Can add interval',15,'add_intervalschedule'),(58,'Can change interval',15,'change_intervalschedule'),(59,'Can delete interval',15,'delete_intervalschedule'),(60,'Can view interval',15,'view_intervalschedule'),(61,'Can add periodic task',16,'add_periodictask'),(62,'Can change periodic task',16,'change_periodictask'),(63,'Can delete periodic task',16,'delete_periodictask'),(64,'Can view periodic task',16,'view_periodictask'),(65,'Can add periodic task track',17,'add_periodictasks'),(66,'Can change periodic task track',17,'change_periodictasks'),(67,'Can delete periodic task track',17,'delete_periodictasks'),(68,'Can view periodic task track',17,'view_periodictasks'),(69,'Can add solar event',18,'add_solarschedule'),(70,'Can change solar event',18,'change_solarschedule'),(71,'Can delete solar event',18,'delete_solarschedule'),(72,'Can view solar event',18,'view_solarschedule'),(73,'Can add clocked',19,'add_clockedschedule'),(74,'Can change clocked',19,'change_clockedschedule'),(75,'Can delete clocked',19,'delete_clockedschedule'),(76,'Can view clocked',19,'view_clockedschedule'),(77,'Can add task result',20,'add_taskresult'),(78,'Can change task result',20,'change_taskresult'),(79,'Can delete task result',20,'delete_taskresult'),(80,'Can view task result',20,'view_taskresult'),(81,'Can add chord counter',21,'add_chordcounter'),(82,'Can change chord counter',21,'change_chordcounter'),(83,'Can delete chord counter',21,'delete_chordcounter'),(84,'Can view chord counter',21,'view_chordcounter'),(85,'Can add group result',22,'add_groupresult'),(86,'Can change group result',22,'change_groupresult'),(87,'Can delete group result',22,'delete_groupresult'),(88,'Can view group result',22,'view_groupresult'),(89,'Can add API Log',23,'add_apilogsmodel'),(90,'Can change API Log',23,'change_apilogsmodel'),(91,'Can delete API Log',23,'delete_apilogsmodel'),(92,'Can view API Log',23,'view_apilogsmodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_system_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_system_users_id` FOREIGN KEY (`user_id`) REFERENCES `system_users` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_clockedschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_clockedschedule`
--

LOCK TABLES `django_celery_beat_clockedschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_crontabschedule`
--

LOCK TABLES `django_celery_beat_crontabschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` DISABLE KEYS */;
INSERT INTO `django_celery_beat_crontabschedule` VALUES (1,'*','*','*','*','*','Asia/Shanghai'),(2,'0','0','*','1','1','Asia/Shanghai'),(3,'0','4','*','*','*','Asia/Shanghai');
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `every` int NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_intervalschedule`
--

LOCK TABLES `django_celery_beat_intervalschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictask`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int DEFAULT NULL,
  `interval_id` int DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int unsigned DEFAULT NULL,
  `headers` longtext NOT NULL DEFAULT (_utf8mb3'{}'),
  `clocked_id` int DEFAULT NULL,
  `expire_seconds` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`),
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`),
  CONSTRAINT `django_celery_beat_periodictask_chk_1` CHECK ((`total_run_count` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_2` CHECK ((`priority` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_3` CHECK ((`expire_seconds` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictask`
--

LOCK TABLES `django_celery_beat_periodictask` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` DISABLE KEYS */;
INSERT INTO `django_celery_beat_periodictask` VALUES (1,'错误日志清理 Job','errorLogCleanJob','[]','{}',NULL,NULL,NULL,NULL,0,NULL,0,'2025-04-16 10:20:13.979919','',2,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(2,'消息日志清理Job2','send_daily_report','[]','{}',NULL,NULL,NULL,NULL,0,NULL,0,'2025-04-16 13:17:24.323026','',1,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(4,'消息日志清理Job4','myapp_infra.tasks.send_daily_report','[]','{}',NULL,NULL,NULL,NULL,1,'2025-04-17 13:57:00.003571',178,'2025-04-17 13:57:10.034328','',1,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL),(7,'celery.backend_cleanup','celery.backend_cleanup','[]','{}',NULL,NULL,NULL,NULL,1,NULL,0,'2025-04-17 12:37:04.134365','',3,NULL,NULL,0,NULL,NULL,'{}',NULL,43200);
/*!40000 ALTER TABLE `django_celery_beat_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictasks`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictasks`
--

LOCK TABLES `django_celery_beat_periodictasks` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` DISABLE KEYS */;
INSERT INTO `django_celery_beat_periodictasks` VALUES (1,'2025-04-17 12:37:04.135364');
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_solarschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_solarschedule`
--

LOCK TABLES `django_celery_beat_solarschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_chordcounter`
--

DROP TABLE IF EXISTS `django_celery_results_chordcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_chordcounter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `sub_tasks` longtext NOT NULL,
  `count` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  CONSTRAINT `django_celery_results_chordcounter_chk_1` CHECK ((`count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_chordcounter`
--

LOCK TABLES `django_celery_results_chordcounter` WRITE;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_groupresult`
--

DROP TABLE IF EXISTS `django_celery_results_groupresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_groupresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  KEY `django_cele_date_cr_bd6c1d_idx` (`date_created`),
  KEY `django_cele_date_do_caae0e_idx` (`date_done`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_groupresult`
--

LOCK TABLES `django_celery_results_groupresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_groupresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_groupresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_taskresult`
--

DROP TABLE IF EXISTS `django_celery_results_taskresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `meta` longtext,
  `task_args` longtext,
  `task_kwargs` longtext,
  `task_name` varchar(255) DEFAULT NULL,
  `worker` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `periodic_task_name` varchar(255) DEFAULT NULL,
  `date_started` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_cele_task_na_08aec9_idx` (`task_name`),
  KEY `django_cele_status_9b6201_idx` (`status`),
  KEY `django_cele_worker_d54dd8_idx` (`worker`),
  KEY `django_cele_date_cr_f04a50_idx` (`date_created`),
  KEY `django_cele_date_do_f59aad_idx` (`date_done`),
  KEY `django_cele_periodi_1993cf_idx` (`periodic_task_name`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_taskresult`
--

LOCK TABLES `django_celery_results_taskresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_taskresult` DISABLE KEYS */;
INSERT INTO `django_celery_results_taskresult` VALUES (1,'c91e025e-c38e-40cf-afc7-5fde1a05c510','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:38:04.167674',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:38:04.167674',NULL,NULL),(2,'783a0ca9-ad8e-4ad3-beeb-6e349831edfb','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:38:04.189659',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:38:04.189659',NULL,NULL),(3,'116da4bf-c8c7-4510-9c7d-1db268bde216','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:39:00.012202',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:39:00.012202',NULL,NULL),(4,'833ce13f-16bf-47e3-a752-41ac7fde66b7','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:39:00.028192',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:39:00.028192',NULL,NULL),(5,'70d84d1f-eedd-4b1a-9e9b-30165c2d8943','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:40:00.021774',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:40:00.020776',NULL,NULL),(6,'df23a71c-9135-43b6-8e84-3779151e95cc','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:40:00.038763',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:40:00.038763',NULL,NULL),(7,'0590db55-25f4-45b3-98ec-f7e2f27048e6','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:41:00.015588',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:41:00.015588',NULL,NULL),(8,'25289042-11fe-4e92-860b-98dd806b4f13','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:41:00.028582',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:41:00.028582',NULL,NULL),(9,'a37f3178-4335-405f-b6f5-7deeb247e135','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:42:00.024645',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:42:00.023647',NULL,NULL),(10,'593984ca-cced-4fb2-99e4-f839a562eb5b','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:42:00.043631',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:42:00.043631',NULL,NULL),(11,'4482e811-fd0e-41b1-bfed-29b73156ac4c','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:43:00.020544',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:43:00.020544',NULL,NULL),(12,'e77b9257-0d97-4240-8f9f-0ad17cb3e4b4','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:43:00.038532',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:43:00.038532',NULL,NULL),(13,'8099520d-77ef-448e-8463-a1269f3fc487','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:44:00.014405',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:44:00.014405',NULL,NULL),(14,'3aee46b1-76d2-47fd-acf2-e121ee4b74af','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:44:00.029394',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:44:00.029394',NULL,NULL),(15,'38e009d2-3798-4092-8836-966d19e7ff33','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:45:00.012853',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:45:00.011851',NULL,NULL),(16,'3af16ed2-f737-46aa-84d8-6071b030d597','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:45:00.025122',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:45:00.025122',NULL,NULL),(17,'0fc74d8b-9098-47c9-8e36-b391584ed29a','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:46:00.029176',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:46:00.029176',NULL,NULL),(18,'1134c7a5-fe69-442a-ac1e-ba8622b1fe3f','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:46:00.051165',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:46:00.051165',NULL,NULL),(19,'73e38181-e36e-4118-b604-f8449e3aa6db','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:47:00.028381',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:47:00.027383',NULL,NULL),(20,'350cfe02-638b-43e8-844d-20a21b4210d8','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:47:00.042372',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:47:00.042372',NULL,NULL),(21,'5a551b54-2d95-4711-aec6-1cb426317a2c','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:48:00.010568',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:48:00.010568',NULL,NULL),(22,'6e502521-61f0-4def-90ce-221941229b5d','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:48:00.024559',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:48:00.024559',NULL,NULL),(23,'eca2e070-2eae-4011-93dd-03b379fc923d','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:49:34.184730',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:49:34.184730',NULL,NULL),(24,'940e0277-41c4-45bf-9cd3-61a2cd2d8759','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 13:49:34.203719',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:49:34.203719',NULL,NULL),(25,'1570a19d-01d4-4d5d-9e22-41759fe67e73','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:50:04.191564',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:50:04.191564',NULL,NULL),(26,'eaaa6e93-403e-443e-b075-70922cd48ea1','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:51:00.022376',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:51:00.022376',NULL,NULL),(27,'e4706569-0f46-4a77-bbcf-18cb1537eed8','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:52:00.007856',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:52:00.007856',NULL,NULL),(28,'e3cb3e53-e189-480b-bf08-8269bef606e5','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:53:00.016088',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:53:00.016088',NULL,NULL),(29,'8ab55b24-2b52-450b-9ad0-b5cd434d1363','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:54:00.011790',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:54:00.011790',NULL,NULL),(30,'bbbb3699-dc75-4e9e-b5a9-874451a6a2b4','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:55:00.008412',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:55:00.008412',NULL,NULL),(31,'3fcb50a1-3144-44b3-ae1f-94b959d439ea','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:56:00.011241',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:56:00.010241',NULL,NULL),(32,'b6d1debd-f261-4895-b309-7dcf97ee42f1','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:57:00.013110',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:57:00.013110',NULL,NULL),(33,'9f9eef17-18c0-433a-afa6-c0befde0057a','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:58:00.009464',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:58:00.009464',NULL,NULL),(34,'347a7937-a36c-4701-8bad-9abe7d492bcf','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 13:59:00.013579',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 13:59:00.013579',NULL,NULL),(35,'f60fbcf5-e991-467f-90b5-e2f559b4ae13','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:00:00.025306',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:00:00.025306',NULL,NULL),(36,'55cc28fe-2f60-41fe-8556-9eade154ba9f','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:01:00.007158',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:01:00.007158',NULL,NULL),(37,'06ff35af-644d-4e3a-81c8-7daf178d3046','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:02:00.010960',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:02:00.010960',NULL,NULL),(38,'1e7a9b55-792e-43d2-ba1c-fbca0af512bb','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:03:00.018499',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:03:00.018499',NULL,NULL),(39,'6dc5fea8-fafa-4e34-b8f4-be8ff391d3ca','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:04:00.008214',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:04:00.008214',NULL,NULL),(40,'35cf4790-e188-49ca-958f-e1fb9cbf439c','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:05:00.034592',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:05:00.034592',NULL,NULL),(41,'129d4745-7860-480b-8c07-5ab83893148b','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:06:00.018586',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:06:00.018586',NULL,NULL),(42,'30e98dbb-188e-40e3-b2f7-4ed89d11c079','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:07:00.007603',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:07:00.007603',NULL,NULL),(43,'f8018251-717d-4b1c-b865-81e9dd0bbd25','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:08:00.012681',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:08:00.012681',NULL,NULL),(44,'27bf4e99-6426-44fb-b15b-0f7c895ff840','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:09:00.018667',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:09:00.018667',NULL,NULL),(45,'83ba578c-11dc-42b9-aad6-194e497ee130','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:10:00.020095',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:10:00.020095',NULL,NULL),(46,'96bc25f7-3c67-45b1-845b-a44550da9ddc','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-16 14:11:00.012632',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 14:11:00.012632',NULL,NULL),(47,'67a18779-2795-4b74-9981-ee3148f5639c','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"myapp_infra.tasks.send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-16 23:59:13.591949',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-16 23:59:13.591949',NULL,NULL),(48,'49fb220a-5828-44ff-bfca-f5cc4a69ab28','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"myapp_infra.tasks.send_daily_report\"], \"exc_module\": \"celery.exceptions\"}','2025-04-17 00:02:13.683835',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-17 00:02:13.683835',NULL,NULL),(49,'f1d6c4d3-224f-4a51-b443-b09673eaec2d','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 00:08:11.010412',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-17 00:08:11.009412',NULL,NULL),(50,'b44567ad-a5ea-448c-91cf-d928cbafad44','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 00:09:11.440619',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-17 00:09:11.440619',NULL,NULL),(51,'54a305c8-ec55-4022-adcb-46b219c95c03','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 00:09:21.512762',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-17 00:09:21.512762',NULL,NULL),(52,'dbf6f581-4445-421d-82d4-b63e3618e27a','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 00:09:25.932394',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-17 00:09:25.932394',NULL,NULL),(53,'7753714d-fbc1-4dd6-9946-dae27f2b921d','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 00:10:52.772093',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-17 00:10:52.772093',NULL,NULL),(54,'3f363396-e5b1-4e7d-b30f-40f2619328e2','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 00:13:03.109575',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-17 00:13:03.109575',NULL,NULL),(55,'916045d2-3281-4fd7-a2e5-2dd654c5f62a','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 00:20:43.506674',NULL,'{\"children\": []}',NULL,NULL,NULL,NULL,'2025-04-17 00:20:43.506674',NULL,NULL),(56,'f2148cf2-7a98-4dba-976c-c419f761a659','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:36:54.765565',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:36:24.753932',NULL,'2025-04-17 16:36:24.754595'),(57,'6920d152-4892-4a51-b6e3-44c8c9521ea8','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:37:30.039980',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:37:00.025384',NULL,'2025-04-17 16:37:00.026905'),(58,'370b8229-597f-443d-bc78-69484acf7af8','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:38:30.036033',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:38:00.024516',NULL,'2025-04-17 16:38:00.025188'),(59,'e1f4f014-16f7-45e7-97f0-e92735021afb','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:39:30.046924',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:39:00.027025',NULL,'2025-04-17 16:39:00.027592'),(60,'a0e4c4aa-4cbe-4c5e-b9b9-699ba60a4cf0','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:40:30.025798',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:40:00.015403',NULL,'2025-04-17 16:40:00.016264'),(61,'febc0c2c-ec36-496e-abfc-32af47f68173','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:41:30.035652',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:41:00.024757',NULL,'2025-04-17 16:41:00.025571'),(62,'8933a2d4-b5c7-45f5-a715-8d1e1e4a1b10','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:42:30.018394',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:42:00.008917',NULL,'2025-04-17 16:42:00.009318'),(63,'8ba8387c-8a89-4b5e-83ac-be8e5970876b','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:43:30.022818',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:43:00.014232',NULL,'2025-04-17 16:43:00.014602'),(64,'3222d273-029c-4679-982a-367fd86fcea1','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:44:30.019226',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:44:00.008723',NULL,'2025-04-17 16:44:00.009564'),(65,'7f7e36a0-83fc-44a2-af44-8e883c503926','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:45:30.016881',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:45:00.008447',NULL,'2025-04-17 16:45:00.009283'),(66,'e3dd8f65-8cb8-4c36-b815-3518fd4f7f88','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:46:30.088350',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:46:00.079473',NULL,'2025-04-17 16:46:00.080275'),(67,'30606257-c337-4e10-b91e-2714712c38bd','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:47:30.033077',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:47:00.018850',NULL,'2025-04-17 16:47:00.019860'),(68,'e9db4e99-5e31-4304-b52c-896008a9b02f','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:48:30.019518',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:48:00.009159',NULL,'2025-04-17 16:48:00.010066'),(69,'4158b560-6311-4470-8b56-ec5d2ed3a72a','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:49:30.020650',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:49:00.010513',NULL,'2025-04-17 16:49:00.011087'),(70,'87d7f4b5-0f4a-448b-8eb3-0aa6c101efa2','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:50:30.019154',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:50:00.009294',NULL,'2025-04-17 16:50:00.010450'),(71,'fb619323-db58-41ed-b2fc-ef84c84b7656','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:51:30.040241',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:51:00.022155',NULL,'2025-04-17 16:51:00.022720'),(72,'db4dc067-38c1-4c3a-9303-32f38b681a2a','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:52:30.045427',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:52:00.023264',NULL,'2025-04-17 16:52:00.023748'),(73,'7b87c884-39f4-4bd0-8c15-8ddc7540f2dc','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:53:30.033066',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:53:00.014222',NULL,'2025-04-17 16:53:00.015513'),(74,'e3a5d4ac-fa65-4717-b32f-36c5d82395d7','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:54:30.034144',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:54:00.021365',NULL,'2025-04-17 16:54:00.022658'),(75,'547cdb48-6d67-41c7-9298-2875b2bb1458','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:55:30.043441',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:55:00.022597',NULL,'2025-04-17 16:55:00.023366'),(76,'cc5f4071-afa4-4fab-9d51-b96442acb855','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:56:30.033128',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:56:00.021114',NULL,'2025-04-17 16:56:00.021786'),(77,'fcc154e3-223a-4c3b-bc3c-3ef5b26b8d6c','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:57:30.036100',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:57:00.022299',NULL,'2025-04-17 16:57:00.023933'),(78,'8861fc7e-1fb9-43a4-a34f-b5edd6413a11','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:58:30.018526',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:58:00.009125',NULL,'2025-04-17 16:58:00.009421'),(79,'2d6cf0f1-29dd-43d6-9ca4-b8ecd2b00d3e','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 08:59:30.020332',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 08:59:00.011439',NULL,'2025-04-17 16:59:00.011698'),(80,'11699989-7df3-486a-a9c0-6b35278cf18b','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:00:30.017298',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:00:00.008598',NULL,'2025-04-17 17:00:00.009615'),(81,'b83f8bb9-3e10-4b29-95e5-8f3835ee0947','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:01:30.034289',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:01:00.014763',NULL,'2025-04-17 17:01:00.015687'),(82,'1d1b9648-c78c-4616-9e51-cb3595befb3e','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:02:30.027772',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:02:00.015817',NULL,'2025-04-17 17:02:00.017263'),(83,'d49546f3-963b-4924-80f3-d5bc92aa12ec','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:03:30.037090',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:03:00.023308',NULL,'2025-04-17 17:03:00.024052'),(84,'1687d702-7431-43fb-8e57-c36410210623','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:04:30.028718',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:04:00.017942',NULL,'2025-04-17 17:04:00.018716'),(85,'f26b6ff2-8c3f-466d-9c01-38f90b97d2b9','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:05:30.026644',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:05:00.008939',NULL,'2025-04-17 17:05:00.009269'),(86,'e09a6bef-0fc3-48cc-a349-036cb582679c','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:06:30.018934',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:06:00.009877',NULL,'2025-04-17 17:06:00.010426'),(87,'91e64ea5-5892-49ec-b8ae-578872046d4a','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:07:30.019452',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:07:00.009324',NULL,'2025-04-17 17:07:00.010267'),(88,'5c2dd1b3-e881-49ed-ba19-207442370285','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:08:30.035591',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:08:00.014724',NULL,'2025-04-17 17:08:00.015552'),(89,'2c31b422-2b15-443f-834f-e0fd4012519b','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:09:30.030950',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:09:00.020116',NULL,'2025-04-17 17:09:00.020819'),(90,'0fe199bc-91d7-49a0-b81a-f27f7718d7e8','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:10:30.032164',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:10:00.021960',NULL,'2025-04-17 17:10:00.022372'),(91,'b0fe05c3-5437-4037-a71e-50d06fef7517','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:11:30.032110',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:11:00.019336',NULL,'2025-04-17 17:11:00.020267'),(92,'2d1510ac-7b68-41f3-8736-e10658290d90','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:12:30.034952',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:12:00.021985',NULL,'2025-04-17 17:12:00.022923'),(93,'2cd5000a-7c2c-48df-8de3-89811527e2a4','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:13:30.031412',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:13:00.020405',NULL,'2025-04-17 17:13:00.021305'),(94,'884830d1-b4ed-4c64-9ecb-b888b3db6cc7','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:14:30.032777',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:14:00.019805',NULL,'2025-04-17 17:14:00.020912'),(95,'3a35cb41-df51-4136-97ce-6cffd9c80a2c','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:15:30.030560',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:15:00.018796',NULL,'2025-04-17 17:15:00.019452'),(96,'2f5361d1-a201-4e6e-94cb-36b48c600fef','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:16:30.021141',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:16:00.011954',NULL,'2025-04-17 17:16:00.012718'),(97,'58d78a3d-41d4-4cc9-bae7-636e8f8064be','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:17:30.044776',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:17:00.011711',NULL,'2025-04-17 17:17:00.012481'),(98,'ed3825fc-d532-4090-98b8-a8160e866194','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:18:30.023327',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:18:00.012913',NULL,'2025-04-17 17:18:00.013640'),(99,'854d1665-801b-42ce-bbb6-b6590bbb008f','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:19:30.032649',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:19:00.021012',NULL,'2025-04-17 17:19:00.021756'),(100,'af20d650-a679-4b03-a959-5d400ee8eaf7','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:20:30.021355',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:20:00.010884',NULL,'2025-04-17 17:20:00.011739'),(101,'590da5d9-9e5c-42fe-b698-18a2997f49a8','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:21:30.020815',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:21:00.008692',NULL,'2025-04-17 17:21:00.009801'),(102,'32349abd-a965-4dca-8e41-57d499418ef5','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:22:30.039446',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:22:00.024240',NULL,'2025-04-17 17:22:00.025519'),(103,'96a26eb9-593b-4a51-bf0f-caeca9511f51','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:23:30.026989',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:23:00.013423',NULL,'2025-04-17 17:23:00.014461'),(104,'9f14f46c-edd9-4d06-b6ce-a2bb2796ac8a','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:24:30.018272',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:24:00.009096',NULL,'2025-04-17 17:24:00.010257'),(105,'73d738d3-e782-4c99-9b5b-1ab635d5b4a8','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:25:30.022373',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:25:00.011415',NULL,'2025-04-17 17:25:00.012570'),(106,'1f15a7c3-bbf5-47dc-bf04-1e0dd8296ab5','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:26:30.018749',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:26:00.008415',NULL,'2025-04-17 17:26:00.009317'),(107,'299d1d9a-f7ff-46b4-aea9-711479f4a3ba','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:27:30.036171',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:27:00.023208',NULL,'2025-04-17 17:27:00.023814'),(108,'31220215-a5c2-4c15-a342-530113b8a493','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:28:30.019712',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:28:00.009323',NULL,'2025-04-17 17:28:00.009790'),(109,'3bded4f3-f7ac-441e-b3b5-4b6cb1712e08','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:29:30.017680',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:29:00.009443',NULL,'2025-04-17 17:29:00.009671'),(110,'cca67d86-5c71-48ee-b35d-79ec348488b2','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:30:51.416886',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:30:21.405843',NULL,'2025-04-17 17:30:21.406732'),(111,'e8130c32-8155-4734-8b7e-cc93888e7f11','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:31:30.033028',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:31:00.021917',NULL,'2025-04-17 17:31:00.023602'),(112,'2bbe0e4b-e987-483a-9b52-b5537bd4b780','FAILURE','application/json','utf-8','{\"exc_type\": \"NotImplementedError\", \"exc_message\": [\"<class \'celery.concurrency.solo.TaskPool\'> does not implement kill_job\"], \"exc_module\": \"builtins\"}','2025-04-17 09:32:14.248330','Traceback (most recent call last):\n  File \"D:\\workspace_python\\mars-mgn\\venv\\Lib\\site-packages\\celery\\app\\trace.py\", line 453, in trace_task\n    R = retval = fun(*args, **kwargs)\n                 ^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\workspace_python\\mars-mgn\\venv\\Lib\\site-packages\\celery\\app\\trace.py\", line 736, in __protected_call__\n    return self.run(*args, **kwargs)\n           ^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\workspace_python\\mars-mgn\\mysite\\myapp_infra\\tasks.py\", line 14, in send_daily_report\n    sleep(30)\n  File \"D:\\workspace_python\\mars-mgn\\venv\\Lib\\site-packages\\celery\\apps\\worker.py\", line 300, in _handle_request\n    callback(worker)\n  File \"D:\\workspace_python\\mars-mgn\\venv\\Lib\\site-packages\\celery\\apps\\worker.py\", line 413, in on_cold_shutdown\n    worker.consumer.cancel_all_unacked_requests()\n  File \"D:\\workspace_python\\mars-mgn\\venv\\Lib\\site-packages\\celery\\worker\\consumer\\consumer.py\", line 757, in cancel_all_unacked_requests\n    request.cancel(self.pool)\n  File \"D:\\workspace_python\\mars-mgn\\venv\\Lib\\site-packages\\celery\\worker\\request.py\", line 428, in cancel\n    pool.terminate_job(self.worker_pid, signal)\n  File \"D:\\workspace_python\\mars-mgn\\venv\\Lib\\site-packages\\celery\\concurrency\\base.py\", line 113, in terminate_job\n    raise NotImplementedError(\nNotImplementedError: <class \'celery.concurrency.solo.TaskPool\'> does not implement kill_job\n','{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:32:00.013123',NULL,'2025-04-17 17:32:00.014189'),(113,'34f7910b-b2d8-4e44-9077-28a179d09fd0','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:33:34.148080',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:33:04.139246',NULL,'2025-04-17 17:33:04.139767'),(114,'6ed14710-4c29-4826-bf59-0f02ab13012b','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:34:30.023434',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:34:00.013740',NULL,'2025-04-17 17:34:00.014760'),(115,'603021d5-b50e-4059-a45c-351dfe2a6c17','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:35:30.020594',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:35:00.010887',NULL,'2025-04-17 17:35:00.011715'),(116,'b860bf58-5b64-4270-86fd-b7e4e6a9fad3','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:36:30.016033',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:36:00.007912',NULL,'2025-04-17 17:36:00.008717'),(117,'ab755e52-1e1d-49e9-83ad-32ee95ea48a5','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:37:30.034891',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:37:00.021248',NULL,'2025-04-17 17:37:00.022416'),(118,'dbfdc60b-1728-4437-8183-2d1403fefb41','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:38:30.037731',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:38:00.023869',NULL,'2025-04-17 17:38:00.024338'),(119,'77bb3638-f3f9-49d6-924b-6717c1679866','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:39:30.031422',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:39:00.013902',NULL,'2025-04-17 17:39:00.015084'),(120,'96bcb422-73ad-4acd-98cc-12fdc2f8f112','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 09:40:30.025751',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:40:00.013564',NULL,'2025-04-17 17:40:00.014533'),(121,'091b2c89-2d25-4945-ab14-117bbdb8c144','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:37:48.816130',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 09:41:00.022852',NULL,'2025-04-17 20:37:18.805871'),(122,'ee2170d9-9f2b-42a0-b9ec-0327621f10ab','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:38:18.857109',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:37:48.844838',NULL,'2025-04-17 20:37:48.845886'),(123,'6f59e393-3a58-4772-9ef3-b34c17fbb980','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:38:48.878276',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:38:18.869856',NULL,'2025-04-17 20:38:18.870773'),(124,'e2b701b5-134a-4e4c-9911-90457888ed42','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:39:30.041640',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:39:00.020925',NULL,'2025-04-17 20:39:00.022264'),(125,'7f8d5bc0-0b52-465c-8002-6183481b7774','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:40:30.031019',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:40:00.018274',NULL,'2025-04-17 20:40:00.018829'),(126,'40c6d4db-85cf-4285-bac7-8fade4ffed52','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:41:30.041027',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:41:00.020278',NULL,'2025-04-17 20:41:00.021685'),(127,'1a4c8ca4-121f-4998-ad01-e35e7201262b','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:42:30.032150',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:42:00.019799',NULL,'2025-04-17 20:42:00.020967'),(128,'f74abee3-46f9-4bdf-a644-491149ac694a','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:43:30.032459',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:43:00.016589',NULL,'2025-04-17 20:43:00.017612'),(129,'76a6bba8-671f-4ccf-a950-c38d65d64f6a','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:44:30.035866',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:44:00.021238',NULL,'2025-04-17 20:44:00.021870'),(130,'1bb29606-9948-4800-9ecc-7f525d3ee19f','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:45:30.021090',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:45:00.009656',NULL,'2025-04-17 20:45:00.010275'),(131,'ca17d1f6-d69b-4688-b247-b72e471ddb1e','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:46:30.032003',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:46:00.021219',NULL,'2025-04-17 20:46:00.022039'),(132,'cfb64193-8e71-4342-8803-6fc7836cc763','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:47:30.020447',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:47:00.009108',NULL,'2025-04-17 20:47:00.010086'),(133,'04382d9b-4747-4fa1-b80d-db5c6888bc25','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:48:30.018756',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:48:00.009452',NULL,'2025-04-17 20:48:00.010597'),(134,'5b7c2d1a-5580-46a9-9613-8fe8b0c15d7c','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:49:30.031278',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:49:00.019826',NULL,'2025-04-17 20:49:00.021025'),(135,'1958d848-b0e3-43b1-abf9-58cbe000b231','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:50:30.034442',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:50:00.021610',NULL,'2025-04-17 20:50:00.023059'),(136,'f86a1fb2-8a91-448d-81e3-127adfdebfe7','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:51:30.029228',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:51:00.008921',NULL,'2025-04-17 20:51:00.009491'),(137,'7b65882b-9c39-4c15-b7a8-f6a554d61026','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:52:30.019894',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:52:00.008157',NULL,'2025-04-17 20:52:00.009079'),(138,'973956f0-610d-41af-b7b4-8caa3d5d4c84','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:53:30.050384',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:53:00.020795',NULL,'2025-04-17 20:53:00.021321'),(139,'3bc6ef4e-37d8-4ab5-a631-8d901c1583a2','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:54:30.064873',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:54:00.044784',NULL,'2025-04-17 20:54:00.045110'),(140,'eb0105ff-66c0-44a7-b645-229988ee8c8c','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:55:30.022268',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:55:00.010736',NULL,'2025-04-17 20:55:00.011786'),(141,'617d357c-168a-489a-9007-a46e97e00deb','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:56:30.031704',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:56:00.017955',NULL,'2025-04-17 20:56:00.019261'),(142,'34df0ce7-a06f-4320-b9d9-5b2b0ac709e0','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:57:30.022151',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:57:00.011865',NULL,'2025-04-17 20:57:00.012237'),(143,'04e23693-7805-48bc-81a8-560191605d4c','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:58:30.033626',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:58:00.020973',NULL,'2025-04-17 20:58:00.021526'),(144,'14ceb6de-9348-4cac-9a05-3da93b60d050','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 12:59:30.019072',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 12:59:00.008205',NULL,'2025-04-17 20:59:00.008585'),(145,'211a2ec2-2df3-4b2b-be60-fe6002738e90','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:00:30.040815',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:00:00.020905',NULL,'2025-04-17 21:00:00.021840'),(146,'2da64e23-8439-4d09-9de1-094da33f23ed','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:01:30.026163',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:01:00.007910',NULL,'2025-04-17 21:01:00.008901'),(147,'dd0a567f-e560-4cf6-a44d-1a21b260b45e','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:02:30.020711',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:02:00.007704',NULL,'2025-04-17 21:02:00.008530'),(148,'f4646e1a-4db3-4b4a-928b-b50d9a508eab','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:03:30.031447',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:03:00.020363',NULL,'2025-04-17 21:03:00.021074'),(149,'7ee198e5-f879-4b80-b6b6-d6f2b20bc19b','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:04:30.016249',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:04:00.007345',NULL,'2025-04-17 21:04:00.007884'),(150,'38463a2f-2780-40e9-a79d-c7c522c3aeaa','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:05:30.031049',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:05:00.018218',NULL,'2025-04-17 21:05:00.019443'),(151,'7a3294c9-e383-45a0-ac18-9416dd025f2e','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:06:30.030108',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:06:00.018540',NULL,'2025-04-17 21:06:00.019943'),(152,'465848dd-a745-4732-a204-0412bb9cab27','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:07:30.020449',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:07:00.010149',NULL,'2025-04-17 21:07:00.010599'),(153,'f1178131-f17d-48b2-9dd6-e92a3e859f76','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:08:30.019918',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:08:00.009684',NULL,'2025-04-17 21:08:00.010675'),(154,'8c68ddd1-424a-4ca8-a2d2-2ce514120b32','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:09:30.033818',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:09:00.020127',NULL,'2025-04-17 21:09:00.021361'),(155,'359cc928-3904-4982-a3eb-e138ca5ae46e','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:10:30.028194',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:10:00.007827',NULL,'2025-04-17 21:10:00.008682'),(156,'21134148-68d8-41a6-b8cc-3b17f2e03ca8','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:11:30.030316',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:11:00.012477',NULL,'2025-04-17 21:11:00.013571'),(157,'8b3abc8f-37a3-4019-bcdb-aeed9c249889','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:12:30.032710',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:12:00.019013',NULL,'2025-04-17 21:12:00.020357'),(158,'fec08ec0-749a-4720-82cb-0151e1854b65','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:13:30.028625',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:13:00.016590',NULL,'2025-04-17 21:13:00.017922'),(159,'679d1f95-8cd4-4259-a86d-1f631388edc1','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:14:30.020983',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:14:00.009963',NULL,'2025-04-17 21:14:00.010822'),(160,'fd07ad76-9469-4220-8f05-705d149ed900','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:15:30.039524',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:15:00.020647',NULL,'2025-04-17 21:15:00.021391'),(161,'94b5d94b-05cc-4aa3-9ee2-498fe921fd9b','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:16:30.031130',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:16:00.018750',NULL,'2025-04-17 21:16:00.019840'),(162,'b3e994b7-b163-428c-b31d-b971a7ca3c24','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:17:30.023705',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:17:00.011911',NULL,'2025-04-17 21:17:00.012598'),(163,'23923344-2378-4312-87dd-cc95509bc87c','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:18:30.032663',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:18:00.019486',NULL,'2025-04-17 21:18:00.020819'),(164,'d87c78db-32b3-4813-93ff-2bbbfc9ba66e','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:19:30.021557',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:19:00.009780',NULL,'2025-04-17 21:19:00.010718'),(165,'50d04ebe-7a55-4b26-af46-79d4ffec2b53','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:20:30.019980',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:20:00.007890',NULL,'2025-04-17 21:20:00.008774'),(166,'b5fe7c9c-dccf-4c2b-ab1d-fec925af33bf','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:21:30.033834',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:21:00.020823',NULL,'2025-04-17 21:21:00.021791'),(167,'4835d96d-16d9-498f-9bf2-84725be1768c','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:22:30.034871',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:22:00.017298',NULL,'2025-04-17 21:22:00.018188'),(168,'80bd9a19-71c9-4eee-a908-dff2dfbb6c9b','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:23:30.023567',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:23:00.011926',NULL,'2025-04-17 21:23:00.012157'),(169,'7aba9404-56c6-47f2-9102-e674d44c41c2','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:24:30.030410',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:24:00.017431',NULL,'2025-04-17 21:24:00.018457'),(170,'1916d065-0c15-4302-825f-677bc7e8cd53','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:25:30.023582',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:25:00.011500',NULL,'2025-04-17 21:25:00.012659'),(171,'c8a397b3-267f-461c-b39f-76fefb44d257','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:26:30.033160',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:26:00.019821',NULL,'2025-04-17 21:26:00.020616'),(172,'6d717207-3cda-47f2-a36f-9c36cabd8641','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:27:30.019399',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:27:00.008435',NULL,'2025-04-17 21:27:00.008939'),(173,'d2494623-1255-4c5e-85cf-23696e23771f','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:28:30.022384',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:28:00.010944',NULL,'2025-04-17 21:28:00.011886'),(174,'38f178d4-9044-4445-a4bb-62dd9f5e816a','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:29:30.044820',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:29:00.022040',NULL,'2025-04-17 21:29:00.023125'),(175,'400f3652-9f48-4bb4-8b84-bbfc58acd5a6','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:30:30.018584',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:30:00.008344',NULL,'2025-04-17 21:30:00.008810'),(176,'6abb5943-b361-489d-8734-8a15d00a6e53','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:31:30.020257',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:31:00.011320',NULL,'2025-04-17 21:31:00.011733'),(177,'0eb9083b-27cf-4ba2-b8bc-1cbf1f1ad781','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:32:30.022022',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:32:00.009941',NULL,'2025-04-17 21:32:00.010315'),(178,'21a324de-69cc-48a0-bec5-1012b04f081c','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:33:30.042021',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:33:00.021989',NULL,'2025-04-17 21:33:00.023431'),(179,'c8215660-58bf-474d-aea0-5dbc73a53fbd','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:34:30.018638',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:34:00.008376',NULL,'2025-04-17 21:34:00.008826'),(180,'38f54e06-4de6-4db0-b3d8-43c093d33975','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:35:30.031524',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:35:00.016476',NULL,'2025-04-17 21:35:00.017327'),(181,'548b0de6-868a-4b0b-9c0d-c0bbe781178c','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:36:30.018041',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:36:00.008798',NULL,'2025-04-17 21:36:00.009892'),(182,'956def49-6f2f-45d1-8066-2b193c56bed7','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:37:30.016432',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:37:00.006015',NULL,'2025-04-17 21:37:00.007004'),(183,'1ef06b58-7048-4a9f-88ab-554639aca6ae','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:38:30.016996',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:38:00.008537',NULL,'2025-04-17 21:38:00.009206'),(184,'5c57cd66-9290-496f-9d61-ee85cc982241','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:39:30.035240',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:39:00.009695',NULL,'2025-04-17 21:39:00.010667'),(185,'b1b58cba-44f7-48d9-abb4-31721728b915','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:40:30.026369',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:40:00.008199',NULL,'2025-04-17 21:40:00.008595'),(186,'70c50e26-4de1-4eba-9e89-3665b046e58d','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:41:30.039776',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:41:00.019877',NULL,'2025-04-17 21:41:00.020823'),(187,'b6f01b53-3d03-4ea2-a38e-a0f4a27ad960','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:42:30.019817',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:42:00.009157',NULL,'2025-04-17 21:42:00.009715'),(188,'6f0a5707-5b7a-46bb-8a47-eb87b34802bb','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:43:30.028842',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:43:00.017275',NULL,'2025-04-17 21:43:00.018639'),(189,'05dcd4bd-f1b6-4e9d-b0b9-adc44f2e1802','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:44:30.019994',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:44:00.008622',NULL,'2025-04-17 21:44:00.009829'),(190,'3be5ff20-e4b9-41a9-a75f-a015176fb64e','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:45:30.028766',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:45:00.017942',NULL,'2025-04-17 21:45:00.018507'),(191,'1b51cca4-c741-4458-9fe5-a9877b7f1fd5','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:46:30.034321',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:46:00.022516',NULL,'2025-04-17 21:46:00.024051'),(192,'cd6e92da-3140-49ab-b634-62a7af7722ef','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:47:30.031435',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:47:00.017748',NULL,'2025-04-17 21:47:00.019195'),(193,'4cb4bf4f-0453-47d6-8caf-c48e3dc70d49','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:48:30.033388',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:48:00.019726',NULL,'2025-04-17 21:48:00.020831'),(194,'10290060-6e48-4c9b-8a0f-3aa7b296132d','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:49:30.038970',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:49:00.017693',NULL,'2025-04-17 21:49:00.019074'),(195,'30694b99-a041-4b5a-9667-588bcd20985b','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:50:30.017400',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:50:00.007661',NULL,'2025-04-17 21:50:00.008320'),(196,'1bad9174-86e7-4da6-b204-dba79752b7cb','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:51:30.038868',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:51:00.029857',NULL,'2025-04-17 21:51:00.030739'),(197,'2ec183e3-f59a-45a1-b026-9c5824e9b4c4','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:52:30.020737',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:52:00.009416',NULL,'2025-04-17 21:52:00.010485'),(198,'982ed8ea-2a5b-46d0-bbc0-23b911dd0e35','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:53:30.018328',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:53:00.008006',NULL,'2025-04-17 21:53:00.008699'),(199,'4c93e1c0-2c9a-42a1-bcd1-1c1ffd973fa0','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:54:30.047090',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:54:00.010967',NULL,'2025-04-17 21:54:00.012135'),(200,'5e4a5002-cdbb-46ca-be91-d16d77f1cf20','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:55:30.026063',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:55:00.008547',NULL,'2025-04-17 21:55:00.009053'),(201,'2584da8b-39bb-4ee7-9c12-7fc28db74851','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:56:30.035230',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:56:00.021185',NULL,'2025-04-17 21:56:00.022642'),(202,'95ae2e83-e027-43fc-8221-a957f6c85b2f','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:57:30.030586',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:57:00.019340',NULL,'2025-04-17 21:57:00.019876'),(203,'7cadbcbc-5d5b-4805-8a5e-14ab9273f79b','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:58:30.018216',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:58:00.007861',NULL,'2025-04-17 21:58:00.008737'),(204,'476e7e73-0671-431e-9903-ffec7f022dd3','SUCCESS','application/json','utf-8','\"Report Success\"','2025-04-17 13:59:30.022533',NULL,'{\"children\": []}','\"()\"','\"{}\"','myapp_infra.tasks.send_daily_report','celery@DESKTOP-MHHVBI3','2025-04-17 13:59:00.010037',NULL,'2025-04-17 21:59:00.011371');
/*!40000 ALTER TABLE `django_celery_results_taskresult` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(19,'django_celery_beat','clockedschedule'),(14,'django_celery_beat','crontabschedule'),(15,'django_celery_beat','intervalschedule'),(16,'django_celery_beat','periodictask'),(17,'django_celery_beat','periodictasks'),(18,'django_celery_beat','solarschedule'),(21,'django_celery_results','chordcounter'),(22,'django_celery_results','groupresult'),(20,'django_celery_results','taskresult'),(23,'drf_api_logger','apilogsmodel'),(7,'myapp_system','systemdept'),(8,'myapp_system','systemmenu'),(9,'myapp_system','systempost'),(10,'myapp_system','systemrole'),(11,'myapp_system','systemrolemenu'),(12,'myapp_system','systemuserpost'),(13,'myapp_system','systemuserrole'),(6,'myapp_system','systemusers'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'myapp_system','0001_initial','2025-03-20 02:04:48.406187'),(2,'contenttypes','0001_initial','2025-03-20 02:04:48.488715'),(3,'admin','0001_initial','2025-03-20 02:04:49.102794'),(4,'admin','0002_logentry_remove_auto_add','2025-03-20 02:04:49.122786'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-20 02:04:49.141772'),(6,'contenttypes','0002_remove_content_type_name','2025-03-20 02:04:49.338317'),(7,'auth','0001_initial','2025-03-20 02:04:49.969771'),(8,'auth','0002_alter_permission_name_max_length','2025-03-20 02:04:50.126349'),(9,'auth','0003_alter_user_email_max_length','2025-03-20 02:04:50.139203'),(10,'auth','0004_alter_user_username_opts','2025-03-20 02:04:50.152497'),(11,'auth','0005_alter_user_last_login_null','2025-03-20 02:04:50.165488'),(12,'auth','0006_require_contenttypes_0002','2025-03-20 02:04:50.174482'),(13,'auth','0007_alter_validators_add_error_messages','2025-03-20 02:04:50.187474'),(14,'auth','0008_alter_user_username_max_length','2025-03-20 02:04:50.199332'),(15,'auth','0009_alter_user_last_name_max_length','2025-03-20 02:04:50.210488'),(16,'auth','0010_alter_group_name_max_length','2025-03-20 02:04:50.239864'),(17,'auth','0011_update_proxy_permissions','2025-03-20 02:04:50.258492'),(18,'auth','0012_alter_user_first_name_max_length','2025-03-20 02:04:50.274161'),(19,'sessions','0001_initial','2025-03-20 02:04:50.367687'),(20,'django_celery_beat','0001_initial','2025-04-16 08:25:15.620781'),(21,'django_celery_beat','0002_auto_20161118_0346','2025-04-16 08:25:15.848218'),(22,'django_celery_beat','0003_auto_20161209_0049','2025-04-16 08:25:15.909942'),(23,'django_celery_beat','0004_auto_20170221_0000','2025-04-16 08:25:15.921579'),(24,'django_celery_beat','0005_add_solarschedule_events_choices','2025-04-16 08:25:15.932957'),(25,'django_celery_beat','0006_auto_20180322_0932','2025-04-16 08:25:16.079088'),(26,'django_celery_beat','0007_auto_20180521_0826','2025-04-16 08:25:16.205316'),(27,'django_celery_beat','0008_auto_20180914_1922','2025-04-16 08:25:16.279383'),(28,'django_celery_beat','0006_auto_20180210_1226','2025-04-16 08:25:16.305365'),(29,'django_celery_beat','0006_periodictask_priority','2025-04-16 08:25:16.467992'),(30,'django_celery_beat','0009_periodictask_headers','2025-04-16 08:25:16.632756'),(31,'django_celery_beat','0010_auto_20190429_0326','2025-04-16 08:25:16.814467'),(32,'django_celery_beat','0011_auto_20190508_0153','2025-04-16 08:25:17.047471'),(33,'django_celery_beat','0012_periodictask_expire_seconds','2025-04-16 08:25:17.231209'),(34,'django_celery_beat','0013_auto_20200609_0727','2025-04-16 08:25:17.247814'),(35,'django_celery_beat','0014_remove_clockedschedule_enabled','2025-04-16 08:25:17.286417'),(36,'django_celery_beat','0015_edit_solarschedule_events_choices','2025-04-16 08:25:17.298230'),(37,'django_celery_beat','0016_alter_crontabschedule_timezone','2025-04-16 08:25:17.315239'),(38,'django_celery_beat','0017_alter_crontabschedule_month_of_year','2025-04-16 08:25:17.328246'),(39,'django_celery_beat','0018_improve_crontab_helptext','2025-04-16 08:25:17.343838'),(40,'django_celery_beat','0019_alter_periodictasks_options','2025-04-16 08:25:17.355459'),(41,'django_celery_results','0001_initial','2025-04-16 08:25:25.638679'),(42,'django_celery_results','0002_add_task_name_args_kwargs','2025-04-16 08:25:25.797114'),(43,'django_celery_results','0003_auto_20181106_1101','2025-04-16 08:25:25.806545'),(44,'django_celery_results','0004_auto_20190516_0412','2025-04-16 08:25:25.946984'),(45,'django_celery_results','0005_taskresult_worker','2025-04-16 08:25:26.014892'),(46,'django_celery_results','0006_taskresult_date_created','2025-04-16 08:25:26.147167'),(47,'django_celery_results','0007_remove_taskresult_hidden','2025-04-16 08:25:26.532889'),(48,'django_celery_results','0008_chordcounter','2025-04-16 08:25:26.763658'),(49,'django_celery_results','0009_groupresult','2025-04-16 08:25:27.356010'),(50,'django_celery_results','0010_remove_duplicate_indices','2025-04-16 08:25:27.374794'),(51,'django_celery_results','0011_taskresult_periodic_task_name','2025-04-16 08:25:27.417655'),(52,'django_celery_results','0012_taskresult_date_started','2025-04-16 08:25:27.472854'),(53,'django_celery_results','0013_taskresult_django_cele_periodi_1993cf_idx','2025-04-16 08:25:27.533816'),(54,'django_celery_results','0014_alter_taskresult_status','2025-04-16 08:25:27.544943'),(55,'drf_api_logger','0001_initial','2025-04-18 08:23:20.741501'),(56,'drf_api_logger','0002_auto_20211221_2155','2025-04-18 08:23:20.771483');
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
-- Table structure for table `drf_api_logs`
--

DROP TABLE IF EXISTS `drf_api_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drf_api_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `api` varchar(1024) NOT NULL,
  `headers` longtext NOT NULL,
  `body` longtext NOT NULL,
  `method` varchar(10) NOT NULL,
  `client_ip_address` varchar(50) NOT NULL,
  `response` longtext NOT NULL,
  `status_code` smallint unsigned NOT NULL,
  `execution_time` decimal(8,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drf_api_logs_method_f610a90b` (`method`),
  KEY `drf_api_logs_status_code_4ffd4334` (`status_code`),
  CONSTRAINT `drf_api_logs_chk_1` CHECK ((`status_code` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drf_api_logs`
--

LOCK TABLES `drf_api_logs` WRITE;
/*!40000 ALTER TABLE `drf_api_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `drf_api_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_api_access_log`
--

DROP TABLE IF EXISTS `infra_api_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_api_access_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户编号',
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '用户类型',
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求方法名',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求地址',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '请求参数',
  `response_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '响应结果',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
  `operate_module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作模块',
  `operate_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作名',
  `operate_type` tinyint DEFAULT '0' COMMENT '操作分类',
  `begin_time` datetime NOT NULL COMMENT '开始请求时间',
  `end_time` datetime NOT NULL COMMENT '结束请求时间',
  `duration` int NOT NULL COMMENT '执行时长',
  `result_code` int NOT NULL DEFAULT '0' COMMENT '结果码',
  `result_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '结果提示',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35942 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='API 访问日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_api_access_log`
--

LOCK TABLES `infra_api_access_log` WRITE;
/*!40000 ALTER TABLE `infra_api_access_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_api_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_api_error_log`
--

DROP TABLE IF EXISTS `infra_api_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_api_error_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链路追踪编号',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户编号',
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '用户类型',
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求方法名',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求地址',
  `request_params` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求参数',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
  `exception_time` datetime NOT NULL COMMENT '异常发生时间',
  `exception_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '异常名',
  `exception_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常导致的消息',
  `exception_root_cause_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常导致的根消息',
  `exception_stack_trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常的栈轨迹',
  `exception_class_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的类全名',
  `exception_file_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的类文件',
  `exception_method_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的方法名',
  `exception_line_number` int NOT NULL COMMENT '异常发生的方法所在行',
  `process_status` tinyint NOT NULL COMMENT '处理状态',
  `process_time` datetime DEFAULT NULL COMMENT '处理时间',
  `process_user_id` int DEFAULT '0' COMMENT '处理用户编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统异常日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_api_error_log`
--

LOCK TABLES `infra_api_error_log` WRITE;
/*!40000 ALTER TABLE `infra_api_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_api_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_codegen_column`
--

DROP TABLE IF EXISTS `infra_codegen_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_codegen_column` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NOT NULL COMMENT '表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段名',
  `data_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段类型',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段描述',
  `nullable` bit(1) NOT NULL COMMENT '是否允许为空',
  `primary_key` bit(1) NOT NULL COMMENT '是否主键',
  `ordinal_position` int NOT NULL COMMENT '排序',
  `java_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 属性类型',
  `java_field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 属性名',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `example` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据示例',
  `create_operation` bit(1) NOT NULL COMMENT '是否为 Create 创建操作的字段',
  `update_operation` bit(1) NOT NULL COMMENT '是否为 Update 更新操作的字段',
  `list_operation` bit(1) NOT NULL COMMENT '是否为 List 查询操作的字段',
  `list_operation_condition` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '=' COMMENT 'List 查询操作的条件类型',
  `list_operation_result` bit(1) NOT NULL COMMENT '是否为 List 查询操作的返回字段',
  `html_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '显示类型',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2483 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成表字段定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_codegen_column`
--

LOCK TABLES `infra_codegen_column` WRITE;
/*!40000 ALTER TABLE `infra_codegen_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_codegen_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_codegen_table`
--

DROP TABLE IF EXISTS `infra_codegen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_codegen_table` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `data_source_config_id` bigint NOT NULL COMMENT '数据源配置的编号',
  `scene` tinyint NOT NULL DEFAULT '1' COMMENT '生成场景',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表描述',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类名称',
  `class_comment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类描述',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作者',
  `template_type` tinyint NOT NULL DEFAULT '1' COMMENT '模板类型',
  `front_type` tinyint NOT NULL COMMENT '前端类型',
  `parent_menu_id` bigint DEFAULT NULL COMMENT '父菜单编号',
  `master_table_id` bigint DEFAULT NULL COMMENT '主表的编号',
  `sub_join_column_id` bigint DEFAULT NULL COMMENT '子表关联主表的字段编号',
  `sub_join_many` bit(1) DEFAULT NULL COMMENT '主表与子表是否一对多',
  `tree_parent_column_id` bigint DEFAULT NULL COMMENT '树表的父字段编号',
  `tree_name_column_id` bigint DEFAULT NULL COMMENT '树表的名字字段编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成表定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_codegen_table`
--

LOCK TABLES `infra_codegen_table` WRITE;
/*!40000 ALTER TABLE `infra_codegen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_codegen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_config`
--

DROP TABLE IF EXISTS `infra_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数分组',
  `type` tinyint NOT NULL COMMENT '参数类型',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数键名',
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数键值',
  `visible` bit(1) NOT NULL COMMENT '是否可见',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_config`
--

LOCK TABLES `infra_config` WRITE;
/*!40000 ALTER TABLE `infra_config` DISABLE KEYS */;
INSERT INTO `infra_config` VALUES (2,'biz',1,'用户管理-账号初始密码','system.user.init-password','123456',_binary '\0','初始化密码 123456','admin','2021-01-05 17:03:48','1','2024-07-20 17:22:47',0),(7,'url',2,'MySQL 监控的地址','url.druid','',_binary '','','1','2023-04-07 13:41:16','1','2023-04-07 14:33:38',0),(8,'url',2,'SkyWalking 监控的地址','url.skywalking','',_binary '','','1','2023-04-07 13:41:16','1','2023-04-07 14:57:03',0),(9,'url',2,'Spring Boot Admin 监控的地址','url.spring-boot-admin','',_binary '','','1','2023-04-07 13:41:16','1','2023-04-07 14:52:07',0),(10,'url',2,'Swagger 接口文档的地址','url.swagger','',_binary '','','1','2023-04-07 13:41:16','1','2023-04-07 14:59:00',0),(11,'ui',2,'腾讯地图 key','tencent.lbs.key','TVDBZ-TDILD-4ON4B-PFDZA-RNLKH-VVF6E',_binary '','腾讯地图 key','1','2023-06-03 19:16:27','1','2023-06-03 19:16:27',0),(12,'test2',2,'test3','test4','test5',_binary '','test6','1','2023-12-03 09:55:16','1','2023-12-03 09:55:27',0);
/*!40000 ALTER TABLE `infra_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_data_source_config`
--

DROP TABLE IF EXISTS `infra_data_source_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_data_source_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据源连接',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据源配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_data_source_config`
--

LOCK TABLES `infra_data_source_config` WRITE;
/*!40000 ALTER TABLE `infra_data_source_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_data_source_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_file`
--

DROP TABLE IF EXISTS `infra_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_file` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '文件编号',
  `config_id` bigint DEFAULT NULL COMMENT '配置编号',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名',
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件路径',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件 URL',
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` int NOT NULL COMMENT '文件大小',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1577 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_file`
--

LOCK TABLES `infra_file` WRITE;
/*!40000 ALTER TABLE `infra_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_file_config`
--

DROP TABLE IF EXISTS `infra_file_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_file_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置名',
  `storage` tinyint NOT NULL COMMENT '存储器',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `master` bit(1) NOT NULL COMMENT '是否为主配置',
  `config` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '存储配置',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文件配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_file_config`
--

LOCK TABLES `infra_file_config` WRITE;
/*!40000 ALTER TABLE `infra_file_config` DISABLE KEYS */;
INSERT INTO `infra_file_config` VALUES (4,'数据库（示例）',1,'我是数据库',_binary '\0','{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.db.DBFileClientConfig\",\"domain\":\"http://127.0.0.1:48080\"}','1','2022-03-15 23:56:24','1','2024-11-09 18:09:28',0),(22,'七牛存储器（示例）',20,'请换成你自己的密钥！！！',_binary '','{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"s3.cn-south-1.qiniucs.com\",\"domain\":\"http://test.yudao.iocoder.cn\",\"bucket\":\"ruoyi-vue-pro\",\"accessKey\":\"3TvrJ70gl2Gt6IBe7_IZT1F6i_k0iMuRtyEv4EyS\",\"accessSecret\":\"wd0tbVBYlp0S-ihA8Qg2hPLncoP83wyrIq24OZuY\"}','1','2024-01-13 22:11:12','1','2024-11-09 18:09:28',0),(24,'腾讯云存储（示例）',20,'请换成你的密钥！！！',_binary '\0','{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"https://cos.ap-shanghai.myqcloud.com\",\"domain\":\"http://tengxun-oss.iocoder.cn\",\"bucket\":\"aoteman-1255880240\",\"accessKey\":\"AKIDAF6WSh1uiIjwqtrOsGSN3WryqTM6cTMt\",\"accessSecret\":\"X\"}','1','2024-11-09 16:03:22','1','2024-11-09 18:15:39',0),(25,'阿里云存储（示例）',20,'',_binary '\0','{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"oss-cn-beijing.aliyuncs.com\",\"domain\":\"http://ali-oss.iocoder.cn\",\"bucket\":\"yunai-aoteman\",\"accessKey\":\"LTAI5tEQLgnDyjh3WpNcdMKA\",\"accessSecret\":\"X\"}','1','2024-11-09 16:47:08','1','2024-11-09 18:15:43',0),(26,'火山云存储（示例）',20,'',_binary '\0','{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"tos-s3-cn-beijing.volces.com\",\"domain\":null,\"bucket\":\"yunai\",\"accessKey\":\"AKLTZjc3Zjc4MzZmMjU3NDk0ZTgxYmIyMmFkNTIwMDI1ZGE\",\"accessSecret\":\"X==\"}','1','2024-11-09 16:56:42','1','2024-11-09 18:15:46',0),(27,'华为云存储（示例）',20,'',_binary '\0','{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"obs.cn-east-3.myhuaweicloud.com\",\"domain\":\"\",\"bucket\":\"yudao\",\"accessKey\":\"PVDONDEIOTW88LF8DC4U\",\"accessSecret\":\"X\"}','1','2024-11-09 17:18:41','1','2024-11-09 18:15:49',0),(28,'MinIO 存储（示例）',20,'',_binary '\0','{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"http://127.0.0.1:9000\",\"domain\":\"http://127.0.0.1:9000/yudao\",\"bucket\":\"yudao\",\"accessKey\":\"admin\",\"accessSecret\":\"password\"}','1','2024-11-09 17:43:10','1','2024-11-09 18:15:52',0);
/*!40000 ALTER TABLE `infra_file_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_file_content`
--

DROP TABLE IF EXISTS `infra_file_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_file_content` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `config_id` bigint NOT NULL COMMENT '配置编号',
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件路径',
  `content` mediumblob NOT NULL COMMENT '文件内容',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_file_content`
--

LOCK TABLES `infra_file_content` WRITE;
/*!40000 ALTER TABLE `infra_file_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_file_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_job`
--

DROP TABLE IF EXISTS `infra_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_job` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `status` tinyint NOT NULL COMMENT '任务状态',
  `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理器的名字',
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '处理器的参数',
  `cron_expression` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CRON 表达式',
  `retry_count` int NOT NULL DEFAULT '0' COMMENT '重试次数',
  `retry_interval` int NOT NULL DEFAULT '0' COMMENT '重试间隔',
  `monitor_timeout` int NOT NULL DEFAULT '0' COMMENT '监控超时时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_job`
--

LOCK TABLES `infra_job` WRITE;
/*!40000 ALTER TABLE `infra_job` DISABLE KEYS */;
INSERT INTO `infra_job` VALUES (5,'支付通知 Job',2,'payNotifyJob',NULL,'* * * * * ?',0,0,0,'1','2021-10-27 08:34:42','1','2024-09-12 13:32:48',0),(17,'支付订单同步 Job',2,'payOrderSyncJob',NULL,'0 0/1 * * * ?',0,0,0,'1','2023-07-22 14:36:26','1','2023-07-22 15:39:08',0),(18,'支付订单过期 Job',2,'payOrderExpireJob',NULL,'0 0/1 * * * ?',0,0,0,'1','2023-07-22 15:36:23','1','2023-07-22 15:39:54',0),(19,'退款订单的同步 Job',2,'payRefundSyncJob',NULL,'0 0/1 * * * ?',0,0,0,'1','2023-07-23 21:03:44','1','2023-07-23 21:09:00',0),(21,'交易订单的自动过期 Job',2,'tradeOrderAutoCancelJob','','0 * * * * ?',3,0,0,'1','2023-09-25 23:43:26','1','2023-09-26 19:23:30',0),(22,'交易订单的自动收货 Job',2,'tradeOrderAutoReceiveJob','','0 * * * * ?',3,0,0,'1','2023-09-26 19:23:53','1','2023-09-26 23:38:08',0),(23,'交易订单的自动评论 Job',2,'tradeOrderAutoCommentJob','','0 * * * * ?',3,0,0,'1','2023-09-26 23:38:29','1','2023-09-27 11:03:10',0),(24,'佣金解冻 Job',2,'brokerageRecordUnfreezeJob','','0 * * * * ?',3,0,0,'1','2023-09-28 22:01:46','1','2023-09-28 22:01:56',0),(25,'访问日志清理 Job',2,'accessLogCleanJob','','0 0 0 * * ?',3,0,0,'1','2023-10-03 10:59:41','1','2023-10-03 11:01:10',0),(26,'错误日志清理 Job',2,'errorLogCleanJob','','0 0 0 * * ?',3,0,0,'1','2023-10-03 11:00:43','153','2025-04-14 07:35:53',0),(27,'任务日志清理 Job',2,'jobLogCleanJob','','0 0 0 * * ?',3,0,0,'1','2023-10-03 11:01:33','1','2024-09-12 13:40:34',0),(34,'消息日志清理Job',2,'infoLogCleanJob','','0 0 * * * ?',3,0,0,'153','2025-04-14 03:50:15','153','2025-04-14 03:50:15',0);
/*!40000 ALTER TABLE `infra_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_job_log`
--

DROP TABLE IF EXISTS `infra_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `job_id` bigint NOT NULL COMMENT '任务编号',
  `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理器的名字',
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '处理器的参数',
  `execute_index` tinyint NOT NULL DEFAULT '1' COMMENT '第几次执行',
  `begin_time` datetime NOT NULL COMMENT '开始执行时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束执行时间',
  `duration` int DEFAULT NULL COMMENT '执行时长',
  `status` tinyint NOT NULL COMMENT '任务状态',
  `result` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '结果数据',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_job_log`
--

LOCK TABLES `infra_job_log` WRITE;
/*!40000 ALTER TABLE `infra_job_log` DISABLE KEYS */;
INSERT INTO `infra_job_log` VALUES (638,26,'TaskHandlerA','{\"key\":\"value\"}',1,'2025-04-14 08:00:00','2025-04-14 08:05:00',300,1,'Success','admin','2025-04-14 17:15:09','admin','2025-04-14 17:37:49',0),(639,1002,'TaskHandlerB',NULL,1,'2025-04-14 09:00:00','2025-04-14 09:10:00',600,0,'Failed','user1','2025-04-14 17:15:09','user1','2025-04-14 17:15:09',0),(640,1003,'TaskHandlerC','{\"param1\":\"val1\",\"param2\":\"val2\"}',2,'2025-04-14 10:00:00','2025-04-14 10:03:00',180,1,'Success','admin','2025-04-14 17:15:09','admin','2025-04-14 17:15:09',0),(641,1004,'TaskHandlerD','{\"id\":123}',1,'2025-04-14 11:00:00',NULL,NULL,2,'Running','user2','2025-04-14 17:15:09','user2','2025-04-14 17:15:09',0),(642,1005,'TaskHandlerE','{\"name\":\"test\"}',3,'2025-04-14 12:00:00','2025-04-14 12:02:00',120,1,'Success','admin','2025-04-14 17:15:09','admin','2025-04-14 17:15:09',0),(643,1006,'TaskHandlerF',NULL,1,'2025-04-14 13:00:00','2025-04-14 13:07:00',420,0,'Failed','user3','2025-04-14 17:15:09','user3','2025-04-14 17:15:09',0);
/*!40000 ALTER TABLE `infra_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dept`
--

DROP TABLE IF EXISTS `system_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父部门id',
  `sort` int NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `leader_user_id` bigint DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` tinyint NOT NULL COMMENT '部门状态（0正常 1停用）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dept`
--

LOCK TABLES `system_dept` WRITE;
/*!40000 ALTER TABLE `system_dept` DISABLE KEYS */;
INSERT INTO `system_dept` VALUES (100,'芋道源码',0,0,1,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','1','2023-11-14 23:30:36',0,1),(101,'深圳总公司',100,1,104,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','1','2023-12-02 09:53:35',0,1),(102,'长沙分公司',100,2,NULL,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','','2021-12-15 05:01:40',0,1),(103,'研发部门',101,1,1,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','1','2024-10-02 10:22:03',0,1),(104,'市场部门',101,2,NULL,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','','2021-12-15 05:01:38',0,1),(105,'测试部门',101,3,NULL,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','1','2022-05-16 20:25:15',0,1),(106,'财务部门',101,4,103,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','103','2022-01-15 21:32:22',0,1),(107,'运维部门',101,5,1,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','1','2023-12-02 09:28:22',0,1),(108,'市场部门',102,1,NULL,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','1','2022-02-16 08:35:45',0,1),(109,'财务部门',102,2,NULL,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','','2021-12-15 05:01:29',0,1),(110,'新部门',0,1,NULL,NULL,NULL,0,'110','2022-02-23 20:46:30','110','2022-02-23 20:46:30',0,121),(111,'顶级部门',0,1,NULL,NULL,NULL,0,'113','2022-03-07 21:44:50','113','2022-03-07 21:44:50',0,122),(112,'产品部门',101,100,1,NULL,NULL,1,'1','2023-12-02 09:45:13','1','2023-12-02 09:45:31',0,1),(113,'支持部门',102,3,104,NULL,NULL,1,'1','2023-12-02 09:47:38','1','2023-12-02 09:47:38',0,1),(115,'广州分公司',100,10,112,'18812345688','gz@qq.com',0,'100','2025-04-01 08:23:19','100','2025-04-01 08:26:56',0,0);
/*!40000 ALTER TABLE `system_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dict_data`
--

DROP TABLE IF EXISTS `system_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dict_data` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `sort` int NOT NULL DEFAULT '0' COMMENT '字典排序',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典标签',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `color_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '颜色类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'css 样式',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dict_data`
--

LOCK TABLES `system_dict_data` WRITE;
/*!40000 ALTER TABLE `system_dict_data` DISABLE KEYS */;
INSERT INTO `system_dict_data` VALUES (1,1,'男','1','system_user_sex',0,'default','A','性别男','admin','2021-01-05 17:03:48','1','2022-03-29 00:14:39',0),(2,2,'女','2','system_user_sex',0,'success','','性别女','admin','2021-01-05 17:03:48','1','2023-11-15 23:30:37',0),(8,1,'正常','1','infra_job_status',0,'success','','正常状态','admin','2021-01-05 17:03:48','1','2022-02-16 19:33:38',0),(9,2,'暂停','2','infra_job_status',0,'danger','','停用状态','admin','2021-01-05 17:03:48','1','2022-02-16 19:33:45',0),(12,1,'系统内置','1','infra_config_type',0,'danger','','参数类型 - 系统内置','admin','2021-01-05 17:03:48','1','2022-02-16 19:06:02',0),(13,2,'自定义','2','infra_config_type',0,'primary','','参数类型 - 自定义','admin','2021-01-05 17:03:48','1','2022-02-16 19:06:07',0),(14,1,'通知','1','system_notice_type',0,'success','','通知','admin','2021-01-05 17:03:48','1','2022-02-16 13:05:57',0),(15,2,'公告','2','system_notice_type',0,'info','','公告','admin','2021-01-05 17:03:48','1','2022-02-16 13:06:01',0),(16,0,'其它','0','infra_operate_type',0,'default','','其它操作','admin','2021-01-05 17:03:48','1','2024-03-14 12:44:19',0),(17,1,'查询','1','infra_operate_type',0,'info','','查询操作','admin','2021-01-05 17:03:48','1','2024-03-14 12:44:20',0),(18,2,'新增','2','infra_operate_type',0,'primary','','新增操作','admin','2021-01-05 17:03:48','1','2024-03-14 12:44:21',0),(19,3,'修改','3','infra_operate_type',0,'warning','','修改操作','admin','2021-01-05 17:03:48','1','2024-03-14 12:44:22',0),(20,4,'删除','4','infra_operate_type',0,'danger','','删除操作','admin','2021-01-05 17:03:48','1','2024-03-14 12:44:23',0),(22,5,'导出','5','infra_operate_type',0,'default','','导出操作','admin','2021-01-05 17:03:48','1','2024-03-14 12:44:24',0),(23,6,'导入','6','infra_operate_type',0,'default','','导入操作','admin','2021-01-05 17:03:48','1','2024-03-14 12:44:25',0),(27,1,'开启','0','common_status',0,'primary','','开启状态','admin','2021-01-05 17:03:48','1','2022-02-16 08:00:39',0),(28,2,'关闭','1','common_status',0,'info','','关闭状态','admin','2021-01-05 17:03:48','1','2022-02-16 08:00:44',0),(29,1,'目录','1','system_menu_type',0,'','','目录','admin','2021-01-05 17:03:48','','2022-02-01 16:43:45',0),(30,2,'菜单','2','system_menu_type',0,'','','菜单','admin','2021-01-05 17:03:48','','2022-02-01 16:43:41',0),(31,3,'按钮','3','system_menu_type',0,'','','按钮','admin','2021-01-05 17:03:48','','2022-02-01 16:43:39',0),(32,1,'内置','1','system_role_type',0,'danger','','内置角色','admin','2021-01-05 17:03:48','1','2022-02-16 13:02:08',0),(33,2,'自定义','2','system_role_type',0,'primary','','自定义角色','admin','2021-01-05 17:03:48','1','2022-02-16 13:02:12',0),(34,1,'全部数据权限','1','system_data_scope',0,'','','全部数据权限','admin','2021-01-05 17:03:48','','2022-02-01 16:47:17',0),(35,2,'指定部门数据权限','2','system_data_scope',0,'','','指定部门数据权限','admin','2021-01-05 17:03:48','','2022-02-01 16:47:18',0),(36,3,'本部门数据权限','3','system_data_scope',0,'','','本部门数据权限','admin','2021-01-05 17:03:48','','2022-02-01 16:47:16',0),(37,4,'本部门及以下数据权限','4','system_data_scope',0,'','','本部门及以下数据权限','admin','2021-01-05 17:03:48','','2022-02-01 16:47:21',0),(38,5,'仅本人数据权限','5','system_data_scope',0,'','','仅本人数据权限','admin','2021-01-05 17:03:48','','2022-02-01 16:47:23',0),(39,0,'成功','0','system_login_result',0,'success','','登陆结果 - 成功','','2021-01-18 06:17:36','1','2022-02-16 13:23:49',0),(40,10,'账号或密码不正确','10','system_login_result',0,'primary','','登陆结果 - 账号或密码不正确','','2021-01-18 06:17:54','1','2022-02-16 13:24:27',0),(41,20,'用户被禁用','20','system_login_result',0,'warning','','登陆结果 - 用户被禁用','','2021-01-18 06:17:54','1','2022-02-16 13:23:57',0),(42,30,'验证码不存在','30','system_login_result',0,'info','','登陆结果 - 验证码不存在','','2021-01-18 06:17:54','1','2022-02-16 13:24:07',0),(43,31,'验证码不正确','31','system_login_result',0,'info','','登陆结果 - 验证码不正确','','2021-01-18 06:17:54','1','2022-02-16 13:24:11',0),(44,100,'未知异常','100','system_login_result',0,'danger','','登陆结果 - 未知异常','','2021-01-18 06:17:54','1','2022-02-16 13:24:23',0),(45,1,'是','true','infra_boolean_string',0,'danger','','Boolean 是否类型 - 是','','2021-01-19 03:20:55','1','2022-03-15 23:01:45',0),(46,1,'否','false','infra_boolean_string',0,'info','','Boolean 是否类型 - 否','','2021-01-19 03:20:55','1','2022-03-15 23:09:45',0),(50,1,'单表（增删改查）','1','infra_codegen_template_type',0,'','',NULL,'','2021-02-05 07:09:06','','2022-03-10 16:33:15',0),(51,2,'树表（增删改查）','2','infra_codegen_template_type',0,'','',NULL,'','2021-02-05 07:14:46','','2022-03-10 16:33:19',0),(53,0,'初始化中','0','infra_job_status',0,'primary','',NULL,'','2021-02-07 07:46:49','1','2022-02-16 19:33:29',0),(57,0,'运行中','0','infra_job_log_status',0,'primary','','RUNNING','','2021-02-08 10:04:24','1','2022-02-16 19:07:48',0),(58,1,'成功','1','infra_job_log_status',0,'success','',NULL,'','2021-02-08 10:06:57','1','2022-02-16 19:07:52',0),(59,2,'失败','2','infra_job_log_status',0,'warning','','失败','','2021-02-08 10:07:38','1','2022-02-16 19:07:56',0),(60,1,'会员','1','user_type',0,'primary','',NULL,'','2021-02-26 00:16:27','1','2022-02-16 10:22:19',0),(61,2,'管理员','2','user_type',0,'success','',NULL,'','2021-02-26 00:16:34','1','2022-02-16 10:22:22',0),(62,0,'未处理','0','infra_api_error_log_process_status',0,'primary','',NULL,'','2021-02-26 07:07:19','1','2022-02-16 20:14:17',0),(63,1,'已处理','1','infra_api_error_log_process_status',0,'success','',NULL,'','2021-02-26 07:07:26','1','2022-02-16 20:14:08',0),(64,2,'已忽略','2','infra_api_error_log_process_status',0,'danger','',NULL,'','2021-02-26 07:07:34','1','2022-02-16 20:14:14',0),(66,1,'阿里云','ALIYUN','system_sms_channel_code',0,'primary','',NULL,'1','2021-04-05 01:05:26','1','2024-07-22 22:23:25',0),(67,1,'验证码','1','system_sms_template_type',0,'warning','',NULL,'1','2021-04-05 21:50:57','1','2022-02-16 12:48:30',0),(68,2,'通知','2','system_sms_template_type',0,'primary','',NULL,'1','2021-04-05 21:51:08','1','2022-02-16 12:48:27',0),(69,0,'营销','3','system_sms_template_type',0,'danger','',NULL,'1','2021-04-05 21:51:15','1','2022-02-16 12:48:22',0),(70,0,'初始化','0','system_sms_send_status',0,'primary','',NULL,'1','2021-04-11 20:18:33','1','2022-02-16 10:26:07',0),(71,1,'发送成功','10','system_sms_send_status',0,'success','',NULL,'1','2021-04-11 20:18:43','1','2022-02-16 10:25:56',0),(72,2,'发送失败','20','system_sms_send_status',0,'danger','',NULL,'1','2021-04-11 20:18:49','1','2022-02-16 10:26:03',0),(73,3,'不发送','30','system_sms_send_status',0,'info','',NULL,'1','2021-04-11 20:19:44','1','2022-02-16 10:26:10',0),(74,0,'等待结果','0','system_sms_receive_status',0,'primary','',NULL,'1','2021-04-11 20:27:43','1','2022-02-16 10:28:24',0),(75,1,'接收成功','10','system_sms_receive_status',0,'success','',NULL,'1','2021-04-11 20:29:25','1','2022-02-16 10:28:28',0),(76,2,'接收失败','20','system_sms_receive_status',0,'danger','',NULL,'1','2021-04-11 20:29:31','1','2022-02-16 10:28:32',0),(77,0,'调试(钉钉)','DEBUG_DING_TALK','system_sms_channel_code',0,'info','',NULL,'1','2021-04-13 00:20:37','1','2022-02-16 10:10:00',0),(80,100,'账号登录','100','system_login_type',0,'primary','','账号登录','1','2021-10-06 00:52:02','1','2022-02-16 13:11:34',0),(81,101,'社交登录','101','system_login_type',0,'info','','社交登录','1','2021-10-06 00:52:17','1','2022-02-16 13:11:40',0),(83,200,'主动登出','200','system_login_type',0,'primary','','主动登出','1','2021-10-06 00:52:58','1','2022-02-16 13:11:49',0),(85,202,'强制登出','202','system_login_type',0,'danger','','强制退出','1','2021-10-06 00:53:41','1','2022-02-16 13:11:57',0),(86,0,'病假','1','bpm_oa_leave_type',0,'primary','',NULL,'1','2021-09-21 22:35:28','1','2022-02-16 10:00:41',0),(87,1,'事假','2','bpm_oa_leave_type',0,'info','',NULL,'1','2021-09-21 22:36:11','1','2022-02-16 10:00:49',0),(88,2,'婚假','3','bpm_oa_leave_type',0,'warning','',NULL,'1','2021-09-21 22:36:38','1','2022-02-16 10:00:53',0),(112,0,'微信 Wap 网站支付','wx_wap','pay_channel_code',0,'success','','微信 Wap 网站支付','1','2023-07-19 20:08:06','1','2023-07-19 20:09:08',0),(113,1,'微信公众号支付','wx_pub','pay_channel_code',0,'success','','微信公众号支付','1','2021-12-03 10:40:24','1','2023-07-19 20:08:47',0),(114,2,'微信小程序支付','wx_lite','pay_channel_code',0,'success','','微信小程序支付','1','2021-12-03 10:41:06','1','2023-07-19 20:08:50',0),(115,3,'微信 App 支付','wx_app','pay_channel_code',0,'success','','微信 App 支付','1','2021-12-03 10:41:20','1','2023-07-19 20:08:56',0),(116,10,'支付宝 PC 网站支付','alipay_pc','pay_channel_code',0,'primary','','支付宝 PC 网站支付','1','2021-12-03 10:42:09','1','2023-07-19 20:09:12',0),(117,11,'支付宝 Wap 网站支付','alipay_wap','pay_channel_code',0,'primary','','支付宝 Wap 网站支付','1','2021-12-03 10:42:26','1','2023-07-19 20:09:16',0),(118,12,'支付宝 App 支付','alipay_app','pay_channel_code',0,'primary','','支付宝 App 支付','1','2021-12-03 10:42:55','1','2023-07-19 20:09:20',0),(119,14,'支付宝扫码支付','alipay_qr','pay_channel_code',0,'primary','','支付宝扫码支付','1','2021-12-03 10:43:10','1','2023-07-19 20:09:28',0),(120,10,'通知成功','10','pay_notify_status',0,'success','','通知成功','1','2021-12-03 11:02:41','1','2023-07-19 10:08:19',0),(121,20,'通知失败','20','pay_notify_status',0,'danger','','通知失败','1','2021-12-03 11:02:59','1','2023-07-19 10:08:21',0),(122,0,'等待通知','0','pay_notify_status',0,'info','','未通知','1','2021-12-03 11:03:10','1','2023-07-19 10:08:24',0),(123,10,'支付成功','10','pay_order_status',0,'success','','支付成功','1','2021-12-03 11:18:29','1','2023-07-19 18:04:28',0),(124,30,'支付关闭','30','pay_order_status',0,'info','','支付关闭','1','2021-12-03 11:18:42','1','2023-07-19 18:05:07',0),(125,0,'等待支付','0','pay_order_status',0,'info','','未支付','1','2021-12-03 11:18:18','1','2023-07-19 18:04:15',0),(600,5,'首页','1','promotion_banner_position',0,'warning','','','1','2023-10-11 07:45:24','1','2023-10-11 07:45:38',0),(601,4,'秒杀活动页','2','promotion_banner_position',0,'warning','','','1','2023-10-11 07:45:24','1','2023-10-11 07:45:38',0),(602,3,'砍价活动页','3','promotion_banner_position',0,'warning','','','1','2023-10-11 07:45:24','1','2023-10-11 07:45:38',0),(603,2,'限时折扣页','4','promotion_banner_position',0,'warning','','','1','2023-10-11 07:45:24','1','2023-10-11 07:45:38',0),(604,1,'满减送页','5','promotion_banner_position',0,'warning','','','1','2023-10-11 07:45:24','1','2023-10-11 07:45:38',0),(1118,0,'等待退款','0','pay_refund_status',0,'info','','等待退款','1','2021-12-10 16:44:59','1','2023-07-19 10:14:39',0),(1119,20,'退款失败','20','pay_refund_status',0,'danger','','退款失败','1','2021-12-10 16:45:10','1','2023-07-19 10:15:10',0),(1124,10,'退款成功','10','pay_refund_status',0,'success','','退款成功','1','2021-12-10 16:46:26','1','2023-07-19 10:15:00',0),(1127,1,'审批中','1','bpm_process_instance_status',0,'default','','流程实例的状态 - 进行中','1','2022-01-07 23:47:22','1','2024-03-16 16:11:45',0),(1128,2,'审批通过','2','bpm_process_instance_status',0,'success','','流程实例的状态 - 已完成','1','2022-01-07 23:47:49','1','2024-03-16 16:11:54',0),(1129,1,'审批中','1','bpm_task_status',0,'primary','','流程实例的结果 - 处理中','1','2022-01-07 23:48:32','1','2024-03-08 22:41:37',0),(1130,2,'审批通过','2','bpm_task_status',0,'success','','流程实例的结果 - 通过','1','2022-01-07 23:48:45','1','2024-03-08 22:41:38',0),(1131,3,'审批不通过','3','bpm_task_status',0,'danger','','流程实例的结果 - 不通过','1','2022-01-07 23:48:55','1','2024-03-08 22:41:38',0),(1132,4,'已取消','4','bpm_task_status',0,'info','','流程实例的结果 - 撤销','1','2022-01-07 23:49:06','1','2024-03-08 22:41:39',0),(1133,10,'流程表单','10','bpm_model_form_type',0,'','','流程的表单类型 - 流程表单','103','2022-01-11 23:51:30','103','2022-01-11 23:51:30',0),(1134,20,'业务表单','20','bpm_model_form_type',0,'','','流程的表单类型 - 业务表单','103','2022-01-11 23:51:47','103','2022-01-11 23:51:47',0),(1135,10,'角色','10','bpm_task_candidate_strategy',0,'info','','任务分配规则的类型 - 角色','103','2022-01-12 23:21:22','1','2024-03-06 02:53:16',0),(1136,20,'部门的成员','20','bpm_task_candidate_strategy',0,'primary','','任务分配规则的类型 - 部门的成员','103','2022-01-12 23:21:47','1','2024-03-06 02:53:17',0),(1137,21,'部门的负责人','21','bpm_task_candidate_strategy',0,'primary','','任务分配规则的类型 - 部门的负责人','103','2022-01-12 23:33:36','1','2024-03-06 02:53:18',0),(1138,30,'用户','30','bpm_task_candidate_strategy',0,'info','','任务分配规则的类型 - 用户','103','2022-01-12 23:34:02','1','2024-03-06 02:53:19',0),(1139,40,'用户组','40','bpm_task_candidate_strategy',0,'warning','','任务分配规则的类型 - 用户组','103','2022-01-12 23:34:21','1','2024-03-06 02:53:20',0),(1140,60,'流程表达式','60','bpm_task_candidate_strategy',0,'danger','','任务分配规则的类型 - 流程表达式','103','2022-01-12 23:34:43','1','2024-03-06 02:53:20',0),(1141,22,'岗位','22','bpm_task_candidate_strategy',0,'success','','任务分配规则的类型 - 岗位','103','2022-01-14 18:41:55','1','2024-03-06 02:53:21',0),(1145,1,'管理后台','1','infra_codegen_scene',0,'','','代码生成的场景枚举 - 管理后台','1','2022-02-02 13:15:06','1','2022-03-10 16:32:59',0),(1146,2,'用户 APP','2','infra_codegen_scene',0,'','','代码生成的场景枚举 - 用户 APP','1','2022-02-02 13:15:19','1','2022-03-10 16:33:03',0),(1150,1,'数据库','1','infra_file_storage',0,'default','',NULL,'1','2022-03-15 00:25:28','1','2022-03-15 00:25:28',0),(1151,10,'本地磁盘','10','infra_file_storage',0,'default','',NULL,'1','2022-03-15 00:25:41','1','2022-03-15 00:25:56',0),(1152,11,'FTP 服务器','11','infra_file_storage',0,'default','',NULL,'1','2022-03-15 00:26:06','1','2022-03-15 00:26:10',0),(1153,12,'SFTP 服务器','12','infra_file_storage',0,'default','',NULL,'1','2022-03-15 00:26:22','1','2022-03-15 00:26:22',0),(1154,20,'S3 对象存储','20','infra_file_storage',0,'default','',NULL,'1','2022-03-15 00:26:31','1','2022-03-15 00:26:45',0),(1155,103,'短信登录','103','system_login_type',0,'default','',NULL,'1','2022-05-09 23:57:58','1','2022-05-09 23:58:09',0),(1156,1,'password','password','system_oauth2_grant_type',0,'default','','密码模式','1','2022-05-12 00:22:05','1','2022-05-11 16:26:01',0),(1157,2,'authorization_code','authorization_code','system_oauth2_grant_type',0,'primary','','授权码模式','1','2022-05-12 00:22:59','1','2022-05-11 16:26:02',0),(1158,3,'implicit','implicit','system_oauth2_grant_type',0,'success','','简化模式','1','2022-05-12 00:23:40','1','2022-05-11 16:26:05',0),(1159,4,'client_credentials','client_credentials','system_oauth2_grant_type',0,'default','','客户端模式','1','2022-05-12 00:23:51','1','2022-05-11 16:26:08',0),(1160,5,'refresh_token','refresh_token','system_oauth2_grant_type',0,'info','','刷新模式','1','2022-05-12 00:24:02','1','2022-05-11 16:26:11',0),(1162,1,'销售中','1','product_spu_status',0,'success','','商品 SPU 状态 - 销售中','1','2022-10-24 21:19:47','1','2022-10-24 21:20:38',0),(1163,0,'仓库中','0','product_spu_status',0,'info','','商品 SPU 状态 - 仓库中','1','2022-10-24 21:20:54','1','2022-10-24 21:21:22',0),(1164,0,'回收站','-1','product_spu_status',0,'default','','商品 SPU 状态 - 回收站','1','2022-10-24 21:21:11','1','2022-10-24 21:21:11',0),(1165,1,'满减','1','promotion_discount_type',0,'success','','优惠类型 - 满减','1','2022-11-01 12:46:41','1','2022-11-01 12:50:11',0),(1166,2,'折扣','2','promotion_discount_type',0,'primary','','优惠类型 - 折扣','1','2022-11-01 12:46:51','1','2022-11-01 12:50:08',0),(1167,1,'固定日期','1','promotion_coupon_template_validity_type',0,'default','','优惠劵模板的有限期类型 - 固定日期','1','2022-11-02 00:07:34','1','2022-11-04 00:07:49',0),(1168,2,'领取之后','2','promotion_coupon_template_validity_type',0,'default','','优惠劵模板的有限期类型 - 领取之后','1','2022-11-02 00:07:54','1','2022-11-04 00:07:52',0),(1169,1,'通用劵','1','promotion_product_scope',0,'default','','营销的商品范围 - 全部商品参与','1','2022-11-02 00:28:22','1','2023-09-28 00:27:42',0),(1170,2,'商品劵','2','promotion_product_scope',0,'default','','营销的商品范围 - 指定商品参与','1','2022-11-02 00:28:34','1','2023-09-28 00:27:44',0),(1171,1,'未使用','1','promotion_coupon_status',0,'primary','','优惠劵的状态 - 已领取','1','2022-11-04 00:15:08','1','2023-10-03 12:54:38',0),(1172,2,'已使用','2','promotion_coupon_status',0,'success','','优惠劵的状态 - 已使用','1','2022-11-04 00:15:21','1','2022-11-04 19:16:08',0),(1173,3,'已过期','3','promotion_coupon_status',0,'info','','优惠劵的状态 - 已过期','1','2022-11-04 00:15:43','1','2022-11-04 19:16:12',0),(1174,1,'直接领取','1','promotion_coupon_take_type',0,'primary','','优惠劵的领取方式 - 直接领取','1','2022-11-04 19:13:00','1','2022-11-04 19:13:25',0),(1175,2,'指定发放','2','promotion_coupon_take_type',0,'success','','优惠劵的领取方式 - 指定发放','1','2022-11-04 19:13:13','1','2022-11-04 19:14:48',0),(1176,10,'未开始','10','promotion_activity_status',0,'primary','','促销活动的状态枚举 - 未开始','1','2022-11-04 22:54:49','1','2022-11-04 22:55:53',0),(1177,20,'进行中','20','promotion_activity_status',0,'success','','促销活动的状态枚举 - 进行中','1','2022-11-04 22:55:06','1','2022-11-04 22:55:20',0),(1178,30,'已结束','30','promotion_activity_status',0,'info','','促销活动的状态枚举 - 已结束','1','2022-11-04 22:55:41','1','2022-11-04 22:55:41',0),(1179,40,'已关闭','40','promotion_activity_status',0,'warning','','促销活动的状态枚举 - 已关闭','1','2022-11-04 22:56:10','1','2022-11-04 22:56:18',0),(1180,10,'满 N 元','10','promotion_condition_type',0,'primary','','营销的条件类型 - 满 N 元','1','2022-11-04 22:59:45','1','2022-11-04 22:59:45',0),(1181,20,'满 N 件','20','promotion_condition_type',0,'success','','营销的条件类型 - 满 N 件','1','2022-11-04 23:00:02','1','2022-11-04 23:00:02',0),(1182,10,'申请售后','10','trade_after_sale_status',0,'primary','','交易售后状态 - 申请售后','1','2022-11-19 20:53:33','1','2022-11-19 20:54:42',0),(1183,20,'商品待退货','20','trade_after_sale_status',0,'primary','','交易售后状态 - 商品待退货','1','2022-11-19 20:54:36','1','2022-11-19 20:58:58',0),(1184,30,'商家待收货','30','trade_after_sale_status',0,'primary','','交易售后状态 - 商家待收货','1','2022-11-19 20:56:56','1','2022-11-19 20:59:20',0),(1185,40,'等待退款','40','trade_after_sale_status',0,'primary','','交易售后状态 - 等待退款','1','2022-11-19 20:59:54','1','2022-11-19 21:00:01',0),(1186,50,'退款成功','50','trade_after_sale_status',0,'default','','交易售后状态 - 退款成功','1','2022-11-19 21:00:33','1','2022-11-19 21:00:33',0),(1187,61,'买家取消','61','trade_after_sale_status',0,'info','','交易售后状态 - 买家取消','1','2022-11-19 21:01:29','1','2022-11-19 21:01:29',0),(1188,62,'商家拒绝','62','trade_after_sale_status',0,'info','','交易售后状态 - 商家拒绝','1','2022-11-19 21:02:17','1','2022-11-19 21:02:17',0),(1189,63,'商家拒收货','63','trade_after_sale_status',0,'info','','交易售后状态 - 商家拒收货','1','2022-11-19 21:02:37','1','2022-11-19 21:03:07',0),(1190,10,'售中退款','10','trade_after_sale_type',0,'success','','交易售后的类型 - 售中退款','1','2022-11-19 21:05:05','1','2022-11-19 21:38:23',0),(1191,20,'售后退款','20','trade_after_sale_type',0,'primary','','交易售后的类型 - 售后退款','1','2022-11-19 21:05:32','1','2022-11-19 21:38:32',0),(1192,10,'仅退款','10','trade_after_sale_way',0,'primary','','交易售后的方式 - 仅退款','1','2022-11-19 21:39:19','1','2022-11-19 21:39:19',0),(1193,20,'退货退款','20','trade_after_sale_way',0,'success','','交易售后的方式 - 退货退款','1','2022-11-19 21:39:38','1','2022-11-19 21:39:49',0),(1194,10,'微信小程序','10','terminal',0,'default','','终端 - 微信小程序','1','2022-12-10 10:51:11','1','2022-12-10 10:51:57',0),(1195,20,'H5 网页','20','terminal',0,'default','','终端 - H5 网页','1','2022-12-10 10:51:30','1','2022-12-10 10:51:59',0),(1196,11,'微信公众号','11','terminal',0,'default','','终端 - 微信公众号','1','2022-12-10 10:54:16','1','2022-12-10 10:52:01',0),(1197,31,'苹果 App','31','terminal',0,'default','','终端 - 苹果 App','1','2022-12-10 10:54:42','1','2022-12-10 10:52:18',0),(1198,32,'安卓 App','32','terminal',0,'default','','终端 - 安卓 App','1','2022-12-10 10:55:02','1','2022-12-10 10:59:17',0),(1199,0,'普通订单','0','trade_order_type',0,'default','','交易订单的类型 - 普通订单','1','2022-12-10 16:34:14','1','2022-12-10 16:34:14',0),(1200,1,'秒杀订单','1','trade_order_type',0,'default','','交易订单的类型 - 秒杀订单','1','2022-12-10 16:34:26','1','2022-12-10 16:34:26',0),(1201,2,'砍价订单','2','trade_order_type',0,'default','','交易订单的类型 - 拼团订单','1','2022-12-10 16:34:36','1','2024-09-07 14:18:39',0),(1202,3,'拼团订单','3','trade_order_type',0,'default','','交易订单的类型 - 砍价订单','1','2022-12-10 16:34:48','1','2024-09-07 14:18:32',0),(1203,0,'待支付','0','trade_order_status',0,'default','','交易订单状态 - 待支付','1','2022-12-10 16:49:29','1','2022-12-10 16:49:29',0),(1204,10,'待发货','10','trade_order_status',0,'primary','','交易订单状态 - 待发货','1','2022-12-10 16:49:53','1','2022-12-10 16:51:17',0),(1205,20,'已发货','20','trade_order_status',0,'primary','','交易订单状态 - 已发货','1','2022-12-10 16:50:13','1','2022-12-10 16:51:31',0),(1206,30,'已完成','30','trade_order_status',0,'success','','交易订单状态 - 已完成','1','2022-12-10 16:50:30','1','2022-12-10 16:51:06',0),(1207,40,'已取消','40','trade_order_status',0,'danger','','交易订单状态 - 已取消','1','2022-12-10 16:50:50','1','2022-12-10 16:51:00',0),(1208,0,'未售后','0','trade_order_item_after_sale_status',0,'info','','交易订单项的售后状态 - 未售后','1','2022-12-10 20:58:42','1','2022-12-10 20:59:29',0),(1209,10,'售后中','10','trade_order_item_after_sale_status',0,'primary','','交易订单项的售后状态 - 售后中','1','2022-12-10 20:59:21','1','2024-07-21 17:01:24',0),(1210,20,'已退款','20','trade_order_item_after_sale_status',0,'success','','交易订单项的售后状态 - 已退款','1','2022-12-10 20:59:46','1','2024-07-21 17:01:35',0),(1211,1,'完全匹配','1','mp_auto_reply_request_match',0,'primary','','公众号自动回复的请求关键字匹配模式 - 完全匹配','1','2023-01-16 23:30:39','1','2023-01-16 23:31:00',0),(1212,2,'半匹配','2','mp_auto_reply_request_match',0,'success','','公众号自动回复的请求关键字匹配模式 - 半匹配','1','2023-01-16 23:30:55','1','2023-01-16 23:31:10',0),(1213,1,'文本','text','mp_message_type',0,'default','','公众号的消息类型 - 文本','1','2023-01-17 22:17:32','1','2023-01-17 22:17:39',0),(1214,2,'图片','image','mp_message_type',0,'default','','公众号的消息类型 - 图片','1','2023-01-17 22:17:32','1','2023-01-17 14:19:47',0),(1215,3,'语音','voice','mp_message_type',0,'default','','公众号的消息类型 - 语音','1','2023-01-17 22:17:32','1','2023-01-17 14:20:08',0),(1216,4,'视频','video','mp_message_type',0,'default','','公众号的消息类型 - 视频','1','2023-01-17 22:17:32','1','2023-01-17 14:21:08',0),(1217,5,'小视频','shortvideo','mp_message_type',0,'default','','公众号的消息类型 - 小视频','1','2023-01-17 22:17:32','1','2023-01-17 14:19:59',0),(1218,6,'图文','news','mp_message_type',0,'default','','公众号的消息类型 - 图文','1','2023-01-17 22:17:32','1','2023-01-17 14:22:54',0),(1219,7,'音乐','music','mp_message_type',0,'default','','公众号的消息类型 - 音乐','1','2023-01-17 22:17:32','1','2023-01-17 14:22:54',0),(1220,8,'地理位置','location','mp_message_type',0,'default','','公众号的消息类型 - 地理位置','1','2023-01-17 22:17:32','1','2023-01-17 14:23:51',0),(1221,9,'链接','link','mp_message_type',0,'default','','公众号的消息类型 - 链接','1','2023-01-17 22:17:32','1','2023-01-17 14:24:49',0),(1222,10,'事件','event','mp_message_type',0,'default','','公众号的消息类型 - 事件','1','2023-01-17 22:17:32','1','2023-01-17 14:24:49',0),(1223,0,'初始化','0','system_mail_send_status',0,'primary','','邮件发送状态 - 初始化\n','1','2023-01-26 09:53:49','1','2023-01-26 16:36:14',0),(1224,10,'发送成功','10','system_mail_send_status',0,'success','','邮件发送状态 - 发送成功','1','2023-01-26 09:54:28','1','2023-01-26 16:36:22',0),(1225,20,'发送失败','20','system_mail_send_status',0,'danger','','邮件发送状态 - 发送失败','1','2023-01-26 09:54:50','1','2023-01-26 16:36:26',0),(1226,30,'不发送','30','system_mail_send_status',0,'info','','邮件发送状态 -  不发送','1','2023-01-26 09:55:06','1','2023-01-26 16:36:36',0),(1227,1,'通知公告','1','system_notify_template_type',0,'primary','','站内信模版的类型 - 通知公告','1','2023-01-28 10:35:59','1','2023-01-28 10:35:59',0),(1228,2,'系统消息','2','system_notify_template_type',0,'success','','站内信模版的类型 - 系统消息','1','2023-01-28 10:36:20','1','2023-01-28 10:36:25',0),(1230,13,'支付宝条码支付','alipay_bar','pay_channel_code',0,'primary','','支付宝条码支付','1','2023-02-18 23:32:24','1','2023-07-19 20:09:23',0),(1231,10,'Vue2 Element UI 标准模版','10','infra_codegen_front_type',0,'','','','1','2023-04-13 00:03:55','1','2023-04-13 00:03:55',0),(1232,20,'Vue3 Element Plus 标准模版','20','infra_codegen_front_type',0,'','','','1','2023-04-13 00:04:08','1','2023-04-13 00:04:08',0),(1234,30,'Vue3 vben 模版','30','infra_codegen_front_type',0,'','','','1','2023-04-13 00:04:26','1','2023-04-13 00:04:26',0),(1244,0,'按件','1','trade_delivery_express_charge_mode',0,'','','','1','2023-05-21 22:46:40','1','2023-05-21 22:46:40',0),(1245,1,'按重量','2','trade_delivery_express_charge_mode',0,'','','','1','2023-05-21 22:46:58','1','2023-05-21 22:46:58',0),(1246,2,'按体积','3','trade_delivery_express_charge_mode',0,'','','','1','2023-05-21 22:47:18','1','2023-05-21 22:47:18',0),(1335,11,'订单积分抵扣','11','member_point_biz_type',0,'','','','1','2023-06-10 12:15:27','1','2023-10-11 07:41:43',0),(1336,1,'签到','1','member_point_biz_type',0,'','','','1','2023-06-10 12:15:48','1','2023-08-20 11:59:53',0),(1341,20,'已退款','20','pay_order_status',0,'danger','','已退款','1','2023-07-19 18:05:37','1','2023-07-19 18:05:37',0),(1342,21,'请求成功，但是结果失败','21','pay_notify_status',0,'warning','','请求成功，但是结果失败','1','2023-07-19 18:10:47','1','2023-07-19 18:11:38',0),(1343,22,'请求失败','22','pay_notify_status',0,'warning','',NULL,'1','2023-07-19 18:11:05','1','2023-07-19 18:11:27',0),(1344,4,'微信扫码支付','wx_native','pay_channel_code',0,'success','','微信扫码支付','1','2023-07-19 20:07:47','1','2023-07-19 20:09:03',0),(1345,5,'微信条码支付','wx_bar','pay_channel_code',0,'success','','微信条码支付\n','1','2023-07-19 20:08:06','1','2023-07-19 20:09:08',0),(1346,1,'支付单','1','pay_notify_type',0,'primary','','支付单','1','2023-07-20 12:23:17','1','2023-07-20 12:23:17',0),(1347,2,'退款单','2','pay_notify_type',0,'danger','',NULL,'1','2023-07-20 12:23:26','1','2023-07-20 12:23:26',0),(1348,20,'模拟支付','mock','pay_channel_code',0,'default','','模拟支付','1','2023-07-29 11:10:51','1','2023-07-29 03:14:10',0),(1349,12,'订单积分抵扣（整单取消）','12','member_point_biz_type',0,'','','','1','2023-08-20 12:00:03','1','2023-10-11 07:42:01',0),(1350,0,'管理员调整','0','member_experience_biz_type',0,'','',NULL,'','2023-08-22 12:41:01','','2023-08-22 12:41:01',0),(1351,1,'邀新奖励','1','member_experience_biz_type',0,'','',NULL,'','2023-08-22 12:41:01','','2023-08-22 12:41:01',0),(1352,11,'下单奖励','11','member_experience_biz_type',0,'success','',NULL,'','2023-08-22 12:41:01','1','2023-10-11 07:45:09',0),(1353,12,'下单奖励（整单取消）','12','member_experience_biz_type',0,'warning','',NULL,'','2023-08-22 12:41:01','1','2023-10-11 07:45:01',0),(1354,4,'签到奖励','4','member_experience_biz_type',0,'','',NULL,'','2023-08-22 12:41:01','','2023-08-22 12:41:01',0),(1355,5,'抽奖奖励','5','member_experience_biz_type',0,'','',NULL,'','2023-08-22 12:41:01','','2023-08-22 12:41:01',0),(1356,1,'快递发货','1','trade_delivery_type',0,'','','','1','2023-08-23 00:04:55','1','2023-08-23 00:04:55',0),(1357,2,'用户自提','2','trade_delivery_type',0,'','','','1','2023-08-23 00:05:05','1','2023-08-23 00:05:05',0),(1358,3,'品类劵','3','promotion_product_scope',0,'default','','','1','2023-09-01 23:43:07','1','2023-09-28 00:27:47',0),(1359,1,'人人分销','1','brokerage_enabled_condition',0,'','','所有用户都可以分销','','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1360,2,'指定分销','2','brokerage_enabled_condition',0,'','','仅可后台手动设置推广员','','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1361,1,'首次绑定','1','brokerage_bind_mode',0,'','','只要用户没有推广人，随时都可以绑定推广关系','','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1362,2,'注册绑定','2','brokerage_bind_mode',0,'','','仅新用户注册时才能绑定推广关系','','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1363,3,'覆盖绑定','3','brokerage_bind_mode',0,'','','如果用户已经有推广人，推广人会被变更','','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1364,1,'钱包','1','brokerage_withdraw_type',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1365,2,'银行卡','2','brokerage_withdraw_type',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1366,3,'微信','3','brokerage_withdraw_type',0,'','','手动打款','','2023-09-28 02:46:05','1','2024-10-13 11:06:54',0),(1367,4,'支付宝','4','brokerage_withdraw_type',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1368,1,'订单返佣','1','brokerage_record_biz_type',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1369,2,'申请提现','2','brokerage_record_biz_type',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1370,3,'申请提现驳回','3','brokerage_record_biz_type',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1371,0,'待结算','0','brokerage_record_status',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1372,1,'已结算','1','brokerage_record_status',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1373,2,'已取消','2','brokerage_record_status',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1374,0,'审核中','0','brokerage_withdraw_status',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1375,10,'审核通过','10','brokerage_withdraw_status',0,'success','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1376,11,'提现成功','11','brokerage_withdraw_status',0,'success','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1377,20,'审核不通过','20','brokerage_withdraw_status',0,'danger','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1378,21,'提现失败','21','brokerage_withdraw_status',0,'danger','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1379,0,'工商银行','0','brokerage_bank_name',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1380,1,'建设银行','1','brokerage_bank_name',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1381,2,'农业银行','2','brokerage_bank_name',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1382,3,'中国银行','3','brokerage_bank_name',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1383,4,'交通银行','4','brokerage_bank_name',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1384,5,'招商银行','5','brokerage_bank_name',0,'','',NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0),(1385,21,'钱包','wallet','pay_channel_code',0,'primary','','','1','2023-10-01 21:46:19','1','2023-10-01 21:48:01',0),(1386,1,'砍价中','1','promotion_bargain_record_status',0,'default','','','1','2023-10-05 10:41:26','1','2023-10-05 10:41:26',0),(1387,2,'砍价成功','2','promotion_bargain_record_status',0,'success','','','1','2023-10-05 10:41:39','1','2023-10-05 10:41:39',0),(1388,3,'砍价失败','3','promotion_bargain_record_status',0,'warning','','','1','2023-10-05 10:41:57','1','2023-10-05 10:41:57',0),(1389,0,'拼团中','0','promotion_combination_record_status',0,'','','','1','2023-10-08 07:24:44','1','2024-10-13 10:08:17',0),(1390,1,'拼团成功','1','promotion_combination_record_status',0,'success','','','1','2023-10-08 07:24:56','1','2024-10-13 10:08:20',0),(1391,2,'拼团失败','2','promotion_combination_record_status',0,'warning','','','1','2023-10-08 07:25:11','1','2024-10-13 10:08:24',0),(1392,2,'管理员修改','2','member_point_biz_type',0,'default','','','1','2023-10-11 07:41:34','1','2023-10-11 07:41:34',0),(1393,13,'订单积分抵扣（单个退款）','13','member_point_biz_type',0,'','','','1','2023-10-11 07:42:29','1','2023-10-11 07:42:29',0),(1394,21,'订单积分奖励','21','member_point_biz_type',0,'default','','','1','2023-10-11 07:42:44','1','2023-10-11 07:42:44',0),(1395,22,'订单积分奖励（整单取消）','22','member_point_biz_type',0,'default','','','1','2023-10-11 07:42:55','1','2023-10-11 07:43:01',0),(1396,23,'订单积分奖励（单个退款）','23','member_point_biz_type',0,'default','','','1','2023-10-11 07:43:16','1','2023-10-11 07:43:16',0),(1397,13,'下单奖励（单个退款）','13','member_experience_biz_type',0,'warning','','','1','2023-10-11 07:45:24','1','2023-10-11 07:45:38',0),(1398,5,'网上转账','5','crm_receivable_return_type',0,'default','','','1','2023-10-18 21:55:24','1','2023-10-18 21:55:24',0),(1399,6,'支付宝','6','crm_receivable_return_type',0,'default','','','1','2023-10-18 21:55:38','1','2023-10-18 21:55:38',0),(1400,7,'微信支付','7','crm_receivable_return_type',0,'default','','','1','2023-10-18 21:55:53','1','2023-10-18 21:55:53',0),(1401,8,'其他','8','crm_receivable_return_type',0,'default','','','1','2023-10-18 21:56:06','1','2023-10-18 21:56:06',0),(1402,1,'IT','1','crm_customer_industry',0,'default','','','1','2023-10-28 23:02:15','1','2024-02-18 23:30:38',0),(1403,2,'金融业','2','crm_customer_industry',0,'default','','','1','2023-10-28 23:02:29','1','2024-02-18 23:30:43',0),(1404,3,'房地产','3','crm_customer_industry',0,'default','','','1','2023-10-28 23:02:41','1','2024-02-18 23:30:48',0),(1405,4,'商业服务','4','crm_customer_industry',0,'default','','','1','2023-10-28 23:02:54','1','2024-02-18 23:30:54',0),(1406,5,'运输/物流','5','crm_customer_industry',0,'default','','','1','2023-10-28 23:03:03','1','2024-02-18 23:31:00',0),(1407,6,'生产','6','crm_customer_industry',0,'default','','','1','2023-10-28 23:03:13','1','2024-02-18 23:31:08',0),(1408,7,'政府','7','crm_customer_industry',0,'default','','','1','2023-10-28 23:03:27','1','2024-02-18 23:31:13',0),(1409,8,'文化传媒','8','crm_customer_industry',0,'default','','','1','2023-10-28 23:03:37','1','2024-02-18 23:31:20',0),(1422,1,'A （重点客户）','1','crm_customer_level',0,'primary','','','1','2023-10-28 23:07:13','1','2023-10-28 23:07:13',0),(1423,2,'B （普通客户）','2','crm_customer_level',0,'info','','','1','2023-10-28 23:07:35','1','2023-10-28 23:07:35',0),(1424,3,'C （非优先客户）','3','crm_customer_level',0,'default','','','1','2023-10-28 23:07:53','1','2023-10-28 23:07:53',0),(1425,1,'促销','1','crm_customer_source',0,'default','','','1','2023-10-28 23:08:29','1','2023-10-28 23:08:29',0),(1426,2,'搜索引擎','2','crm_customer_source',0,'default','','','1','2023-10-28 23:08:39','1','2023-10-28 23:08:39',0),(1427,3,'广告','3','crm_customer_source',0,'default','','','1','2023-10-28 23:08:47','1','2023-10-28 23:08:47',0),(1428,4,'转介绍','4','crm_customer_source',0,'default','','','1','2023-10-28 23:08:58','1','2023-10-28 23:08:58',0),(1429,5,'线上注册','5','crm_customer_source',0,'default','','','1','2023-10-28 23:09:12','1','2023-10-28 23:09:12',0),(1430,6,'线上咨询','6','crm_customer_source',0,'default','','','1','2023-10-28 23:09:22','1','2023-10-28 23:09:22',0),(1431,7,'预约上门','7','crm_customer_source',0,'default','','','1','2023-10-28 23:09:39','1','2023-10-28 23:09:39',0),(1432,8,'陌拜','8','crm_customer_source',0,'default','','','1','2023-10-28 23:10:04','1','2023-10-28 23:10:04',0),(1433,9,'电话咨询','9','crm_customer_source',0,'default','','','1','2023-10-28 23:10:18','1','2023-10-28 23:10:18',0),(1434,10,'邮件咨询','10','crm_customer_source',0,'default','','','1','2023-10-28 23:10:33','1','2023-10-28 23:10:33',0),(1435,10,'Gitee','10','system_social_type',0,'','','','1','2023-11-04 13:04:42','1','2023-11-04 13:04:42',0),(1436,20,'钉钉','20','system_social_type',0,'','','','1','2023-11-04 13:04:54','1','2023-11-04 13:04:54',0),(1437,30,'企业微信','30','system_social_type',0,'','','','1','2023-11-04 13:05:09','1','2023-11-04 13:05:09',0),(1438,31,'微信公众平台','31','system_social_type',0,'','','','1','2023-11-04 13:05:18','1','2023-11-04 13:05:18',0),(1439,32,'微信开放平台','32','system_social_type',0,'','','','1','2023-11-04 13:05:30','1','2023-11-04 13:05:30',0),(1440,34,'微信小程序','34','system_social_type',0,'','','','1','2023-11-04 13:05:38','1','2023-11-04 13:07:16',0),(1441,1,'上架','1','crm_product_status',0,'success','','','1','2023-10-30 21:49:34','1','2023-10-30 21:49:34',0),(1442,0,'下架','0','crm_product_status',0,'success','','','1','2023-10-30 21:49:13','1','2023-10-30 21:49:13',0),(1443,15,'子表','15','infra_codegen_template_type',0,'default','','','1','2023-11-13 23:06:16','1','2023-11-13 23:06:16',0),(1444,10,'主表（标准模式）','10','infra_codegen_template_type',0,'default','','','1','2023-11-14 12:32:49','1','2023-11-14 12:32:49',0),(1445,11,'主表（ERP 模式）','11','infra_codegen_template_type',0,'default','','','1','2023-11-14 12:33:05','1','2023-11-14 12:33:05',0),(1446,12,'主表（内嵌模式）','12','infra_codegen_template_type',0,'','','','1','2023-11-14 12:33:31','1','2023-11-14 12:33:31',0),(1447,1,'负责人','1','crm_permission_level',0,'default','','','1','2023-11-30 09:53:12','1','2023-11-30 09:53:12',0),(1448,2,'只读','2','crm_permission_level',0,'','','','1','2023-11-30 09:53:29','1','2023-11-30 09:53:29',0),(1449,3,'读写','3','crm_permission_level',0,'','','','1','2023-11-30 09:53:36','1','2023-11-30 09:53:36',0),(1450,0,'未提交','0','crm_audit_status',0,'','','','1','2023-11-30 18:56:59','1','2023-11-30 18:56:59',0),(1451,10,'审批中','10','crm_audit_status',0,'','','','1','2023-11-30 18:57:10','1','2023-11-30 18:57:10',0),(1452,20,'审核通过','20','crm_audit_status',0,'','','','1','2023-11-30 18:57:24','1','2023-11-30 18:57:24',0),(1453,30,'审核不通过','30','crm_audit_status',0,'','','','1','2023-11-30 18:57:32','1','2023-11-30 18:57:32',0),(1454,40,'已取消','40','crm_audit_status',0,'','','','1','2023-11-30 18:57:42','1','2023-11-30 18:57:42',0),(1456,1,'支票','1','crm_receivable_return_type',0,'default','','','1','2023-10-18 21:54:29','1','2023-10-18 21:54:29',0),(1457,2,'现金','2','crm_receivable_return_type',0,'default','','','1','2023-10-18 21:54:41','1','2023-10-18 21:54:41',0),(1458,3,'邮政汇款','3','crm_receivable_return_type',0,'default','','','1','2023-10-18 21:54:53','1','2023-10-18 21:54:53',0),(1459,4,'电汇','4','crm_receivable_return_type',0,'default','','','1','2023-10-18 21:55:07','1','2023-10-18 21:55:07',0),(1461,1,'个','1','crm_product_unit',0,'','','','1','2023-12-05 23:02:26','1','2023-12-05 23:02:26',0),(1462,2,'块','2','crm_product_unit',0,'','','','1','2023-12-05 23:02:34','1','2023-12-05 23:02:34',0),(1463,3,'只','3','crm_product_unit',0,'','','','1','2023-12-05 23:02:57','1','2023-12-05 23:02:57',0),(1464,4,'把','4','crm_product_unit',0,'','','','1','2023-12-05 23:03:05','1','2023-12-05 23:03:05',0),(1465,5,'枚','5','crm_product_unit',0,'','','','1','2023-12-05 23:03:14','1','2023-12-05 23:03:14',0),(1466,6,'瓶','6','crm_product_unit',0,'','','','1','2023-12-05 23:03:20','1','2023-12-05 23:03:20',0),(1467,7,'盒','7','crm_product_unit',0,'','','','1','2023-12-05 23:03:30','1','2023-12-05 23:03:30',0),(1468,8,'台','8','crm_product_unit',0,'','','','1','2023-12-05 23:03:41','1','2023-12-05 23:03:41',0),(1469,9,'吨','9','crm_product_unit',0,'','','','1','2023-12-05 23:03:48','1','2023-12-05 23:03:48',0),(1470,10,'千克','10','crm_product_unit',0,'','','','1','2023-12-05 23:04:03','1','2023-12-05 23:04:03',0),(1471,11,'米','11','crm_product_unit',0,'','','','1','2023-12-05 23:04:12','1','2023-12-05 23:04:12',0),(1472,12,'箱','12','crm_product_unit',0,'','','','1','2023-12-05 23:04:25','1','2023-12-05 23:04:25',0),(1473,13,'套','13','crm_product_unit',0,'','','','1','2023-12-05 23:04:34','1','2023-12-05 23:04:34',0),(1474,1,'打电话','1','crm_follow_up_type',0,'','','','1','2024-01-15 20:48:20','1','2024-01-15 20:48:20',0),(1475,2,'发短信','2','crm_follow_up_type',0,'','','','1','2024-01-15 20:48:31','1','2024-01-15 20:48:31',0),(1476,3,'上门拜访','3','crm_follow_up_type',0,'','','','1','2024-01-15 20:49:07','1','2024-01-15 20:49:07',0),(1477,4,'微信沟通','4','crm_follow_up_type',0,'','','','1','2024-01-15 20:49:15','1','2024-01-15 20:49:15',0),(1478,4,'钱包余额','4','pay_transfer_type',0,'info','','','1','2023-10-28 16:28:37','1','2023-10-28 16:28:37',0),(1479,3,'银行卡','3','pay_transfer_type',0,'default','','','1','2023-10-28 16:28:21','1','2023-10-28 16:28:21',0),(1480,2,'微信余额','2','pay_transfer_type',0,'info','','','1','2023-10-28 16:28:07','1','2023-10-28 16:28:07',0),(1481,1,'支付宝余额','1','pay_transfer_type',0,'default','','','1','2023-10-28 16:27:44','1','2023-10-28 16:27:44',0),(1482,4,'转账失败','30','pay_transfer_status',0,'warning','','','1','2023-10-28 16:24:16','1','2023-10-28 16:24:16',0),(1483,3,'转账成功','20','pay_transfer_status',0,'success','','','1','2023-10-28 16:23:50','1','2023-10-28 16:23:50',0),(1484,2,'转账进行中','10','pay_transfer_status',0,'info','','','1','2023-10-28 16:23:12','1','2023-10-28 16:23:12',0),(1485,1,'等待转账','0','pay_transfer_status',0,'default','','','1','2023-10-28 16:21:43','1','2023-10-28 16:23:22',0),(1486,10,'其它入库','10','erp_stock_record_biz_type',0,'','','','1','2024-02-05 18:07:25','1','2024-02-05 18:07:43',0),(1487,11,'其它入库（作废）','11','erp_stock_record_biz_type',0,'danger','','','1','2024-02-05 18:08:07','1','2024-02-05 19:20:16',0),(1488,20,'其它出库','20','erp_stock_record_biz_type',0,'','','','1','2024-02-05 18:08:51','1','2024-02-05 18:08:51',0),(1489,21,'其它出库（作废）','21','erp_stock_record_biz_type',0,'danger','','','1','2024-02-05 18:09:00','1','2024-02-05 19:20:10',0),(1490,10,'未审核','10','erp_audit_status',0,'default','','','1','2024-02-06 00:00:21','1','2024-02-06 00:00:21',0),(1491,20,'已审核','20','erp_audit_status',0,'success','','','1','2024-02-06 00:00:35','1','2024-02-06 00:00:35',0),(1492,30,'调拨入库','30','erp_stock_record_biz_type',0,'','','','1','2024-02-07 20:34:19','1','2024-02-07 12:36:31',0),(1493,31,'调拨入库（作废）','31','erp_stock_record_biz_type',0,'danger','','','1','2024-02-07 20:34:29','1','2024-02-07 20:37:11',0),(1494,32,'调拨出库','32','erp_stock_record_biz_type',0,'','','','1','2024-02-07 20:34:38','1','2024-02-07 12:36:33',0),(1495,33,'调拨出库（作废）','33','erp_stock_record_biz_type',0,'danger','','','1','2024-02-07 20:34:49','1','2024-02-07 20:37:06',0),(1496,40,'盘盈入库','40','erp_stock_record_biz_type',0,'','','','1','2024-02-08 08:53:00','1','2024-02-08 08:53:09',0),(1497,41,'盘盈入库（作废）','41','erp_stock_record_biz_type',0,'danger','','','1','2024-02-08 08:53:39','1','2024-02-16 19:40:54',0),(1498,42,'盘亏出库','42','erp_stock_record_biz_type',0,'','','','1','2024-02-08 08:54:16','1','2024-02-08 08:54:16',0),(1499,43,'盘亏出库（作废）','43','erp_stock_record_biz_type',0,'danger','','','1','2024-02-08 08:54:31','1','2024-02-16 19:40:46',0),(1500,50,'销售出库','50','erp_stock_record_biz_type',0,'','','','1','2024-02-11 21:47:25','1','2024-02-11 21:50:40',0),(1501,51,'销售出库（作废）','51','erp_stock_record_biz_type',0,'danger','','','1','2024-02-11 21:47:37','1','2024-02-11 21:51:12',0),(1502,60,'销售退货入库','60','erp_stock_record_biz_type',0,'','','','1','2024-02-12 06:51:05','1','2024-02-12 06:51:05',0),(1503,61,'销售退货入库（作废）','61','erp_stock_record_biz_type',0,'danger','','','1','2024-02-12 06:51:18','1','2024-02-12 06:51:18',0),(1504,70,'采购入库','70','erp_stock_record_biz_type',0,'','','','1','2024-02-16 13:10:02','1','2024-02-16 13:10:02',0),(1505,71,'采购入库（作废）','71','erp_stock_record_biz_type',0,'danger','','','1','2024-02-16 13:10:10','1','2024-02-16 19:40:40',0),(1506,80,'采购退货出库','80','erp_stock_record_biz_type',0,'','','','1','2024-02-16 13:10:17','1','2024-02-16 13:10:17',0),(1507,81,'采购退货出库（作废）','81','erp_stock_record_biz_type',0,'danger','','','1','2024-02-16 13:10:26','1','2024-02-16 19:40:33',0),(1509,3,'审批不通过','3','bpm_process_instance_status',0,'danger','','','1','2024-03-16 16:12:06','1','2024-03-16 16:12:06',0),(1510,4,'已取消','4','bpm_process_instance_status',0,'warning','','','1','2024-03-16 16:12:22','1','2024-03-16 16:12:22',0),(1511,5,'已退回','5','bpm_task_status',0,'warning','','','1','2024-03-16 19:10:46','1','2024-03-08 22:41:40',0),(1512,6,'委派中','6','bpm_task_status',0,'primary','','','1','2024-03-17 10:06:22','1','2024-03-08 22:41:40',0),(1513,7,'审批通过中','7','bpm_task_status',0,'success','','','1','2024-03-17 10:06:47','1','2024-03-08 22:41:41',0),(1514,0,'待审批','0','bpm_task_status',0,'info','','','1','2024-03-17 10:07:11','1','2024-03-08 22:41:42',0),(1515,35,'发起人自选','35','bpm_task_candidate_strategy',0,'','','','1','2024-03-22 19:45:16','1','2024-03-22 19:45:16',0),(1516,1,'执行监听器','execution','bpm_process_listener_type',0,'primary','','','1','2024-03-23 12:54:03','1','2024-03-23 19:14:19',0),(1517,1,'任务监听器','task','bpm_process_listener_type',0,'success','','','1','2024-03-23 12:54:13','1','2024-03-23 19:14:24',0),(1526,1,'Java 类','class','bpm_process_listener_value_type',0,'primary','','','1','2024-03-23 15:08:45','1','2024-03-23 19:14:32',0),(1527,2,'表达式','expression','bpm_process_listener_value_type',0,'success','','','1','2024-03-23 15:09:06','1','2024-03-23 19:14:38',0),(1528,3,'代理表达式','delegateExpression','bpm_process_listener_value_type',0,'info','','','1','2024-03-23 15:11:23','1','2024-03-23 19:14:41',0),(1529,1,'天','1','date_interval',0,'','','','1','2024-03-29 22:50:26','1','2024-03-29 22:50:26',0),(1530,2,'周','2','date_interval',0,'','','','1','2024-03-29 22:50:36','1','2024-03-29 22:50:36',0),(1531,3,'月','3','date_interval',0,'','','','1','2024-03-29 22:50:46','1','2024-03-29 22:50:54',0),(1532,4,'季度','4','date_interval',0,'','','','1','2024-03-29 22:51:01','1','2024-03-29 22:51:01',0),(1533,5,'年','5','date_interval',0,'','','','1','2024-03-29 22:51:07','1','2024-03-29 22:51:07',0),(1534,1,'赢单','1','crm_business_end_status_type',0,'success','','','1','2024-04-13 23:26:57','1','2024-04-13 23:26:57',0),(1535,2,'输单','2','crm_business_end_status_type',0,'primary','','','1','2024-04-13 23:27:31','1','2024-04-13 23:27:31',0),(1536,3,'无效','3','crm_business_end_status_type',0,'info','','','1','2024-04-13 23:27:59','1','2024-04-13 23:27:59',0),(1537,1,'OpenAI','OpenAI','ai_platform',0,'','','','1','2024-05-09 22:33:47','1','2024-05-09 22:58:46',0),(1538,2,'Ollama','Ollama','ai_platform',0,'','','','1','2024-05-17 23:02:55','1','2024-05-17 23:02:55',0),(1539,3,'文心一言','YiYan','ai_platform',0,'','','','1','2024-05-18 09:24:20','1','2024-05-18 09:29:01',0),(1540,4,'讯飞星火','XingHuo','ai_platform',0,'','','','1','2024-05-18 10:08:56','1','2024-05-18 10:08:56',0),(1541,5,'通义千问','TongYi','ai_platform',0,'','','','1','2024-05-18 10:32:29','1','2024-07-06 15:42:29',0),(1542,6,'StableDiffusion','StableDiffusion','ai_platform',0,'','','','1','2024-06-01 15:09:31','1','2024-06-01 15:10:25',0),(1543,10,'进行中','10','ai_image_status',0,'primary','','','1','2024-06-26 20:51:41','1','2024-06-26 20:52:48',0),(1544,20,'已完成','20','ai_image_status',0,'success','','','1','2024-06-26 20:52:07','1','2024-06-26 20:52:41',0),(1545,30,'已失败','30','ai_image_status',0,'warning','','','1','2024-06-26 20:52:25','1','2024-06-26 20:52:35',0),(1546,7,'Midjourney','Midjourney','ai_platform',0,'','','','1','2024-06-26 22:14:46','1','2024-06-26 22:14:46',0),(1547,10,'进行中','10','ai_music_status',0,'primary','','','1','2024-06-27 22:45:22','1','2024-06-28 00:56:17',0),(1548,20,'已完成','20','ai_music_status',0,'success','','','1','2024-06-27 22:45:33','1','2024-06-28 00:56:18',0),(1549,30,'已失败','30','ai_music_status',0,'danger','','','1','2024-06-27 22:45:44','1','2024-06-28 00:56:19',0),(1550,1,'歌词模式','1','ai_generate_mode',0,'','','','1','2024-06-27 22:46:31','1','2024-06-28 01:22:25',0),(1551,2,'描述模式','2','ai_generate_mode',0,'','','','1','2024-06-27 22:46:37','1','2024-06-28 01:22:24',0),(1552,8,'Suno','Suno','ai_platform',0,'','','','1','2024-06-29 09:13:36','1','2024-06-29 09:13:41',0),(1553,9,'DeepSeek','DeepSeek','ai_platform',0,'','','','1','2024-07-06 12:04:30','1','2024-07-06 12:05:20',0),(1554,10,'智谱','ZhiPu','ai_platform',0,'','','','1','2024-07-06 18:00:35','1','2024-07-06 18:00:35',0),(1555,4,'长','4','ai_write_length',0,'','','','1','2024-07-07 15:49:03','1','2024-07-07 15:49:03',0),(1556,5,'段落','5','ai_write_format',0,'','','','1','2024-07-07 15:49:54','1','2024-07-07 15:49:54',0),(1557,6,'文章','6','ai_write_format',0,'','','','1','2024-07-07 15:50:05','1','2024-07-07 15:50:05',0),(1558,7,'博客文章','7','ai_write_format',0,'','','','1','2024-07-07 15:50:23','1','2024-07-07 15:50:23',0),(1559,8,'想法','8','ai_write_format',0,'','','','1','2024-07-07 15:50:31','1','2024-07-07 15:50:31',0),(1560,9,'大纲','9','ai_write_format',0,'','','','1','2024-07-07 15:50:37','1','2024-07-07 15:50:37',0),(1561,1,'自动','1','ai_write_tone',0,'','','','1','2024-07-07 15:51:06','1','2024-07-07 15:51:06',0),(1562,2,'友善','2','ai_write_tone',0,'','','','1','2024-07-07 15:51:19','1','2024-07-07 15:51:19',0),(1563,3,'随意','3','ai_write_tone',0,'','','','1','2024-07-07 15:51:27','1','2024-07-07 15:51:27',0),(1564,4,'友好','4','ai_write_tone',0,'','','','1','2024-07-07 15:51:37','1','2024-07-07 15:51:37',0),(1565,5,'专业','5','ai_write_tone',0,'','','','1','2024-07-07 15:51:49','1','2024-07-07 15:52:02',0),(1566,6,'诙谐','6','ai_write_tone',0,'','','','1','2024-07-07 15:52:15','1','2024-07-07 15:52:15',0),(1567,7,'有趣','7','ai_write_tone',0,'','','','1','2024-07-07 15:52:24','1','2024-07-07 15:52:24',0),(1568,8,'正式','8','ai_write_tone',0,'','','','1','2024-07-07 15:54:33','1','2024-07-07 15:54:33',0),(1569,5,'段落','5','ai_write_format',0,'','','','1','2024-07-07 15:49:54','1','2024-07-07 15:49:54',0),(1570,1,'自动','1','ai_write_format',0,'','','','1','2024-07-07 15:19:34','1','2024-07-07 15:19:34',0),(1571,2,'电子邮件','2','ai_write_format',0,'','','','1','2024-07-07 15:19:50','1','2024-07-07 15:49:30',0),(1572,3,'消息','3','ai_write_format',0,'','','','1','2024-07-07 15:20:01','1','2024-07-07 15:49:38',0),(1573,4,'评论','4','ai_write_format',0,'','','','1','2024-07-07 15:20:13','1','2024-07-07 15:49:45',0),(1574,1,'自动','1','ai_write_language',0,'','','','1','2024-07-07 15:44:18','1','2024-07-07 15:44:18',0),(1575,2,'中文','2','ai_write_language',0,'','','','1','2024-07-07 15:44:28','1','2024-07-07 15:44:28',0),(1576,3,'英文','3','ai_write_language',0,'','','','1','2024-07-07 15:44:37','1','2024-07-07 15:44:37',0),(1577,4,'韩语','4','ai_write_language',0,'','','','1','2024-07-07 15:46:28','1','2024-07-07 15:46:28',0),(1578,5,'日语','5','ai_write_language',0,'','','','1','2024-07-07 15:46:44','1','2024-07-07 15:46:44',0),(1579,1,'自动','1','ai_write_length',0,'','','','1','2024-07-07 15:48:34','1','2024-07-07 15:48:34',0),(1580,2,'短','2','ai_write_length',0,'','','','1','2024-07-07 15:48:44','1','2024-07-07 15:48:44',0),(1581,3,'中等','3','ai_write_length',0,'','','','1','2024-07-07 15:48:52','1','2024-07-07 15:48:52',0),(1582,4,'长','4','ai_write_length',0,'','','','1','2024-07-07 15:49:03','1','2024-07-07 15:49:03',0),(1584,1,'撰写','1','ai_write_type',0,'','','','1','2024-07-10 21:26:00','1','2024-07-10 21:26:00',0),(1585,2,'回复','2','ai_write_type',0,'','','','1','2024-07-10 21:26:06','1','2024-07-10 21:26:06',0),(1586,2,'腾讯云','TENCENT','system_sms_channel_code',0,'','','','1','2024-07-22 22:23:16','1','2024-07-22 22:23:16',0),(1587,3,'华为云','HUAWEI','system_sms_channel_code',0,'','','','1','2024-07-22 22:23:46','1','2024-07-22 22:23:53',0),(1588,1,'OpenAI 微软','AzureOpenAI','ai_platform',0,'','','','1','2024-08-10 14:07:41','1','2024-08-10 14:07:41',0),(1589,10,'BPMN 设计器','10','bpm_model_type',0,'primary','','','1','2024-08-26 15:22:17','1','2024-08-26 16:46:02',0),(1590,20,'SIMPLE 设计器','20','bpm_model_type',0,'success','','','1','2024-08-26 15:22:27','1','2024-08-26 16:45:58',0),(1591,4,'七牛云','QINIU','system_sms_channel_code',0,'','','','1','2024-08-31 08:45:03','1','2024-08-31 08:45:24',0),(1592,3,'新人券','3','promotion_coupon_take_type',0,'info','','新人注册后，自动发放','1','2024-09-03 11:57:16','1','2024-09-03 11:57:28',0),(1593,5,'微信零钱','5','brokerage_withdraw_type',0,'','','自动打款','1','2024-10-13 11:06:48','1','2024-10-13 11:06:59',0),(1655,0,'标准数据格式（JSON）','0','iot_data_format',0,'default','','','1','2024-08-10 11:53:26','1','2024-09-06 14:31:02',0),(1656,1,'透传/自定义','1','iot_data_format',0,'default','','','1','2024-08-10 11:53:37','1','2024-09-06 14:30:54',0),(1657,0,'直连设备','0','iot_product_device_type',0,'default','','','1','2024-08-10 11:54:58','1','2024-09-06 21:57:01',0),(1658,2,'网关设备','2','iot_product_device_type',0,'default','','','1','2024-08-10 11:55:08','1','2024-09-06 21:56:46',0),(1659,1,'网关子设备','1','iot_product_device_type',0,'default','','','1','2024-08-10 11:55:20','1','2024-09-06 21:57:10',0),(1661,1,'已发布','1','iot_product_status',0,'success','','','1','2024-08-10 12:10:33','1','2024-09-06 22:06:22',0),(1663,0,'开发中','0','iot_product_status',0,'default','','','1','2024-08-10 14:19:18','1','2024-09-07 10:58:07',0),(1665,0,'弱校验','0','iot_validate_type',0,'','','','1','2024-09-06 20:05:48','1','2024-09-06 22:02:44',0),(1666,1,'免校验','1','iot_validate_type',0,'','','','1','2024-09-06 20:06:03','1','2024-09-06 22:02:51',0),(1667,0,'Wi-Fi','0','iot_net_type',0,'','','','1','2024-09-06 22:04:47','1','2024-09-06 22:04:47',0),(1668,1,'蜂窝（2G / 3G / 4G / 5G）','1','iot_net_type',0,'','','','1','2024-09-06 22:05:14','1','2024-09-06 22:05:14',0),(1669,2,'以太网','2','iot_net_type',0,'','','','1','2024-09-06 22:05:35','1','2024-09-06 22:05:35',0),(1670,3,'其他','3','iot_net_type',0,'','','','1','2024-09-06 22:05:52','1','2024-09-06 22:05:52',0),(1671,0,'自定义','0','iot_protocol_type',0,'','','','1','2024-09-06 22:26:10','1','2024-09-06 22:26:10',0),(1672,1,'Modbus','1','iot_protocol_type',0,'','','','1','2024-09-06 22:26:21','1','2024-09-06 22:26:21',0),(1673,2,'OPC UA','2','iot_protocol_type',0,'','','','1','2024-09-06 22:26:31','1','2024-09-06 22:26:31',0),(1674,3,'ZigBee','3','iot_protocol_type',0,'','','','1','2024-09-06 22:26:39','1','2024-09-06 22:26:39',0),(1675,4,'BLE','4','iot_protocol_type',0,'','','','1','2024-09-06 22:26:48','1','2024-09-06 22:26:48',0),(1676,0,'未激活','0','iot_device_status',0,'','','','1','2024-09-21 08:13:34','1','2024-09-21 08:13:34',0),(1677,1,'在线','1','iot_device_status',0,'','','','1','2024-09-21 08:13:48','1','2024-09-21 08:13:48',0),(1678,2,'离线','2','iot_device_status',0,'','','','1','2024-09-21 08:13:59','1','2024-09-21 08:13:59',0),(1679,3,'已禁用','3','iot_device_status',0,'','','','1','2024-09-21 08:14:13','1','2024-09-21 08:14:13',0),(1680,1,'属性','1','iot_product_function_type',0,'','','','1','2024-09-29 20:03:01','1','2024-09-29 20:09:41',0),(1681,2,'服务','2','iot_product_function_type',0,'','','','1','2024-09-29 20:03:11','1','2024-09-29 20:08:23',0),(1682,3,'事件','3','iot_product_function_type',0,'','','','1','2024-09-29 20:03:20','1','2024-09-29 20:08:20',0);
/*!40000 ALTER TABLE `system_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dict_type`
--

DROP TABLE IF EXISTS `system_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dict_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典名称',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=640 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dict_type`
--

LOCK TABLES `system_dict_type` WRITE;
/*!40000 ALTER TABLE `system_dict_type` DISABLE KEYS */;
INSERT INTO `system_dict_type` VALUES (1,'用户性别','system_user_sex',0,NULL,'admin','2021-01-05 17:03:48','1','2022-05-16 20:29:32',0,NULL),(6,'参数类型','infra_config_type',0,NULL,'admin','2021-01-05 17:03:48','','2022-02-01 16:36:54',0,NULL),(7,'通知类型','system_notice_type',0,NULL,'admin','2021-01-05 17:03:48','','2022-02-01 16:35:26',0,NULL),(9,'操作类型','infra_operate_type',0,NULL,'admin','2021-01-05 17:03:48','1','2024-03-14 12:44:01',0,NULL),(10,'系统状态','common_status',0,NULL,'admin','2021-01-05 17:03:48','','2022-02-01 16:21:28',0,NULL),(11,'Boolean 是否类型','infra_boolean_string',0,'boolean 转是否','','2021-01-19 03:20:08','','2022-02-01 16:37:10',0,NULL),(104,'登陆结果','system_login_result',0,'登陆结果','','2021-01-18 06:17:11','','2022-02-01 16:36:00',0,NULL),(106,'代码生成模板类型','infra_codegen_template_type',0,NULL,'','2021-02-05 07:08:06','1','2022-05-16 20:26:50',0,NULL),(107,'定时任务状态','infra_job_status',0,NULL,'','2021-02-07 07:44:16','','2022-02-01 16:51:11',0,NULL),(108,'定时任务日志状态','infra_job_log_status',0,NULL,'','2021-02-08 10:03:51','','2022-02-01 16:50:43',0,NULL),(109,'用户类型','user_type',0,NULL,'','2021-02-26 00:15:51','','2021-02-26 00:15:51',0,NULL),(110,'API 异常数据的处理状态','infra_api_error_log_process_status',0,NULL,'','2021-02-26 07:07:01','','2022-02-01 16:50:53',0,NULL),(111,'短信渠道编码','system_sms_channel_code',0,NULL,'1','2021-04-05 01:04:50','1','2022-02-16 02:09:08',0,NULL),(112,'短信模板的类型','system_sms_template_type',0,NULL,'1','2021-04-05 21:50:43','1','2022-02-01 16:35:06',0,NULL),(113,'短信发送状态','system_sms_send_status',0,NULL,'1','2021-04-11 20:18:03','1','2022-02-01 16:35:09',0,NULL),(114,'短信接收状态','system_sms_receive_status',0,NULL,'1','2021-04-11 20:27:14','1','2022-02-01 16:35:14',0,NULL),(116,'登陆日志的类型','system_login_type',0,'登陆日志的类型','1','2021-10-06 00:50:46','1','2022-02-01 16:35:56',0,NULL),(117,'OA 请假类型','bpm_oa_leave_type',0,NULL,'1','2021-09-21 22:34:33','1','2022-01-22 10:41:37',0,NULL),(130,'支付渠道编码类型','pay_channel_code',0,'支付渠道的编码','1','2021-12-03 10:35:08','1','2023-07-10 10:11:39',0,NULL),(131,'支付回调状态','pay_notify_status',0,'支付回调状态（包括退款回调）','1','2021-12-03 10:53:29','1','2023-07-19 18:09:43',0,NULL),(132,'支付订单状态','pay_order_status',0,'支付订单状态','1','2021-12-03 11:17:50','1','2021-12-03 11:17:50',0,NULL),(134,'退款订单状态','pay_refund_status',0,'退款订单状态','1','2021-12-10 16:42:50','1','2023-07-19 10:13:17',0,NULL),(139,'流程实例的状态','bpm_process_instance_status',0,'流程实例的状态','1','2022-01-07 23:46:42','1','2022-01-07 23:46:42',0,NULL),(140,'流程实例的结果','bpm_task_status',0,'流程实例的结果','1','2022-01-07 23:48:10','1','2024-03-08 22:42:03',0,NULL),(141,'流程的表单类型','bpm_model_form_type',0,'流程的表单类型','103','2022-01-11 23:50:45','103','2022-01-11 23:50:45',0,NULL),(142,'任务分配规则的类型','bpm_task_candidate_strategy',0,'BPM 任务的候选人的策略','103','2022-01-12 23:21:04','103','2024-03-06 02:53:59',0,NULL),(144,'代码生成的场景枚举','infra_codegen_scene',0,'代码生成的场景枚举','1','2022-02-02 13:14:45','1','2022-03-10 16:33:46',0,NULL),(145,'角色类型','system_role_type',0,'角色类型','1','2022-02-16 13:01:46','1','2022-02-16 13:01:46',0,NULL),(146,'文件存储器','infra_file_storage',0,'文件存储器','1','2022-03-15 00:24:38','1','2022-03-15 00:24:38',0,NULL),(147,'OAuth 2.0 授权类型','system_oauth2_grant_type',0,'OAuth 2.0 授权类型（模式）','1','2022-05-12 00:20:52','1','2022-05-11 16:25:49',0,NULL),(149,'商品 SPU 状态','product_spu_status',0,'商品 SPU 状态','1','2022-10-24 21:19:04','1','2022-10-24 21:19:08',0,NULL),(150,'优惠类型','promotion_discount_type',0,'优惠类型','1','2022-11-01 12:46:06','1','2022-11-01 12:46:06',0,NULL),(151,'优惠劵模板的有限期类型','promotion_coupon_template_validity_type',0,'优惠劵模板的有限期类型','1','2022-11-02 00:06:20','1','2022-11-04 00:08:26',0,NULL),(152,'营销的商品范围','promotion_product_scope',0,'营销的商品范围','1','2022-11-02 00:28:01','1','2022-11-02 00:28:01',0,NULL),(153,'优惠劵的状态','promotion_coupon_status',0,'优惠劵的状态','1','2022-11-04 00:14:49','1','2022-11-04 00:14:49',0,NULL),(154,'优惠劵的领取方式','promotion_coupon_take_type',0,'优惠劵的领取方式','1','2022-11-04 19:12:27','1','2022-11-04 19:12:27',0,NULL),(155,'促销活动的状态','promotion_activity_status',0,'促销活动的状态','1','2022-11-04 22:54:23','1','2022-11-04 22:54:23',0,NULL),(156,'营销的条件类型','promotion_condition_type',0,'营销的条件类型','1','2022-11-04 22:59:23','1','2022-11-04 22:59:23',0,NULL),(157,'交易售后状态','trade_after_sale_status',0,'交易售后状态','1','2022-11-19 20:52:56','1','2022-11-19 20:52:56',0,NULL),(158,'交易售后的类型','trade_after_sale_type',0,'交易售后的类型','1','2022-11-19 21:04:09','1','2022-11-19 21:04:09',0,NULL),(159,'交易售后的方式','trade_after_sale_way',0,'交易售后的方式','1','2022-11-19 21:39:04','1','2022-11-19 21:39:04',0,NULL),(160,'终端','terminal',0,'终端','1','2022-12-10 10:50:50','1','2022-12-10 10:53:11',0,NULL),(161,'交易订单的类型','trade_order_type',0,'交易订单的类型','1','2022-12-10 16:33:54','1','2022-12-10 16:33:54',0,NULL),(162,'交易订单的状态','trade_order_status',0,'交易订单的状态','1','2022-12-10 16:48:44','1','2022-12-10 16:48:44',0,NULL),(163,'交易订单项的售后状态','trade_order_item_after_sale_status',0,'交易订单项的售后状态','1','2022-12-10 20:58:08','1','2022-12-10 20:58:08',0,NULL),(164,'公众号自动回复的请求关键字匹配模式','mp_auto_reply_request_match',0,'公众号自动回复的请求关键字匹配模式','1','2023-01-16 23:29:56','1','2023-01-16 23:29:56',0,'1970-01-01 00:00:00'),(165,'公众号的消息类型','mp_message_type',0,'公众号的消息类型','1','2023-01-17 22:17:09','1','2023-01-17 22:17:09',0,'1970-01-01 00:00:00'),(166,'邮件发送状态','system_mail_send_status',0,'邮件发送状态','1','2023-01-26 09:53:13','1','2023-01-26 09:53:13',0,'1970-01-01 00:00:00'),(167,'站内信模版的类型','system_notify_template_type',0,'站内信模版的类型','1','2023-01-28 10:35:10','1','2023-01-28 10:35:10',0,'1970-01-01 00:00:00'),(168,'代码生成的前端类型','infra_codegen_front_type',0,'','1','2023-04-12 23:57:52','1','2023-04-12 23:57:52',0,'1970-01-01 00:00:00'),(170,'快递计费方式','trade_delivery_express_charge_mode',0,'用于商城交易模块配送管理','1','2023-05-21 22:45:03','1','2023-05-21 22:45:03',0,'1970-01-01 00:00:00'),(171,'积分业务类型','member_point_biz_type',0,'','1','2023-06-10 12:15:00','1','2023-06-28 13:48:20',0,'1970-01-01 00:00:00'),(173,'支付通知类型','pay_notify_type',0,NULL,'1','2023-07-20 12:23:03','1','2023-07-20 12:23:03',0,'1970-01-01 00:00:00'),(174,'会员经验业务类型','member_experience_biz_type',0,NULL,'','2023-08-22 12:41:01','','2023-08-22 12:41:01',0,NULL),(175,'交易配送类型','trade_delivery_type',0,'','1','2023-08-23 00:03:14','1','2023-08-23 00:03:14',0,'1970-01-01 00:00:00'),(176,'分佣模式','brokerage_enabled_condition',0,NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0,NULL),(177,'分销关系绑定模式','brokerage_bind_mode',0,NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0,NULL),(178,'佣金提现类型','brokerage_withdraw_type',0,NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0,NULL),(179,'佣金记录业务类型','brokerage_record_biz_type',0,NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0,NULL),(180,'佣金记录状态','brokerage_record_status',0,NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0,NULL),(181,'佣金提现状态','brokerage_withdraw_status',0,NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0,NULL),(182,'佣金提现银行','brokerage_bank_name',0,NULL,'','2023-09-28 02:46:05','','2023-09-28 02:46:05',0,NULL),(183,'砍价记录的状态','promotion_bargain_record_status',0,'','1','2023-10-05 10:41:08','1','2023-10-05 10:41:08',0,'1970-01-01 00:00:00'),(184,'拼团记录的状态','promotion_combination_record_status',0,'','1','2023-10-08 07:24:25','1','2023-10-08 07:24:25',0,'1970-01-01 00:00:00'),(185,'回款-回款方式','crm_receivable_return_type',0,'回款-回款方式','1','2023-10-18 21:54:10','1','2023-10-18 21:54:10',0,'1970-01-01 00:00:00'),(186,'CRM 客户行业','crm_customer_industry',0,'CRM 客户所属行业','1','2023-10-28 22:57:07','1','2024-02-18 23:30:22',0,NULL),(187,'客户等级','crm_customer_level',0,'CRM 客户等级','1','2023-10-28 22:59:12','1','2023-10-28 15:11:16',0,NULL),(188,'客户来源','crm_customer_source',0,'CRM 客户来源','1','2023-10-28 23:00:34','1','2023-10-28 15:11:16',0,NULL),(600,'Banner 位置','promotion_banner_position',0,'','1','2023-10-08 07:24:25','1','2023-11-04 13:04:02',0,'1970-01-01 00:00:00'),(601,'社交类型','system_social_type',0,'','1','2023-11-04 13:03:54','1','2023-11-04 13:03:54',0,'1970-01-01 00:00:00'),(604,'产品状态','crm_product_status',0,'','1','2023-10-30 21:47:59','1','2023-10-30 21:48:45',0,'1970-01-01 00:00:00'),(605,'CRM 数据权限的级别','crm_permission_level',0,'','1','2023-11-30 09:51:59','1','2023-11-30 09:51:59',0,'1970-01-01 00:00:00'),(606,'CRM 审批状态','crm_audit_status',0,'','1','2023-11-30 18:56:23','1','2023-11-30 18:56:23',0,'1970-01-01 00:00:00'),(607,'CRM 产品单位','crm_product_unit',0,'','1','2023-12-05 23:01:51','1','2023-12-05 23:01:51',0,'1970-01-01 00:00:00'),(608,'CRM 跟进方式','crm_follow_up_type',0,'','1','2024-01-15 20:48:05','1','2024-01-15 20:48:05',0,'1970-01-01 00:00:00'),(609,'支付转账类型','pay_transfer_type',0,'','1','2023-10-28 16:27:18','1','2023-10-28 16:27:18',0,'1970-01-01 00:00:00'),(610,'转账订单状态','pay_transfer_status',0,'','1','2023-10-28 16:18:32','1','2023-10-28 16:18:32',0,'1970-01-01 00:00:00'),(611,'ERP 库存明细的业务类型','erp_stock_record_biz_type',0,'ERP 库存明细的业务类型','1','2024-02-05 18:07:02','1','2024-02-05 18:07:02',0,'1970-01-01 00:00:00'),(612,'ERP 审批状态','erp_audit_status',0,'','1','2024-02-06 00:00:07','1','2024-02-06 00:00:07',0,'1970-01-01 00:00:00'),(613,'BPM 监听器类型','bpm_process_listener_type',0,'','1','2024-03-23 12:52:24','1','2024-03-09 15:54:28',0,'1970-01-01 00:00:00'),(615,'BPM 监听器值类型','bpm_process_listener_value_type',0,'','1','2024-03-23 13:00:31','1','2024-03-23 13:00:31',0,'1970-01-01 00:00:00'),(616,'时间间隔','date_interval',0,'','1','2024-03-29 22:50:09','1','2024-03-29 22:50:09',0,'1970-01-01 00:00:00'),(619,'CRM 商机结束状态类型','crm_business_end_status_type',0,'','1','2024-04-13 23:23:00','1','2024-04-13 23:23:00',0,'1970-01-01 00:00:00'),(620,'AI 模型平台','ai_platform',0,'','1','2024-05-09 22:27:38','1','2024-05-09 22:27:38',0,'1970-01-01 00:00:00'),(621,'AI 绘画状态','ai_image_status',0,'','1','2024-06-26 20:51:23','1','2024-06-26 20:51:23',0,'1970-01-01 00:00:00'),(622,'AI 音乐状态','ai_music_status',0,'','1','2024-06-27 22:45:07','1','2024-06-28 00:56:27',0,'1970-01-01 00:00:00'),(623,'AI 音乐生成模式','ai_generate_mode',0,'','1','2024-06-27 22:46:21','1','2024-06-28 01:22:29',0,'1970-01-01 00:00:00'),(624,'写作语气','ai_write_tone',0,'','1','2024-07-07 15:19:02','1','2024-07-07 15:19:02',0,'1970-01-01 00:00:00'),(625,'写作语言','ai_write_language',0,'','1','2024-07-07 15:18:52','1','2024-07-07 15:18:52',0,'1970-01-01 00:00:00'),(626,'写作长度','ai_write_length',0,'','1','2024-07-07 15:18:41','1','2024-07-07 15:18:41',0,'1970-01-01 00:00:00'),(627,'写作格式','ai_write_format',0,'','1','2024-07-07 15:14:34','1','2024-07-07 15:14:34',0,'1970-01-01 00:00:00'),(628,'AI 写作类型','ai_write_type',0,'','1','2024-07-10 21:25:29','1','2024-07-10 21:25:29',0,'1970-01-01 00:00:00'),(629,'BPM 流程模型类型','bpm_model_type',0,'','1','2024-08-26 15:21:43','1','2024-08-26 15:21:43',0,'1970-01-01 00:00:00'),(630,'IOT 接入网关协议','iot_protocol_type',0,'','1','2024-09-06 22:20:17','1','2024-09-06 22:20:17',0,'1970-01-01 00:00:00'),(631,'IOT 设备状态','iot_device_status',0,'','1','2024-09-21 08:12:55','1','2024-09-21 08:12:55',0,'1970-01-01 00:00:00'),(632,'IOT 物模型功能类型','iot_product_function_type',0,'','1','2024-09-29 20:02:36','1','2024-09-29 20:09:26',0,'1970-01-01 00:00:00'),(634,'IOT 数据格式','iot_data_format',0,'','1','2024-08-10 11:52:58','1','2024-09-06 14:30:14',0,'1970-01-01 00:00:00'),(635,'IOT 产品设备类型','iot_product_device_type',0,'','1','2024-08-10 11:54:30','1','2024-08-10 04:06:56',0,'1970-01-01 00:00:00'),(637,'IOT 产品状态','iot_product_status',0,'','1','2024-08-10 12:06:09','1','2024-08-10 12:06:09',0,'1970-01-01 00:00:00'),(638,'IOT 数据校验级别','iot_validate_type',0,'','1','2024-09-06 20:05:13','1','2024-09-06 20:05:13',0,'1970-01-01 00:00:00'),(639,'IOT 联网方式','iot_net_type',0,'','1','2024-09-06 22:04:13','1','2024-09-06 22:04:13',0,'1970-01-01 00:00:00');
/*!40000 ALTER TABLE `system_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_login_log`
--

DROP TABLE IF EXISTS `system_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `log_type` bigint NOT NULL COMMENT '日志类型',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户编号',
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '用户类型',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  `result` tinyint NOT NULL COMMENT '登陆结果',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_login_log`
--

LOCK TABLES `system_login_log` WRITE;
/*!40000 ALTER TABLE `system_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_account`
--

DROP TABLE IF EXISTS `system_mail_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_account` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SMTP 服务器域名',
  `port` int NOT NULL COMMENT 'SMTP 服务器端口',
  `ssl_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否开启 SSL',
  `starttls_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否开启 STARTTLS',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱账号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_account`
--

LOCK TABLES `system_mail_account` WRITE;
/*!40000 ALTER TABLE `system_mail_account` DISABLE KEYS */;
INSERT INTO `system_mail_account` VALUES (1,'7684413@qq.com','7684413@qq.com','1234576','127.0.0.1',8080,_binary '\0',_binary '\0','1','2023-01-25 17:39:52','1','2024-07-27 22:39:12',0),(2,'ydym_test@163.com','ydym_test@163.com','WBZTEINMIFVRYSOE','smtp.163.com',465,_binary '',_binary '\0','1','2023-01-26 01:26:03','1','2023-04-12 22:39:38',0),(3,'76854114@qq.com','3335','11234','yunai1.cn',466,_binary '\0',_binary '\0','1','2023-01-27 15:06:38','1','2023-01-27 07:08:36',1),(4,'7685413x@qq.com','2','3','4',5,_binary '',_binary '\0','1','2023-04-12 23:05:06','1','2023-04-12 15:05:11',1);
/*!40000 ALTER TABLE `system_mail_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_log`
--

DROP TABLE IF EXISTS `system_mail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
  `user_type` tinyint DEFAULT NULL COMMENT '用户类型',
  `to_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接收邮箱地址',
  `account_id` bigint NOT NULL COMMENT '邮箱账号编号',
  `from_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送邮箱地址',
  `template_id` bigint NOT NULL COMMENT '模板编号',
  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `template_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模版发送人名称',
  `template_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件标题',
  `template_content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件内容',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件参数',
  `send_status` tinyint NOT NULL DEFAULT '0' COMMENT '发送状态',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `send_message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送返回的消息 ID',
  `send_exception` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送异常',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮件日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_log`
--

LOCK TABLES `system_mail_log` WRITE;
/*!40000 ALTER TABLE `system_mail_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_template`
--

DROP TABLE IF EXISTS `system_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `account_id` bigint NOT NULL COMMENT '发送的邮箱账号编号',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送人名称',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板标题',
  `content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板内容',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数数组',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮件模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_template`
--

LOCK TABLES `system_mail_template` WRITE;
/*!40000 ALTER TABLE `system_mail_template` DISABLE KEYS */;
INSERT INTO `system_mail_template` VALUES (13,'后台用户短信登录','admin-sms-login',1,'奥特曼','你猜我猜','<p>您的验证码是{code}，名字是{name}</p>','[\"code\",\"name\"]',0,'3','1','2021-10-11 08:10:00','1','2023-12-02 19:51:14',0),(14,'测试模版','test_01',2,'芋艿','一个标题','<p>你是 {key01} 吗？</p><p><br></p><p>是的话，赶紧 {key02} 一下！</p>','[\"key01\",\"key02\"]',0,NULL,'1','2023-01-26 01:27:40','1','2023-01-27 10:32:16',0),(15,'3','2',2,'7','4','<p>45</p>','[]',1,'80','1','2023-01-27 15:50:35','1','2023-01-27 16:34:49',0);
/*!40000 ALTER TABLE `system_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_menu`
--

DROP TABLE IF EXISTS `system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `type` tinyint NOT NULL COMMENT '菜单类型',
  `sort` int NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '路由地址',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `component_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件名',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '菜单状态',
  `visible` tinyint(1) DEFAULT NULL,
  `keep_alive` tinyint(1) DEFAULT NULL,
  `always_show` tinyint(1) DEFAULT NULL,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2914 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_menu`
--

LOCK TABLES `system_menu` WRITE;
/*!40000 ALTER TABLE `system_menu` DISABLE KEYS */;
INSERT INTO `system_menu` VALUES (1,'系统管理','',1,10,0,'/system','ep:tools',NULL,NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-06-18 01:19:41',0),(2,'基础设施','',1,20,NULL,'/infra','ep:monitor',NULL,NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2025-04-23 16:35:29',0),(5,'OA 示例','',1,40,1185,'oa','fa:road',NULL,NULL,0,1,1,1,'admin','2021-09-20 16:26:19','1','2024-02-29 12:38:13',0),(100,'用户管理','system:user:list',2,1,1,'user','ep:avatar','system/user/index','SystemUser',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 01:02:04',0),(101,'角色管理','',2,2,1,'role','ep:user','system/role/index','SystemRole',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-05-01 18:35:29',0),(102,'菜单管理','',2,3,1,'menu','ep:menu','system/menu/index','SystemMenu',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 01:03:50',0),(103,'部门管理','',2,4,1,'dept','fa:address-card','system/dept/index','SystemDept',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 01:06:28',0),(104,'岗位管理','',2,5,1,'post','fa:address-book-o','system/post/index','SystemPost',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 01:06:39',0),(105,'字典管理','',2,6,1,'dict','ep:collection','system/dict/index','SystemDictType',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 01:07:12',0),(106,'配置管理','',2,8,2,'config','fa:connectdevelop','infra/config/index','InfraConfig',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-04-23 00:02:45',0),(107,'通知公告','',2,4,2739,'notice','ep:takeaway-box','system/notice/index','SystemNotice',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-04-22 23:56:17',0),(108,'审计日志','',1,9,1,'log','ep:document-copy','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 01:08:30',0),(109,'令牌管理','',2,2,1261,'token','fa:key','system/oauth2/token/index','SystemTokenClient',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 01:13:48',0),(110,'定时任务','',2,7,2,'job','fa-solid:tasks','infra/job/index','InfraJob',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 08:57:36',0),(111,'MySQL 监控','',2,1,2740,'druid','fa-solid:box','infra/druid/index','InfraDruid',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-04-23 00:05:58',0),(112,'Java 监控','',2,3,2740,'admin-server','ep:coffee-cup','infra/server/index','InfraAdminServer',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-04-23 00:06:57',0),(113,'Redis 监控','',2,2,2740,'redis','fa:reddit-square','infra/redis/index','InfraRedis',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-04-23 00:06:09',0),(114,'表单构建','infra:build:list',2,2,2,'build','fa:wpforms','infra/build/index','InfraBuild',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 08:51:35',0),(115,'代码生成','infra:codegen:query',2,1,2,'codegen','ep:document-copy','infra/codegen/index','InfraCodegen',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 08:51:06',0),(116,'API 接口','infra:swagger:list',2,3,2,'swagger','fa:fighter-jet','infra/swagger/index','InfraSwagger',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-04-23 00:01:24',0),(500,'操作日志','',2,1,108,'operate-log','ep:position','system/operatelog/index','SystemOperateLog',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 01:09:59',0),(501,'登录日志','',2,2,108,'login-log','ep:promotion','system/loginlog/index','SystemLoginLog',0,1,1,1,'admin','2021-01-05 17:03:48','1','2024-02-29 01:10:29',0),(1001,'用户查询','system:user:query',3,1,100,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1002,'用户新增','system:user:create',3,2,100,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1003,'用户修改','system:user:update',3,3,100,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1004,'用户删除','system:user:delete',3,4,100,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1005,'用户导出','system:user:export',3,5,100,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1006,'用户导入','system:user:import',3,6,100,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1007,'重置密码','system:user:update-password',3,7,100,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1008,'角色查询','system:role:query',3,1,101,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1009,'角色新增','system:role:create',3,2,101,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1010,'角色修改','system:role:update',3,3,101,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1011,'角色删除','system:role:delete',3,4,101,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1012,'角色导出','system:role:export',3,5,101,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1013,'菜单查询','system:menu:query',3,1,102,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1014,'菜单新增','system:menu:create',3,2,102,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1015,'菜单修改','system:menu:update',3,3,102,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1016,'菜单删除','system:menu:delete',3,4,102,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1017,'部门查询','system:dept:query',3,1,103,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1018,'部门新增','system:dept:create',3,2,103,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1019,'部门修改','system:dept:update',3,3,103,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1020,'部门删除','system:dept:delete',3,4,103,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1021,'岗位查询','system:post:query',3,1,104,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1022,'岗位新增','system:post:create',3,2,104,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1023,'岗位修改','system:post:update',3,3,104,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1024,'岗位删除','system:post:delete',3,4,104,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1025,'岗位导出','system:post:export',3,5,104,'','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1026,'字典查询','system:dict:query',3,1,105,'#','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1027,'字典新增','system:dict:create',3,2,105,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1028,'字典修改','system:dict:update',3,3,105,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1029,'字典删除','system:dict:delete',3,4,105,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1030,'字典导出','system:dict:export',3,5,105,'#','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1031,'配置查询','infra:config:query',3,1,106,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1032,'配置新增','infra:config:create',3,2,106,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1033,'配置修改','infra:config:update',3,3,106,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1034,'配置删除','infra:config:delete',3,4,106,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1035,'配置导出','infra:config:export',3,5,106,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1036,'公告查询','system:notice:query',3,1,107,'#','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1037,'公告新增','system:notice:create',3,2,107,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1038,'公告修改','system:notice:update',3,3,107,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1039,'公告删除','system:notice:delete',3,4,107,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1040,'操作查询','system:operate-log:query',3,1,500,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1042,'日志导出','system:operate-log:export',3,2,500,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1043,'登录查询','system:login-log:query',3,1,501,'#','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1045,'日志导出','system:login-log:export',3,3,501,'#','#','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1046,'令牌列表','system:oauth2-token:page',3,1,109,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-05-09 23:54:42',0),(1048,'令牌删除','system:oauth2-token:delete',3,2,109,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-05-09 23:54:53',0),(1050,'任务新增','infra:job:create',3,2,110,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1051,'任务修改','infra:job:update',3,3,110,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1052,'任务删除','infra:job:delete',3,4,110,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1053,'状态修改','infra:job:update',3,5,110,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1054,'任务导出','infra:job:export',3,7,110,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',0),(1056,'生成修改','infra:codegen:update',3,2,115,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1057,'生成删除','infra:codegen:delete',3,3,115,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1058,'导入代码','infra:codegen:create',3,2,115,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1059,'预览代码','infra:codegen:preview',3,4,115,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1060,'生成代码','infra:codegen:download',3,5,115,'','','',NULL,0,1,1,1,'admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',0),(1063,'设置角色菜单权限','system:permission:assign-role-menu',3,6,101,'','','',NULL,0,1,1,1,'','2021-01-06 17:53:44','','2022-04-20 17:03:10',0),(1064,'设置角色数据权限','system:permission:assign-role-data-scope',3,7,101,'','','',NULL,0,1,1,1,'','2021-01-06 17:56:31','','2022-04-20 17:03:10',0),(1065,'设置用户角色','system:permission:assign-user-role',3,8,101,'','','',NULL,0,1,1,1,'','2021-01-07 10:23:28','','2022-04-20 17:03:10',0),(1066,'获得 Redis 监控信息','infra:redis:get-monitor-info',3,1,113,'','','',NULL,0,1,1,1,'','2021-01-26 01:02:31','','2022-04-20 17:03:10',0),(1067,'获得 Redis Key 列表','infra:redis:get-key-list',3,2,113,'','','',NULL,0,1,1,1,'','2021-01-26 01:02:52','','2022-04-20 17:03:10',0),(1070,'代码生成案例','',1,1,2,'demo','ep:aim','infra/testDemo/index',NULL,0,1,1,1,'','2021-02-06 12:42:49','1','2023-11-15 23:45:53',0),(1075,'任务触发','infra:job:trigger',3,8,110,'','','',NULL,0,1,1,1,'','2021-02-07 13:03:10','','2022-04-20 17:03:10',0),(1077,'链路追踪','',2,4,2740,'skywalking','fa:eye','infra/skywalking/index','InfraSkyWalking',0,1,1,1,'','2021-02-08 20:41:31','1','2024-04-23 00:07:15',0),(1078,'访问日志','',2,1,1083,'api-access-log','ep:place','infra/apiAccessLog/index','InfraApiAccessLog',0,1,1,1,'','2021-02-26 01:32:59','1','2024-02-29 08:54:57',0),(1082,'日志导出','infra:api-access-log:export',3,2,1078,'','','',NULL,0,1,1,1,'','2021-02-26 01:32:59','1','2022-04-20 17:03:10',0),(1083,'API 日志','',2,4,2,'log','fa:tasks',NULL,NULL,0,1,1,1,'','2021-02-26 02:18:24','1','2024-04-22 23:58:36',0),(1084,'错误日志','infra:api-error-log:query',2,2,1083,'api-error-log','ep:warning-filled','infra/apiErrorLog/index','InfraApiErrorLog',0,1,1,1,'','2021-02-26 07:53:20','1','2024-02-29 08:55:17',0),(1085,'日志处理','infra:api-error-log:update-status',3,2,1084,'','','',NULL,0,1,1,1,'','2021-02-26 07:53:20','1','2022-04-20 17:03:10',0),(1086,'日志导出','infra:api-error-log:export',3,3,1084,'','','',NULL,0,1,1,1,'','2021-02-26 07:53:20','1','2022-04-20 17:03:10',0),(1087,'任务查询','infra:job:query',3,1,110,'','','',NULL,0,1,1,1,'1','2021-03-10 01:26:19','1','2022-04-20 17:03:10',0),(1088,'日志查询','infra:api-access-log:query',3,1,1078,'','','',NULL,0,1,1,1,'1','2021-03-10 01:28:04','1','2022-04-20 17:03:10',0),(1089,'日志查询','infra:api-error-log:query',3,1,1084,'','','',NULL,0,1,1,1,'1','2021-03-10 01:29:09','1','2022-04-20 17:03:10',0),(1090,'文件列表','',2,5,1243,'file','ep:upload-filled','infra/file/index','InfraFile',0,1,1,1,'','2021-03-12 20:16:20','1','2024-02-29 08:53:02',0),(1091,'文件查询','infra:file:query',3,1,1090,'','','',NULL,0,1,1,1,'','2021-03-12 20:16:20','','2022-04-20 17:03:10',0),(1092,'文件删除','infra:file:delete',3,4,1090,'','','',NULL,0,1,1,1,'','2021-03-12 20:16:20','','2022-04-20 17:03:10',0),(1093,'短信管理','',1,1,2739,'sms','ep:message',NULL,NULL,0,1,1,1,'1','2021-04-05 01:10:16','1','2024-04-22 23:56:03',0),(1094,'短信渠道','',2,0,1093,'sms-channel','fa:stack-exchange','system/sms/channel/index','SystemSmsChannel',0,1,1,1,'','2021-04-01 11:07:15','1','2024-02-29 01:15:54',0),(1095,'短信渠道查询','system:sms-channel:query',3,1,1094,'','','',NULL,0,1,1,1,'','2021-04-01 11:07:15','','2022-04-20 17:03:10',0),(1096,'短信渠道创建','system:sms-channel:create',3,2,1094,'','','',NULL,0,1,1,1,'','2021-04-01 11:07:15','','2022-04-20 17:03:10',0),(1097,'短信渠道更新','system:sms-channel:update',3,3,1094,'','','',NULL,0,1,1,1,'','2021-04-01 11:07:15','','2022-04-20 17:03:10',0),(1098,'短信渠道删除','system:sms-channel:delete',3,4,1094,'','','',NULL,0,1,1,1,'','2021-04-01 11:07:15','','2022-04-20 17:03:10',0),(1100,'短信模板','',2,1,1093,'sms-template','ep:connection','system/sms/template/index','SystemSmsTemplate',0,1,1,1,'','2021-04-01 17:35:17','1','2024-02-29 01:16:18',0),(1101,'短信模板查询','system:sms-template:query',3,1,1100,'','','',NULL,0,1,1,1,'','2021-04-01 17:35:17','','2022-04-20 17:03:10',0),(1102,'短信模板创建','system:sms-template:create',3,2,1100,'','','',NULL,0,1,1,1,'','2021-04-01 17:35:17','','2022-04-20 17:03:10',0),(1103,'短信模板更新','system:sms-template:update',3,3,1100,'','','',NULL,0,1,1,1,'','2021-04-01 17:35:17','','2022-04-20 17:03:10',0),(1104,'短信模板删除','system:sms-template:delete',3,4,1100,'','','',NULL,0,1,1,1,'','2021-04-01 17:35:17','','2022-04-20 17:03:10',0),(1105,'短信模板导出','system:sms-template:export',3,5,1100,'','','',NULL,0,1,1,1,'','2021-04-01 17:35:17','','2022-04-20 17:03:10',0),(1106,'发送测试短信','system:sms-template:send-sms',3,6,1100,'','','',NULL,0,1,1,1,'1','2021-04-11 00:26:40','1','2022-04-20 17:03:10',0),(1107,'短信日志','',2,2,1093,'sms-log','fa:edit','system/sms/log/index','SystemSmsLog',0,1,1,1,'','2021-04-11 08:37:05','1','2024-02-29 08:49:02',0),(1108,'短信日志查询','system:sms-log:query',3,1,1107,'','','',NULL,0,1,1,1,'','2021-04-11 08:37:05','','2022-04-20 17:03:10',0),(1109,'短信日志导出','system:sms-log:export',3,5,1107,'','','',NULL,0,1,1,1,'','2021-04-11 08:37:05','','2022-04-20 17:03:10',0),(1117,'支付管理','',1,30,0,'/pay','ep:money',NULL,NULL,0,1,1,1,'1','2021-12-25 16:43:41','1','2024-02-29 08:58:38',0),(1118,'请假查询','',2,0,5,'leave','fa:leanpub','bpm/oa/leave/index','BpmOALeave',0,1,1,1,'','2021-09-20 08:51:03','1','2024-02-29 12:38:21',0),(1119,'请假申请查询','bpm:oa-leave:query',3,1,1118,'','','',NULL,0,1,1,1,'','2021-09-20 08:51:03','1','2022-04-20 17:03:10',0),(1120,'请假申请创建','bpm:oa-leave:create',3,2,1118,'','','',NULL,0,1,1,1,'','2021-09-20 08:51:03','1','2022-04-20 17:03:10',0),(1126,'应用信息','',2,1,1117,'app','fa:apple','pay/app/index','PayApp',0,1,1,1,'','2021-11-10 01:13:30','1','2024-02-29 08:59:55',0),(1127,'支付应用信息查询','pay:app:query',3,1,1126,'','','',NULL,0,1,1,1,'','2021-11-10 01:13:31','','2022-04-20 17:03:10',0),(1128,'支付应用信息创建','pay:app:create',3,2,1126,'','','',NULL,0,1,1,1,'','2021-11-10 01:13:31','','2022-04-20 17:03:10',0),(1129,'支付应用信息更新','pay:app:update',3,3,1126,'','','',NULL,0,1,1,1,'','2021-11-10 01:13:31','','2022-04-20 17:03:10',0),(1130,'支付应用信息删除','pay:app:delete',3,4,1126,'','','',NULL,0,1,1,1,'','2021-11-10 01:13:31','','2022-04-20 17:03:10',0),(1132,'秘钥解析','pay:channel:parsing',3,6,1129,'','','',NULL,0,1,1,1,'1','2021-11-08 15:15:47','1','2022-04-20 17:03:10',0),(1133,'支付商户信息查询','pay:merchant:query',3,1,1132,'','','',NULL,0,1,1,1,'','2021-11-10 01:13:41','','2022-04-20 17:03:10',0),(1134,'支付商户信息创建','pay:merchant:create',3,2,1132,'','','',NULL,0,1,1,1,'','2021-11-10 01:13:41','','2022-04-20 17:03:10',0),(1135,'支付商户信息更新','pay:merchant:update',3,3,1132,'','','',NULL,0,1,1,1,'','2021-11-10 01:13:41','','2022-04-20 17:03:10',0),(1136,'支付商户信息删除','pay:merchant:delete',3,4,1132,'','','',NULL,0,1,1,1,'','2021-11-10 01:13:41','','2022-04-20 17:03:10',0),(1137,'支付商户信息导出','pay:merchant:export',3,5,1132,'','','',NULL,0,1,1,1,'','2021-11-10 01:13:41','','2022-04-20 17:03:10',0),(1138,'租户列表','',2,0,1224,'list','ep:house','system/tenant/index','SystemTenant',0,1,1,1,'','2021-12-14 12:31:43','1','2024-02-29 01:01:10',0),(1139,'租户查询','system:tenant:query',3,1,1138,'','','',NULL,0,1,1,1,'','2021-12-14 12:31:44','','2022-04-20 17:03:10',0),(1140,'租户创建','system:tenant:create',3,2,1138,'','','',NULL,0,1,1,1,'','2021-12-14 12:31:44','','2022-04-20 17:03:10',0),(1141,'租户更新','system:tenant:update',3,3,1138,'','','',NULL,0,1,1,1,'','2021-12-14 12:31:44','','2022-04-20 17:03:10',0),(1142,'租户删除','system:tenant:delete',3,4,1138,'','','',NULL,0,1,1,1,'','2021-12-14 12:31:44','','2022-04-20 17:03:10',0),(1143,'租户导出','system:tenant:export',3,5,1138,'','','',NULL,0,1,1,1,'','2021-12-14 12:31:44','','2022-04-20 17:03:10',0),(1150,'秘钥解析','',3,6,1129,'','','',NULL,0,1,1,1,'1','2021-11-08 15:15:47','1','2022-04-20 17:03:10',0),(1161,'退款订单','',2,3,1117,'refund','fa:registered','pay/refund/index','PayRefund',0,1,1,1,'','2021-12-25 08:29:07','1','2024-02-29 08:59:20',0),(1162,'退款订单查询','pay:refund:query',3,1,1161,'','','',NULL,0,1,1,1,'','2021-12-25 08:29:07','','2022-04-20 17:03:10',0),(1163,'退款订单创建','pay:refund:create',3,2,1161,'','','',NULL,0,1,1,1,'','2021-12-25 08:29:07','','2022-04-20 17:03:10',0),(1164,'退款订单更新','pay:refund:update',3,3,1161,'','','',NULL,0,1,1,1,'','2021-12-25 08:29:07','','2022-04-20 17:03:10',0),(1165,'退款订单删除','pay:refund:delete',3,4,1161,'','','',NULL,0,1,1,1,'','2021-12-25 08:29:07','','2022-04-20 17:03:10',0),(1166,'退款订单导出','pay:refund:export',3,5,1161,'','','',NULL,0,1,1,1,'','2021-12-25 08:29:07','','2022-04-20 17:03:10',0),(1173,'支付订单','',2,2,1117,'order','fa:cc-paypal','pay/order/index','PayOrder',0,1,1,1,'','2021-12-25 08:49:43','1','2024-02-29 08:59:43',0),(1174,'支付订单查询','pay:order:query',3,1,1173,'','','',NULL,0,1,1,1,'','2021-12-25 08:49:43','','2022-04-20 17:03:10',0),(1175,'支付订单创建','pay:order:create',3,2,1173,'','','',NULL,0,1,1,1,'','2021-12-25 08:49:43','','2022-04-20 17:03:10',0),(1176,'支付订单更新','pay:order:update',3,3,1173,'','','',NULL,0,1,1,1,'','2021-12-25 08:49:43','','2022-04-20 17:03:10',0),(1177,'支付订单删除','pay:order:delete',3,4,1173,'','','',NULL,0,1,1,1,'','2021-12-25 08:49:43','','2022-04-20 17:03:10',0),(1178,'支付订单导出','pay:order:export',3,5,1173,'','','',NULL,0,1,1,1,'','2021-12-25 08:49:43','','2022-04-20 17:03:10',0),(1185,'工作流程','',1,50,0,'/bpm','fa:medium',NULL,NULL,0,1,1,1,'1','2021-12-30 20:26:36','1','2024-02-29 12:43:43',0),(1186,'流程管理','',1,10,1185,'manager','fa:dedent',NULL,NULL,0,1,1,1,'1','2021-12-30 20:28:30','1','2024-02-29 12:36:02',0),(1187,'流程表单','',2,2,1186,'form','fa:hdd-o','bpm/form/index','BpmForm',0,1,1,1,'','2021-12-30 12:38:22','1','2024-03-19 12:25:25',0),(1188,'表单查询','bpm:form:query',3,1,1187,'','','',NULL,0,1,1,1,'','2021-12-30 12:38:22','1','2022-04-20 17:03:10',0),(1189,'表单创建','bpm:form:create',3,2,1187,'','','',NULL,0,1,1,1,'','2021-12-30 12:38:22','1','2022-04-20 17:03:10',0),(1190,'表单更新','bpm:form:update',3,3,1187,'','','',NULL,0,1,1,1,'','2021-12-30 12:38:22','1','2022-04-20 17:03:10',0),(1191,'表单删除','bpm:form:delete',3,4,1187,'','','',NULL,0,1,1,1,'','2021-12-30 12:38:22','1','2022-04-20 17:03:10',0),(1192,'表单导出','bpm:form:export',3,5,1187,'','','',NULL,0,1,1,1,'','2021-12-30 12:38:22','1','2022-04-20 17:03:10',0),(1193,'流程模型','',2,1,1186,'model','fa-solid:project-diagram','bpm/model/index','BpmModel',0,1,1,1,'1','2021-12-31 23:24:58','1','2024-03-19 12:25:19',0),(1194,'模型查询','bpm:model:query',3,1,1193,'','','',NULL,0,1,1,1,'1','2022-01-03 19:01:10','1','2022-04-20 17:03:10',0),(1195,'模型创建','bpm:model:create',3,2,1193,'','','',NULL,0,1,1,1,'1','2022-01-03 19:01:24','1','2022-04-20 17:03:10',0),(1197,'模型更新','bpm:model:update',3,4,1193,'','','',NULL,0,1,1,1,'1','2022-01-03 19:02:28','1','2022-04-20 17:03:10',0),(1198,'模型删除','bpm:model:delete',3,5,1193,'','','',NULL,0,1,1,1,'1','2022-01-03 19:02:43','1','2022-04-20 17:03:10',0),(1199,'模型发布','bpm:model:deploy',3,6,1193,'','','',NULL,0,1,1,1,'1','2022-01-03 19:03:24','1','2022-04-20 17:03:10',0),(1200,'审批中心','',2,20,1185,'task','fa:tasks',NULL,NULL,0,1,1,1,'1','2022-01-07 23:51:48','1','2024-03-21 00:33:15',0),(1201,'我的流程','',2,1,1200,'my','fa-solid:book','bpm/processInstance/index','BpmProcessInstanceMy',0,1,1,1,'','2022-01-07 15:53:44','1','2024-03-21 23:52:12',0),(1202,'流程实例的查询','bpm:process-instance:query',3,1,1201,'','','',NULL,0,1,1,1,'','2022-01-07 15:53:44','1','2022-04-20 17:03:10',0),(1207,'待办任务','',2,10,1200,'todo','fa:slack','bpm/task/todo/index','BpmTodoTask',0,1,1,1,'1','2022-01-08 10:33:37','1','2024-02-29 12:37:39',0),(1208,'已办任务','',2,20,1200,'done','fa:delicious','bpm/task/done/index','BpmDoneTask',0,1,1,1,'1','2022-01-08 10:34:13','1','2024-02-29 12:37:54',0),(1209,'用户分组','',2,4,1186,'user-group','fa:user-secret','bpm/group/index','BpmUserGroup',0,1,1,1,'','2022-01-14 02:14:20','1','2024-03-21 23:55:29',0),(1210,'用户组查询','bpm:user-group:query',3,1,1209,'','','',NULL,0,1,1,1,'','2022-01-14 02:14:20','','2022-04-20 17:03:10',0),(1211,'用户组创建','bpm:user-group:create',3,2,1209,'','','',NULL,0,1,1,1,'','2022-01-14 02:14:20','','2022-04-20 17:03:10',0),(1212,'用户组更新','bpm:user-group:update',3,3,1209,'','','',NULL,0,1,1,1,'','2022-01-14 02:14:20','','2022-04-20 17:03:10',0),(1213,'用户组删除','bpm:user-group:delete',3,4,1209,'','','',NULL,0,1,1,1,'','2022-01-14 02:14:20','','2022-04-20 17:03:10',0),(1215,'流程定义查询','bpm:process-definition:query',3,10,1193,'','','',NULL,0,1,1,1,'1','2022-01-23 00:21:43','1','2022-04-20 17:03:10',0),(1216,'流程任务分配规则查询','bpm:task-assign-rule:query',3,20,1193,'','','',NULL,0,1,1,1,'1','2022-01-23 00:26:53','1','2022-04-20 17:03:10',0),(1217,'流程任务分配规则创建','bpm:task-assign-rule:create',3,21,1193,'','','',NULL,0,1,1,1,'1','2022-01-23 00:28:15','1','2022-04-20 17:03:10',0),(1218,'流程任务分配规则更新','bpm:task-assign-rule:update',3,22,1193,'','','',NULL,0,1,1,1,'1','2022-01-23 00:28:41','1','2022-04-20 17:03:10',0),(1219,'流程实例的创建','bpm:process-instance:create',3,2,1201,'','','',NULL,0,1,1,1,'1','2022-01-23 00:36:15','1','2022-04-20 17:03:10',0),(1220,'流程实例的取消','bpm:process-instance:cancel',3,3,1201,'','','',NULL,0,1,1,1,'1','2022-01-23 00:36:33','1','2022-04-20 17:03:10',0),(1221,'流程任务的查询','bpm:task:query',3,1,1207,'','','',NULL,0,1,1,1,'1','2022-01-23 00:38:52','1','2022-04-20 17:03:10',0),(1222,'流程任务的更新','bpm:task:update',3,2,1207,'','','',NULL,0,1,1,1,'1','2022-01-23 00:39:24','1','2022-04-20 17:03:10',0),(1224,'租户管理','',2,0,1,'tenant','fa-solid:house-user',NULL,NULL,0,1,1,1,'1','2022-02-20 01:41:13','1','2024-02-29 00:59:29',0),(1225,'租户套餐','',2,0,1224,'package','fa:bars','system/tenantPackage/index','SystemTenantPackage',0,1,1,1,'','2022-02-19 17:44:06','1','2024-02-29 01:01:43',0),(1226,'租户套餐查询','system:tenant-package:query',3,1,1225,'','','',NULL,0,1,1,1,'','2022-02-19 17:44:06','','2022-04-20 17:03:10',0),(1227,'租户套餐创建','system:tenant-package:create',3,2,1225,'','','',NULL,0,1,1,1,'','2022-02-19 17:44:06','','2022-04-20 17:03:10',0),(1228,'租户套餐更新','system:tenant-package:update',3,3,1225,'','','',NULL,0,1,1,1,'','2022-02-19 17:44:06','','2022-04-20 17:03:10',0),(1229,'租户套餐删除','system:tenant-package:delete',3,4,1225,'','','',NULL,0,1,1,1,'','2022-02-19 17:44:06','','2022-04-20 17:03:10',0),(1237,'文件配置','',2,0,1243,'file-config','fa-solid:file-signature','infra/fileConfig/index','InfraFileConfig',0,1,1,1,'','2022-03-15 14:35:28','1','2024-02-29 08:52:54',0),(1238,'文件配置查询','infra:file-config:query',3,1,1237,'','','',NULL,0,1,1,1,'','2022-03-15 14:35:28','','2022-04-20 17:03:10',0),(1239,'文件配置创建','infra:file-config:create',3,2,1237,'','','',NULL,0,1,1,1,'','2022-03-15 14:35:28','','2022-04-20 17:03:10',0),(1240,'文件配置更新','infra:file-config:update',3,3,1237,'','','',NULL,0,1,1,1,'','2022-03-15 14:35:28','','2022-04-20 17:03:10',0),(1241,'文件配置删除','infra:file-config:delete',3,4,1237,'','','',NULL,0,1,1,1,'','2022-03-15 14:35:28','','2022-04-20 17:03:10',0),(1242,'文件配置导出','infra:file-config:export',3,5,1237,'','','',NULL,0,1,1,1,'','2022-03-15 14:35:28','','2022-04-20 17:03:10',0),(1243,'文件管理','',2,6,2,'file','ep:files',NULL,'',0,1,1,1,'1','2022-03-16 23:47:40','1','2024-04-23 00:02:11',0),(1254,'作者动态','',1,0,0,'https://www.iocoder.cn','ep:avatar',NULL,NULL,0,1,1,1,'1','2022-04-23 01:03:15','1','2024-09-06 09:19:42',0),(1255,'数据源配置','',2,1,2,'data-source-config','ep:data-analysis','infra/dataSourceConfig/index','InfraDataSourceConfig',0,1,1,1,'','2022-04-27 14:37:32','1','2024-02-29 08:51:25',0),(1256,'数据源配置查询','infra:data-source-config:query',3,1,1255,'','','',NULL,0,1,1,1,'','2022-04-27 14:37:32','','2022-04-27 14:37:32',0),(1257,'数据源配置创建','infra:data-source-config:create',3,2,1255,'','','',NULL,0,1,1,1,'','2022-04-27 14:37:32','','2022-04-27 14:37:32',0),(1258,'数据源配置更新','infra:data-source-config:update',3,3,1255,'','','',NULL,0,1,1,1,'','2022-04-27 14:37:32','','2022-04-27 14:37:32',0),(1259,'数据源配置删除','infra:data-source-config:delete',3,4,1255,'','','',NULL,0,1,1,1,'','2022-04-27 14:37:32','','2022-04-27 14:37:32',0),(1260,'数据源配置导出','infra:data-source-config:export',3,5,1255,'','','',NULL,0,1,1,1,'','2022-04-27 14:37:32','','2022-04-27 14:37:32',0),(1261,'OAuth 2.0','',2,10,1,'oauth2','fa:dashcube',NULL,NULL,0,1,1,1,'1','2022-05-09 23:38:17','1','2024-02-29 01:12:08',0),(1263,'应用管理','',2,0,1261,'oauth2/application','fa:hdd-o','system/oauth2/client/index','SystemOAuth2Client',0,1,1,1,'','2022-05-10 16:26:33','1','2024-02-29 01:13:14',0),(1264,'客户端查询','system:oauth2-client:query',3,1,1263,'','','',NULL,0,1,1,1,'','2022-05-10 16:26:33','1','2022-05-11 00:31:06',0),(1265,'客户端创建','system:oauth2-client:create',3,2,1263,'','','',NULL,0,1,1,1,'','2022-05-10 16:26:33','1','2022-05-11 00:31:23',0),(1266,'客户端更新','system:oauth2-client:update',3,3,1263,'','','',NULL,0,1,1,1,'','2022-05-10 16:26:33','1','2022-05-11 00:31:28',0),(1267,'客户端删除','system:oauth2-client:delete',3,4,1263,'','','',NULL,0,1,1,1,'','2022-05-10 16:26:33','1','2022-05-11 00:31:33',0),(1281,'报表管理','',2,40,0,'/report','ep:pie-chart',NULL,NULL,0,1,1,1,'1','2022-07-10 20:22:15','1','2024-02-29 12:33:03',0),(1282,'报表设计器','',2,1,1281,'jimu-report','ep:trend-charts','report/jmreport/index','GoView',0,1,1,1,'1','2022-07-10 20:26:36','1','2024-02-29 12:33:54',0),(2000,'商品中心','',1,60,2362,'product','fa:product-hunt',NULL,NULL,0,1,1,1,'','2022-07-29 15:53:53','1','2023-09-30 11:52:36',0),(2002,'商品分类','',2,2,2000,'category','ep:cellphone','mall/product/category/index','ProductCategory',0,1,1,1,'','2022-07-29 15:53:53','1','2023-08-21 10:27:15',0),(2003,'分类查询','product:category:query',3,1,2002,'','','',NULL,0,1,1,1,'','2022-07-29 15:53:53','','2022-07-29 15:53:53',0),(2004,'分类创建','product:category:create',3,2,2002,'','','',NULL,0,1,1,1,'','2022-07-29 15:53:53','','2022-07-29 15:53:53',0),(2005,'分类更新','product:category:update',3,3,2002,'','','',NULL,0,1,1,1,'','2022-07-29 15:53:53','','2022-07-29 15:53:53',0),(2006,'分类删除','product:category:delete',3,4,2002,'','','',NULL,0,1,1,1,'','2022-07-29 15:53:53','','2022-07-29 15:53:53',0),(2008,'商品品牌','',2,3,2000,'brand','ep:chicken','mall/product/brand/index','ProductBrand',0,1,1,1,'','2022-07-30 13:52:44','1','2023-08-21 10:27:28',0),(2009,'品牌查询','product:brand:query',3,1,2008,'','','',NULL,0,1,1,1,'','2022-07-30 13:52:44','','2022-07-30 13:52:44',0),(2010,'品牌创建','product:brand:create',3,2,2008,'','','',NULL,0,1,1,1,'','2022-07-30 13:52:44','','2022-07-30 13:52:44',0),(2011,'品牌更新','product:brand:update',3,3,2008,'','','',NULL,0,1,1,1,'','2022-07-30 13:52:44','','2022-07-30 13:52:44',0),(2012,'品牌删除','product:brand:delete',3,4,2008,'','','',NULL,0,1,1,1,'','2022-07-30 13:52:44','','2022-07-30 13:52:44',0),(2014,'商品列表','',2,1,2000,'spu','ep:apple','mall/product/spu/index','ProductSpu',0,1,1,1,'','2022-07-30 14:22:58','1','2023-08-21 10:27:01',0),(2015,'商品查询','product:spu:query',3,1,2014,'','','',NULL,0,1,1,1,'','2022-07-30 14:22:58','','2022-07-30 14:22:58',0),(2016,'商品创建','product:spu:create',3,2,2014,'','','',NULL,0,1,1,1,'','2022-07-30 14:22:58','','2022-07-30 14:22:58',0),(2017,'商品更新','product:spu:update',3,3,2014,'','','',NULL,0,1,1,1,'','2022-07-30 14:22:58','','2022-07-30 14:22:58',0),(2018,'商品删除','product:spu:delete',3,4,2014,'','','',NULL,0,1,1,1,'','2022-07-30 14:22:58','','2022-07-30 14:22:58',0),(2019,'商品属性','',2,4,2000,'property','ep:cold-drink','mall/product/property/index','ProductProperty',0,1,1,1,'','2022-08-01 14:55:35','1','2023-08-26 11:01:05',0),(2020,'规格查询','product:property:query',3,1,2019,'','','',NULL,0,1,1,1,'','2022-08-01 14:55:35','','2022-12-12 20:26:24',0),(2021,'规格创建','product:property:create',3,2,2019,'','','',NULL,0,1,1,1,'','2022-08-01 14:55:35','','2022-12-12 20:26:30',0),(2022,'规格更新','product:property:update',3,3,2019,'','','',NULL,0,1,1,1,'','2022-08-01 14:55:35','','2022-12-12 20:26:33',0),(2023,'规格删除','product:property:delete',3,4,2019,'','','',NULL,0,1,1,1,'','2022-08-01 14:55:35','','2022-12-12 20:26:37',0),(2025,'Banner','',2,100,2387,'banner','fa:bandcamp','mall/promotion/banner/index',NULL,0,1,1,1,'','2022-08-01 14:56:14','1','2023-10-24 20:20:06',0),(2026,'Banner查询','promotion:banner:query',3,1,2025,'','','','',0,1,1,1,'','2022-08-01 14:56:14','1','2023-10-24 20:20:18',0),(2027,'Banner创建','promotion:banner:create',3,2,2025,'','','','',0,1,1,1,'','2022-08-01 14:56:14','1','2023-10-24 20:20:23',0),(2028,'Banner更新','promotion:banner:update',3,3,2025,'','','','',0,1,1,1,'','2022-08-01 14:56:14','1','2023-10-24 20:20:28',0),(2029,'Banner删除','promotion:banner:delete',3,4,2025,'','','','',0,1,1,1,'','2022-08-01 14:56:14','1','2023-10-24 20:20:36',0),(2030,'营销中心','',1,70,2362,'promotion','ep:present',NULL,NULL,0,1,1,1,'1','2022-10-31 21:25:09','1','2023-09-30 11:54:27',0),(2032,'优惠劵列表','',2,1,2365,'template','ep:discount','mall/promotion/coupon/template/index','PromotionCouponTemplate',0,1,1,1,'','2022-10-31 22:27:14','1','2023-10-03 12:40:06',0),(2033,'优惠劵模板查询','promotion:coupon-template:query',3,1,2032,'','','',NULL,0,1,1,1,'','2022-10-31 22:27:14','','2022-10-31 22:27:14',0),(2034,'优惠劵模板创建','promotion:coupon-template:create',3,2,2032,'','','',NULL,0,1,1,1,'','2022-10-31 22:27:14','','2022-10-31 22:27:14',0),(2035,'优惠劵模板更新','promotion:coupon-template:update',3,3,2032,'','','',NULL,0,1,1,1,'','2022-10-31 22:27:14','','2022-10-31 22:27:14',0),(2036,'优惠劵模板删除','promotion:coupon-template:delete',3,4,2032,'','','',NULL,0,1,1,1,'','2022-10-31 22:27:14','','2022-10-31 22:27:14',0),(2038,'领取记录','',2,2,2365,'list','ep:collection-tag','mall/promotion/coupon/index','PromotionCoupon',0,1,1,1,'','2022-11-03 23:21:31','1','2023-10-03 12:55:30',0),(2039,'优惠劵查询','promotion:coupon:query',3,1,2038,'','','',NULL,0,1,1,1,'','2022-11-03 23:21:31','','2022-11-03 23:21:31',0),(2040,'优惠劵删除','promotion:coupon:delete',3,4,2038,'','','',NULL,0,1,1,1,'','2022-11-03 23:21:31','','2022-11-03 23:21:31',0),(2041,'满减送','',2,10,2390,'reward-activity','ep:goblet-square-full','mall/promotion/rewardActivity/index','PromotionRewardActivity',0,1,1,1,'','2022-11-04 23:47:49','1','2023-10-21 19:24:46',0),(2042,'满减送活动查询','promotion:reward-activity:query',3,1,2041,'','','',NULL,0,1,1,1,'','2022-11-04 23:47:49','','2022-11-04 23:47:49',0),(2043,'满减送活动创建','promotion:reward-activity:create',3,2,2041,'','','',NULL,0,1,1,1,'','2022-11-04 23:47:49','','2022-11-04 23:47:49',0),(2044,'满减送活动更新','promotion:reward-activity:update',3,3,2041,'','','',NULL,0,1,1,1,'','2022-11-04 23:47:50','','2022-11-04 23:47:50',0),(2045,'满减送活动删除','promotion:reward-activity:delete',3,4,2041,'','','',NULL,0,1,1,1,'','2022-11-04 23:47:50','','2022-11-04 23:47:50',0),(2046,'满减送活动关闭','promotion:reward-activity:close',3,5,2041,'','','',NULL,0,1,1,1,'1','2022-11-05 10:42:53','1','2022-11-05 10:42:53',0),(2047,'限时折扣','',2,7,2390,'discount-activity','ep:timer','mall/promotion/discountActivity/index','PromotionDiscountActivity',0,1,1,1,'','2022-11-05 17:12:15','1','2023-10-21 19:24:21',0),(2048,'限时折扣活动查询','promotion:discount-activity:query',3,1,2047,'','','',NULL,0,1,1,1,'','2022-11-05 17:12:15','','2022-11-05 17:12:15',0),(2049,'限时折扣活动创建','promotion:discount-activity:create',3,2,2047,'','','',NULL,0,1,1,1,'','2022-11-05 17:12:15','','2022-11-05 17:12:15',0),(2050,'限时折扣活动更新','promotion:discount-activity:update',3,3,2047,'','','',NULL,0,1,1,1,'','2022-11-05 17:12:16','','2022-11-05 17:12:16',0),(2051,'限时折扣活动删除','promotion:discount-activity:delete',3,4,2047,'','','',NULL,0,1,1,1,'','2022-11-05 17:12:16','','2022-11-05 17:12:16',0),(2052,'限时折扣活动关闭','promotion:discount-activity:close',3,5,2047,'','','',NULL,0,1,1,1,'','2022-11-05 17:12:16','','2022-11-05 17:12:16',0),(2059,'秒杀商品','',2,2,2209,'activity','ep:basketball','mall/promotion/seckill/activity/index','PromotionSeckillActivity',0,1,1,1,'','2022-11-06 22:24:49','1','2023-06-24 18:57:25',0),(2060,'秒杀活动查询','promotion:seckill-activity:query',3,1,2059,'','','',NULL,0,1,1,1,'','2022-11-06 22:24:49','','2022-11-06 22:24:49',0),(2061,'秒杀活动创建','promotion:seckill-activity:create',3,2,2059,'','','',NULL,0,1,1,1,'','2022-11-06 22:24:49','','2022-11-06 22:24:49',0),(2062,'秒杀活动更新','promotion:seckill-activity:update',3,3,2059,'','','',NULL,0,1,1,1,'','2022-11-06 22:24:49','','2022-11-06 22:24:49',0),(2063,'秒杀活动删除','promotion:seckill-activity:delete',3,4,2059,'','','',NULL,0,1,1,1,'','2022-11-06 22:24:49','','2022-11-06 22:24:49',0),(2066,'秒杀时段','',2,1,2209,'config','ep:baseball','mall/promotion/seckill/config/index','PromotionSeckillConfig',0,1,1,1,'','2022-11-15 19:46:50','1','2023-06-24 18:57:14',0),(2067,'秒杀时段查询','promotion:seckill-config:query',3,1,2066,'','','','',0,1,1,1,'','2022-11-15 19:46:51','1','2023-06-24 17:50:25',0),(2068,'秒杀时段创建','promotion:seckill-config:create',3,2,2066,'','','','',0,1,1,1,'','2022-11-15 19:46:51','1','2023-06-24 17:48:39',0),(2069,'秒杀时段更新','promotion:seckill-config:update',3,3,2066,'','','','',0,1,1,1,'','2022-11-15 19:46:51','1','2023-06-24 17:50:29',0),(2070,'秒杀时段删除','promotion:seckill-config:delete',3,4,2066,'','','','',0,1,1,1,'','2022-11-15 19:46:51','1','2023-06-24 17:50:32',0),(2072,'订单中心','',1,65,2362,'trade','ep:eleme',NULL,NULL,0,1,1,1,'1','2022-11-19 18:57:19','1','2023-09-30 11:54:07',0),(2073,'售后退款','',2,2,2072,'after-sale','ep:refrigerator','mall/trade/afterSale/index','TradeAfterSale',0,1,1,1,'','2022-11-19 20:15:32','1','2023-10-01 21:42:21',0),(2074,'售后查询','trade:after-sale:query',3,1,2073,'','','',NULL,0,1,1,1,'','2022-11-19 20:15:33','1','2022-12-10 21:04:29',0),(2075,'秒杀活动关闭','promotion:seckill-activity:close',3,5,2059,'','','','',0,1,1,1,'1','2022-11-28 20:20:15','1','2023-10-03 18:34:28',0),(2076,'订单列表','',2,1,2072,'order','ep:list','mall/trade/order/index','TradeOrder',0,1,1,1,'1','2022-12-10 21:05:44','1','2023-10-01 21:42:08',0),(2083,'地区管理','',2,14,1,'area','fa:map-marker','system/area/index','SystemArea',0,1,1,1,'1','2022-12-23 17:35:05','1','2024-02-29 08:50:28',0),(2084,'公众号管理','',1,100,0,'/mp','ep:compass',NULL,NULL,0,1,1,1,'1','2023-01-01 20:11:04','1','2024-02-29 12:39:30',0),(2085,'账号管理','',2,1,2084,'account','fa:user','mp/account/index','MpAccount',0,1,1,1,'1','2023-01-01 20:13:31','1','2024-02-29 12:42:10',0),(2086,'新增账号','mp:account:create',3,1,2085,'','','',NULL,0,1,1,1,'1','2023-01-01 20:21:40','1','2023-01-07 17:32:53',0),(2087,'修改账号','mp:account:update',3,2,2085,'','','',NULL,0,1,1,1,'1','2023-01-07 17:32:46','1','2023-01-07 17:32:46',0),(2088,'查询账号','mp:account:query',3,0,2085,'','','',NULL,0,1,1,1,'1','2023-01-07 17:33:07','1','2023-01-07 17:33:07',0),(2089,'删除账号','mp:account:delete',3,3,2085,'','','',NULL,0,1,1,1,'1','2023-01-07 17:33:21','1','2023-01-07 17:33:21',0),(2090,'生成二维码','mp:account:qr-code',3,4,2085,'','','',NULL,0,1,1,1,'1','2023-01-07 17:33:58','1','2023-01-07 17:33:58',0),(2091,'清空 API 配额','mp:account:clear-quota',3,5,2085,'','','',NULL,0,1,1,1,'1','2023-01-07 18:20:32','1','2023-01-07 18:20:59',0),(2092,'数据统计','mp:statistics:query',2,2,2084,'statistics','ep:trend-charts','mp/statistics/index','MpStatistics',0,1,1,1,'1','2023-01-07 20:17:36','1','2024-02-29 12:42:21',0),(2093,'标签管理','',2,3,2084,'tag','ep:collection-tag','mp/tag/index','MpTag',0,1,1,1,'1','2023-01-08 11:37:32','1','2024-02-29 12:42:29',0),(2094,'查询标签','mp:tag:query',3,0,2093,'','','',NULL,0,1,1,1,'1','2023-01-08 11:59:03','1','2023-01-08 11:59:03',0),(2095,'新增标签','mp:tag:create',3,1,2093,'','','',NULL,0,1,1,1,'1','2023-01-08 11:59:23','1','2023-01-08 11:59:23',0),(2096,'修改标签','mp:tag:update',3,2,2093,'','','',NULL,0,1,1,1,'1','2023-01-08 11:59:41','1','2023-01-08 11:59:41',0),(2097,'删除标签','mp:tag:delete',3,3,2093,'','','',NULL,0,1,1,1,'1','2023-01-08 12:00:04','1','2023-01-08 12:00:13',0),(2098,'同步标签','mp:tag:sync',3,4,2093,'','','',NULL,0,1,1,1,'1','2023-01-08 12:00:29','1','2023-01-08 12:00:29',0),(2099,'粉丝管理','',2,4,2084,'user','fa:user-secret','mp/user/index','MpUser',0,1,1,1,'1','2023-01-08 16:51:20','1','2024-02-29 12:42:39',0),(2100,'查询粉丝','mp:user:query',3,0,2099,'','','',NULL,0,1,1,1,'1','2023-01-08 17:16:59','1','2023-01-08 17:17:23',0),(2101,'修改粉丝','mp:user:update',3,1,2099,'','','',NULL,0,1,1,1,'1','2023-01-08 17:17:11','1','2023-01-08 17:17:11',0),(2102,'同步粉丝','mp:user:sync',3,2,2099,'','','',NULL,0,1,1,1,'1','2023-01-08 17:17:40','1','2023-01-08 17:17:40',0),(2103,'消息管理','',2,5,2084,'message','ep:message','mp/message/index','MpMessage',0,1,1,1,'1','2023-01-08 18:44:19','1','2024-02-29 12:42:50',0),(2104,'图文发表记录','',2,10,2084,'free-publish','ep:edit-pen','mp/freePublish/index','MpFreePublish',0,1,1,1,'1','2023-01-13 00:30:50','1','2024-02-29 12:43:31',0),(2105,'查询发布列表','mp:free-publish:query',3,1,2104,'','','',NULL,0,1,1,1,'1','2023-01-13 07:19:17','1','2023-01-13 07:19:17',0),(2106,'发布草稿','mp:free-publish:submit',3,2,2104,'','','',NULL,0,1,1,1,'1','2023-01-13 07:19:46','1','2023-01-13 07:19:46',0),(2107,'删除发布记录','mp:free-publish:delete',3,3,2104,'','','',NULL,0,1,1,1,'1','2023-01-13 07:20:01','1','2023-01-13 07:20:01',0),(2108,'图文草稿箱','',2,9,2084,'draft','ep:edit','mp/draft/index','MpDraft',0,1,1,1,'1','2023-01-13 07:40:21','1','2024-02-29 12:43:26',0),(2109,'新建草稿','mp:draft:create',3,1,2108,'','','',NULL,0,1,1,1,'1','2023-01-13 23:15:30','1','2023-01-13 23:15:44',0),(2110,'修改草稿','mp:draft:update',3,2,2108,'','','',NULL,0,1,1,1,'1','2023-01-14 10:08:47','1','2023-01-14 10:08:47',0),(2111,'查询草稿','mp:draft:query',3,0,2108,'','','',NULL,0,1,1,1,'1','2023-01-14 10:09:01','1','2023-01-14 10:09:01',0),(2112,'删除草稿','mp:draft:delete',3,3,2108,'','','',NULL,0,1,1,1,'1','2023-01-14 10:09:19','1','2023-01-14 10:09:19',0),(2113,'素材管理','',2,8,2084,'material','ep:basketball','mp/material/index','MpMaterial',0,1,1,1,'1','2023-01-14 14:12:07','1','2024-02-29 12:43:18',0),(2114,'上传临时素材','mp:material:upload-temporary',3,1,2113,'','','',NULL,0,1,1,1,'1','2023-01-14 15:33:55','1','2023-01-14 15:33:55',0),(2115,'上传永久素材','mp:material:upload-permanent',3,2,2113,'','','',NULL,0,1,1,1,'1','2023-01-14 15:34:14','1','2023-01-14 15:34:14',0),(2116,'删除素材','mp:material:delete',3,3,2113,'','','',NULL,0,1,1,1,'1','2023-01-14 15:35:37','1','2023-01-14 15:35:37',0),(2117,'上传图文图片','mp:material:upload-news-image',3,4,2113,'','','',NULL,0,1,1,1,'1','2023-01-14 15:36:31','1','2023-01-14 15:36:31',0),(2118,'查询素材','mp:material:query',3,5,2113,'','','',NULL,0,1,1,1,'1','2023-01-14 15:39:22','1','2023-01-14 15:39:22',0),(2119,'菜单管理','',2,6,2084,'menu','ep:menu','mp/menu/index','MpMenu',0,1,1,1,'1','2023-01-14 17:43:54','1','2024-02-29 12:42:56',0),(2120,'自动回复','',2,7,2084,'auto-reply','fa-solid:republican','mp/autoReply/index','MpAutoReply',0,1,1,1,'1','2023-01-15 22:13:09','1','2024-02-29 12:43:10',0),(2121,'查询回复','mp:auto-reply:query',3,0,2120,'','','',NULL,0,1,1,1,'1','2023-01-16 22:28:41','1','2023-01-16 22:28:41',0),(2122,'新增回复','mp:auto-reply:create',3,1,2120,'','','',NULL,0,1,1,1,'1','2023-01-16 22:28:54','1','2023-01-16 22:28:54',0),(2123,'修改回复','mp:auto-reply:update',3,2,2120,'','','',NULL,0,1,1,1,'1','2023-01-16 22:29:05','1','2023-01-16 22:29:05',0),(2124,'删除回复','mp:auto-reply:delete',3,3,2120,'','','',NULL,0,1,1,1,'1','2023-01-16 22:29:34','1','2023-01-16 22:29:34',0),(2125,'查询菜单','mp:menu:query',3,0,2119,'','','',NULL,0,1,1,1,'1','2023-01-17 23:05:41','1','2023-01-17 23:05:41',0),(2126,'保存菜单','mp:menu:save',3,1,2119,'','','',NULL,0,1,1,1,'1','2023-01-17 23:06:01','1','2023-01-17 23:06:01',0),(2127,'删除菜单','mp:menu:delete',3,2,2119,'','','',NULL,0,1,1,1,'1','2023-01-17 23:06:16','1','2023-01-17 23:06:16',0),(2128,'查询消息','mp:message:query',3,0,2103,'','','',NULL,0,1,1,1,'1','2023-01-17 23:07:14','1','2023-01-17 23:07:14',0),(2129,'发送消息','mp:message:send',3,1,2103,'','','',NULL,0,1,1,1,'1','2023-01-17 23:07:26','1','2023-01-17 23:07:26',0),(2130,'邮箱管理','',2,2,2739,'mail','fa-solid:mail-bulk',NULL,NULL,0,1,1,1,'1','2023-01-25 17:27:44','1','2024-04-22 23:56:08',0),(2131,'邮箱账号','',2,0,2130,'mail-account','fa:universal-access','system/mail/account/index','SystemMailAccount',0,1,1,1,'','2023-01-25 09:33:48','1','2024-02-29 08:48:16',0),(2132,'账号查询','system:mail-account:query',3,1,2131,'','','',NULL,0,1,1,1,'','2023-01-25 09:33:48','','2023-01-25 09:33:48',0),(2133,'账号创建','system:mail-account:create',3,2,2131,'','','',NULL,0,1,1,1,'','2023-01-25 09:33:48','','2023-01-25 09:33:48',0),(2134,'账号更新','system:mail-account:update',3,3,2131,'','','',NULL,0,1,1,1,'','2023-01-25 09:33:48','','2023-01-25 09:33:48',0),(2135,'账号删除','system:mail-account:delete',3,4,2131,'','','',NULL,0,1,1,1,'','2023-01-25 09:33:48','','2023-01-25 09:33:48',0),(2136,'邮件模版','',2,0,2130,'mail-template','fa:tag','system/mail/template/index','SystemMailTemplate',0,1,1,1,'','2023-01-25 12:05:31','1','2024-02-29 08:48:41',0),(2137,'模版查询','system:mail-template:query',3,1,2136,'','','',NULL,0,1,1,1,'','2023-01-25 12:05:31','','2023-01-25 12:05:31',0),(2138,'模版创建','system:mail-template:create',3,2,2136,'','','',NULL,0,1,1,1,'','2023-01-25 12:05:31','','2023-01-25 12:05:31',0),(2139,'模版更新','system:mail-template:update',3,3,2136,'','','',NULL,0,1,1,1,'','2023-01-25 12:05:31','','2023-01-25 12:05:31',0),(2140,'模版删除','system:mail-template:delete',3,4,2136,'','','',NULL,0,1,1,1,'','2023-01-25 12:05:31','','2023-01-25 12:05:31',0),(2141,'邮件记录','',2,0,2130,'mail-log','fa:edit','system/mail/log/index','SystemMailLog',0,1,1,1,'','2023-01-26 02:16:50','1','2024-02-29 08:48:51',0),(2142,'日志查询','system:mail-log:query',3,1,2141,'','','',NULL,0,1,1,1,'','2023-01-26 02:16:50','','2023-01-26 02:16:50',0),(2143,'发送测试邮件','system:mail-template:send-mail',3,5,2136,'','','',NULL,0,1,1,1,'1','2023-01-26 23:29:15','1','2023-01-26 23:29:15',0),(2144,'站内信管理','',1,3,2739,'notify','ep:message-box',NULL,NULL,0,1,1,1,'1','2023-01-28 10:25:18','1','2024-04-22 23:56:12',0),(2145,'模板管理','',2,0,2144,'notify-template','fa:archive','system/notify/template/index','SystemNotifyTemplate',0,1,1,1,'','2023-01-28 02:26:42','1','2024-02-29 08:49:14',0),(2146,'站内信模板查询','system:notify-template:query',3,1,2145,'','','',NULL,0,1,1,1,'','2023-01-28 02:26:42','','2023-01-28 02:26:42',0),(2147,'站内信模板创建','system:notify-template:create',3,2,2145,'','','',NULL,0,1,1,1,'','2023-01-28 02:26:42','','2023-01-28 02:26:42',0),(2148,'站内信模板更新','system:notify-template:update',3,3,2145,'','','',NULL,0,1,1,1,'','2023-01-28 02:26:42','','2023-01-28 02:26:42',0),(2149,'站内信模板删除','system:notify-template:delete',3,4,2145,'','','',NULL,0,1,1,1,'','2023-01-28 02:26:42','','2023-01-28 02:26:42',0),(2150,'发送测试站内信','system:notify-template:send-notify',3,5,2145,'','','',NULL,0,1,1,1,'1','2023-01-28 10:54:43','1','2023-01-28 10:54:43',0),(2151,'消息记录','',2,0,2144,'notify-message','fa:edit','system/notify/message/index','SystemNotifyMessage',0,1,1,1,'','2023-01-28 04:28:22','1','2024-02-29 08:49:22',0),(2152,'站内信消息查询','system:notify-message:query',3,1,2151,'','','',NULL,0,1,1,1,'','2023-01-28 04:28:22','','2023-01-28 04:28:22',0),(2153,'大屏设计器','',2,2,1281,'go-view','fa:area-chart','report/goview/index','JimuReport',0,1,1,1,'1','2023-02-07 00:03:19','1','2024-02-29 12:34:02',0),(2154,'创建项目','report:go-view-project:create',3,1,2153,'','','',NULL,0,1,1,1,'1','2023-02-07 19:25:14','1','2023-02-07 19:25:14',0),(2155,'更新项目','report:go-view-project:update',3,2,2153,'','','','',0,1,1,1,'1','2023-02-07 19:25:34','1','2024-04-24 20:01:18',0),(2156,'查询项目','report:go-view-project:query',3,0,2153,'','','',NULL,0,1,1,1,'1','2023-02-07 19:25:53','1','2023-02-07 19:25:53',0),(2157,'使用 SQL 查询数据','report:go-view-data:get-by-sql',3,3,2153,'','','',NULL,0,1,1,1,'1','2023-02-07 19:26:15','1','2023-02-07 19:26:15',0),(2158,'使用 HTTP 查询数据','report:go-view-data:get-by-http',3,4,2153,'','','',NULL,0,1,1,1,'1','2023-02-07 19:26:35','1','2023-02-07 19:26:35',0),(2159,'Boot 开发文档','',1,1,0,'https://doc.iocoder.cn/','ep:document',NULL,NULL,0,1,1,1,'1','2023-02-10 22:46:28','1','2024-07-28 11:36:48',0),(2160,'Cloud 开发文档','',1,2,0,'https://cloud.iocoder.cn','ep:document-copy',NULL,NULL,0,1,1,1,'1','2023-02-10 22:47:07','1','2023-12-02 21:32:29',0),(2161,'接入示例','',1,99,1117,'demo','fa-solid:dragon','pay/demo/index',NULL,0,1,1,1,'','2023-02-11 14:21:42','1','2024-01-18 23:50:00',0),(2162,'商品导出','product:spu:export',3,5,2014,'','','',NULL,0,1,1,1,'','2022-07-30 14:22:58','','2022-07-30 14:22:58',0),(2164,'配送管理','',1,3,2072,'delivery','ep:shopping-cart','','',0,1,1,1,'1','2023-05-18 09:18:02','1','2023-09-28 10:58:09',0),(2165,'快递发货','',1,0,2164,'express','ep:bicycle','','',0,1,1,1,'1','2023-05-18 09:22:06','1','2023-08-30 21:02:49',0),(2166,'门店自提','',1,1,2164,'pick-up-store','ep:add-location','','',0,1,1,1,'1','2023-05-18 09:23:14','1','2023-08-30 21:03:21',0),(2167,'快递公司','',2,0,2165,'express','ep:compass','mall/trade/delivery/express/index','Express',0,1,1,1,'1','2023-05-18 09:27:21','1','2024-11-29 11:20:54',0),(2168,'快递公司查询','trade:delivery:express:query',3,1,2167,'','','',NULL,0,1,1,1,'','2023-05-18 09:37:53','','2023-05-18 09:37:53',0),(2169,'快递公司创建','trade:delivery:express:create',3,2,2167,'','','',NULL,0,1,1,1,'','2023-05-18 09:37:53','','2023-05-18 09:37:53',0),(2170,'快递公司更新','trade:delivery:express:update',3,3,2167,'','','',NULL,0,1,1,1,'','2023-05-18 09:37:53','','2023-05-18 09:37:53',0),(2171,'快递公司删除','trade:delivery:express:delete',3,4,2167,'','','',NULL,0,1,1,1,'','2023-05-18 09:37:53','','2023-05-18 09:37:53',0),(2172,'快递公司导出','trade:delivery:express:export',3,5,2167,'','','',NULL,0,1,1,1,'','2023-05-18 09:37:53','','2023-05-18 09:37:53',0),(2173,'运费模版','trade:delivery:express-template:query',2,1,2165,'express-template','ep:coordinate','mall/trade/delivery/expressTemplate/index','ExpressTemplate',0,1,1,1,'1','2023-05-20 06:48:10','1','2023-08-30 21:03:13',0),(2174,'快递运费模板查询','trade:delivery:express-template:query',3,1,2173,'','','',NULL,0,1,1,1,'','2023-05-20 06:49:53','','2023-05-20 06:49:53',0),(2175,'快递运费模板创建','trade:delivery:express-template:create',3,2,2173,'','','',NULL,0,1,1,1,'','2023-05-20 06:49:53','','2023-05-20 06:49:53',0),(2176,'快递运费模板更新','trade:delivery:express-template:update',3,3,2173,'','','',NULL,0,1,1,1,'','2023-05-20 06:49:53','','2023-05-20 06:49:53',0),(2177,'快递运费模板删除','trade:delivery:express-template:delete',3,4,2173,'','','',NULL,0,1,1,1,'','2023-05-20 06:49:53','','2023-05-20 06:49:53',0),(2178,'快递运费模板导出','trade:delivery:express-template:export',3,5,2173,'','','',NULL,0,1,1,1,'','2023-05-20 06:49:53','','2023-05-20 06:49:53',0),(2179,'门店管理','',2,1,2166,'pick-up-store','ep:basketball','mall/trade/delivery/pickUpStore/index','PickUpStore',0,1,1,1,'1','2023-05-25 10:50:00','1','2023-08-30 21:03:28',0),(2180,'自提门店查询','trade:delivery:pick-up-store:query',3,1,2179,'','','',NULL,0,1,1,1,'','2023-05-25 10:53:29','','2023-05-25 10:53:29',0),(2181,'自提门店创建','trade:delivery:pick-up-store:create',3,2,2179,'','','',NULL,0,1,1,1,'','2023-05-25 10:53:29','','2023-05-25 10:53:29',0),(2182,'自提门店更新','trade:delivery:pick-up-store:update',3,3,2179,'','','',NULL,0,1,1,1,'','2023-05-25 10:53:29','','2023-05-25 10:53:29',0),(2183,'自提门店删除','trade:delivery:pick-up-store:delete',3,4,2179,'','','',NULL,0,1,1,1,'','2023-05-25 10:53:29','','2023-05-25 10:53:29',0),(2184,'自提门店导出','trade:delivery:pick-up-store:export',3,5,2179,'','','',NULL,0,1,1,1,'','2023-05-25 10:53:29','','2023-05-25 10:53:29',0),(2209,'秒杀活动','',2,3,2030,'seckill','ep:place','','',0,1,1,1,'1','2023-06-24 17:39:13','1','2023-06-24 18:55:15',0),(2262,'会员中心','',1,55,0,'/member','ep:bicycle',NULL,NULL,0,1,1,1,'1','2023-06-10 00:42:03','1','2023-08-20 09:23:56',0),(2275,'会员配置','',2,0,2262,'config','fa:archive','member/config/index','MemberConfig',0,1,1,1,'','2023-06-10 02:07:44','1','2023-10-01 23:41:29',0),(2276,'会员配置查询','member:config:query',3,1,2275,'','','','',0,1,1,1,'','2023-06-10 02:07:44','1','2024-04-24 19:48:58',0),(2277,'会员配置保存','member:config:save',3,2,2275,'','','','',0,1,1,1,'','2023-06-10 02:07:44','1','2024-04-24 19:49:28',0),(2281,'签到配置','',2,2,2300,'config','ep:calendar','member/signin/config/index','SignInConfig',0,1,1,1,'','2023-06-10 03:26:12','1','2023-08-20 19:25:51',0),(2282,'积分签到规则查询','point:sign-in-config:query',3,1,2281,'','','',NULL,0,1,1,1,'','2023-06-10 03:26:12','','2023-06-10 03:26:12',0),(2283,'积分签到规则创建','point:sign-in-config:create',3,2,2281,'','','',NULL,0,1,1,1,'','2023-06-10 03:26:12','','2023-06-10 03:26:12',0),(2284,'积分签到规则更新','point:sign-in-config:update',3,3,2281,'','','',NULL,0,1,1,1,'','2023-06-10 03:26:12','','2023-06-10 03:26:12',0),(2285,'积分签到规则删除','point:sign-in-config:delete',3,4,2281,'','','',NULL,0,1,1,1,'','2023-06-10 03:26:12','','2023-06-10 03:26:12',0),(2287,'会员积分','',2,10,2262,'record','fa:asterisk','member/point/record/index','PointRecord',0,1,1,1,'','2023-06-10 04:18:50','1','2023-10-01 23:42:11',0),(2288,'用户积分记录查询','point:record:query',3,1,2287,'','','',NULL,0,1,1,1,'','2023-06-10 04:18:50','','2023-06-10 04:18:50',0),(2293,'签到记录','',2,3,2300,'record','ep:chicken','member/signin/record/index','SignInRecord',0,1,1,1,'','2023-06-10 04:48:22','1','2023-08-20 19:26:02',0),(2294,'用户签到积分查询','point:sign-in-record:query',3,1,2293,'','','',NULL,0,1,1,1,'','2023-06-10 04:48:22','','2023-06-10 04:48:22',0),(2297,'用户签到积分删除','point:sign-in-record:delete',3,4,2293,'','','',NULL,0,1,1,1,'','2023-06-10 04:48:22','','2023-06-10 04:48:22',0),(2300,'会员签到','',1,11,2262,'signin','ep:alarm-clock','','',0,1,1,1,'1','2023-06-27 22:49:53','1','2023-08-20 09:23:48',0),(2301,'回调通知','',2,5,1117,'notify','ep:mute-notification','pay/notify/index','PayNotify',0,1,1,1,'','2023-07-20 04:41:32','1','2024-01-18 23:56:48',0),(2302,'支付通知查询','pay:notify:query',3,1,2301,'','','',NULL,0,1,1,1,'','2023-07-20 04:41:32','','2023-07-20 04:41:32',0),(2303,'拼团活动','',2,3,2030,'combination','fa:group','','',0,1,1,1,'1','2023-08-12 17:19:54','1','2023-08-12 17:20:05',0),(2304,'拼团商品','',2,1,2303,'acitivity','ep:apple','mall/promotion/combination/activity/index','PromotionCombinationActivity',0,1,1,1,'1','2023-08-12 17:22:03','1','2023-08-12 17:22:29',0),(2305,'拼团活动查询','promotion:combination-activity:query',3,1,2304,'','','','',0,1,1,1,'1','2023-08-12 17:54:32','1','2023-11-24 11:57:40',0),(2306,'拼团活动创建','promotion:combination-activity:create',3,2,2304,'','','','',0,1,1,1,'1','2023-08-12 17:54:49','1','2023-08-12 17:54:49',0),(2307,'拼团活动更新','promotion:combination-activity:update',3,3,2304,'','','','',0,1,1,1,'1','2023-08-12 17:55:04','1','2023-08-12 17:55:04',0),(2308,'拼团活动删除','promotion:combination-activity:delete',3,4,2304,'','','','',0,1,1,1,'1','2023-08-12 17:55:23','1','2023-08-12 17:55:23',0),(2309,'拼团活动关闭','promotion:combination-activity:close',3,5,2304,'','','','',0,1,1,1,'1','2023-08-12 17:55:37','1','2023-10-06 10:51:57',0),(2310,'砍价活动','',2,4,2030,'bargain','ep:box','','',0,1,1,1,'1','2023-08-13 00:27:25','1','2023-08-13 00:27:25',0),(2311,'砍价商品','',2,1,2310,'activity','ep:burger','mall/promotion/bargain/activity/index','PromotionBargainActivity',0,1,1,1,'1','2023-08-13 00:28:49','1','2023-10-05 01:16:23',0),(2312,'砍价活动查询','promotion:bargain-activity:query',3,1,2311,'','','','',0,1,1,1,'1','2023-08-13 00:32:30','1','2023-08-13 00:32:30',0),(2313,'砍价活动创建','promotion:bargain-activity:create',3,2,2311,'','','','',0,1,1,1,'1','2023-08-13 00:32:44','1','2023-08-13 00:32:44',0),(2314,'砍价活动更新','promotion:bargain-activity:update',3,3,2311,'','','','',0,1,1,1,'1','2023-08-13 00:32:55','1','2023-08-13 00:32:55',0),(2315,'砍价活动删除','promotion:bargain-activity:delete',3,4,2311,'','','','',0,1,1,1,'1','2023-08-13 00:34:50','1','2023-08-13 00:34:50',0),(2316,'砍价活动关闭','promotion:bargain-activity:close',3,5,2311,'','','','',0,1,1,1,'1','2023-08-13 00:35:02','1','2023-08-13 00:35:02',0),(2317,'会员管理','',2,0,2262,'user','ep:avatar','member/user/index','MemberUser',0,1,1,1,'','2023-08-19 04:12:15','1','2023-08-24 00:50:55',0),(2318,'会员用户查询','member:user:query',3,1,2317,'','','',NULL,0,1,1,1,'','2023-08-19 04:12:15','','2023-08-19 04:12:15',0),(2319,'会员用户更新','member:user:update',3,3,2317,'','','',NULL,0,1,1,1,'','2023-08-19 04:12:15','','2023-08-19 04:12:15',0),(2320,'会员标签','',2,1,2262,'tag','ep:collection-tag','member/tag/index','MemberTag',0,1,1,1,'','2023-08-20 01:03:08','1','2023-08-20 09:23:19',0),(2321,'会员标签查询','member:tag:query',3,1,2320,'','','',NULL,0,1,1,1,'','2023-08-20 01:03:08','','2023-08-20 01:03:08',0),(2322,'会员标签创建','member:tag:create',3,2,2320,'','','',NULL,0,1,1,1,'','2023-08-20 01:03:08','','2023-08-20 01:03:08',0),(2323,'会员标签更新','member:tag:update',3,3,2320,'','','',NULL,0,1,1,1,'','2023-08-20 01:03:08','','2023-08-20 01:03:08',0),(2324,'会员标签删除','member:tag:delete',3,4,2320,'','','',NULL,0,1,1,1,'','2023-08-20 01:03:08','','2023-08-20 01:03:08',0),(2325,'会员等级','',2,2,2262,'level','fa:level-up','member/level/index','MemberLevel',0,1,1,1,'','2023-08-22 12:41:01','1','2023-08-22 21:47:00',0),(2326,'会员等级查询','member:level:query',3,1,2325,'','','',NULL,0,1,1,1,'','2023-08-22 12:41:02','','2023-08-22 12:41:02',0),(2327,'会员等级创建','member:level:create',3,2,2325,'','','',NULL,0,1,1,1,'','2023-08-22 12:41:02','','2023-08-22 12:41:02',0),(2328,'会员等级更新','member:level:update',3,3,2325,'','','',NULL,0,1,1,1,'','2023-08-22 12:41:02','','2023-08-22 12:41:02',0),(2329,'会员等级删除','member:level:delete',3,4,2325,'','','',NULL,0,1,1,1,'','2023-08-22 12:41:02','','2023-08-22 12:41:02',0),(2330,'会员分组','',2,3,2262,'group','fa:group','member/group/index','MemberGroup',0,1,1,1,'','2023-08-22 13:50:06','1','2023-10-01 23:42:01',0),(2331,'用户分组查询','member:group:query',3,1,2330,'','','',NULL,0,1,1,1,'','2023-08-22 13:50:06','','2023-08-22 13:50:06',0),(2332,'用户分组创建','member:group:create',3,2,2330,'','','',NULL,0,1,1,1,'','2023-08-22 13:50:06','','2023-08-22 13:50:06',0),(2333,'用户分组更新','member:group:update',3,3,2330,'','','',NULL,0,1,1,1,'','2023-08-22 13:50:06','','2023-08-22 13:50:06',0),(2334,'用户分组删除','member:group:delete',3,4,2330,'','','',NULL,0,1,1,1,'','2023-08-22 13:50:06','','2023-08-22 13:50:06',0),(2335,'用户等级修改','member:user:update-level',3,5,2317,'','','',NULL,0,1,1,1,'','2023-08-23 16:49:05','','2023-08-23 16:50:48',0),(2336,'商品评论','',2,5,2000,'comment','ep:comment','mall/product/comment/index','ProductComment',0,1,1,1,'1','2023-08-26 11:03:00','1','2023-08-26 11:03:38',0),(2337,'评论查询','product:comment:query',3,1,2336,'','','','',0,1,1,1,'1','2023-08-26 11:04:01','1','2023-08-26 11:04:01',0),(2338,'添加自评','product:comment:create',3,2,2336,'','','','',0,1,1,1,'1','2023-08-26 11:04:23','1','2023-08-26 11:08:18',0),(2339,'商家回复','product:comment:update',3,3,2336,'','','','',0,1,1,1,'1','2023-08-26 11:04:37','1','2023-08-26 11:04:37',0),(2340,'显隐评论','product:comment:update',3,4,2336,'','','','',0,1,1,1,'1','2023-08-26 11:04:55','1','2023-08-26 11:04:55',0),(2341,'优惠劵发送','promotion:coupon:send',3,2,2038,'','','','',0,1,1,1,'1','2023-09-02 00:03:14','1','2023-09-02 00:03:14',0),(2342,'交易配置','',2,0,2072,'config','ep:setting','mall/trade/config/index','TradeConfig',0,1,1,1,'','2023-09-28 02:46:22','1','2024-02-26 20:30:53',0),(2343,'交易中心配置查询','trade:config:query',3,1,2342,'','','',NULL,0,1,1,1,'','2023-09-28 02:46:22','','2023-09-28 02:46:22',0),(2344,'交易中心配置保存','trade:config:save',3,2,2342,'','','',NULL,0,1,1,1,'','2023-09-28 02:46:22','','2023-09-28 02:46:22',0),(2345,'分销管理','',1,4,2072,'brokerage','fa-solid:project-diagram','','',0,1,1,1,'','2023-09-28 02:46:22','1','2023-09-28 10:58:44',0),(2346,'分销用户','',2,0,2345,'brokerage-user','fa-solid:user-tie','mall/trade/brokerage/user/index','TradeBrokerageUser',0,1,1,1,'','2023-09-28 02:46:22','1','2024-02-26 20:33:23',0),(2347,'分销用户查询','trade:brokerage-user:query',3,1,2346,'','','',NULL,0,1,1,1,'','2023-09-28 02:46:22','','2023-09-28 02:46:22',0),(2348,'分销用户推广人查询','trade:brokerage-user:user-query',3,2,2346,'','','',NULL,0,1,1,1,'','2023-09-28 02:46:22','','2023-09-28 02:46:22',0),(2349,'分销用户推广订单查询','trade:brokerage-user:order-query',3,3,2346,'','','',NULL,0,1,1,1,'','2023-09-28 02:46:22','','2023-09-28 02:46:22',0),(2350,'分销用户修改推广资格','trade:brokerage-user:update-brokerage-enable',3,4,2346,'','','',NULL,0,1,1,1,'','2023-09-28 02:46:22','','2023-09-28 02:46:22',0),(2351,'修改推广员','trade:brokerage-user:update-bind-user',3,5,2346,'','','','',0,1,1,1,'','2023-09-28 02:46:22','1','2024-12-01 14:33:07',0),(2352,'清除推广员','trade:brokerage-user:clear-bind-user',3,6,2346,'','','','',0,1,1,1,'','2023-09-28 02:46:22','1','2024-12-01 14:33:14',0),(2353,'佣金记录','',2,1,2345,'brokerage-record','fa:money','mall/trade/brokerage/record/index','TradeBrokerageRecord',0,1,1,1,'','2023-09-28 02:46:22','1','2024-02-26 20:33:30',0),(2354,'佣金记录查询','trade:brokerage-record:query',3,1,2353,'','','',NULL,0,1,1,1,'','2023-09-28 02:46:22','','2023-09-28 02:46:22',0),(2355,'佣金提现','',2,2,2345,'brokerage-withdraw','fa:credit-card','mall/trade/brokerage/withdraw/index','TradeBrokerageWithdraw',0,1,1,1,'','2023-09-28 02:46:22','1','2024-02-26 20:33:35',0),(2356,'佣金提现查询','trade:brokerage-withdraw:query',3,1,2355,'','','',NULL,0,1,1,1,'','2023-09-28 02:46:22','','2023-09-28 02:46:22',0),(2357,'佣金提现审核','trade:brokerage-withdraw:audit',3,2,2355,'','','',NULL,0,1,1,1,'','2023-09-28 02:46:22','','2023-09-28 02:46:22',0),(2358,'统计中心','',1,75,2362,'statistics','ep:data-line','','',0,1,1,1,'','2023-09-30 03:22:40','1','2023-09-30 11:54:48',0),(2359,'交易统计','',2,4,2358,'trade','fa-solid:credit-card','mall/statistics/trade/index','TradeStatistics',0,1,1,1,'','2023-09-30 03:22:40','1','2024-02-26 20:42:00',0),(2360,'交易统计查询','statistics:trade:query',3,1,2359,'','','',NULL,0,1,1,1,'','2023-09-30 03:22:40','','2023-09-30 03:22:40',0),(2361,'交易统计导出','statistics:trade:export',3,2,2359,'','','',NULL,0,1,1,1,'','2023-09-30 03:22:40','','2023-09-30 03:22:40',0),(2362,'商城系统','',1,59,0,'/mall','ep:shop','','',0,1,1,1,'1','2023-09-30 11:52:02','1','2023-09-30 11:52:18',0),(2363,'用户积分修改','member:user:update-point',3,6,2317,'','','',NULL,0,1,1,1,'','2023-10-01 14:39:43','','2023-10-01 14:39:43',0),(2364,'用户余额修改','pay:wallet:update-balance',3,7,2317,'','','','',0,1,1,1,'','2023-10-01 14:39:43','1','2024-10-01 09:42:57',0),(2365,'优惠劵','',1,2,2030,'coupon','fa-solid:disease','','',0,1,1,1,'1','2023-10-03 12:39:15','1','2023-10-05 00:16:07',0),(2366,'砍价记录','',2,2,2310,'record','ep:list','mall/promotion/bargain/record/index','PromotionBargainRecord',0,1,1,1,'','2023-10-05 02:49:06','1','2023-10-05 10:50:38',0),(2367,'砍价记录查询','promotion:bargain-record:query',3,1,2366,'','','',NULL,0,1,1,1,'','2023-10-05 02:49:06','','2023-10-05 02:49:06',0),(2368,'助力记录查询','promotion:bargain-help:query',3,2,2366,'','','','',0,1,1,1,'1','2023-10-05 12:27:49','1','2023-10-05 12:27:49',0),(2369,'拼团记录','promotion:combination-record:query',2,2,2303,'record','ep:avatar','mall/promotion/combination/record/index.vue','PromotionCombinationRecord',0,1,1,1,'1','2023-10-08 07:10:22','1','2023-10-08 07:34:11',0),(2374,'会员统计','',2,2,2358,'member','ep:avatar','mall/statistics/member/index','MemberStatistics',0,1,1,1,'','2023-10-11 04:39:24','1','2024-02-26 20:41:46',0),(2375,'会员统计查询','statistics:member:query',3,1,2374,'','','',NULL,0,1,1,1,'','2023-10-11 04:39:24','','2023-10-11 04:39:24',0),(2376,'订单核销','trade:order:pick-up',3,10,2076,'','','','',0,1,1,1,'1','2023-10-14 17:11:58','1','2023-10-14 17:11:58',0),(2377,'文章分类','',2,0,2387,'article/category','fa:certificate','mall/promotion/article/category/index','ArticleCategory',0,1,1,1,'','2023-10-16 01:26:18','1','2023-10-16 09:38:26',0),(2378,'分类查询','promotion:article-category:query',3,1,2377,'','','',NULL,0,1,1,1,'','2023-10-16 01:26:18','','2023-10-16 01:26:18',0),(2379,'分类创建','promotion:article-category:create',3,2,2377,'','','',NULL,0,1,1,1,'','2023-10-16 01:26:18','','2023-10-16 01:26:18',0),(2380,'分类更新','promotion:article-category:update',3,3,2377,'','','',NULL,0,1,1,1,'','2023-10-16 01:26:18','','2023-10-16 01:26:18',0),(2381,'分类删除','promotion:article-category:delete',3,4,2377,'','','',NULL,0,1,1,1,'','2023-10-16 01:26:18','','2023-10-16 01:26:18',0),(2382,'文章列表','',2,2,2387,'article','ep:connection','mall/promotion/article/index','Article',0,1,1,1,'','2023-10-16 01:26:18','1','2023-10-16 09:41:19',0),(2383,'文章管理查询','promotion:article:query',3,1,2382,'','','',NULL,0,1,1,1,'','2023-10-16 01:26:18','','2023-10-16 01:26:18',0),(2384,'文章管理创建','promotion:article:create',3,2,2382,'','','',NULL,0,1,1,1,'','2023-10-16 01:26:18','','2023-10-16 01:26:18',0),(2385,'文章管理更新','promotion:article:update',3,3,2382,'','','',NULL,0,1,1,1,'','2023-10-16 01:26:18','','2023-10-16 01:26:18',0),(2386,'文章管理删除','promotion:article:delete',3,4,2382,'','','',NULL,0,1,1,1,'','2023-10-16 01:26:18','','2023-10-16 01:26:18',0),(2387,'内容管理','',1,1,2030,'content','ep:collection','','',0,1,1,1,'1','2023-10-16 09:37:31','1','2023-10-16 09:37:31',0),(2388,'商城首页','',2,1,2362,'home','ep:home-filled','mall/home/index','MallHome',0,1,1,1,'','2023-10-16 12:10:33','','2023-10-16 12:10:33',0),(2389,'核销订单','',2,2,2166,'pick-up-order','ep:list','mall/trade/delivery/pickUpOrder/index','PickUpOrder',0,1,1,1,'','2023-10-19 16:09:51','','2023-10-19 16:09:51',0),(2390,'优惠活动','',1,99,2030,'youhui','ep:aim','','',0,1,1,1,'1','2023-10-21 19:23:49','1','2023-10-21 19:23:49',0),(2391,'客户管理','',2,10,2397,'customer','fa:address-book-o','crm/customer/index','CrmCustomer',0,1,1,1,'','2023-10-29 09:04:21','1','2024-02-17 17:13:32',0),(2392,'客户查询','crm:customer:query',3,1,2391,'','','',NULL,0,1,1,1,'','2023-10-29 09:04:21','','2023-10-29 09:04:21',0),(2393,'客户创建','crm:customer:create',3,2,2391,'','','',NULL,0,1,1,1,'','2023-10-29 09:04:21','','2023-10-29 09:04:21',0),(2394,'客户更新','crm:customer:update',3,3,2391,'','','',NULL,0,1,1,1,'','2023-10-29 09:04:21','','2023-10-29 09:04:21',0),(2395,'客户删除','crm:customer:delete',3,4,2391,'','','',NULL,0,1,1,1,'','2023-10-29 09:04:21','','2023-10-29 09:04:21',0),(2396,'客户导出','crm:customer:export',3,5,2391,'','','',NULL,0,1,1,1,'','2023-10-29 09:04:21','','2023-10-29 09:04:21',0),(2397,'CRM 系统','',1,200,0,'/crm','ep:avatar','','',0,1,1,1,'1','2023-10-29 17:08:30','1','2024-02-04 15:37:31',0),(2398,'合同管理','',2,50,2397,'contract','ep:notebook','crm/contract/index','CrmContract',0,1,1,1,'','2023-10-29 10:50:41','1','2024-02-17 17:15:09',0),(2399,'合同查询','crm:contract:query',3,1,2398,'','','',NULL,0,1,1,1,'','2023-10-29 10:50:41','','2023-10-29 10:50:41',0),(2400,'合同创建','crm:contract:create',3,2,2398,'','','',NULL,0,1,1,1,'','2023-10-29 10:50:41','','2023-10-29 10:50:41',0),(2401,'合同更新','crm:contract:update',3,3,2398,'','','',NULL,0,1,1,1,'','2023-10-29 10:50:41','','2023-10-29 10:50:41',0),(2402,'合同删除','crm:contract:delete',3,4,2398,'','','',NULL,0,1,1,1,'','2023-10-29 10:50:41','','2023-10-29 10:50:41',0),(2403,'合同导出','crm:contract:export',3,5,2398,'','','',NULL,0,1,1,1,'','2023-10-29 10:50:41','','2023-10-29 10:50:41',0),(2404,'线索管理','',2,8,2397,'clue','fa:pagelines','crm/clue/index','CrmClue',0,1,1,1,'','2023-10-29 11:06:29','1','2024-02-17 17:15:41',0),(2405,'线索查询','crm:clue:query',3,1,2404,'','','',NULL,0,1,1,1,'','2023-10-29 11:06:29','','2023-10-29 11:06:29',0),(2406,'线索创建','crm:clue:create',3,2,2404,'','','',NULL,0,1,1,1,'','2023-10-29 11:06:29','','2023-10-29 11:06:29',0),(2407,'线索更新','crm:clue:update',3,3,2404,'','','',NULL,0,1,1,1,'','2023-10-29 11:06:29','','2023-10-29 11:06:29',0),(2408,'线索删除','crm:clue:delete',3,4,2404,'','','',NULL,0,1,1,1,'','2023-10-29 11:06:29','','2023-10-29 11:06:29',0),(2409,'线索导出','crm:clue:export',3,5,2404,'','','',NULL,0,1,1,1,'','2023-10-29 11:06:29','','2023-10-29 11:06:29',0),(2410,'商机管理','',2,40,2397,'business','fa:bus','crm/business/index','CrmBusiness',0,1,1,1,'','2023-10-29 11:12:35','1','2024-02-17 17:14:55',0),(2411,'商机查询','crm:business:query',3,1,2410,'','','',NULL,0,1,1,1,'','2023-10-29 11:12:35','','2023-10-29 11:12:35',0),(2412,'商机创建','crm:business:create',3,2,2410,'','','',NULL,0,1,1,1,'','2023-10-29 11:12:35','','2023-10-29 11:12:35',0),(2413,'商机更新','crm:business:update',3,3,2410,'','','',NULL,0,1,1,1,'','2023-10-29 11:12:35','','2023-10-29 11:12:35',0),(2414,'商机删除','crm:business:delete',3,4,2410,'','','',NULL,0,1,1,1,'','2023-10-29 11:12:35','','2023-10-29 11:12:35',0),(2415,'商机导出','crm:business:export',3,5,2410,'','','',NULL,0,1,1,1,'','2023-10-29 11:12:35','','2023-10-29 11:12:35',0),(2416,'联系人管理','',2,20,2397,'contact','fa:address-book-o','crm/contact/index','CrmContact',0,1,1,1,'','2023-10-29 11:14:56','1','2024-02-17 17:13:49',0),(2417,'联系人查询','crm:contact:query',3,1,2416,'','','',NULL,0,1,1,1,'','2023-10-29 11:14:56','','2023-10-29 11:14:56',0),(2418,'联系人创建','crm:contact:create',3,2,2416,'','','',NULL,0,1,1,1,'','2023-10-29 11:14:56','','2023-10-29 11:14:56',0),(2419,'联系人更新','crm:contact:update',3,3,2416,'','','',NULL,0,1,1,1,'','2023-10-29 11:14:56','','2023-10-29 11:14:56',0),(2420,'联系人删除','crm:contact:delete',3,4,2416,'','','',NULL,0,1,1,1,'','2023-10-29 11:14:56','','2023-10-29 11:14:56',0),(2421,'联系人导出','crm:contact:export',3,5,2416,'','','',NULL,0,1,1,1,'','2023-10-29 11:14:56','','2023-10-29 11:14:56',0),(2422,'回款管理','',2,60,2397,'receivable','ep:money','crm/receivable/index','CrmReceivable',0,1,1,1,'','2023-10-29 11:18:09','1','2024-02-17 17:16:18',0),(2423,'回款管理查询','crm:receivable:query',3,1,2422,'','','',NULL,0,1,1,1,'','2023-10-29 11:18:09','','2023-10-29 11:18:09',0),(2424,'回款管理创建','crm:receivable:create',3,2,2422,'','','',NULL,0,1,1,1,'','2023-10-29 11:18:09','','2023-10-29 11:18:09',0),(2425,'回款管理更新','crm:receivable:update',3,3,2422,'','','',NULL,0,1,1,1,'','2023-10-29 11:18:09','','2023-10-29 11:18:09',0),(2426,'回款管理删除','crm:receivable:delete',3,4,2422,'','','',NULL,0,1,1,1,'','2023-10-29 11:18:09','','2023-10-29 11:18:09',0),(2427,'回款管理导出','crm:receivable:export',3,5,2422,'','','',NULL,0,1,1,1,'','2023-10-29 11:18:09','','2023-10-29 11:18:09',0),(2428,'回款计划','',2,61,2397,'receivable-plan','fa:money','crm/receivable/plan/index','CrmReceivablePlan',0,1,1,1,'','2023-10-29 11:18:09','1','2024-02-17 17:16:11',0),(2429,'回款计划查询','crm:receivable-plan:query',3,1,2428,'','','',NULL,0,1,1,1,'','2023-10-29 11:18:09','','2023-10-29 11:18:09',0),(2430,'回款计划创建','crm:receivable-plan:create',3,2,2428,'','','',NULL,0,1,1,1,'','2023-10-29 11:18:09','','2023-10-29 11:18:09',0),(2431,'回款计划更新','crm:receivable-plan:update',3,3,2428,'','','',NULL,0,1,1,1,'','2023-10-29 11:18:09','','2023-10-29 11:18:09',0),(2432,'回款计划删除','crm:receivable-plan:delete',3,4,2428,'','','',NULL,0,1,1,1,'','2023-10-29 11:18:09','','2023-10-29 11:18:09',0),(2433,'回款计划导出','crm:receivable-plan:export',3,5,2428,'','','',NULL,0,1,1,1,'','2023-10-29 11:18:09','','2023-10-29 11:18:09',0),(2435,'商城装修','',2,20,2030,'diy-template','fa6-solid:brush','mall/promotion/diy/template/index','DiyTemplate',0,1,1,1,'','2023-10-29 14:19:25','','2023-10-29 14:19:25',0),(2436,'装修模板','',2,1,2435,'diy-template','fa6-solid:brush','mall/promotion/diy/template/index','DiyTemplate',0,1,1,1,'','2023-10-29 14:19:25','','2023-10-29 14:19:25',0),(2437,'装修模板查询','promotion:diy-template:query',3,1,2436,'','','',NULL,0,1,1,1,'','2023-10-29 14:19:25','','2023-10-29 14:19:25',0),(2438,'装修模板创建','promotion:diy-template:create',3,2,2436,'','','',NULL,0,1,1,1,'','2023-10-29 14:19:25','','2023-10-29 14:19:25',0),(2439,'装修模板更新','promotion:diy-template:update',3,3,2436,'','','',NULL,0,1,1,1,'','2023-10-29 14:19:25','','2023-10-29 14:19:25',0),(2440,'装修模板删除','promotion:diy-template:delete',3,4,2436,'','','',NULL,0,1,1,1,'','2023-10-29 14:19:25','','2023-10-29 14:19:25',0),(2441,'装修模板使用','promotion:diy-template:use',3,5,2436,'','','',NULL,0,1,1,1,'','2023-10-29 14:19:25','','2023-10-29 14:19:25',0),(2442,'装修页面','',2,2,2435,'diy-page','foundation:page-edit','mall/promotion/diy/page/index','DiyPage',0,1,1,1,'','2023-10-29 14:19:25','','2023-10-29 14:19:25',0),(2443,'装修页面查询','promotion:diy-page:query',3,1,2442,'','','',NULL,0,1,1,1,'','2023-10-29 14:19:25','','2023-10-29 14:19:25',0),(2444,'装修页面创建','promotion:diy-page:create',3,2,2442,'','','',NULL,0,1,1,1,'','2023-10-29 14:19:26','','2023-10-29 14:19:26',0),(2445,'装修页面更新','promotion:diy-page:update',3,3,2442,'','','',NULL,0,1,1,1,'','2023-10-29 14:19:26','','2023-10-29 14:19:26',0),(2446,'装修页面删除','promotion:diy-page:delete',3,4,2442,'','','',NULL,0,1,1,1,'','2023-10-29 14:19:26','','2023-10-29 14:19:26',0),(2447,'三方登录','',1,10,1,'social','fa:rocket','','',0,1,1,1,'1','2023-11-04 12:12:01','1','2024-02-29 01:14:05',0),(2448,'三方应用','',2,1,2447,'client','ep:set-up','system/social/client/index.vue','SocialClient',0,1,1,1,'1','2023-11-04 12:17:19','1','2024-05-04 19:09:54',0),(2449,'三方应用查询','system:social-client:query',3,1,2448,'','','','',0,1,1,1,'1','2023-11-04 12:43:12','1','2023-11-04 12:43:33',0),(2450,'三方应用创建','system:social-client:create',3,2,2448,'','','','',0,1,1,1,'1','2023-11-04 12:43:58','1','2023-11-04 12:43:58',0),(2451,'三方应用更新','system:social-client:update',3,3,2448,'','','','',0,1,1,1,'1','2023-11-04 12:44:27','1','2023-11-04 12:44:27',0),(2452,'三方应用删除','system:social-client:delete',3,4,2448,'','','','',0,1,1,1,'1','2023-11-04 12:44:43','1','2023-11-04 12:44:43',0),(2453,'三方用户','system:social-user:query',2,2,2447,'user','ep:avatar','system/social/user/index.vue','SocialUser',0,1,1,1,'1','2023-11-04 14:01:05','1','2023-11-04 14:01:05',0),(2472,'主子表（内嵌）','',2,12,1070,'demo03-inner','fa:power-off','infra/demo/demo03/inner/index','Demo03StudentInner',0,1,1,1,'','2023-11-13 04:39:51','1','2023-11-16 23:53:46',0),(2478,'单表（增删改查）','',2,1,1070,'demo01-contact','ep:bicycle','infra/demo/demo01/index','Demo01Contact',0,1,1,1,'','2023-11-15 14:42:30','1','2023-11-16 20:34:40',0),(2479,'示例联系人查询','infra:demo01-contact:query',3,1,2478,'','','',NULL,0,1,1,1,'','2023-11-15 14:42:30','','2023-11-15 14:42:30',0),(2480,'示例联系人创建','infra:demo01-contact:create',3,2,2478,'','','',NULL,0,1,1,1,'','2023-11-15 14:42:30','','2023-11-15 14:42:30',0),(2481,'示例联系人更新','infra:demo01-contact:update',3,3,2478,'','','',NULL,0,1,1,1,'','2023-11-15 14:42:30','','2023-11-15 14:42:30',0),(2482,'示例联系人删除','infra:demo01-contact:delete',3,4,2478,'','','',NULL,0,1,1,1,'','2023-11-15 14:42:30','','2023-11-15 14:42:30',0),(2483,'示例联系人导出','infra:demo01-contact:export',3,5,2478,'','','',NULL,0,1,1,1,'','2023-11-15 14:42:30','','2023-11-15 14:42:30',0),(2484,'树表（增删改查）','',2,2,1070,'demo02-category','fa:tree','infra/demo/demo02/index','Demo02Category',0,1,1,1,'','2023-11-16 12:18:27','1','2023-11-16 20:35:01',0),(2485,'示例分类查询','infra:demo02-category:query',3,1,2484,'','','',NULL,0,1,1,1,'','2023-11-16 12:18:27','','2023-11-16 12:18:27',0),(2486,'示例分类创建','infra:demo02-category:create',3,2,2484,'','','',NULL,0,1,1,1,'','2023-11-16 12:18:27','','2023-11-16 12:18:27',0),(2487,'示例分类更新','infra:demo02-category:update',3,3,2484,'','','',NULL,0,1,1,1,'','2023-11-16 12:18:27','','2023-11-16 12:18:27',0),(2488,'示例分类删除','infra:demo02-category:delete',3,4,2484,'','','',NULL,0,1,1,1,'','2023-11-16 12:18:27','','2023-11-16 12:18:27',0),(2489,'示例分类导出','infra:demo02-category:export',3,5,2484,'','','',NULL,0,1,1,1,'','2023-11-16 12:18:27','','2023-11-16 12:18:27',0),(2490,'主子表（标准）','',2,10,1070,'demo03-normal','fa:battery-3','infra/demo/demo03/normal/index','Demo03StudentNormal',0,1,1,1,'','2023-11-16 12:53:37','1','2023-11-16 23:10:03',0),(2491,'学生查询','infra:demo03-student:query',3,1,2490,'','','',NULL,0,1,1,1,'','2023-11-16 12:53:37','','2023-11-16 12:53:37',0),(2492,'学生创建','infra:demo03-student:create',3,2,2490,'','','',NULL,0,1,1,1,'','2023-11-16 12:53:37','','2023-11-16 12:53:37',0),(2493,'学生更新','infra:demo03-student:update',3,3,2490,'','','',NULL,0,1,1,1,'','2023-11-16 12:53:37','','2023-11-16 12:53:37',0),(2494,'学生删除','infra:demo03-student:delete',3,4,2490,'','','',NULL,0,1,1,1,'','2023-11-16 12:53:37','','2023-11-16 12:53:37',0),(2495,'学生导出','infra:demo03-student:export',3,5,2490,'','','',NULL,0,1,1,1,'','2023-11-16 12:53:37','','2023-11-16 12:53:37',0),(2497,'主子表（ERP）','',2,11,1070,'demo03-erp','ep:calendar','infra/demo/demo03/erp/index','Demo03StudentERP',0,1,1,1,'','2023-11-16 15:50:59','1','2023-11-17 13:19:56',0),(2516,'客户公海配置','',2,0,2524,'customer-pool-config','ep:data-analysis','crm/customer/poolConfig/index','CrmCustomerPoolConfig',0,1,1,1,'','2023-11-18 13:33:31','1','2024-01-03 19:52:06',0),(2517,'客户公海配置保存','crm:customer-pool-config:update',3,1,2516,'','','',NULL,0,1,1,1,'','2023-11-18 13:33:31','','2023-11-18 13:33:31',0),(2518,'客户限制配置','',2,1,2524,'customer-limit-config','ep:avatar','crm/customer/limitConfig/index','CrmCustomerLimitConfig',0,1,1,1,'','2023-11-18 13:33:53','1','2024-02-24 16:43:33',0),(2519,'客户限制配置查询','crm:customer-limit-config:query',3,1,2518,'','','',NULL,0,1,1,1,'','2023-11-18 13:33:53','','2023-11-18 13:33:53',0),(2520,'客户限制配置创建','crm:customer-limit-config:create',3,2,2518,'','','',NULL,0,1,1,1,'','2023-11-18 13:33:53','','2023-11-18 13:33:53',0),(2521,'客户限制配置更新','crm:customer-limit-config:update',3,3,2518,'','','',NULL,0,1,1,1,'','2023-11-18 13:33:53','','2023-11-18 13:33:53',0),(2522,'客户限制配置删除','crm:customer-limit-config:delete',3,4,2518,'','','',NULL,0,1,1,1,'','2023-11-18 13:33:53','','2023-11-18 13:33:53',0),(2523,'客户限制配置导出','crm:customer-limit-config:export',3,5,2518,'','','',NULL,0,1,1,1,'','2023-11-18 13:33:53','','2023-11-18 13:33:53',0),(2524,'系统配置','',1,999,2397,'config','ep:connection','','',0,1,1,1,'1','2023-11-18 21:58:00','1','2024-02-17 17:14:34',0),(2525,'WebSocket','',2,5,2,'websocket','ep:connection','infra/webSocket/index','InfraWebSocket',0,1,1,1,'1','2023-11-23 19:41:55','1','2024-04-23 00:02:00',0),(2526,'产品管理','',2,80,2397,'product','fa:product-hunt','crm/product/index','CrmProduct',0,1,1,1,'1','2023-12-05 22:45:26','1','2024-02-20 20:36:20',0),(2527,'产品查询','crm:product:query',3,1,2526,'','','','',0,1,1,1,'1','2023-12-05 22:47:16','1','2023-12-05 22:47:16',0),(2528,'产品创建','crm:product:create',3,2,2526,'','','','',0,1,1,1,'1','2023-12-05 22:47:41','1','2023-12-05 22:47:48',0),(2529,'产品更新','crm:product:update',3,3,2526,'','','','',0,1,1,1,'1','2023-12-05 22:48:03','1','2023-12-05 22:48:03',0),(2530,'产品删除','crm:product:delete',3,4,2526,'','','','',0,1,1,1,'1','2023-12-05 22:48:17','1','2023-12-05 22:48:17',0),(2531,'产品导出','crm:product:export',3,5,2526,'','','','',0,1,1,1,'1','2023-12-05 22:48:29','1','2023-12-05 22:48:29',0),(2532,'产品分类配置','',2,3,2524,'product/category','fa-solid:window-restore','crm/product/category/index','CrmProductCategory',0,1,1,1,'1','2023-12-06 12:52:36','1','2023-12-06 12:52:51',0),(2533,'产品分类查询','crm:product-category:query',3,1,2532,'','','','',0,1,1,1,'1','2023-12-06 12:53:23','1','2023-12-06 12:53:23',0),(2534,'产品分类创建','crm:product-category:create',3,2,2532,'','','','',0,1,1,1,'1','2023-12-06 12:53:41','1','2023-12-06 12:53:41',0),(2535,'产品分类更新','crm:product-category:update',3,3,2532,'','','','',0,1,1,1,'1','2023-12-06 12:53:59','1','2023-12-06 12:53:59',0),(2536,'产品分类删除','crm:product-category:delete',3,4,2532,'','','','',0,1,1,1,'1','2023-12-06 12:54:14','1','2023-12-06 12:54:14',0),(2543,'关联商机','crm:contact:create-business',3,10,2416,'','','','',0,1,1,1,'1','2024-01-02 17:28:25','1','2024-01-02 17:28:25',0),(2544,'取关商机','crm:contact:delete-business',3,11,2416,'','','','',0,1,1,1,'1','2024-01-02 17:28:43','1','2024-01-02 17:28:51',0),(2545,'商品统计','',2,3,2358,'product','fa:product-hunt','mall/statistics/product/index','ProductStatistics',0,1,1,1,'','2023-12-15 18:54:28','1','2024-02-26 20:41:52',0),(2546,'客户公海','',2,30,2397,'customer/pool','fa-solid:swimming-pool','crm/customer/pool/index','CrmCustomerPool',0,1,1,1,'1','2024-01-15 21:29:34','1','2024-02-17 17:14:18',0),(2547,'订单查询','trade:order:query',3,1,2076,'','','','',0,1,1,1,'1','2024-01-16 08:52:00','1','2024-01-16 08:52:00',0),(2548,'订单更新','trade:order:update',3,2,2076,'','','','',0,1,1,1,'1','2024-01-16 08:52:21','1','2024-01-16 08:52:21',0),(2549,'支付&退款案例','',2,1,2161,'order','fa:paypal','pay/demo/order/index','',0,1,1,1,'1','2024-01-18 23:45:00','1','2024-01-18 23:47:21',0),(2550,'转账案例','',2,2,2161,'transfer','fa:transgender-alt','pay/demo/transfer/index','',0,1,1,1,'1','2024-01-18 23:51:16','1','2024-01-18 23:51:16',0),(2551,'钱包管理','',1,4,1117,'wallet','ep:wallet','','',0,1,1,1,'','2023-12-29 02:32:54','1','2024-02-29 08:58:54',0),(2552,'充值套餐','',2,2,2551,'wallet-recharge-package','fa:leaf','pay/wallet/rechargePackage/index','WalletRechargePackage',0,1,1,1,'','2023-12-29 02:32:54','','2023-12-29 02:32:54',0),(2553,'钱包充值套餐查询','pay:wallet-recharge-package:query',3,1,2552,'','','',NULL,0,1,1,1,'','2023-12-29 02:32:54','','2023-12-29 02:32:54',0),(2554,'钱包充值套餐创建','pay:wallet-recharge-package:create',3,2,2552,'','','',NULL,0,1,1,1,'','2023-12-29 02:32:54','','2023-12-29 02:32:54',0),(2555,'钱包充值套餐更新','pay:wallet-recharge-package:update',3,3,2552,'','','',NULL,0,1,1,1,'','2023-12-29 02:32:54','','2023-12-29 02:32:54',0),(2556,'钱包充值套餐删除','pay:wallet-recharge-package:delete',3,4,2552,'','','',NULL,0,1,1,1,'','2023-12-29 02:32:54','','2023-12-29 02:32:54',0),(2557,'钱包余额','',2,1,2551,'wallet-balance','fa:leaf','pay/wallet/balance/index','WalletBalance',0,1,1,1,'','2023-12-29 02:32:54','','2023-12-29 02:32:54',0),(2558,'钱包余额查询','pay:wallet:query',3,1,2557,'','','',NULL,0,1,1,1,'','2023-12-29 02:32:54','','2023-12-29 02:32:54',0),(2559,'转账订单','',2,3,1117,'transfer','ep:credit-card','pay/transfer/index','PayTransfer',0,1,1,1,'','2023-12-29 02:32:54','','2023-12-29 02:32:54',0),(2560,'数据统计','',1,200,2397,'statistics','ep:data-line','','',0,1,1,1,'1','2024-01-26 22:50:35','1','2024-02-24 20:10:07',0),(2561,'排行榜','crm:statistics-rank:query',2,1,2560,'ranking','fa:area-chart','crm/statistics/rank/index','CrmStatisticsRank',0,1,1,1,'1','2024-01-26 22:52:09','1','2024-04-24 19:39:11',0),(2562,'客户导入','crm:customer:import',3,6,2391,'','','','',0,1,1,1,'1','2024-02-01 13:09:00','1','2024-02-01 13:09:05',0),(2563,'ERP 系统','',1,300,0,'/erp','fa-solid:store','','',0,1,1,1,'1','2024-02-04 15:37:25','1','2024-02-04 15:37:25',0),(2564,'产品管理','',1,40,2563,'product','fa:product-hunt','','',0,1,1,1,'1','2024-02-04 15:38:43','1','2024-02-04 15:38:43',0),(2565,'产品信息','',2,0,2564,'product','fa-solid:apple-alt','erp/product/product/index','ErpProduct',0,1,1,1,'','2024-02-04 07:52:15','1','2024-02-05 14:42:11',0),(2566,'产品查询','erp:product:query',3,1,2565,'','','','',0,1,1,1,'','2024-02-04 07:52:15','1','2024-02-04 17:21:57',0),(2567,'产品创建','erp:product:create',3,2,2565,'','','','',0,1,1,1,'','2024-02-04 07:52:15','1','2024-02-04 17:22:12',0),(2568,'产品更新','erp:product:update',3,3,2565,'','','','',0,1,1,1,'','2024-02-04 07:52:15','1','2024-02-04 17:22:16',0),(2569,'产品删除','erp:product:delete',3,4,2565,'','','','',0,1,1,1,'','2024-02-04 07:52:15','1','2024-02-04 17:22:22',0),(2570,'产品导出','erp:product:export',3,5,2565,'','','','',0,1,1,1,'','2024-02-04 07:52:15','1','2024-02-04 17:22:26',0),(2571,'产品分类','',2,1,2564,'product-category','fa:certificate','erp/product/category/index','ErpProductCategory',0,1,1,1,'','2024-02-04 09:21:04','1','2024-02-04 17:24:58',0),(2572,'分类查询','erp:product-category:query',3,1,2571,'','','',NULL,0,1,1,1,'','2024-02-04 09:21:04','','2024-02-04 09:21:04',0),(2573,'分类创建','erp:product-category:create',3,2,2571,'','','',NULL,0,1,1,1,'','2024-02-04 09:21:04','','2024-02-04 09:21:04',0),(2574,'分类更新','erp:product-category:update',3,3,2571,'','','',NULL,0,1,1,1,'','2024-02-04 09:21:04','','2024-02-04 09:21:04',0),(2575,'分类删除','erp:product-category:delete',3,4,2571,'','','',NULL,0,1,1,1,'','2024-02-04 09:21:04','','2024-02-04 09:21:04',0),(2576,'分类导出','erp:product-category:export',3,5,2571,'','','',NULL,0,1,1,1,'','2024-02-04 09:21:04','','2024-02-04 09:21:04',0),(2577,'产品单位','',2,2,2564,'unit','ep:opportunity','erp/product/unit/index','ErpProductUnit',0,1,1,1,'','2024-02-04 11:54:08','1','2024-02-04 19:54:37',0),(2578,'单位查询','erp:product-unit:query',3,1,2577,'','','',NULL,0,1,1,1,'','2024-02-04 11:54:08','','2024-02-04 11:54:08',0),(2579,'单位创建','erp:product-unit:create',3,2,2577,'','','',NULL,0,1,1,1,'','2024-02-04 11:54:08','','2024-02-04 11:54:08',0),(2580,'单位更新','erp:product-unit:update',3,3,2577,'','','',NULL,0,1,1,1,'','2024-02-04 11:54:08','','2024-02-04 11:54:08',0),(2581,'单位删除','erp:product-unit:delete',3,4,2577,'','','',NULL,0,1,1,1,'','2024-02-04 11:54:08','','2024-02-04 11:54:08',0),(2582,'单位导出','erp:product-unit:export',3,5,2577,'','','',NULL,0,1,1,1,'','2024-02-04 11:54:08','','2024-02-04 11:54:08',0),(2583,'库存管理','',1,30,2563,'stock','fa:window-restore','','',0,1,1,1,'1','2024-02-05 00:29:37','1','2024-02-05 00:29:37',0),(2584,'仓库信息','',2,0,2583,'warehouse','ep:house','erp/stock/warehouse/index','ErpWarehouse',0,1,1,1,'','2024-02-04 17:12:09','1','2024-02-05 01:12:53',0),(2585,'仓库查询','erp:warehouse:query',3,1,2584,'','','',NULL,0,1,1,1,'','2024-02-04 17:12:09','','2024-02-04 17:12:09',0),(2586,'仓库创建','erp:warehouse:create',3,2,2584,'','','',NULL,0,1,1,1,'','2024-02-04 17:12:09','','2024-02-04 17:12:09',0),(2587,'仓库更新','erp:warehouse:update',3,3,2584,'','','',NULL,0,1,1,1,'','2024-02-04 17:12:09','','2024-02-04 17:12:09',0),(2588,'仓库删除','erp:warehouse:delete',3,4,2584,'','','',NULL,0,1,1,1,'','2024-02-04 17:12:09','','2024-02-04 17:12:09',0),(2589,'仓库导出','erp:warehouse:export',3,5,2584,'','','',NULL,0,1,1,1,'','2024-02-04 17:12:09','','2024-02-04 17:12:09',0),(2590,'产品库存','',2,1,2583,'stock','ep:coffee','erp/stock/stock/index','ErpStock',0,1,1,1,'','2024-02-05 06:40:50','1','2024-02-05 14:42:44',0),(2591,'库存查询','erp:stock:query',3,1,2590,'','','',NULL,0,1,1,1,'','2024-02-05 06:40:50','','2024-02-05 06:40:50',0),(2592,'库存导出','erp:stock:export',3,5,2590,'','','',NULL,0,1,1,1,'','2024-02-05 06:40:50','','2024-02-05 06:40:50',0),(2593,'出入库明细','',2,2,2583,'record','fa-solid:blog','erp/stock/record/index','ErpStockRecord',0,1,1,1,'','2024-02-05 10:27:21','1','2024-02-06 17:26:11',0),(2594,'库存明细查询','erp:stock-record:query',3,1,2593,'','','',NULL,0,1,1,1,'','2024-02-05 10:27:21','','2024-02-05 10:27:21',0),(2595,'库存明细导出','erp:stock-record:export',3,5,2593,'','','',NULL,0,1,1,1,'','2024-02-05 10:27:21','','2024-02-05 10:27:21',0),(2596,'其它入库','',2,3,2583,'in','ep:zoom-in','erp/stock/in/index','ErpStockIn',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-07 19:06:51',0),(2597,'其它入库单查询','erp:stock-in:query',3,1,2596,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-05 16:08:56',0),(2598,'其它入库单创建','erp:stock-in:create',3,2,2596,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-05 16:08:56',0),(2599,'其它入库单更新','erp:stock-in:update',3,3,2596,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-05 16:08:56',0),(2600,'其它入库单删除','erp:stock-in:delete',3,4,2596,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-05 16:08:56',0),(2601,'其它入库单导出','erp:stock-in:export',3,5,2596,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-05 16:08:56',0),(2602,'采购管理','',1,10,2563,'purchase','fa:buysellads','','',0,1,1,1,'1','2024-02-06 16:01:01','1','2024-02-06 16:01:23',0),(2603,'供应商信息','',2,4,2602,'supplier','fa:superpowers','erp/purchase/supplier/index','ErpSupplier',0,1,1,1,'','2024-02-06 08:21:55','1','2024-02-06 16:22:25',0),(2604,'供应商查询','erp:supplier:query',3,1,2603,'','','',NULL,0,1,1,1,'','2024-02-06 08:21:55','','2024-02-06 08:21:55',0),(2605,'供应商创建','erp:supplier:create',3,2,2603,'','','',NULL,0,1,1,1,'','2024-02-06 08:21:55','','2024-02-06 08:21:55',0),(2606,'供应商更新','erp:supplier:update',3,3,2603,'','','',NULL,0,1,1,1,'','2024-02-06 08:21:55','','2024-02-06 08:21:55',0),(2607,'供应商删除','erp:supplier:delete',3,4,2603,'','','',NULL,0,1,1,1,'','2024-02-06 08:21:55','','2024-02-06 08:21:55',0),(2608,'供应商导出','erp:supplier:export',3,5,2603,'','','',NULL,0,1,1,1,'','2024-02-06 08:21:55','','2024-02-06 08:21:55',0),(2609,'其它入库单审批','erp:stock-in:update-status',3,6,2596,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-05 16:08:56',0),(2610,'其它出库','',2,4,2583,'out','ep:zoom-out','erp/stock/out/index','ErpStockOut',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-07 19:06:55',0),(2611,'其它出库单查询','erp:stock-out:query',3,1,2610,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 06:43:39',0),(2612,'其它出库单创建','erp:stock-out:create',3,2,2610,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 06:43:42',0),(2613,'其它出库单更新','erp:stock-out:update',3,3,2610,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 06:43:44',0),(2614,'其它出库单删除','erp:stock-out:delete',3,4,2610,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 06:43:56',0),(2615,'其它出库单导出','erp:stock-out:export',3,5,2610,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 06:43:57',0),(2616,'其它出库单审批','erp:stock-out:update-status',3,6,2610,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 06:43:58',0),(2617,'销售管理','',1,20,2563,'sale','fa:sellsy','','',0,1,1,1,'1','2024-02-07 15:12:32','1','2024-02-07 15:12:32',0),(2618,'客户信息','',2,4,2617,'customer','ep:avatar','erp/sale/customer/index','ErpCustomer',0,1,1,1,'','2024-02-07 07:21:45','1','2024-02-07 15:22:25',0),(2619,'客户查询','erp:customer:query',3,1,2618,'','','',NULL,0,1,1,1,'','2024-02-07 07:21:45','','2024-02-07 07:21:45',0),(2620,'客户创建','erp:customer:create',3,2,2618,'','','',NULL,0,1,1,1,'','2024-02-07 07:21:45','','2024-02-07 07:21:45',0),(2621,'客户更新','erp:customer:update',3,3,2618,'','','',NULL,0,1,1,1,'','2024-02-07 07:21:45','','2024-02-07 07:21:45',0),(2622,'客户删除','erp:customer:delete',3,4,2618,'','','',NULL,0,1,1,1,'','2024-02-07 07:21:45','','2024-02-07 07:21:45',0),(2623,'客户导出','erp:customer:export',3,5,2618,'','','',NULL,0,1,1,1,'','2024-02-07 07:21:45','','2024-02-07 07:21:45',0),(2624,'库存调拨','',2,5,2583,'move','ep:folder-remove','erp/stock/move/index','ErpStockMove',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-16 18:53:55',0),(2625,'库存调度单查询','erp:stock-move:query',3,1,2624,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:49',0),(2626,'库存调度单创建','erp:stock-move:create',3,2,2624,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:52',0),(2627,'库存调度单更新','erp:stock-move:update',3,3,2624,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:55',0),(2628,'库存调度单删除','erp:stock-move:delete',3,4,2624,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:57',0),(2629,'库存调度单导出','erp:stock-move:export',3,5,2624,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:59',0),(2630,'库存调度单审批','erp:stock-move:update-status',3,6,2624,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:13:03',0),(2631,'库存盘点','',2,6,2583,'check','ep:circle-check-filled','erp/stock/check/index','ErpStockCheck',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-08 08:31:09',0),(2632,'库存盘点单查询','erp:stock-check:query',3,1,2631,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:49',0),(2633,'库存盘点单创建','erp:stock-check:create',3,2,2631,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:52',0),(2634,'库存盘点单更新','erp:stock-check:update',3,3,2631,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:55',0),(2635,'库存盘点单删除','erp:stock-check:delete',3,4,2631,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:57',0),(2636,'库存盘点单导出','erp:stock-check:export',3,5,2631,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:59',0),(2637,'库存盘点单审批','erp:stock-check:update-status',3,6,2631,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:13:03',0),(2638,'销售订单','',2,1,2617,'order','fa:first-order','erp/sale/order/index','ErpSaleOrder',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-10 21:59:20',0),(2639,'销售订单查询','erp:sale-order:query',3,1,2638,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:49',0),(2640,'销售订单创建','erp:sale-order:create',3,2,2638,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:52',0),(2641,'销售订单更新','erp:sale-order:update',3,3,2638,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:55',0),(2642,'销售订单删除','erp:sale-order:delete',3,4,2638,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:57',0),(2643,'销售订单导出','erp:sale-order:export',3,5,2638,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:59',0),(2644,'销售订单审批','erp:sale-order:update-status',3,6,2638,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:13:03',0),(2645,'财务管理','',1,50,2563,'finance','ep:money','','',0,1,1,1,'1','2024-02-10 08:05:58','1','2024-02-10 08:06:07',0),(2646,'结算账户','',2,10,2645,'account','fa:universal-access','erp/finance/account/index','ErpAccount',0,1,1,1,'','2024-02-10 00:15:07','1','2024-02-14 08:24:31',0),(2647,'结算账户查询','erp:account:query',3,1,2646,'','','',NULL,0,1,1,1,'','2024-02-10 00:15:07','','2024-02-10 00:15:07',0),(2648,'结算账户创建','erp:account:create',3,2,2646,'','','',NULL,0,1,1,1,'','2024-02-10 00:15:07','','2024-02-10 00:15:07',0),(2649,'结算账户更新','erp:account:update',3,3,2646,'','','',NULL,0,1,1,1,'','2024-02-10 00:15:07','','2024-02-10 00:15:07',0),(2650,'结算账户删除','erp:account:delete',3,4,2646,'','','',NULL,0,1,1,1,'','2024-02-10 00:15:07','','2024-02-10 00:15:07',0),(2651,'结算账户导出','erp:account:export',3,5,2646,'','','',NULL,0,1,1,1,'','2024-02-10 00:15:07','','2024-02-10 00:15:07',0),(2652,'销售出库','',2,2,2617,'out','ep:sold-out','erp/sale/out/index','ErpSaleOut',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-10 22:02:07',0),(2653,'销售出库查询','erp:sale-out:query',3,1,2652,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:49',0),(2654,'销售出库创建','erp:sale-out:create',3,2,2652,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:52',0),(2655,'销售出库更新','erp:sale-out:update',3,3,2652,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:55',0),(2656,'销售出库删除','erp:sale-out:delete',3,4,2652,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:57',0),(2657,'销售出库导出','erp:sale-out:export',3,5,2652,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:59',0),(2658,'销售出库审批','erp:sale-out:update-status',3,6,2652,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:13:03',0),(2659,'销售退货','',2,3,2617,'return','fa-solid:bone','erp/sale/return/index','ErpSaleReturn',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-12 06:12:58',0),(2660,'销售退货查询','erp:sale-return:query',3,1,2659,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:49',0),(2661,'销售退货创建','erp:sale-return:create',3,2,2659,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:52',0),(2662,'销售退货更新','erp:sale-return:update',3,3,2659,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:55',0),(2663,'销售退货删除','erp:sale-return:delete',3,4,2659,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:57',0),(2664,'销售退货导出','erp:sale-return:export',3,5,2659,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:12:59',0),(2665,'销售退货审批','erp:sale-return:update-status',3,6,2659,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-07 11:13:03',0),(2666,'采购订单','',2,1,2602,'order','fa-solid:border-all','erp/purchase/order/index','ErpPurchaseOrder',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-12 08:51:49',0),(2667,'采购订单查询','erp:purchase-order:query',3,1,2666,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:17',0),(2668,'采购订单创建','erp:purchase-order:create',3,2,2666,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:44:54',0),(2669,'采购订单更新','erp:purchase-order:update',3,3,2666,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:44:58',0),(2670,'采购订单删除','erp:purchase-order:delete',3,4,2666,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:00',0),(2671,'采购订单导出','erp:purchase-order:export',3,5,2666,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:05',0),(2672,'采购订单审批','erp:purchase-order:update-status',3,6,2666,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:08',0),(2673,'采购入库','',2,2,2602,'in','fa-solid:gopuram','erp/purchase/in/index','ErpPurchaseIn',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-12 11:19:27',0),(2674,'采购入库查询','erp:purchase-in:query',3,1,2673,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:17',0),(2675,'采购入库创建','erp:purchase-in:create',3,2,2673,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:44:54',0),(2676,'采购入库更新','erp:purchase-in:update',3,3,2673,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:44:58',0),(2677,'采购入库删除','erp:purchase-in:delete',3,4,2673,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:00',0),(2678,'采购入库导出','erp:purchase-in:export',3,5,2673,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:05',0),(2679,'采购入库审批','erp:purchase-in:update-status',3,6,2673,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:08',0),(2680,'采购退货','',2,3,2602,'return','ep:minus','erp/purchase/return/index','ErpPurchaseReturn',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-12 20:51:02',0),(2681,'采购退货查询','erp:purchase-return:query',3,1,2680,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:17',0),(2682,'采购退货创建','erp:purchase-return:create',3,2,2680,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:44:54',0),(2683,'采购退货更新','erp:purchase-return:update',3,3,2680,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:44:58',0),(2684,'采购退货删除','erp:purchase-return:delete',3,4,2680,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:00',0),(2685,'采购退货导出','erp:purchase-return:export',3,5,2680,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:05',0),(2686,'采购退货审批','erp:purchase-return:update-status',3,6,2680,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:08',0),(2687,'付款单','',2,1,2645,'payment','ep:caret-right','erp/finance/payment/index','ErpFinancePayment',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-14 08:24:23',0),(2688,'付款单查询','erp:finance-payment:query',3,1,2687,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:17',0),(2689,'付款单创建','erp:finance-payment:create',3,2,2687,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:44:54',0),(2690,'付款单更新','erp:finance-payment:update',3,3,2687,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:44:58',0),(2691,'付款单删除','erp:finance-payment:delete',3,4,2687,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:00',0),(2692,'付款单导出','erp:finance-payment:export',3,5,2687,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:05',0),(2693,'付款单审批','erp:finance-payment:update-status',3,6,2687,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:08',0),(2694,'收款单','',2,2,2645,'receipt','ep:expand','erp/finance/receipt/index','ErpFinanceReceipt',0,1,1,1,'','2024-02-05 16:08:56','1','2024-02-15 19:35:45',0),(2695,'收款单查询','erp:finance-receipt:query',3,1,2694,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:17',0),(2696,'收款单创建','erp:finance-receipt:create',3,2,2694,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:44:54',0),(2697,'收款单更新','erp:finance-receipt:update',3,3,2694,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:44:58',0),(2698,'收款单删除','erp:finance-receipt:delete',3,4,2694,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:00',0),(2699,'收款单导出','erp:finance-receipt:export',3,5,2694,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:05',0),(2700,'收款单审批','erp:finance-receipt:update-status',3,6,2694,'','','',NULL,0,1,1,1,'','2024-02-05 16:08:56','','2024-02-12 00:45:08',0),(2701,'待办事项','',2,0,2397,'backlog','fa-solid:tasks','crm/backlog/index','CrmBacklog',0,1,1,1,'1','2024-02-17 17:17:11','1','2024-02-17 17:17:11',0),(2702,'ERP 首页','erp:statistics:query',2,0,2563,'home','ep:home-filled','erp/home/index.vue','ErpHome',0,1,1,1,'1','2024-02-18 16:49:40','1','2024-02-26 21:12:18',0),(2703,'商机状态配置','',2,4,2524,'business-status','fa-solid:charging-station','crm/business/status/index','CrmBusinessStatus',0,1,1,1,'1','2024-02-21 20:15:17','1','2024-02-21 20:15:17',0),(2704,'商机状态查询','crm:business-status:query',3,1,2703,'','','','',0,1,1,1,'1','2024-02-21 20:35:36','1','2024-02-21 20:36:06',0),(2705,'商机状态创建','crm:business-status:create',3,2,2703,'','','','',0,1,1,1,'1','2024-02-21 20:35:57','1','2024-02-21 20:35:57',0),(2706,'商机状态更新','crm:business-status:update',3,3,2703,'','','','',0,1,1,1,'1','2024-02-21 20:36:21','1','2024-02-21 20:36:21',0),(2707,'商机状态删除','crm:business-status:delete',3,4,2703,'','','','',0,1,1,1,'1','2024-02-21 20:36:36','1','2024-02-21 20:36:36',0),(2708,'合同配置','',2,5,2524,'contract-config','ep:connection','crm/contract/config/index','CrmContractConfig',0,1,1,1,'1','2024-02-24 16:44:40','1','2024-02-24 16:44:48',0),(2709,'客户公海配置查询','crm:customer-pool-config:query',3,2,2516,'','','','',0,1,1,1,'1','2024-02-24 16:45:19','1','2024-02-24 16:45:28',0),(2710,'合同配置更新','crm:contract-config:update',3,1,2708,'','','','',0,1,1,1,'1','2024-02-24 16:45:56','1','2024-02-24 16:45:56',0),(2711,'合同配置查询','crm:contract-config:query',3,2,2708,'','','','',0,1,1,1,'1','2024-02-24 16:46:16','1','2024-02-24 16:46:16',0),(2712,'客户分析','crm:statistics-customer:query',2,0,2560,'customer','ep:avatar','crm/statistics/customer/index.vue','CrmStatisticsCustomer',0,1,1,1,'1','2024-03-09 16:43:56','1','2024-05-04 20:38:50',0),(2713,'抄送我的','bpm:process-instance-cc:query',2,30,1200,'copy','ep:copy-document','bpm/task/copy/index','BpmProcessInstanceCopy',0,1,1,1,'1','2024-03-17 21:50:23','1','2024-04-24 19:55:12',0),(2714,'流程分类','',2,3,1186,'category','fa:object-ungroup','bpm/category/index','BpmCategory',0,1,1,1,'','2024-03-08 02:00:51','1','2024-03-21 23:51:18',0),(2715,'分类查询','bpm:category:query',3,1,2714,'','','','',0,1,1,1,'','2024-03-08 02:00:51','1','2024-03-19 14:36:25',0),(2716,'分类创建','bpm:category:create',3,2,2714,'','','','',0,1,1,1,'','2024-03-08 02:00:51','1','2024-03-19 14:36:31',0),(2717,'分类更新','bpm:category:update',3,3,2714,'','','','',0,1,1,1,'','2024-03-08 02:00:51','1','2024-03-19 14:36:35',0),(2718,'分类删除','bpm:category:delete',3,4,2714,'','','','',0,1,1,1,'','2024-03-08 02:00:51','1','2024-03-19 14:36:41',0),(2720,'发起流程','',2,0,1200,'create','fa-solid:grin-stars','bpm/processInstance/create/index','BpmProcessInstanceCreate',0,1,0,1,'1','2024-03-19 19:46:05','1','2024-03-23 19:03:42',0),(2721,'流程实例','',2,10,1186,'process-instance/manager','fa:square','bpm/processInstance/manager/index','BpmProcessInstanceManager',0,1,1,1,'1','2024-03-21 23:57:30','1','2024-03-21 23:57:30',0),(2722,'流程实例的查询（管理员）','bpm:process-instance:manager-query',3,1,2721,'','','','',0,1,1,1,'1','2024-03-22 08:18:27','1','2024-03-22 08:19:05',0),(2723,'流程实例的取消（管理员）','bpm:process-instance:cancel-by-admin',3,2,2721,'','','','',0,1,1,1,'1','2024-03-22 08:19:25','1','2024-03-22 08:19:25',0),(2724,'流程任务','',2,11,1186,'process-tasnk','ep:collection-tag','bpm/task/manager/index','BpmManagerTask',0,1,1,1,'1','2024-03-22 08:43:22','1','2024-03-22 08:43:27',0),(2725,'流程任务的查询（管理员）','bpm:task:mananger-query',3,1,2724,'','','','',0,1,1,1,'1','2024-03-22 08:43:49','1','2024-03-22 08:43:49',0),(2726,'流程监听器','',2,5,1186,'process-listener','fa:assistive-listening-systems','bpm/processListener/index','BpmProcessListener',0,1,1,1,'','2024-03-09 16:05:34','1','2024-03-23 13:13:38',0),(2727,'流程监听器查询','bpm:process-listener:query',3,1,2726,'','','',NULL,0,1,1,1,'','2024-03-09 16:05:34','','2024-03-09 16:05:34',0),(2728,'流程监听器创建','bpm:process-listener:create',3,2,2726,'','','',NULL,0,1,1,1,'','2024-03-09 16:05:34','','2024-03-09 16:05:34',0),(2729,'流程监听器更新','bpm:process-listener:update',3,3,2726,'','','',NULL,0,1,1,1,'','2024-03-09 16:05:34','','2024-03-09 16:05:34',0),(2730,'流程监听器删除','bpm:process-listener:delete',3,4,2726,'','','',NULL,0,1,1,1,'','2024-03-09 16:05:34','','2024-03-09 16:05:34',0),(2731,'流程表达式','',2,6,1186,'process-expression','fa:wpexplorer','bpm/processExpression/index','BpmProcessExpression',0,1,1,1,'','2024-03-09 22:35:08','1','2024-03-23 19:43:05',0),(2732,'流程表达式查询','bpm:process-expression:query',3,1,2731,'','','',NULL,0,1,1,1,'','2024-03-09 22:35:08','','2024-03-09 22:35:08',0),(2733,'流程表达式创建','bpm:process-expression:create',3,2,2731,'','','',NULL,0,1,1,1,'','2024-03-09 22:35:08','','2024-03-09 22:35:08',0),(2734,'流程表达式更新','bpm:process-expression:update',3,3,2731,'','','',NULL,0,1,1,1,'','2024-03-09 22:35:08','','2024-03-09 22:35:08',0),(2735,'流程表达式删除','bpm:process-expression:delete',3,4,2731,'','','',NULL,0,1,1,1,'','2024-03-09 22:35:08','','2024-03-09 22:35:08',0),(2736,'员工业绩','crm:statistics-performance:query',2,3,2560,'performance','ep:dish-dot','crm/statistics/performance/index','CrmStatisticsPerformance',0,1,1,1,'1','2024-04-05 13:49:20','1','2024-04-24 19:42:43',0),(2737,'客户画像','crm:statistics-portrait:query',2,4,2560,'portrait','ep:picture','crm/statistics/portrait/index','CrmStatisticsPortrait',0,1,1,1,'1','2024-04-05 13:57:40','1','2024-04-24 19:42:24',0),(2738,'销售漏斗','crm:statistics-funnel:query',2,5,2560,'funnel','ep:grape','crm/statistics/funnel/index','CrmStatisticsFunnel',0,1,1,1,'1','2024-04-13 10:53:26','1','2024-04-24 19:39:33',0),(2739,'消息中心','',1,7,1,'messages','ep:chat-dot-round','','',0,1,1,1,'1','2024-04-22 23:54:30','1','2024-04-23 09:36:35',0),(2740,'监控中心','',1,10,2,'monitors','ep:monitor','','',0,1,1,1,'1','2024-04-23 00:04:44','1','2024-04-23 00:04:44',0),(2741,'领取公海客户','crm:customer:receive',3,1,2546,'','','','',0,1,1,1,'1','2024-04-24 19:47:45','1','2024-04-24 19:47:45',0),(2742,'分配公海客户','crm:customer:distribute',3,2,2546,'','','','',0,1,1,1,'1','2024-04-24 19:48:05','1','2024-04-24 19:48:05',0),(2743,'商品统计查询','statistics:product:query',3,1,2545,'','','','',0,1,1,1,'1','2024-04-24 19:50:05','1','2024-04-24 19:50:05',0),(2744,'商品统计导出','statistics:product:export',3,2,2545,'','','','',0,1,1,1,'1','2024-04-24 19:50:26','1','2024-04-24 19:50:26',0),(2745,'支付渠道查询','pay:channel:query',3,10,1126,'','','','',0,1,1,1,'1','2024-04-24 19:53:01','1','2024-04-24 19:53:01',0),(2746,'支付渠道创建','pay:channel:create',3,11,1126,'','','','',0,1,1,1,'1','2024-04-24 19:53:18','1','2024-04-24 19:53:18',0),(2747,'支付渠道更新','pay:channel:update',3,12,1126,'','','','',0,1,1,1,'1','2024-04-24 19:53:32','1','2024-04-24 19:53:58',0),(2748,'支付渠道删除','pay:channel:delete',3,13,1126,'','','','',0,1,1,1,'1','2024-04-24 19:54:34','1','2024-04-24 19:54:34',0),(2749,'商品收藏查询','product:favorite:query',3,10,2014,'','','','',0,1,1,1,'1','2024-04-24 19:55:47','1','2024-04-24 19:55:47',0),(2750,'商品浏览查询','product:browse-history:query',3,20,2014,'','','','',0,1,1,1,'1','2024-04-24 19:57:43','1','2024-04-24 19:57:43',0),(2751,'售后同意','trade:after-sale:agree',3,2,2073,'','','','',0,1,1,1,'1','2024-04-24 19:58:40','1','2024-04-24 19:58:40',0),(2752,'售后不同意','trade:after-sale:disagree',3,3,2073,'','','','',0,1,1,1,'1','2024-04-24 19:59:03','1','2024-04-24 19:59:03',0),(2753,'售后确认退货','trade:after-sale:receive',3,4,2073,'','','','',0,1,1,1,'1','2024-04-24 20:00:07','1','2024-04-24 20:00:07',0),(2754,'售后确认退款','trade:after-sale:refund',3,5,2073,'','','','',0,1,1,1,'1','2024-04-24 20:00:24','1','2024-04-24 20:00:24',0),(2755,'删除项目','report:go-view-project:delete',3,2,2153,'','','','',0,1,1,1,'1','2024-04-24 20:01:37','1','2024-04-24 20:01:37',0),(2756,'会员等级记录查询','member:level-record:query',3,10,2325,'','','','',0,1,1,1,'1','2024-04-24 20:02:32','1','2024-04-24 20:02:32',0),(2757,'会员经验记录查询','member:experience-record:query',3,11,2325,'','','','',0,1,1,1,'1','2024-04-24 20:02:51','1','2024-04-24 20:02:51',0),(2758,'AI 大模型','',1,400,0,'/ai','fa:apple','','',0,1,1,1,'1','2024-05-07 15:07:56','1','2024-05-25 12:36:12',0),(2759,'AI 对话','',2,1,2758,'chat','ep:message','ai/chat/index/index.vue','AiChat',0,1,1,1,'1','2024-05-07 15:09:14','1','2024-07-07 17:15:36',0),(2760,'控制台','',1,100,2758,'console','ep:setting','','',0,1,1,1,'1','2024-05-09 22:39:09','1','2024-05-24 23:34:21',0),(2761,'API 密钥','',2,0,2760,'api-key','ep:key','ai/model/apiKey/index.vue','AiApiKey',0,1,1,1,'','2024-05-09 14:52:56','1','2024-05-10 22:44:08',0),(2762,'API 密钥查询','ai:api-key:query',3,1,2761,'','','','',0,1,1,1,'','2024-05-09 14:52:56','1','2024-05-13 20:36:32',0),(2763,'API 密钥创建','ai:api-key:create',3,2,2761,'','','','',0,1,1,1,'','2024-05-09 14:52:56','1','2024-05-13 20:36:26',0),(2764,'API 密钥更新','ai:api-key:update',3,3,2761,'','','','',0,1,1,1,'','2024-05-09 14:52:56','1','2024-05-13 20:36:42',0),(2765,'API 密钥删除','ai:api-key:delete',3,4,2761,'','','','',0,1,1,1,'','2024-05-09 14:52:56','1','2024-05-13 20:36:48',0),(2767,'聊天模型','',2,0,2760,'chat-model','fa-solid:abacus','ai/model/chatModel/index.vue','AiChatModel',0,1,1,1,'','2024-05-10 14:42:48','1','2024-05-10 22:44:16',0),(2768,'聊天模型查询','ai:chat-model:query',3,1,2767,'','','','',0,1,1,1,'','2024-05-10 14:42:48','1','2024-05-13 20:37:02',0),(2769,'聊天模型创建','ai:chat-model:create',3,2,2767,'','','','',0,1,1,1,'','2024-05-10 14:42:48','1','2024-05-13 20:37:12',0),(2770,'聊天模型更新','ai:chat-model:update',3,3,2767,'','','','',0,1,1,1,'','2024-05-10 14:42:48','1','2024-05-13 20:37:18',0),(2771,'聊天模型删除','ai:chat-model:delete',3,4,2767,'','','','',0,1,1,1,'','2024-05-10 14:42:48','1','2024-05-13 20:37:23',0),(2773,'聊天角色','',2,0,2760,'chat-role','fa:user-secret','ai/model/chatRole/index.vue','AiChatRole',0,1,1,1,'','2024-05-13 12:39:28','1','2024-05-13 20:41:45',0),(2774,'聊天角色查询','ai:chat-role:query',3,1,2773,'','','',NULL,0,1,1,1,'','2024-05-13 12:39:28','','2024-05-13 12:39:28',0),(2775,'聊天角色创建','ai:chat-role:create',3,2,2773,'','','',NULL,0,1,1,1,'','2024-05-13 12:39:28','','2024-05-13 12:39:28',0),(2776,'聊天角色更新','ai:chat-role:update',3,3,2773,'','','',NULL,0,1,1,1,'','2024-05-13 12:39:28','','2024-05-13 12:39:28',0),(2777,'聊天角色删除','ai:chat-role:delete',3,4,2773,'','','','',0,1,1,1,'1','2024-05-13 21:43:38','1','2024-05-13 21:43:38',0),(2778,'聊天管理','',2,10,2760,'chat-conversation','ep:chat-square','ai/chat/manager/index.vue','AiChatManager',0,1,1,1,'','2024-05-24 15:39:18','1','2024-06-26 21:36:56',0),(2779,'会话查询','ai:chat-conversation:query',3,1,2778,'','','','',0,1,1,1,'','2024-05-24 15:39:18','1','2024-05-25 08:38:30',0),(2780,'会话删除','ai:chat-conversation:delete',3,2,2778,'','','','',0,1,1,1,'','2024-05-24 15:39:18','1','2024-05-25 08:38:40',0),(2781,'消息查询','ai:chat-message:query',3,11,2778,'','','','',0,1,1,1,'1','2024-05-25 08:38:56','1','2024-05-25 08:38:56',0),(2782,'消息删除','ai:chat-message:delete',3,12,2778,'','','','',0,1,1,1,'1','2024-05-25 08:39:10','1','2024-05-25 08:39:10',0),(2783,'AI 绘画','',2,2,2758,'image','ep:picture-rounded','ai/image/index/index.vue','AiImage',0,1,1,1,'1','2024-05-26 11:45:17','1','2024-07-07 17:18:59',0),(2784,'绘画管理','',2,11,2760,'image','fa:file-image-o','ai/image/manager/index.vue','AiImageManager',0,1,1,1,'','2024-06-26 13:32:31','1','2024-06-26 21:37:13',0),(2785,'绘画查询','ai:image:query',3,1,2784,'','','','',0,1,1,1,'','2024-06-26 13:32:31','1','2024-06-26 22:21:57',0),(2786,'绘画删除','ai:image:delete',3,4,2784,'','','','',0,1,1,1,'','2024-06-26 13:32:31','1','2024-06-26 22:22:08',0),(2787,'绘图更新','ai:image:update',3,2,2784,'','','','',0,1,1,1,'1','2024-06-26 22:47:56','1','2024-08-31 09:21:35',0),(2788,'音乐管理','',2,12,2760,'music','fa:music','ai/music/manager/index.vue','AiMusicManager',0,1,1,1,'','2024-06-27 15:03:33','1','2024-06-27 23:04:19',0),(2789,'音乐查询','ai:music:query',3,1,2788,'','','',NULL,0,1,1,1,'','2024-06-27 15:03:33','','2024-06-27 15:03:33',0),(2790,'音乐更新','ai:music:update',3,3,2788,'','','',NULL,0,1,1,1,'','2024-06-27 15:03:33','','2024-06-27 15:03:33',0),(2791,'音乐删除','ai:music:delete',3,4,2788,'','','',NULL,0,1,1,1,'','2024-06-27 15:03:33','','2024-06-27 15:03:33',0),(2792,'AI 写作','',2,3,2758,'write','fa-solid:book-reader','ai/write/index/index.vue','AiWrite',0,1,1,1,'1','2024-07-08 09:26:44','1','2024-07-16 13:03:06',0),(2793,'写作管理','',2,13,2760,'write','fa:bookmark-o','ai/write/manager/index.vue','AiWriteManager',0,1,1,1,'','2024-07-10 13:24:34','1','2024-07-10 21:31:59',0),(2794,'AI 写作查询','ai:write:query',3,1,2793,'','','',NULL,0,1,1,1,'','2024-07-10 13:24:34','','2024-07-10 13:24:34',0),(2795,'AI 写作删除','ai:write:delete',3,4,2793,'','','',NULL,0,1,1,1,'','2024-07-10 13:24:34','','2024-07-10 13:24:34',0),(2796,'AI 音乐','',2,4,2758,'music','fa:music','ai/music/index/index.vue','AiMusic',0,1,1,1,'1','2024-07-17 09:21:12','1','2024-07-29 21:11:52',0),(2797,'客服中心','',2,100,2362,'kefu','fa-solid:user-alt','mall/promotion/kefu/index','KeFu',0,1,1,1,'1','2024-07-17 23:49:05','1','2024-07-17 23:49:16',0),(2798,'AI 思维导图','',2,5,2758,'mind-map','fa:sitemap','ai/mindmap/index/index.vue','AiMindMap',0,1,1,1,'1','2024-07-29 21:31:59','1','2024-07-29 21:33:20',0),(2799,'导图管理','',2,14,2760,'mind-map','fa:map','ai/mindmap/manager/index','AiMindMapManager',0,1,1,1,'','2024-08-10 09:15:09','1','2024-08-10 17:24:28',0),(2800,'思维导图查询','ai:mind-map:query',3,1,2799,'','','',NULL,0,1,1,1,'','2024-08-10 09:15:09','','2024-08-10 09:15:09',0),(2801,'思维导图删除','ai:mind-map:delete',3,4,2799,'','','',NULL,0,1,1,1,'','2024-08-10 09:15:09','','2024-08-10 09:15:09',0),(2802,'会话查询','promotion:kefu-conversation:query',3,1,2797,'','','','',0,1,1,1,'1','2024-08-31 09:17:52','1','2024-08-31 09:18:52',0),(2803,'会话更新','promotion:kefu-conversation:update',3,2,2797,'','','','',0,1,1,1,'1','2024-08-31 09:18:15','1','2024-08-31 09:19:29',0),(2804,'消息查询','promotion:kefu-message:query',3,10,2797,'','','','',0,1,1,1,'1','2024-08-31 09:18:42','1','2024-08-31 09:18:42',0),(2805,'会话删除','promotion:kefu-conversation:delete',3,3,2797,'','','','',0,1,1,1,'1','2024-08-31 09:19:51','1','2024-08-31 09:20:32',0),(2806,'消息发送','promotion:kefu-message:send',3,12,2797,'','','','',0,1,1,1,'1','2024-08-31 09:20:06','1','2024-08-31 09:20:06',0),(2807,'消息更新','promotion:kefu-message:update',3,11,2797,'','','','',0,1,1,1,'1','2024-08-31 09:20:22','1','2024-08-31 09:20:22',0),(2808,'积分商城','',2,5,2030,'point-activity','ep:bowl','mall/promotion/point/activity/index','PointActivity',0,1,1,1,'','2024-09-21 05:36:42','1','2024-09-23 09:14:43',0),(2809,'积分商城活动查询','promotion:point-activity:query',3,1,2808,'','','','',0,1,1,1,'','2024-09-21 05:36:42','1','2024-09-22 14:49:05',0),(2810,'积分商城活动创建','promotion:point-activity:create',3,2,2808,'','','','',0,1,1,1,'','2024-09-21 05:36:42','1','2024-09-22 14:49:08',0),(2811,'积分商城活动更新','promotion:point-activity:update',3,3,2808,'','','','',0,1,1,1,'','2024-09-21 05:36:42','1','2024-09-22 14:49:10',0),(2812,'积分商城活动删除','promotion:point-activity:delete',3,4,2808,'','','','',0,1,1,1,'','2024-09-21 05:36:42','1','2024-09-22 14:49:12',0),(2813,'积分商城活动导出','promotion:point-activity:export',3,5,2808,'','','','',0,1,1,1,'','2024-09-21 05:36:42','1','2024-09-22 14:49:27',0),(2892,'IOT 物联网','',1,500,0,'/iot','fa-solid:hdd','','',0,1,1,1,'1','2024-08-10 09:55:29','1','2024-08-10 09:55:29',0),(2893,'设备接入','',1,1,2892,'device','ep:platform','','',0,1,1,1,'1','2024-08-10 09:57:56','1','2024-10-20 18:57:43',0),(2894,'产品管理','',2,0,2893,'product','','iot/product/index','IoTProduct',0,1,1,1,'','2024-08-10 02:38:02','1','2024-09-16 19:50:42',0),(2895,'产品查询','iot:product:query',3,1,2894,'','','',NULL,0,1,1,1,'','2024-08-10 02:38:02','','2024-08-10 02:38:02',0),(2896,'产品创建','iot:product:create',3,2,2894,'','','',NULL,0,1,1,1,'','2024-08-10 02:38:02','','2024-08-10 02:38:02',0),(2897,'产品更新','iot:product:update',3,3,2894,'','','',NULL,0,1,1,1,'','2024-08-10 02:38:02','','2024-08-10 02:38:02',0),(2898,'产品删除','iot:product:delete',3,4,2894,'','','',NULL,0,1,1,1,'','2024-08-10 02:38:02','','2024-08-10 02:38:02',0),(2899,'产品导出','iot:product:export',3,5,2894,'','','',NULL,0,1,1,1,'','2024-08-10 02:38:02','','2024-08-10 02:38:02',0),(2900,'设备管理','',2,0,2893,'device','','iot/device/index','IoTDevice',0,1,1,1,'','2024-09-16 18:48:19','1','2024-09-16 19:50:53',0),(2901,'设备查询','iot:device:query',3,1,2900,'','','','',0,1,1,1,'','2024-09-16 18:48:19','1','2024-09-16 19:37:00',0),(2902,'设备创建','iot:device:create',3,2,2900,'','','','',0,1,1,1,'','2024-09-16 18:48:19','1','2024-09-16 19:37:09',0),(2903,'设备更新','iot:device:update',3,3,2900,'','','','',0,1,1,1,'','2024-09-16 18:48:19','1','2024-09-16 19:37:18',0),(2904,'设备删除','iot:device:delete',3,4,2900,'','','','',0,1,1,1,'','2024-09-16 18:48:19','1','2024-09-16 19:37:42',0),(2905,'设备导出','iot:device:export',3,5,2900,'','','','',0,1,1,1,'','2024-09-16 18:48:19','1','2024-09-16 19:37:49',0),(2906,'IoT 产品物模型管理','',1,0,2893,'think-model-function','','','',0,0,1,1,'','2024-09-25 22:12:09','1','2024-09-29 20:52:12',0),(2907,'IoT 产品物模型查询','iot:think-model-function:query',3,1,2906,'','','',NULL,0,1,1,1,'','2024-09-25 22:12:09','','2024-09-25 22:12:09',0),(2908,'IoT 产品物模型创建','iot:think-model-function:create',3,2,2906,'','','',NULL,0,1,1,1,'','2024-09-25 22:12:09','','2024-09-25 22:12:09',0),(2909,'IoT 产品物模型更新','iot:think-model-function:update',3,3,2906,'','','',NULL,0,1,1,1,'','2024-09-25 22:12:09','','2024-09-25 22:12:09',0),(2910,'IoT 产品物模型删除','iot:think-model-function:delete',3,4,2906,'','','',NULL,0,1,1,1,'','2024-09-25 22:12:09','','2024-09-25 22:12:09',0),(2911,'IoT 产品物模型导出','iot:think-model-function:export',3,5,2906,'','','',NULL,0,1,1,1,'','2024-09-25 22:12:09','','2024-09-25 22:12:09',0),(2912,'创建推广员','trade:brokerage-user:create',3,7,2346,'','','','',0,1,1,1,'1','2024-12-01 14:32:39','1','2024-12-01 14:32:39',0),(2913,'人工智能1','',1,60,2758,'aaii1','ep:avatar','','',1,1,1,1,'100','2025-04-05 06:00:27','100','2025-04-06 09:40:37',0);
/*!40000 ALTER TABLE `system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notice`
--

DROP TABLE IF EXISTS `system_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告内容',
  `type` tinyint NOT NULL COMMENT '公告类型（1通知 2公告）',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notice`
--

LOCK TABLES `system_notice` WRITE;
/*!40000 ALTER TABLE `system_notice` DISABLE KEYS */;
INSERT INTO `system_notice` VALUES (1,'芋道的公众','<p>新版本内容133</p>',1,0,'admin','2021-01-05 17:03:48','1','2022-05-04 21:00:20',0,1),(2,'维护通知：2018-07-01 系统凌晨维护','<p><img src=\"http://test.yudao.iocoder.cn/b7cb3cf49b4b3258bf7309a09dd2f4e5.jpg\" alt=\"\" data-href=\"\" style=\"\"/>11112222<img src=\"http://test.yudao.iocoder.cn/fe44fc7bdb82ca421184b2eebbaee9e2148d4a1827479a4eb4521e11d2a062ba.png\" alt=\"image\" data-href=\"http://test.yudao.iocoder.cn/fe44fc7bdb82ca421184b2eebbaee9e2148d4a1827479a4eb4521e11d2a062ba.png\" style=\"\"/></p>',2,1,'admin','2021-01-05 17:03:48','1','2024-09-24 20:48:09',0,1),(4,'我是测试标题','<p>哈哈哈哈123</p>',1,0,'110','2022-02-22 01:01:25','110','2022-02-22 01:01:46',0,121);
/*!40000 ALTER TABLE `system_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notify_message`
--

DROP TABLE IF EXISTS `system_notify_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notify_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `template_id` bigint NOT NULL COMMENT '模版编号',
  `template_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `template_nickname` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版发送人名称',
  `template_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版内容',
  `template_type` int NOT NULL COMMENT '模版类型',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版参数',
  `read_status` bit(1) NOT NULL COMMENT '是否已读',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='站内信消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notify_message`
--

LOCK TABLES `system_notify_message` WRITE;
/*!40000 ALTER TABLE `system_notify_message` DISABLE KEYS */;
INSERT INTO `system_notify_message` VALUES (2,1,2,1,'test','123','我是 1，我开始 2 了',1,'{\"name\":\"1\",\"what\":\"2\"}',_binary '','2023-02-10 00:47:04','1','2023-01-28 11:44:08','1','2023-02-10 00:47:04',0,1),(3,1,2,1,'test','123','我是 1，我开始 2 了',1,'{\"name\":\"1\",\"what\":\"2\"}',_binary '','2023-02-10 00:47:04','1','2023-01-28 11:45:04','1','2023-02-10 00:47:04',0,1),(4,103,2,2,'register','系统消息','你好，欢迎 哈哈 加入大家庭！',2,'{\"name\":\"哈哈\"}',_binary '\0',NULL,'1','2023-01-28 21:02:20','1','2023-01-28 21:02:20',0,1),(5,1,2,1,'test','123','我是 芋艿，我开始 写代码 了',1,'{\"name\":\"芋艿\",\"what\":\"写代码\"}',_binary '','2023-02-10 00:47:04','1','2023-01-28 22:21:42','1','2023-02-10 00:47:04',0,1),(6,1,2,1,'test','123','我是 芋艿，我开始 写代码 了',1,'{\"name\":\"芋艿\",\"what\":\"写代码\"}',_binary '','2023-01-29 10:52:06','1','2023-01-28 22:22:07','1','2023-01-29 10:52:06',0,1),(7,1,2,1,'test','123','我是 2，我开始 3 了',1,'{\"name\":\"2\",\"what\":\"3\"}',_binary '','2023-01-29 10:52:06','1','2023-01-28 23:45:21','1','2023-01-29 10:52:06',0,1),(8,1,2,2,'register','系统消息','你好，欢迎 123 加入大家庭！',2,'{\"name\":\"123\"}',_binary '','2023-01-29 10:52:06','1','2023-01-28 23:50:21','1','2023-01-29 10:52:06',0,1),(9,247,1,4,'brokerage_withdraw_audit_approve','system','您在2023-09-28 08:35:46提现￥0.09元的申请已通过审核',2,'{\"reason\":null,\"createTime\":\"2023-09-28 08:35:46\",\"price\":\"0.09\"}',_binary '\0',NULL,'1','2023-09-28 16:36:22','1','2023-09-28 16:36:22',0,1),(10,247,1,4,'brokerage_withdraw_audit_approve','system','您在2023-09-30 20:59:40提现￥1.00元的申请已通过审核',2,'{\"reason\":null,\"createTime\":\"2023-09-30 20:59:40\",\"price\":\"1.00\"}',_binary '\0',NULL,'1','2023-10-03 12:11:34','1','2023-10-03 12:11:34',0,1);
/*!40000 ALTER TABLE `system_notify_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notify_template`
--

DROP TABLE IF EXISTS `system_notify_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notify_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版编码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送人名称',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版内容',
  `type` tinyint NOT NULL COMMENT '类型',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参数数组',
  `status` tinyint NOT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='站内信模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notify_template`
--

LOCK TABLES `system_notify_template` WRITE;
/*!40000 ALTER TABLE `system_notify_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_notify_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_oauth2_access_token`
--

DROP TABLE IF EXISTS `system_oauth2_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_access_token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `user_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户信息',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '访问令牌',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '刷新令牌',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '授权范围',
  `expires_time` datetime NOT NULL COMMENT '过期时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_access_token` (`access_token`) USING BTREE,
  KEY `idx_refresh_token` (`refresh_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12055 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 访问令牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_oauth2_access_token`
--

LOCK TABLES `system_oauth2_access_token` WRITE;
/*!40000 ALTER TABLE `system_oauth2_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_oauth2_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_oauth2_approve`
--

DROP TABLE IF EXISTS `system_oauth2_approve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_approve` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权范围',
  `approved` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否接受',
  `expires_time` datetime NOT NULL COMMENT '过期时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 批准表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_oauth2_approve`
--

LOCK TABLES `system_oauth2_approve` WRITE;
/*!40000 ALTER TABLE `system_oauth2_approve` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_oauth2_approve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_oauth2_client`
--

DROP TABLE IF EXISTS `system_oauth2_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_client` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端密钥',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应用描述',
  `status` tinyint NOT NULL COMMENT '状态',
  `access_token_validity_seconds` int NOT NULL COMMENT '访问令牌的有效期',
  `refresh_token_validity_seconds` int NOT NULL COMMENT '刷新令牌的有效期',
  `redirect_uris` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '可重定向的 URI 地址',
  `authorized_grant_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '授权类型',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '授权范围',
  `auto_approve_scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自动通过的授权范围',
  `authorities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限',
  `resource_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源',
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '附加信息',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 客户端表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_oauth2_client`
--

LOCK TABLES `system_oauth2_client` WRITE;
/*!40000 ALTER TABLE `system_oauth2_client` DISABLE KEYS */;
INSERT INTO `system_oauth2_client` VALUES (1,'default','admin123','芋道源码','http://test.yudao.iocoder.cn/a5e2e244368878a366b516805a4aabf1.png','我是描述',0,1800,2592000,'[\"https://www.iocoder.cn\",\"https://doc.iocoder.cn\"]','[\"password\",\"authorization_code\",\"implicit\",\"refresh_token\"]','[\"user.read\",\"user.write\"]','[]','[\"user.read\",\"user.write\"]','[]','{}','1','2022-05-11 21:47:12','1','2024-02-22 16:31:52',0),(40,'test','test2','biubiu','http://test.yudao.iocoder.cn/277a899d573723f1fcdfb57340f00379.png','啦啦啦啦',0,1800,43200,'[\"https://www.iocoder.cn\"]','[\"password\",\"authorization_code\",\"implicit\"]','[\"user_info\",\"projects\"]','[\"user_info\"]','[]','[]','{}','1','2022-05-12 00:28:20','1','2023-12-02 21:01:01',0),(41,'yudao-sso-demo-by-code','test','基于授权码模式，如何实现 SSO 单点登录？','http://test.yudao.iocoder.cn/fe4ed36596adad5120036ef61a6d0153654544d44af8dd4ad3ffe8f759933d6f.png',NULL,0,1800,43200,'[\"http://127.0.0.1:18080\"]','[\"authorization_code\",\"refresh_token\"]','[\"user.read\",\"user.write\"]','[]','[]','[]',NULL,'1','2022-09-29 13:28:31','1','2022-09-29 13:28:31',0),(42,'yudao-sso-demo-by-password','test','基于密码模式，如何实现 SSO 单点登录？','http://test.yudao.iocoder.cn/604bdc695e13b3b22745be704d1f2aa8ee05c5f26f9fead6d1ca49005afbc857.jpeg',NULL,0,1800,43200,'[\"http://127.0.0.1:18080\"]','[\"password\",\"refresh_token\"]','[\"user.read\",\"user.write\"]','[]','[]','[]',NULL,'1','2022-10-04 17:40:16','1','2022-10-04 20:31:21',0);
/*!40000 ALTER TABLE `system_oauth2_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_oauth2_code`
--

DROP TABLE IF EXISTS `system_oauth2_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_code` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '授权码',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '授权范围',
  `expires_time` datetime NOT NULL COMMENT '过期时间',
  `redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '可重定向的 URI 地址',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 授权码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_oauth2_code`
--

LOCK TABLES `system_oauth2_code` WRITE;
/*!40000 ALTER TABLE `system_oauth2_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_oauth2_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_oauth2_refresh_token`
--

DROP TABLE IF EXISTS `system_oauth2_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_refresh_token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '刷新令牌',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '授权范围',
  `expires_time` datetime NOT NULL COMMENT '过期时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1711 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 刷新令牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_oauth2_refresh_token`
--

LOCK TABLES `system_oauth2_refresh_token` WRITE;
/*!40000 ALTER TABLE `system_oauth2_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_oauth2_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_operate_log`
--

DROP TABLE IF EXISTS `system_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_operate_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '用户类型',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作模块类型',
  `sub_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作名',
  `biz_id` bigint NOT NULL COMMENT '操作数据模块编号',
  `action` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作内容',
  `success` bit(1) NOT NULL DEFAULT b'1' COMMENT '操作结果',
  `extra` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '拓展字段',
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求方法名',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求地址',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '浏览器 UA',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9064 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志记录 V2 版本';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_operate_log`
--

LOCK TABLES `system_operate_log` WRITE;
/*!40000 ALTER TABLE `system_operate_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_post`
--

DROP TABLE IF EXISTS `system_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `sort` int NOT NULL COMMENT '显示顺序',
  `status` tinyint NOT NULL COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_post`
--

LOCK TABLES `system_post` WRITE;
/*!40000 ALTER TABLE `system_post` DISABLE KEYS */;
INSERT INTO `system_post` VALUES (1,'ceo','董事长',1,0,'','admin','2021-01-06 17:03:48','1','2023-02-11 15:19:04',0,1),(2,'se','项目经理',2,0,'','admin','2021-01-05 17:03:48','1','2023-11-15 09:18:20',0,1),(4,'user','普通员工',4,0,'111','admin','2021-01-05 17:03:48','1','2023-12-02 10:04:37',0,1),(5,'HR','人力资源',5,0,'','1','2024-03-24 20:45:40','1','2024-03-24 20:45:40',0,1),(6,'yudao','小土豆',1024,1,'快乐的备注','','2025-03-30 03:13:56','','2025-03-30 03:13:56',0,0),(7,'yudao','小土豆',1024,1,'快乐的备注','','2025-03-30 03:14:21','','2025-03-30 03:14:21',0,0),(8,'yudao','小土豆',1024,0,'快乐的备注','aaaa','2025-03-30 03:25:45','aaaa','2025-03-30 03:25:45',0,0);
/*!40000 ALTER TABLE `system_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role`
--

DROP TABLE IF EXISTS `system_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` tinyint NOT NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `data_scope_dept_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据范围(指定部门数组)',
  `status` tinyint NOT NULL COMMENT '角色状态（0正常 1停用）',
  `type` tinyint NOT NULL COMMENT '角色类型',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role`
--

LOCK TABLES `system_role` WRITE;
/*!40000 ALTER TABLE `system_role` DISABLE KEYS */;
INSERT INTO `system_role` VALUES (1,'超级管理员','super_admin',1,1,'',0,1,'超级管理员','admin','2021-01-05 17:03:48','','2022-02-22 05:08:21',0,1),(2,'普通角色','common',2,2,'',0,1,'普通角色','admin','2021-01-05 17:03:48','','2022-02-22 05:08:20',0,1),(3,'CRM 管理员','crm_admin',2,1,'',0,1,'CRM 专属角色','1','2024-02-24 10:51:13','1','2024-02-24 02:51:32',0,1),(101,'测试账号','test',0,1,'[]',0,2,'','','2021-01-06 13:49:35','1','2025-04-06 08:18:25',0,1),(109,'租户管理员','tenant_admin',0,1,'',0,1,'系统自动生成','1','2022-02-22 00:56:14','1','2022-02-22 00:56:14',0,121),(111,'租户管理员','tenant_admin',0,1,'',0,1,'系统自动生成','1','2022-03-07 21:37:58','1','2022-03-07 21:37:58',0,122),(153,'某角色','tt',4,2,'[103, 108]',1,2,'','1','2024-08-17 14:09:35','100','2025-04-06 09:43:08',0,1);
/*!40000 ALTER TABLE `system_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role_menu`
--

DROP TABLE IF EXISTS `system_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5803 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role_menu`
--

LOCK TABLES `system_role_menu` WRITE;
/*!40000 ALTER TABLE `system_role_menu` DISABLE KEYS */;
INSERT INTO `system_role_menu` VALUES (263,109,1,'1','2022-02-22 00:56:14','1','2022-02-22 00:56:14',0,121),(434,2,1,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(454,2,1093,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(455,2,1094,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(460,2,1100,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(467,2,1107,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(476,2,1117,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(477,2,100,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(478,2,101,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(479,2,102,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(480,2,1126,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(481,2,103,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(483,2,104,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(485,2,105,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(488,2,107,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(490,2,108,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(492,2,109,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(498,2,1138,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(523,2,1224,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(524,2,1225,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(541,2,500,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(543,2,501,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',0,1),(675,2,2,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',0,1),(689,2,1077,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',0,1),(690,2,1078,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',0,1),(692,2,1083,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',0,1),(693,2,1084,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',0,1),(699,2,1090,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',0,1),(703,2,106,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',0,1),(704,2,110,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',0,1),(705,2,111,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',0,1),(706,2,112,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',0,1),(707,2,113,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',0,1),(1296,110,1,'110','2022-02-23 00:23:55','110','2022-02-23 00:23:55',0,121),(1578,111,1,'1','2022-03-07 21:37:58','1','2022-03-07 21:37:58',0,122),(1604,101,1216,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1605,101,1217,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1606,101,1218,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1607,101,1219,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1608,101,1220,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1609,101,1221,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1610,101,5,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1611,101,1222,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1612,101,1118,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1613,101,1119,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1614,101,1120,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1615,101,1185,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1616,101,1186,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1617,101,1187,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1618,101,1188,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1619,101,1189,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1620,101,1190,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1621,101,1191,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1622,101,1192,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1623,101,1193,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1624,101,1194,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1625,101,1195,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1627,101,1197,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1628,101,1198,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1629,101,1199,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1630,101,1200,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1631,101,1201,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1632,101,1202,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1633,101,1207,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1634,101,1208,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1635,101,1209,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1636,101,1210,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1637,101,1211,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1638,101,1212,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1639,101,1213,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1640,101,1215,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',0,1),(1641,101,2,'1','2022-04-01 22:21:24','1','2022-04-01 22:21:24',0,1),(1642,101,1031,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1643,101,1032,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1644,101,1033,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1645,101,1034,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1646,101,1035,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1647,101,1050,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1648,101,1051,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1649,101,1052,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1650,101,1053,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1651,101,1054,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1652,101,1056,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1653,101,1057,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1654,101,1058,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1655,101,1059,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1656,101,1060,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1657,101,1066,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1658,101,1067,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1659,101,1070,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1664,101,1075,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1666,101,1077,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1667,101,1078,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1668,101,1082,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1669,101,1083,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1670,101,1084,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1671,101,1085,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1672,101,1086,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1673,101,1087,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1674,101,1088,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1675,101,1089,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1679,101,1237,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1680,101,1238,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1681,101,1239,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1682,101,1240,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1683,101,1241,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1684,101,1242,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1685,101,1243,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1687,101,106,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1688,101,110,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1689,101,111,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1690,101,112,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1691,101,113,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1692,101,114,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1693,101,115,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1694,101,116,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',0,1),(1729,109,100,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1730,109,101,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1731,109,1063,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1732,109,1064,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1733,109,1001,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1734,109,1065,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1735,109,1002,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1736,109,1003,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1737,109,1004,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1738,109,1005,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1739,109,1006,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1740,109,1007,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1741,109,1008,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1742,109,1009,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1743,109,1010,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1744,109,1011,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1745,109,1012,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',0,121),(1746,111,100,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1747,111,101,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1748,111,1063,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1749,111,1064,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1750,111,1001,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1751,111,1065,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1752,111,1002,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1753,111,1003,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1754,111,1004,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1755,111,1005,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1756,111,1006,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1757,111,1007,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1758,111,1008,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1759,111,1009,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1760,111,1010,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1761,111,1011,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1762,111,1012,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',0,122),(1763,109,100,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1764,109,101,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1765,109,1063,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1766,109,1064,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1767,109,1001,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1768,109,1065,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1769,109,1002,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1770,109,1003,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1771,109,1004,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1772,109,1005,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1773,109,1006,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1774,109,1007,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1775,109,1008,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1776,109,1009,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1777,109,1010,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1778,109,1011,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1779,109,1012,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',0,121),(1780,111,100,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1781,111,101,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1782,111,1063,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1783,111,1064,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1784,111,1001,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1785,111,1065,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1786,111,1002,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1787,111,1003,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1788,111,1004,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1789,111,1005,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1790,111,1006,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1791,111,1007,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1792,111,1008,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1793,111,1009,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1794,111,1010,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1795,111,1011,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1796,111,1012,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',0,122),(1797,109,100,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1798,109,101,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1799,109,1063,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1800,109,1064,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1801,109,1001,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1802,109,1065,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1803,109,1002,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1804,109,1003,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1805,109,1004,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1806,109,1005,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1807,109,1006,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1808,109,1007,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1809,109,1008,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1810,109,1009,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1811,109,1010,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1812,109,1011,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1813,109,1012,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',0,121),(1814,111,100,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1815,111,101,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1816,111,1063,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1817,111,1064,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1818,111,1001,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1819,111,1065,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1820,111,1002,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1821,111,1003,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1822,111,1004,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1823,111,1005,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1824,111,1006,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1825,111,1007,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1826,111,1008,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1827,111,1009,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1828,111,1010,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1829,111,1011,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1830,111,1012,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',0,122),(1831,109,103,'1','2022-09-21 22:43:23','1','2022-09-21 22:43:23',0,121),(1832,109,1017,'1','2022-09-21 22:43:23','1','2022-09-21 22:43:23',0,121),(1833,109,1018,'1','2022-09-21 22:43:23','1','2022-09-21 22:43:23',0,121),(1834,109,1019,'1','2022-09-21 22:43:23','1','2022-09-21 22:43:23',0,121),(1835,109,1020,'1','2022-09-21 22:43:23','1','2022-09-21 22:43:23',0,121),(1836,111,103,'1','2022-09-21 22:43:24','1','2022-09-21 22:43:24',0,122),(1837,111,1017,'1','2022-09-21 22:43:24','1','2022-09-21 22:43:24',0,122),(1838,111,1018,'1','2022-09-21 22:43:24','1','2022-09-21 22:43:24',0,122),(1839,111,1019,'1','2022-09-21 22:43:24','1','2022-09-21 22:43:24',0,122),(1840,111,1020,'1','2022-09-21 22:43:24','1','2022-09-21 22:43:24',0,122),(1841,109,1036,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',0,121),(1842,109,1037,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',0,121),(1843,109,1038,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',0,121),(1844,109,1039,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',0,121),(1845,109,107,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',0,121),(1846,111,1036,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',0,122),(1847,111,1037,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',0,122),(1848,111,1038,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',0,122),(1849,111,1039,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',0,122),(1850,111,107,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',0,122),(1991,2,1024,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(1992,2,1025,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(1993,2,1026,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(1994,2,1027,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(1995,2,1028,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(1996,2,1029,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(1997,2,1030,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(1998,2,1031,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(1999,2,1032,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2000,2,1033,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2001,2,1034,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2002,2,1035,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2003,2,1036,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2004,2,1037,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2005,2,1038,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2006,2,1039,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2007,2,1040,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2008,2,1042,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2009,2,1043,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2010,2,1045,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2011,2,1046,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2012,2,1048,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2013,2,1050,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2014,2,1051,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2015,2,1052,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2016,2,1053,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2017,2,1054,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2018,2,1056,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2019,2,1057,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2020,2,1058,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2021,2,2083,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2022,2,1059,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2023,2,1060,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2024,2,1063,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2025,2,1064,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2026,2,1065,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2027,2,1066,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2028,2,1067,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2029,2,1070,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2034,2,1075,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2036,2,1082,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2037,2,1085,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2038,2,1086,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2039,2,1087,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2040,2,1088,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2041,2,1089,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2042,2,1091,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2043,2,1092,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2044,2,1095,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2045,2,1096,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2046,2,1097,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2047,2,1098,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2048,2,1101,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2049,2,1102,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2050,2,1103,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2051,2,1104,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2052,2,1105,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2053,2,1106,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2054,2,1108,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2055,2,1109,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2061,2,1127,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2062,2,1128,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2063,2,1129,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2064,2,1130,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2066,2,1132,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2067,2,1133,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2068,2,1134,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2069,2,1135,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2070,2,1136,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2071,2,1137,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2072,2,114,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2073,2,1139,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2074,2,115,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2075,2,1140,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2076,2,116,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2077,2,1141,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2078,2,1142,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2079,2,1143,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2080,2,1150,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2081,2,1161,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2082,2,1162,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2083,2,1163,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2084,2,1164,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2085,2,1165,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2086,2,1166,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2087,2,1173,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2088,2,1174,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2089,2,1175,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2090,2,1176,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2091,2,1177,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2092,2,1178,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2099,2,1226,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2100,2,1227,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2101,2,1228,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2102,2,1229,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2103,2,1237,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2104,2,1238,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2105,2,1239,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2106,2,1240,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2107,2,1241,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2108,2,1242,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2109,2,1243,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2116,2,1254,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2117,2,1255,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2118,2,1256,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2119,2,1257,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2120,2,1258,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2121,2,1259,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2122,2,1260,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2123,2,1261,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2124,2,1263,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2125,2,1264,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2126,2,1265,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2127,2,1266,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2128,2,1267,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2129,2,1001,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2130,2,1002,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2131,2,1003,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2132,2,1004,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2133,2,1005,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2134,2,1006,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2135,2,1007,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2136,2,1008,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2137,2,1009,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2138,2,1010,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2139,2,1011,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2140,2,1012,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2141,2,1013,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2142,2,1014,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2143,2,1015,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2144,2,1016,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2145,2,1017,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2146,2,1018,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2147,2,1019,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2148,2,1020,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2149,2,1021,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2150,2,1022,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2151,2,1023,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',0,1),(2152,2,1281,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2153,2,1282,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2154,2,2000,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2155,2,2002,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2156,2,2003,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2157,2,2004,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2158,2,2005,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2159,2,2006,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2160,2,2008,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2161,2,2009,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2162,2,2010,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2163,2,2011,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2164,2,2012,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2170,2,2019,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2171,2,2020,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2172,2,2021,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2173,2,2022,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2174,2,2023,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2175,2,2025,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2177,2,2027,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2178,2,2028,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2179,2,2029,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',0,1),(2180,2,2014,'1','2023-01-25 08:43:12','1','2023-01-25 08:43:12',0,1),(2181,2,2015,'1','2023-01-25 08:43:12','1','2023-01-25 08:43:12',0,1),(2182,2,2016,'1','2023-01-25 08:43:12','1','2023-01-25 08:43:12',0,1),(2183,2,2017,'1','2023-01-25 08:43:12','1','2023-01-25 08:43:12',0,1),(2184,2,2018,'1','2023-01-25 08:43:12','1','2023-01-25 08:43:12',0,1),(2188,101,1024,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2189,101,1,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2190,101,1025,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2191,101,1026,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2192,101,1027,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2193,101,1028,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2194,101,1029,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2195,101,1030,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2196,101,1036,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2197,101,1037,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2198,101,1038,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2199,101,1039,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2200,101,1040,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2201,101,1042,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2202,101,1043,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2203,101,1045,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2204,101,1046,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2205,101,1048,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2206,101,2083,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2207,101,1063,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2208,101,1064,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2209,101,1065,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2210,101,1093,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2211,101,1094,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2212,101,1095,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2213,101,1096,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2214,101,1097,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2215,101,1098,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2216,101,1100,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2217,101,1101,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2218,101,1102,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2219,101,1103,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2220,101,1104,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2221,101,1105,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2222,101,1106,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2223,101,2130,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2224,101,1107,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2225,101,2131,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2226,101,1108,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2227,101,2132,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2228,101,1109,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2229,101,2133,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2230,101,2134,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2232,101,2135,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2234,101,2136,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2236,101,2137,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2238,101,2138,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2240,101,2139,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2242,101,2140,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2243,101,2141,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2244,101,2142,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2245,101,2143,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2246,101,2144,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2247,101,2145,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2248,101,2146,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2249,101,2147,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2250,101,100,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2251,101,2148,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2252,101,101,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2253,101,2149,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2254,101,102,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2255,101,2150,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2256,101,103,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2257,101,2151,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2258,101,104,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2259,101,2152,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2260,101,105,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2261,101,107,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2262,101,108,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2263,101,109,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2264,101,1138,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2265,101,1139,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2266,101,1140,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2267,101,1141,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2268,101,1142,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2269,101,1143,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2270,101,1224,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2271,101,1225,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2272,101,1226,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2273,101,1227,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2274,101,1228,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2275,101,1229,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2282,101,1261,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2283,101,1263,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2284,101,1264,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2285,101,1265,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2286,101,1266,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2287,101,1267,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2288,101,1001,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2289,101,1002,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2290,101,1003,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2291,101,1004,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2292,101,1005,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2293,101,1006,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2294,101,1007,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2295,101,1008,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2296,101,1009,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2297,101,1010,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2298,101,1011,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2299,101,1012,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2300,101,500,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2301,101,1013,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2302,101,501,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2303,101,1014,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2304,101,1015,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2305,101,1016,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2306,101,1017,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2307,101,1018,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2308,101,1019,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2309,101,1020,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2310,101,1021,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2311,101,1022,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2312,101,1023,'1','2023-02-09 23:49:46','1','2023-02-09 23:49:46',0,1),(2929,109,1224,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2930,109,1225,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2931,109,1226,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2932,109,1227,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2933,109,1228,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2934,109,1229,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2935,109,1138,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2936,109,1139,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2937,109,1140,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2938,109,1141,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2939,109,1142,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2940,109,1143,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,121),(2941,111,1224,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2942,111,1225,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2943,111,1226,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2944,111,1227,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2945,111,1228,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2946,111,1229,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2947,111,1138,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2948,111,1139,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2949,111,1140,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2950,111,1141,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2951,111,1142,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2952,111,1143,'1','2023-12-02 23:19:40','1','2023-12-02 23:19:40',0,122),(2993,109,2,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(2994,109,1031,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(2995,109,1032,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(2996,109,1033,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(2997,109,1034,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(2998,109,1035,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(2999,109,1050,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3000,109,1051,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3001,109,1052,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3002,109,1053,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3003,109,1054,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3004,109,1056,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3005,109,1057,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3006,109,1058,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3007,109,1059,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3008,109,1060,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3009,109,1066,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3010,109,1067,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3011,109,1070,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3012,109,1075,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3014,109,1077,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3015,109,1078,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3016,109,1082,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3017,109,1083,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3018,109,1084,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3019,109,1085,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3020,109,1086,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3021,109,1087,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3022,109,1088,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3023,109,1089,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3024,109,1090,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3025,109,1091,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3026,109,1092,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3027,109,106,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3028,109,110,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3029,109,111,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3030,109,112,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3031,109,113,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3032,109,114,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3033,109,115,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3034,109,116,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3035,109,2472,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3036,109,2478,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3037,109,2479,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3038,109,2480,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3039,109,2481,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3040,109,2482,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3041,109,2483,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3042,109,2484,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3043,109,2485,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3044,109,2486,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3045,109,2487,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3046,109,2488,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3047,109,2489,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3048,109,2490,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3049,109,2491,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3050,109,2492,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3051,109,2493,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3052,109,2494,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3053,109,2495,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3054,109,2497,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3055,109,1237,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3056,109,1238,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3057,109,1239,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3058,109,1240,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3059,109,1241,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3060,109,1242,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3061,109,1243,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3062,109,2525,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3063,109,1255,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3064,109,1256,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3065,109,1257,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3066,109,1258,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3067,109,1259,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3068,109,1260,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,121),(3069,111,2,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3070,111,1031,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3071,111,1032,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3072,111,1033,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3073,111,1034,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3074,111,1035,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3075,111,1050,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3076,111,1051,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3077,111,1052,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3078,111,1053,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3079,111,1054,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3080,111,1056,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3081,111,1057,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3082,111,1058,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3083,111,1059,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3084,111,1060,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3085,111,1066,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3086,111,1067,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3087,111,1070,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3088,111,1075,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3090,111,1077,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3091,111,1078,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3092,111,1082,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3093,111,1083,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3094,111,1084,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3095,111,1085,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3096,111,1086,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3097,111,1087,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3098,111,1088,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3099,111,1089,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3100,111,1090,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3101,111,1091,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3102,111,1092,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3103,111,106,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3104,111,110,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3105,111,111,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3106,111,112,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3107,111,113,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3108,111,114,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3109,111,115,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3110,111,116,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3111,111,2472,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3112,111,2478,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3113,111,2479,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3114,111,2480,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3115,111,2481,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3116,111,2482,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3117,111,2483,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3118,111,2484,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3119,111,2485,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3120,111,2486,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3121,111,2487,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3122,111,2488,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3123,111,2489,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3124,111,2490,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3125,111,2491,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3126,111,2492,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3127,111,2493,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3128,111,2494,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3129,111,2495,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3130,111,2497,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3131,111,1237,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3132,111,1238,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3133,111,1239,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3134,111,1240,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3135,111,1241,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3136,111,1242,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3137,111,1243,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3138,111,2525,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3139,111,1255,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3140,111,1256,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3141,111,1257,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3142,111,1258,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3143,111,1259,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3144,111,1260,'1','2023-12-02 23:41:02','1','2023-12-02 23:41:02',0,122),(3221,109,102,'1','2023-12-30 11:42:36','1','2023-12-30 11:42:36',0,121),(3222,109,1013,'1','2023-12-30 11:42:36','1','2023-12-30 11:42:36',0,121),(3223,109,1014,'1','2023-12-30 11:42:36','1','2023-12-30 11:42:36',0,121),(3224,109,1015,'1','2023-12-30 11:42:36','1','2023-12-30 11:42:36',0,121),(3225,109,1016,'1','2023-12-30 11:42:36','1','2023-12-30 11:42:36',0,121),(3226,111,102,'1','2023-12-30 11:42:36','1','2023-12-30 11:42:36',0,122),(3227,111,1013,'1','2023-12-30 11:42:36','1','2023-12-30 11:42:36',0,122),(3228,111,1014,'1','2023-12-30 11:42:36','1','2023-12-30 11:42:36',0,122),(3229,111,1015,'1','2023-12-30 11:42:36','1','2023-12-30 11:42:36',0,122),(3230,111,1016,'1','2023-12-30 11:42:36','1','2023-12-30 11:42:36',0,122),(4163,109,5,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4164,109,1118,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4165,109,1119,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4166,109,1120,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4167,109,2713,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4168,109,2714,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4169,109,2715,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4170,109,2716,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4171,109,2717,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4172,109,2718,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4173,109,2720,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4174,109,1185,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4175,109,2721,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4176,109,1186,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4177,109,2722,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4178,109,1187,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4179,109,2723,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4180,109,1188,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4181,109,2724,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4182,109,1189,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4183,109,2725,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4184,109,1190,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4185,109,2726,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4186,109,1191,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4187,109,2727,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4188,109,1192,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4189,109,2728,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4190,109,1193,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4191,109,2729,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4192,109,1194,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4193,109,2730,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4194,109,1195,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4195,109,2731,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4196,109,1196,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4197,109,2732,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4198,109,1197,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4199,109,2733,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4200,109,1198,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4201,109,2734,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4202,109,1199,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4203,109,2735,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4204,109,1200,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4205,109,1201,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4206,109,1202,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4207,109,1207,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4208,109,1208,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4209,109,1209,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4210,109,1210,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4211,109,1211,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4212,109,1212,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4213,109,1213,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4214,109,1215,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4215,109,1216,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4216,109,1217,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4217,109,1218,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4218,109,1219,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4219,109,1220,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4220,109,1221,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4221,109,1222,'1','2024-03-30 17:53:17','1','2024-03-30 17:53:17',0,121),(4222,111,5,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4223,111,1118,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4224,111,1119,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4225,111,1120,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4226,111,2713,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4227,111,2714,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4228,111,2715,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4229,111,2716,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4230,111,2717,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4231,111,2718,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4232,111,2720,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4233,111,1185,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4234,111,2721,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4235,111,1186,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4236,111,2722,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4237,111,1187,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4238,111,2723,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4239,111,1188,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4240,111,2724,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4241,111,1189,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4242,111,2725,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4243,111,1190,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4244,111,2726,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4245,111,1191,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4246,111,2727,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4247,111,1192,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4248,111,2728,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4249,111,1193,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4250,111,2729,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4251,111,1194,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4252,111,2730,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4253,111,1195,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4254,111,2731,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4255,111,1196,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4256,111,2732,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4257,111,1197,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4258,111,2733,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4259,111,1198,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4260,111,2734,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4261,111,1199,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4262,111,2735,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4263,111,1200,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4264,111,1201,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4265,111,1202,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4266,111,1207,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4267,111,1208,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4268,111,1209,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4269,111,1210,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4270,111,1211,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4271,111,1212,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4272,111,1213,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4273,111,1215,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4274,111,1216,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4275,111,1217,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4276,111,1218,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4277,111,1219,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4278,111,1220,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4279,111,1221,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(4280,111,1222,'1','2024-03-30 17:53:18','1','2024-03-30 17:53:18',0,122),(5777,101,2739,'1','2024-04-30 09:38:37','1','2024-04-30 09:38:37',0,1),(5778,101,2740,'1','2024-04-30 09:38:37','1','2024-04-30 09:38:37',0,1),(5779,2,2739,'1','2024-07-07 20:39:38','1','2024-07-07 20:39:38',0,1),(5780,2,2740,'1','2024-07-07 20:39:38','1','2024-07-07 20:39:38',0,1),(5781,2,2758,'1','2024-07-07 20:39:38','1','2024-07-07 20:39:38',0,1),(5782,2,2759,'1','2024-07-07 20:39:38','1','2024-07-07 20:39:38',0,1),(5783,2,2362,'1','2024-07-07 20:39:38','1','2024-07-07 20:39:38',0,1),(5784,2,2387,'1','2024-07-07 20:39:38','1','2024-07-07 20:39:38',0,1),(5785,2,2030,'1','2024-07-07 20:39:38','1','2024-07-07 20:39:38',0,1),(5786,101,2758,'1','2024-07-07 20:39:55','1','2024-07-07 20:39:55',0,1),(5787,101,2759,'1','2024-07-07 20:39:55','1','2024-07-07 20:39:55',0,1),(5788,101,2783,'1','2024-07-07 20:39:55','1','2024-07-07 20:39:55',0,1),(5789,109,2739,'1','2024-07-13 22:37:24','1','2024-07-13 22:37:24',0,121),(5790,109,2740,'1','2024-07-13 22:37:24','1','2024-07-13 22:37:24',0,121),(5791,111,2739,'1','2024-07-13 22:37:24','1','2024-07-13 22:37:24',0,122),(5792,111,2740,'1','2024-07-13 22:37:24','1','2024-07-13 22:37:24',0,122),(5793,101,1281,'','2025-04-06 08:18:25','','2025-04-06 08:18:25',0,0),(5794,101,2755,'','2025-04-06 08:18:25','','2025-04-06 08:18:25',0,0),(5795,101,2153,'','2025-04-06 08:18:25','','2025-04-06 08:18:25',0,0),(5796,101,2154,'','2025-04-06 08:18:25','','2025-04-06 08:18:25',0,0),(5797,101,2155,'','2025-04-06 08:18:25','','2025-04-06 08:18:25',0,0),(5798,101,2156,'','2025-04-06 08:18:25','','2025-04-06 08:18:25',0,0),(5799,101,2157,'','2025-04-06 08:18:25','','2025-04-06 08:18:25',0,0),(5800,101,2158,'','2025-04-06 08:18:25','','2025-04-06 08:18:25',0,0);
/*!40000 ALTER TABLE `system_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_sms_channel`
--

DROP TABLE IF EXISTS `system_sms_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_channel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `signature` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信签名',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道编码',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `api_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的账号',
  `api_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信 API 的秘钥',
  `callback_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信发送回调 URL',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信渠道';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sms_channel`
--

LOCK TABLES `system_sms_channel` WRITE;
/*!40000 ALTER TABLE `system_sms_channel` DISABLE KEYS */;
INSERT INTO `system_sms_channel` VALUES (2,'Ballcat','ALIYUN',0,'你要改哦，只有我可以用！！！！','LTAI5tCnKso2uG3kJ5gRav88','fGJ5SNXL7P1NHNRmJ7DJaMJGPyE55C',NULL,'','2021-03-31 11:53:10','1','2024-08-04 08:53:26',0),(4,'测试渠道','DEBUG_DING_TALK',0,'123','696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859','SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67',NULL,'1','2021-04-13 00:23:14','1','2022-03-27 20:29:49',0),(7,'mock腾讯云','TENCENT',0,'','1 2','2 3','','1','2024-09-30 08:53:45','1','2024-09-30 08:55:01',0);
/*!40000 ALTER TABLE `system_sms_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_sms_code`
--

DROP TABLE IF EXISTS `system_sms_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_code` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码',
  `create_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建 IP',
  `scene` tinyint NOT NULL COMMENT '发送场景',
  `today_index` tinyint NOT NULL COMMENT '今日发送的第几条',
  `used` tinyint NOT NULL COMMENT '是否使用',
  `used_time` datetime DEFAULT NULL COMMENT '使用时间',
  `used_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '使用 IP',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_mobile` (`mobile`) USING BTREE COMMENT '手机号'
) ENGINE=InnoDB AUTO_INCREMENT=645 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='手机验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sms_code`
--

LOCK TABLES `system_sms_code` WRITE;
/*!40000 ALTER TABLE `system_sms_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_sms_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_sms_log`
--

DROP TABLE IF EXISTS `system_sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `channel_id` bigint NOT NULL COMMENT '短信渠道编号',
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信渠道编码',
  `template_id` bigint NOT NULL COMMENT '模板编号',
  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `template_type` tinyint NOT NULL COMMENT '短信类型',
  `template_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信内容',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信参数',
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的模板编号',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
  `user_type` tinyint DEFAULT NULL COMMENT '用户类型',
  `send_status` tinyint NOT NULL DEFAULT '0' COMMENT '发送状态',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `api_send_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信 API 发送结果的编码',
  `api_send_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信 API 发送失败的提示',
  `api_request_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信 API 发送返回的唯一请求 ID',
  `api_serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信 API 发送返回的序号',
  `receive_status` tinyint NOT NULL DEFAULT '0' COMMENT '接收状态',
  `receive_time` datetime DEFAULT NULL COMMENT '接收时间',
  `api_receive_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'API 接收结果的编码',
  `api_receive_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'API 接收结果的说明',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sms_log`
--

LOCK TABLES `system_sms_log` WRITE;
/*!40000 ALTER TABLE `system_sms_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_sms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_sms_template`
--

DROP TABLE IF EXISTS `system_sms_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` tinyint NOT NULL COMMENT '模板类型',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板内容',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数数组',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的模板编号',
  `channel_id` bigint NOT NULL COMMENT '短信渠道编号',
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信渠道编码',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sms_template`
--

LOCK TABLES `system_sms_template` WRITE;
/*!40000 ALTER TABLE `system_sms_template` DISABLE KEYS */;
INSERT INTO `system_sms_template` VALUES (2,1,0,'test_01','测试验证码短信','正在进行登录操作{operation}，您的验证码是{code}','[\"operation\",\"code\"]','测试备注','4383920',4,'DEBUG_DING_TALK','','2021-03-31 10:49:38','1','2024-08-18 11:57:18',0),(3,1,0,'test_02','公告通知','您的验证码{code}，该验证码5分钟内有效，请勿泄漏于他人！','[\"code\"]',NULL,'SMS_207945135',2,'ALIYUN','','2021-03-31 11:56:30','1','2021-04-10 01:22:02',0),(6,3,0,'test-01','测试模板','哈哈哈 {name}','[\"name\"]','f哈哈哈','4383920',4,'DEBUG_DING_TALK','1','2021-04-10 01:07:21','1','2024-08-18 11:57:07',0),(7,3,0,'test-04','测试下','老鸡{name}，牛逼{code}','[\"name\",\"code\"]','哈哈哈哈','suibian',7,'DEBUG_DING_TALK','1','2021-04-13 00:29:53','1','2024-09-30 00:56:24',0),(8,1,0,'user-sms-login','前台用户短信登录','您的验证码是{code}','[\"code\"]',NULL,'4372216',4,'DEBUG_DING_TALK','1','2021-10-11 08:10:00','1','2024-08-18 11:57:06',0),(9,2,0,'bpm_task_assigned','【工作流】任务被分配','您收到了一条新的待办任务：{processInstanceName}-{taskName}，申请人：{startUserNickname}，处理链接：{detailUrl}','[\"processInstanceName\",\"taskName\",\"startUserNickname\",\"detailUrl\"]',NULL,'suibian',4,'DEBUG_DING_TALK','1','2022-01-21 22:31:19','1','2022-01-22 00:03:36',0),(10,2,0,'bpm_process_instance_reject','【工作流】流程被不通过','您的流程被审批不通过：{processInstanceName}，原因：{reason}，查看链接：{detailUrl}','[\"processInstanceName\",\"reason\",\"detailUrl\"]',NULL,'suibian',4,'DEBUG_DING_TALK','1','2022-01-22 00:03:31','1','2022-05-01 12:33:14',0),(11,2,0,'bpm_process_instance_approve','【工作流】流程被通过','您的流程被审批通过：{processInstanceName}，查看链接：{detailUrl}','[\"processInstanceName\",\"detailUrl\"]',NULL,'suibian',4,'DEBUG_DING_TALK','1','2022-01-22 00:04:31','1','2022-03-27 20:32:21',0),(12,2,0,'demo','演示模板','我就是测试一下下','[]',NULL,'biubiubiu',4,'DEBUG_DING_TALK','1','2022-04-10 23:22:49','1','2024-08-18 11:57:04',0),(14,1,0,'user-update-mobile','会员用户 - 修改手机','您的验证码{code}，该验证码 5 分钟内有效，请勿泄漏于他人！','[\"code\"]','','null',4,'DEBUG_DING_TALK','1','2023-08-19 18:58:01','1','2023-08-19 11:34:04',0),(15,1,0,'user-update-password','会员用户 - 修改密码','您的验证码{code}，该验证码 5 分钟内有效，请勿泄漏于他人！','[\"code\"]','','null',4,'DEBUG_DING_TALK','1','2023-08-19 18:58:01','1','2023-08-19 11:34:18',0),(16,1,0,'user-reset-password','会员用户 - 重置密码','您的验证码{code}，该验证码 5 分钟内有效，请勿泄漏于他人！','[\"code\"]','','null',4,'DEBUG_DING_TALK','1','2023-08-19 18:58:01','1','2023-12-02 22:35:27',0),(17,2,0,'bpm_task_timeout','【工作流】任务审批超时','您收到了一条超时的待办任务：{processInstanceName}-{taskName}，处理链接：{detailUrl}','[\"processInstanceName\",\"taskName\",\"detailUrl\"]','','X',4,'DEBUG_DING_TALK','1','2024-08-16 21:59:15','1','2024-08-16 21:59:34',0);
/*!40000 ALTER TABLE `system_sms_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_social_client`
--

DROP TABLE IF EXISTS `system_social_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_social_client` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `social_type` tinyint NOT NULL COMMENT '社交平台的类型',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端密钥',
  `agent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '代理编号',
  `status` tinyint NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='社交客户端表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_social_client`
--

LOCK TABLES `system_social_client` WRITE;
/*!40000 ALTER TABLE `system_social_client` DISABLE KEYS */;
INSERT INTO `system_social_client` VALUES (1,'钉钉',20,2,'dingvrnreaje3yqvzhxg','i8E6iZyDvZj51JIb0tYsYfVQYOks9Cq1lgryEjFRqC79P3iJcrxEwT6Qk2QvLrLI',NULL,0,'','2023-10-18 11:21:18','1','2023-12-20 21:28:26',1,1),(2,'钉钉（王土豆）',20,2,'dingtsu9hpepjkbmthhw','FP_bnSq_HAHKCSncmJjw5hxhnzs6vaVDSZZn3egj6rdqTQ_hu5tQVJyLMpgCakdP',NULL,0,'','2023-10-18 11:21:18','','2023-12-20 21:28:26',1,121),(3,'微信公众号',31,1,'wx5b23ba7a5589ecbb','2a7b3b20c537e52e74afd395eb85f61f',NULL,0,'','2023-10-18 16:07:46','1','2023-12-20 21:28:23',1,1),(43,'微信小程序',34,1,'wx63c280fe3248a3e7','6f270509224a7ae1296bbf1c8cb97aed',NULL,0,'','2023-10-19 13:37:41','1','2023-12-20 21:28:25',1,1);
/*!40000 ALTER TABLE `system_social_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_social_user`
--

DROP TABLE IF EXISTS `system_social_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_social_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键(自增策略)',
  `type` tinyint NOT NULL COMMENT '社交平台的类型',
  `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '社交 openid',
  `token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '社交 token',
  `raw_token_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始 Token 数据，一般是 JSON 格式',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `raw_user_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始用户数据，一般是 JSON 格式',
  `code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '最后一次的认证 code',
  `state` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后一次的认证 state',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='社交用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_social_user`
--

LOCK TABLES `system_social_user` WRITE;
/*!40000 ALTER TABLE `system_social_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_social_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_social_user_bind`
--

DROP TABLE IF EXISTS `system_social_user_bind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_social_user_bind` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键(自增策略)',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `social_type` tinyint NOT NULL COMMENT '社交平台的类型',
  `social_user_id` bigint NOT NULL COMMENT '社交用户的编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='社交绑定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_social_user_bind`
--

LOCK TABLES `system_social_user_bind` WRITE;
/*!40000 ALTER TABLE `system_social_user_bind` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_social_user_bind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_tenant`
--

DROP TABLE IF EXISTS `system_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_tenant` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '租户编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户名',
  `contact_user_id` bigint DEFAULT NULL COMMENT '联系人的用户编号',
  `contact_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人',
  `contact_mobile` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系手机',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
  `website` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '绑定域名',
  `package_id` bigint NOT NULL COMMENT '租户套餐编号',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `account_count` int NOT NULL COMMENT '账号数量',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='租户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_tenant`
--

LOCK TABLES `system_tenant` WRITE;
/*!40000 ALTER TABLE `system_tenant` DISABLE KEYS */;
INSERT INTO `system_tenant` VALUES (1,'芋道源码',NULL,'芋艿','17321315478',0,'www.iocoder.cn',0,'2099-02-19 17:14:16',9999,'1','2021-01-05 17:03:47','1','2023-11-06 11:41:41',0),(121,'小租户',110,'小王2','15601691300',0,'zsxq.iocoder.cn',111,'2025-03-11 00:00:00',20,'1','2022-02-22 00:56:14','1','2024-07-20 22:21:53',0),(122,'测试租户',113,'芋道','15601691300',0,'test.iocoder.cn',111,'2022-04-29 00:00:00',50,'1','2022-03-07 21:37:58','1','2024-09-22 12:10:50',0);
/*!40000 ALTER TABLE `system_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_tenant_package`
--

DROP TABLE IF EXISTS `system_tenant_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_tenant_package` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '套餐编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '套餐名',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `menu_ids` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联的菜单编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='租户套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_tenant_package`
--

LOCK TABLES `system_tenant_package` WRITE;
/*!40000 ALTER TABLE `system_tenant_package` DISABLE KEYS */;
INSERT INTO `system_tenant_package` VALUES (111,'普通套餐',0,'小功能','[1,2,5,1031,1032,1033,1034,1035,1036,1037,1038,1039,1050,1051,1052,1053,1054,1056,1057,1058,1059,1060,1063,1064,1065,1066,1067,1070,1075,1077,1078,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1118,1119,1120,100,101,102,103,106,107,110,111,112,113,1138,114,1139,115,1140,116,1141,1142,1143,2713,2714,2715,2716,2717,2718,2720,1185,2721,1186,2722,1187,2723,1188,2724,1189,2725,1190,2726,1191,2727,2472,1192,2728,1193,2729,1194,2730,1195,2731,1196,2732,1197,2733,2478,1198,2734,2479,1199,2735,2480,1200,2481,1201,2482,1202,2483,2739,2484,2740,2485,2486,2487,1207,2488,1208,2489,1209,2490,1210,2491,1211,2492,1212,2493,1213,2494,2495,1215,1216,2497,1217,1218,1219,1220,1221,1222,1224,1225,1226,1227,1228,1229,1237,1238,1239,1240,1241,1242,1243,2525,1255,1256,1001,1257,1002,1258,1003,1259,1004,1260,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020]','1','2022-02-22 00:54:00','1','2024-07-13 22:37:24',0);
/*!40000 ALTER TABLE `system_tenant_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_post`
--

DROP TABLE IF EXISTS `system_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID',
  `post_id` bigint NOT NULL DEFAULT '0' COMMENT '岗位ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户岗位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_post`
--

LOCK TABLES `system_user_post` WRITE;
/*!40000 ALTER TABLE `system_user_post` DISABLE KEYS */;
INSERT INTO `system_user_post` VALUES (112,1,1,'admin','2022-05-02 07:25:24','admin','2022-05-02 07:25:24',0,1),(113,100,1,'admin','2022-05-02 07:25:24','admin','2022-05-02 07:25:24',0,1),(115,104,1,'1','2022-05-16 19:36:28','1','2022-05-16 19:36:28',0,1),(116,117,2,'1','2022-07-09 17:40:26','1','2022-07-09 17:40:26',0,1),(117,118,1,'1','2022-07-09 17:44:44','1','2022-07-09 17:44:44',0,1),(119,114,5,'1','2024-03-24 20:45:51','1','2024-03-24 20:45:51',0,1),(123,115,1,'1','2024-04-04 09:37:14','1','2024-04-04 09:37:14',0,1),(124,115,2,'1','2024-04-04 09:37:14','1','2024-04-04 09:37:14',0,1),(125,1,2,'1','2024-07-13 22:31:39','1','2024-07-13 22:31:39',0,1),(127,140,2,'','2025-03-25 01:37:51','','2025-03-25 01:37:51',0,0),(128,140,5,'','2025-03-25 01:37:51','','2025-03-25 01:37:51',0,0),(136,150,4,'','2025-03-29 08:27:14','','2025-03-29 08:27:14',0,0);
/*!40000 ALTER TABLE `system_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_role`
--

DROP TABLE IF EXISTS `system_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_role`
--

LOCK TABLES `system_user_role` WRITE;
/*!40000 ALTER TABLE `system_user_role` DISABLE KEYS */;
INSERT INTO `system_user_role` VALUES (1,1,1,'','2022-01-11 13:19:45','','2022-05-12 12:35:17',0,1),(2,2,2,'','2022-01-11 13:19:45','','2022-05-12 12:35:13',0,1),(5,100,1,'','2022-01-11 13:19:45','','2022-05-12 12:35:12',0,1),(6,100,2,'','2022-01-11 13:19:45','','2022-05-12 12:35:11',0,1),(10,103,1,'1','2022-01-11 13:19:45','1','2022-01-11 13:19:45',0,1),(14,110,109,'1','2022-02-22 00:56:14','1','2022-02-22 00:56:14',0,121),(15,111,110,'110','2022-02-23 13:14:38','110','2022-02-23 13:14:38',0,121),(16,113,111,'1','2022-03-07 21:37:58','1','2022-03-07 21:37:58',0,122),(18,1,2,'1','2022-05-12 20:39:29','1','2022-05-12 20:39:29',0,1),(20,104,101,'1','2022-05-28 15:43:57','1','2022-05-28 15:43:57',0,1),(22,115,2,'1','2022-07-21 22:08:30','1','2022-07-21 22:08:30',0,1),(35,112,1,'1','2024-03-15 20:00:24','1','2024-03-15 20:00:24',0,1),(36,118,1,'1','2024-03-17 09:12:08','1','2024-03-17 09:12:08',0,1),(38,114,101,'1','2024-03-24 22:23:03','1','2024-03-24 22:23:03',0,1),(46,117,1,'1','2024-10-02 10:16:11','1','2024-10-02 10:16:11',0,1),(48,100,101,'','2025-04-06 10:07:52','','2025-04-06 10:07:52',0,0);
/*!40000 ALTER TABLE `system_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_users`
--

DROP TABLE IF EXISTS `system_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `post_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位编号数组',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` tinyint DEFAULT '0' COMMENT '用户性别',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像地址',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT NULL,
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  `last_login` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_users`
--

LOCK TABLES `system_users` WRITE;
/*!40000 ALTER TABLE `system_users` DISABLE KEYS */;
INSERT INTO `system_users` VALUES (1,'admin','pbkdf2_sha256$600000$OKkSnczX3DvxUSLokW6g3k$5+rQa+gBWUPKwl4eyuGddPayiysN83i5gEKkeT/AWUw=','芋道源码','管理员',103,'[1,2]','aoteman@126.com','18818260277',2,'http://test.yudao.iocoder.cn/bf2002b38950c904243be7c825d3f82e29f25a44526583c3fde2ebdff3a87f75.png',0,'127.0.0.1','2025-04-24 08:12:36','admin','2021-01-05 17:03:47',NULL,'2025-04-24 08:12:36',0,1,NULL,1),(103,'yuanma','$2a$04$fUBSmjKCPYAUmnMzOb6qE.eZCGPhHi1JmAKclODbfS/O7fHOl2bH6','源码',NULL,106,NULL,'yuanma@iocoder.cn','15601701300',0,'',0,'0:0:0:0:0:0:0:1','2024-08-11 17:48:12','','2021-01-13 23:50:35',NULL,'2024-08-11 17:48:12',0,1,NULL,1),(104,'test','$2a$04$jDFLttgfik0QqJKAbfhMa.2A9xXoZmAIxakdFJUzkX.MgBKT6ddo6','测试号',NULL,107,'[1,2]','111@qq.com','15601691200',1,'',0,'0:0:0:0:0:0:0:1','2024-09-17 15:05:43','','2021-01-21 02:13:53',NULL,'2024-09-17 15:05:43',0,1,NULL,1),(107,'admin107','$2a$10$dYOOBKMO93v/.ReCqzyFg.o67Tqk.bbc2bhrpyBGkIw9aypCtr2pm','芋艿',NULL,NULL,NULL,'','15601691300',0,'',0,'',NULL,'1','2022-02-20 22:59:33','1','2022-02-27 08:26:51',0,118,NULL,1),(108,'admin108','$2a$10$y6mfvKoNYL1GXWak8nYwVOH.kCWqjactkzdoIDgiKl93WN3Ejg.Lu','芋艿',NULL,NULL,NULL,'','15601691300',0,'',0,'',NULL,'1','2022-02-20 23:00:50','1','2022-02-27 08:26:53',0,119,NULL,1),(109,'admin109','$2a$10$JAqvH0tEc0I7dfDVBI7zyuB4E3j.uH6daIjV53.vUS6PknFkDJkuK','芋艿',NULL,NULL,NULL,'','15601691300',0,'',0,'',NULL,'1','2022-02-20 23:11:50','1','2022-02-27 08:26:56',0,120,NULL,1),(110,'admin110','$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm','小王',NULL,NULL,NULL,'','15601691300',0,'',0,'0:0:0:0:0:0:0:1','2024-07-20 22:23:17','1','2022-02-22 00:56:14',NULL,'2024-07-20 22:23:17',0,121,NULL,1),(111,'test','$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm','测试用户',NULL,NULL,'[]','','',0,'',0,'0:0:0:0:0:0:0:1','2023-12-30 11:42:17','110','2022-02-23 13:14:33',NULL,'2023-12-30 11:42:17',0,121,NULL,1),(112,'newobject','$2a$04$dB0z8Q819fJWz0hbaLe6B.VfHCjYgWx6LFfET5lyz3JwcqlyCkQ4C','新对象',NULL,100,'[]','','15601691235',1,'',0,'0:0:0:0:0:0:0:1','2024-03-16 23:11:38','1','2022-02-23 19:08:03',NULL,'2024-03-16 23:11:38',0,1,NULL,1),(113,'aoteman','$2a$10$0acJOIk2D25/oC87nyclE..0lzeu9DtQ/n3geP4fkun/zIVRhHJIO','芋道',NULL,NULL,NULL,'','15601691300',0,'',0,'127.0.0.1','2022-03-19 18:38:51','1','2022-03-07 21:37:58',NULL,'2022-03-19 18:38:51',0,122,NULL,1),(114,'hrmgr','$2a$10$TR4eybBioGRhBmDBWkqWLO6NIh3mzYa8KBKDDB5woiGYFVlRAi.fu','hr 小姐姐',NULL,NULL,'[5]','','15601691236',1,'',0,'0:0:0:0:0:0:0:1','2024-03-24 22:21:05','1','2022-03-19 21:50:58',NULL,'2024-03-24 22:21:05',0,1,NULL,1),(115,'aotemane','$2a$04$GcyP0Vyzb2F2Yni5PuIK9ueGxM0tkZGMtDwVRwrNbtMvorzbpNsV2','阿呆','11222',102,'[1,2]','7648@qq.com','15601691229',2,'',0,'',NULL,'1','2022-04-30 02:55:43','1','2024-04-04 09:37:14',0,1,NULL,1),(117,'admin123','$2a$04$sEtimsHu9YCkYY4/oqElHem2Ijc9ld20eYO6lN.g/21NfLUTDLB9W','测试号02','1111',100,'[2]','','15601691234',1,'',0,'0:0:0:0:0:0:0:1','2024-10-02 10:16:20','1','2022-07-09 17:40:26',NULL,'2024-10-02 10:16:20',0,1,NULL,1),(118,'goudan','$2a$04$OB1SuphCdiLVRpiYRKeqH.8NYS7UIp5vmIv1W7U4w6toiFeOAATVK','狗蛋',NULL,103,'[1]','','15601691239',1,'',0,'0:0:0:0:0:0:0:1','2024-03-17 09:10:27','1','2022-07-09 17:44:43','1','2024-09-06 21:40:43',0,1,NULL,1),(131,'hh','$2a$04$jyH9h6.gaw8mpOjPfHIpx.8as2Rzfcmdlj5rlJFwgCw4rsv/MTb2K','呵呵',NULL,100,'[]','777@qq.com','15601882312',1,'',0,'',NULL,'1','2024-04-27 08:45:56','1','2024-04-27 08:45:56',0,1,NULL,1),(139,'wwbwwb','pbkdf2_sha256$600000$h3fEJY5COVkx5h1ZMMpDAe$gz1AY7cBgFYG4VzHN96eWWEcXVcUFo7T06RCIOP6nNY=','小秃头',NULL,NULL,NULL,'','',0,'',0,'0:0:0:0:0:0:0:1','2024-09-10 21:03:58',NULL,'2024-09-10 21:03:58',NULL,'2025-04-03 00:31:31',0,1,NULL,1),(140,'zhangsan','pbkdf2_sha256$600000$biIcMCOTZBHBKh14YzvYdG$BzqEv8dNlzWPEMrtsWebVvNhstBPl2qtAn3WSBgeRos=','李四12','修改测试1',104,NULL,'ls@qq.com','18812345679',2,'',1,'',NULL,'','2025-03-24 03:51:11','100','2025-04-02 03:17:55',0,0,NULL,1),(142,'tt1','pbkdf2_sha256$600000$gMElv70AydHoirR7SEYYd0$O6bqnNdDq3aeASzYrTM+ZOa0M831MvJh65SQEpOTo/s=','张三2',NULL,103,NULL,'yunai@iocoder.cn','15601691300',1,'',0,'',NULL,'','2025-03-27 02:36:54','','2025-03-27 10:42:15',0,0,'2025-03-27 02:42:16',1),(143,'tt2','pbkdf2_sha256$600000$SVkGIzq7hRXLCWuZ1Vcm1w$4GntD6G/kzdEYf2/G6VNot3jMi5aCOaRhEwyxD02Y84=','李四2',NULL,108,NULL,'yuanma@iocoder.cn','15601701300',2,'',1,'',NULL,'','2025-03-27 02:36:54','','2025-03-27 02:36:55',0,0,NULL,1),(150,'zs','pbkdf2_sha256$600000$2yIeukFu6z0Lc1ei5mcYF8$+UFK9vnHeLVFMtbj0dkOFq7otWWjJbE5ljpUYfq7CbM=','张三','新增，测试1',103,NULL,'zs@qq.com','18812345678',1,'',0,'',NULL,'','2025-03-29 08:27:14','100','2025-04-02 06:15:01',0,0,NULL,1),(152,'yunai1','pbkdf2_sha256$600000$BMPHRS80yaLSWZZvfGLDGG$qLJbdVT+Y8QRBYbh/luUqIH2PtCm+qcp1FCE97c4TOk=','芋道',NULL,103,NULL,'yunai@iocoder.cn','15601691300',1,'',0,'',NULL,'','2025-04-03 02:02:20','','2025-04-03 02:02:21',0,0,NULL,1),(153,'yuanma1','pbkdf2_sha256$600000$ZDhEBsL5ZkNUh0xS1eHnvU$R1j/3EQ5314tF3/OtrTBc8XpUtXyt6CdKS15kesqqMY=','源码',NULL,104,NULL,'yuanma@iocoder.cn','15601701300',2,'avatars/2025/20250407115043178.jpg',0,'127.0.0.1','2025-04-23 23:56:03','','2025-04-03 02:02:21','','2025-04-23 23:56:03',0,0,'2025-04-07 07:24:07',1),(156,'abcd','pbkdf2_sha256$600000$Vz80hXrUe5s5sS96xeqqtm$35vMOQxtqYxf7XaT1QCZ0DZkrtZUmqgFoTcPExooRVc=','大力',NULL,NULL,NULL,'','',0,'',0,'127.0.0.1','2025-04-23 06:51:05','','2025-04-07 09:41:56','','2025-04-23 06:51:05',0,0,NULL,1);
/*!40000 ALTER TABLE `system_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yudao_demo01_contact`
--

DROP TABLE IF EXISTS `yudao_demo01_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yudao_demo01_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `sex` tinyint(1) NOT NULL COMMENT '性别',
  `birthday` datetime NOT NULL COMMENT '出生年',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '简介',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='示例联系人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yudao_demo01_contact`
--

LOCK TABLES `yudao_demo01_contact` WRITE;
/*!40000 ALTER TABLE `yudao_demo01_contact` DISABLE KEYS */;
INSERT INTO `yudao_demo01_contact` VALUES (1,'土豆',2,'2023-11-07 00:00:00','<p>天蚕土豆！呀</p>','http://127.0.0.1:48080/admin-api/infra/file/4/get/46f8fa1a37db3f3960d8910ff2fe3962ab3b2db87cf2f8ccb4dc8145b8bdf237.jpeg','1','2023-11-15 23:34:30','1','2023-11-15 23:47:39',_binary '\0',1);
/*!40000 ALTER TABLE `yudao_demo01_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yudao_demo02_category`
--

DROP TABLE IF EXISTS `yudao_demo02_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yudao_demo02_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `parent_id` bigint NOT NULL COMMENT '父级编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='示例分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yudao_demo02_category`
--

LOCK TABLES `yudao_demo02_category` WRITE;
/*!40000 ALTER TABLE `yudao_demo02_category` DISABLE KEYS */;
INSERT INTO `yudao_demo02_category` VALUES (1,'土豆',0,'1','2023-11-15 23:34:30','1','2023-11-16 20:24:23',_binary '\0',1),(2,'番茄',0,'1','2023-11-16 20:24:00','1','2023-11-16 20:24:15',_binary '\0',1),(3,'怪怪',0,'1','2023-11-16 20:24:32','1','2023-11-16 20:24:32',_binary '\0',1),(4,'小番茄',2,'1','2023-11-16 20:24:39','1','2023-11-16 20:24:39',_binary '\0',1),(5,'大番茄',2,'1','2023-11-16 20:24:46','1','2023-11-16 20:24:46',_binary '\0',1),(6,'11',3,'1','2023-11-24 19:29:34','1','2023-11-24 19:29:34',_binary '\0',1);
/*!40000 ALTER TABLE `yudao_demo02_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yudao_demo03_course`
--

DROP TABLE IF EXISTS `yudao_demo03_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yudao_demo03_course` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `student_id` bigint NOT NULL COMMENT '学生编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `score` tinyint NOT NULL COMMENT '分数',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yudao_demo03_course`
--

LOCK TABLES `yudao_demo03_course` WRITE;
/*!40000 ALTER TABLE `yudao_demo03_course` DISABLE KEYS */;
INSERT INTO `yudao_demo03_course` VALUES (2,2,'语文',66,'1','2023-11-16 23:21:49','1','2024-09-17 10:55:30',_binary '',1),(3,2,'数学',22,'1','2023-11-16 23:21:49','1','2024-09-17 10:55:30',_binary '',1),(6,5,'体育',23,'1','2023-11-16 23:22:46','1','2023-11-16 15:44:40',_binary '',1),(7,5,'计算机',11,'1','2023-11-16 23:22:46','1','2023-11-16 15:44:40',_binary '',1),(8,5,'体育',23,'1','2023-11-16 23:22:46','1','2023-11-16 15:47:09',_binary '',1),(9,5,'计算机',11,'1','2023-11-16 23:22:46','1','2023-11-16 15:47:09',_binary '',1),(10,5,'体育',23,'1','2023-11-16 23:22:46','1','2024-09-17 10:55:28',_binary '',1),(11,5,'计算机',11,'1','2023-11-16 23:22:46','1','2024-09-17 10:55:28',_binary '',1),(12,2,'电脑',33,'1','2023-11-17 00:20:42','1','2023-11-16 16:20:45',_binary '',1),(13,9,'滑雪',12,'1','2023-11-17 13:13:20','1','2024-09-17 10:55:26',_binary '',1),(14,9,'滑雪',12,'1','2023-11-17 13:13:20','1','2024-09-17 10:55:49',_binary '',1),(15,5,'体育',23,'1','2023-11-16 23:22:46','1','2024-09-17 18:55:29',_binary '\0',1),(16,5,'计算机',11,'1','2023-11-16 23:22:46','1','2024-09-17 18:55:29',_binary '\0',1),(17,2,'语文',66,'1','2023-11-16 23:21:49','1','2024-09-17 18:55:31',_binary '\0',1),(18,2,'数学',22,'1','2023-11-16 23:21:49','1','2024-09-17 18:55:31',_binary '\0',1),(19,9,'滑雪',12,'1','2023-11-17 13:13:20','1','2024-09-17 18:55:50',_binary '\0',1);
/*!40000 ALTER TABLE `yudao_demo03_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yudao_demo03_grade`
--

DROP TABLE IF EXISTS `yudao_demo03_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yudao_demo03_grade` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `student_id` bigint NOT NULL COMMENT '学生编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `teacher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '班主任',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生班级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yudao_demo03_grade`
--

LOCK TABLES `yudao_demo03_grade` WRITE;
/*!40000 ALTER TABLE `yudao_demo03_grade` DISABLE KEYS */;
INSERT INTO `yudao_demo03_grade` VALUES (7,2,'三年 2 班','周杰伦','1','2023-11-16 23:21:49','1','2024-09-17 18:55:31',_binary '\0',1),(8,5,'华为','遥遥领先','1','2023-11-16 23:22:46','1','2024-09-17 18:55:29',_binary '\0',1),(9,9,'小图','小娃111','1','2023-11-17 13:10:23','1','2024-09-17 18:55:50',_binary '\0',1);
/*!40000 ALTER TABLE `yudao_demo03_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yudao_demo03_student`
--

DROP TABLE IF EXISTS `yudao_demo03_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yudao_demo03_student` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `sex` tinyint NOT NULL COMMENT '性别',
  `birthday` datetime NOT NULL COMMENT '出生日期',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '简介',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yudao_demo03_student`
--

LOCK TABLES `yudao_demo03_student` WRITE;
/*!40000 ALTER TABLE `yudao_demo03_student` DISABLE KEYS */;
INSERT INTO `yudao_demo03_student` VALUES (2,'小白',1,'2023-11-16 00:00:00','<p>厉害</p>','1','2023-11-16 23:21:49','1','2024-09-17 18:55:31',_binary '\0',1),(5,'大黑',2,'2023-11-13 00:00:00','<p>你在教我做事?</p>','1','2023-11-16 23:22:46','1','2024-09-17 18:55:29',_binary '\0',1),(9,'小花',1,'2023-11-07 00:00:00','<p>哈哈哈</p>','1','2023-11-17 00:04:47','1','2024-09-17 18:55:50',_binary '\0',1);
/*!40000 ALTER TABLE `yudao_demo03_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mars-mgn'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-27 10:59:45
