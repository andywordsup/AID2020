-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user profile',7,'add_userprofile'),(20,'Can change user profile',7,'change_userprofile'),(21,'Can delete user profile',7,'delete_userprofile'),(22,'Can add topic',8,'add_topic'),(23,'Can change topic',8,'change_topic'),(24,'Can delete topic',8,'delete_topic'),(25,'Can add message',9,'add_message'),(26,'Can change message',9,'change_message'),(27,'Can delete message',9,'delete_message');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$h5ThWOtE8jOC$VWa6okB4vxw1Y5uHa2CNwJP7QG1iD2NXs3RErxbqJQw=','2020-09-27 15:27:00.081146',1,'tarena','','','aaa@aaa.com',1,1,'2020-09-24 14:55:34.857257');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-09-24 20:57:38.372816','andyssss','andyssss',3,'',7,1),(2,'2020-09-24 20:57:38.377067','andyccc','andyccc',3,'',7,1),(3,'2020-09-24 20:57:38.381652','andy123','andy123',3,'',7,1),(4,'2020-09-24 20:57:38.385580','andy111','andy111',3,'',7,1),(5,'2020-09-24 20:57:38.389657','andy100','andy100',3,'',7,1),(6,'2020-09-24 20:57:38.391987','222','222',3,'',7,1),(7,'2020-09-24 20:57:38.395907','111','111',3,'',7,1),(8,'2020-09-24 21:08:47.633377','15','Pytho',1,'[{\"added\": {}}]',8,1),(9,'2020-09-26 11:05:26.940378','15','Pytho',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(10,'2020-09-26 11:05:41.187341','15','Pytho',2,'[{\"changed\": {\"fields\": [\"introduce\"]}}]',8,1),(11,'2020-09-26 11:12:54.926947','15','Pytho',3,'',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'message','message'),(6,'sessions','session'),(8,'topic','topic'),(7,'user','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-08-31 10:14:46.743118'),(2,'auth','0001_initial','2020-08-31 10:14:47.391436'),(3,'admin','0001_initial','2020-08-31 10:14:47.529690'),(4,'admin','0002_logentry_remove_auto_add','2020-08-31 10:14:47.550534'),(5,'contenttypes','0002_remove_content_type_name','2020-08-31 10:14:47.637348'),(6,'auth','0002_alter_permission_name_max_length','2020-08-31 10:14:47.689044'),(7,'auth','0003_alter_user_email_max_length','2020-08-31 10:14:47.731763'),(8,'auth','0004_alter_user_username_opts','2020-08-31 10:14:47.745504'),(9,'auth','0005_alter_user_last_login_null','2020-08-31 10:14:47.782562'),(10,'auth','0006_require_contenttypes_0002','2020-08-31 10:14:47.787105'),(11,'auth','0007_alter_validators_add_error_messages','2020-08-31 10:14:47.802242'),(12,'auth','0008_alter_user_username_max_length','2020-08-31 10:14:47.965747'),(13,'sessions','0001_initial','2020-08-31 10:14:48.015279'),(14,'user','0001_initial','2020-08-31 10:14:48.043822'),(15,'topic','0001_initial','2020-09-05 08:25:18.126710'),(16,'message','0001_initial','2020-09-09 16:39:51.050263');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1mrmprlzk4tiht8ei5atl4puasrhdrns','ZGM3YjVhNzRmMDlkMDYzZDQyMDNiZmRkM2QwNjdjNGVjMjY3MmVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMmNlMDY0MTQwMDg2NmE3ZmVmY2JkM2Y1M2M1ZGIwZjQ2YTc2OTNlIn0=','2020-10-09 19:45:10.710622'),('sc1cdjy75ynfin177fmlxxwo2txaypco','ZGM3YjVhNzRmMDlkMDYzZDQyMDNiZmRkM2QwNjdjNGVjMjY3MmVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMmNlMDY0MTQwMDg2NmE3ZmVmY2JkM2Y1M2M1ZGIwZjQ2YTc2OTNlIn0=','2020-10-11 15:27:00.087053'),('wc637t4yakctyop685azopicu546rl6p','ZGM3YjVhNzRmMDlkMDYzZDQyMDNiZmRkM2QwNjdjNGVjMjY3MmVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMmNlMDY0MTQwMDg2NmE3ZmVmY2JkM2Y1M2M1ZGIwZjQ2YTc2OTNlIn0=','2020-10-08 14:55:55.915858');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `parent_message` int(11) NOT NULL,
  `publisher_id` varchar(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_publisher_id_bd1d4886_fk_user_profile_username` (`publisher_id`),
  KEY `message_topic_id_bb04ad2d_fk_topic_id` (`topic_id`),
  CONSTRAINT `message_publisher_id_bd1d4886_fk_user_profile_username` FOREIGN KEY (`publisher_id`) REFERENCES `user_profile` (`username`),
  CONSTRAINT `message_topic_id_bb04ad2d_fk_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (12,'<p>7777<br></p>','2020-09-23 17:59:49.637596',0,'root',12),(13,'博主回覆','2020-09-23 18:00:06.759485',12,'root',12),(14,'<p><br></p>','2020-09-28 14:48:07.524584',0,'superuser',31);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `category` varchar(20) NOT NULL,
  `limit` varchar(10) NOT NULL,
  `introduce` varchar(90) DEFAULT NULL,
  `content` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  `author_id` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_author_id_1d892d90_fk_user_profile_username` (`author_id`),
  CONSTRAINT `topic_author_id_1d892d90_fk_user_profile_username` FOREIGN KEY (`author_id`) REFERENCES `user_profile` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (8,'&lt;script&gt;alter(123)&lt;/script&gt;','tec','private','\'&lt;script&gt;alter(123)&lt;/','<p>\'&lt;script&gt;alter(123)&lt;/script&gt;\' 這人轉譯技術測試<br></p>','2020-09-07 20:02:04.359244','2020-09-07 20:02:04.359273','andy333'),(9,'測試','tec','public','測試','<p>測試<br></p>','2020-09-22 19:03:24.950959','2020-09-22 19:03:24.950993','andy333'),(10,'非技術','no-tec','public','非技術','<p>非技術<br></p>','2020-09-22 19:03:53.714361','2020-09-22 19:03:53.714393','andy333'),(11,'root123','no-tec','public','公開非技術','<p>公開非技術<br></p>','2020-09-22 19:29:42.963416','2020-09-22 19:29:42.963445','root123'),(12,'公開12345','tec','public','vaadfvdfvdfv f雖 66666wdwdw','<br><p><br></p><p>vaadfvdfvdfv f雖 66666wdwdw<br></p><p><br></p><br><p><br></p>','2020-09-22 19:39:18.847738','2020-09-26 14:52:50.427212','root'),(13,'private','tec','public','edfo j威','<br><p>edfo j威<br></p><p><br></p>','2020-09-23 19:59:34.259379','2020-09-26 14:52:56.383121','root'),(14,'伺服器錯誤回應','tec','public','HTTP 500 Internal Server Error','<br><p></p><p>HTTP 500 Internal Server Error 伺服器錯誤回應表明了伺服器碰上意外情況，令伺服器無法完成請求。 不管你的網站是不是採用WordPress 系統，任何放在伺服器當中的網頁都有可能發生這種錯誤。 本錯誤回應屬於通用的「全方位」回應。 一般來說，這代碼代表程式無法給出比500 更適當的回應。</p><p><br></p>','2020-09-24 14:25:56.528475','2020-09-26 14:53:40.283967','root'),(19,'Python語言在人工智能（AI）中的優勢','tec','public','為什麼 Python 能夠後來居上呢？？如果泛泛而論，我很可','<div style=\"text-align: center;\"><br></div><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"></p><p style=\"text-align: center;\"><br></p><h1 style=\"text-align: center;\">為什麼 Python 能夠後來居上呢？？</h1><h1 style=\"text-align: center;\"><br>如果泛泛而論，我很可以列舉 Python 的一些優點，比如語言設計簡潔優雅，對程式設計師友好，開發效率高。但我認為這不是根本原因，因為其他一些語言在這方面表現得並不差。</h1><h1 style=\"text-align: center;\"><br>還有人認為 Python 的優勢在於資源豐富，擁有堅實的數值演算法、圖示和資料處理基礎設施，建立了非常良好的生態環境，吸引了大批科學家以及各領域的專家使用，從而把雪球越滾越大。</h1><h1 style=\"text-align: center;\"><br>但我覺得這是倒因為果。為什麼偏偏是\n Python 能夠吸引人們使用，建立起這麼好的基礎設施呢？為什麼世界上最好的語言 PHP 裡頭就沒有 numpy \n、NLTK、sk-learn、pandas 和 PyTorch 這樣級別的庫呢？為什麼 JavaScript \n極度繁榮之後就搞得各種程式庫層次不齊，一地雞毛，而 Python 的各種程式庫既繁榮又有序，能夠保持較高水準呢？</h1><h1 style=\"text-align: center;\"><br>我認為最根本的原因只有一點：Python 是眾多主流語言中唯一一個戰略定位明確，而且始終堅持原有戰略定位不動搖的語言。相比之下，太多的語言不斷的用戰術上無原則的勤奮去侵蝕和模糊自己的戰略定位，最終只能等而下之。</h1><h1 style=\"text-align: center;\"><br>Python 的戰略定位是什麼？其實很簡單，就是要做一種簡單、易用但專業、嚴謹的通用組合語言，或者叫膠水語言，讓普通人也能夠很容易的入門，把各種基本程式元件拼裝在一起，協調運作。</h1><h1 style=\"text-align: center;\"><br>正是因為堅持這個定位，Python 始終把語言本身的優美一致放在奇技妙招前面，始終把開發者效率放在CPU效率前面，始終把橫向擴張能力放在縱向深潛能力之前。長期堅持這些戰略選擇，為 Python 帶來了其他語言望塵莫及的豐富生態。</h1><h1 style=\"text-align: center;\"><br>比如說，任何一個人，只要願意學習，可以在幾天的時間裡學會Python基礎部分，然後幹很多很多事情，這種投入產出比可能是其他任何語言都無法相比的。</h1><h1 style=\"text-align: center;\"><br>再比如說，正是由於 Python 語言本身慢，所以大家在開發被頻繁使用的核心程式庫時，大量使用 C 語言跟它配合，結果用 Python 開發的真實程式跑起來非常快，因為很有可能超過 80% 的時間系統執行的程式碼是 C 寫的。</h1><h1 style=\"text-align: center;\"><br>相反，如果 Python 不服氣，非要在速度上較勁，那麼結果很可能是裸速提高個幾倍，但這樣就沒人有動力為它開發 C 模組了，最後的速度遠不如混合模式，而且很可能語言因此會變得更復雜，結果是一個又慢又醜陋的語言。</h1><h1 style=\"text-align: center;\"><br>更重要的是，Python 的包裝能力、可組合性、可嵌入性都很好，可以把各種複雜性包裝在 Python 模組裡，暴露出漂亮的介面。</h1><h1 style=\"text-align: center;\"><br>很\n 多時候，一個程式庫本身是用 C/C++ 寫的，但你會發現，直接使用 C 或者 C++ \n去呼叫那個程式庫，從環境配置到介面呼叫，都非常麻煩，反而隔著一層，用其python 包裝庫更加清爽整潔，又快又漂亮。這些特點到了 AI \n領域中，就成了 Python 的強大優勢。</h1><h1 style=\"text-align: center;\"><br>Python 也藉助 AI 和資料科學，攀爬到了程式語言生態鏈的頂級位置。Python 與 AI綁在一起，對它們來說，無論是電子商務、搜尋引擎、社交網路還是智慧硬體，未來都只是生態鏈下游的資料奶牛、電子神經和執行工具，都將聽命於自己。</h1><h1 style=\"text-align: center;\"><br>Python為何能坐穩 AI 時代頭牌語言2</h1><h1 style=\"text-align: center;\"><br>對程式語言發展歷史缺乏瞭解的人可能會覺得，Python 的戰略定位是犬儒主義和缺乏進取心的。但事實證明，能同時做到簡單而嚴謹、易用而專業，是很難的，而能夠堅守膠水語言的定位，更是難上加難。</h1><h1 style=\"text-align: center;\"><br>有的語言，從一開始就是出於學術而非實用的目的，學習曲線過於陡峭，一般人很難接近。</h1><h1 style=\"text-align: center;\"><br>有的語言，過於依賴背後金主的商業支援，好的時候風光無限，一旦被打入冷宮，連生存下去都成問題。</h1><h1 style=\"text-align: center;\"><br>有的語言，設計的時候有明確的假想場景，要麼是為了解決大規模併發，要麼是為了解決矩陣運算，要麼是為了做網頁渲染模板，一旦離開這個場景，就各種不爽。</h1><h1 style=\"text-align: center;\"><br>更多的語言，剛剛取得一點成功，就迫不及待的想成為全能冠軍，在各個方向上拼命的伸展觸角，特別是在增強表達能力和提升效能方面經常過分積極，不惜將核心語言改得面目全非，最後變成誰都無法掌控的龐然大物。</h1><h1 style=\"text-align: center;\"><br>相比之下，Python 是現代程式語言設計和演化當中的一個成功典範。</h1><h1 style=\"text-align: center;\"><br>Python 之所以在戰略定位上如此清晰，戰略堅持上如此堅定，歸根結底是因為其社群構建了一個堪稱典範的決策和治理機制。</h1><h1 style=\"text-align: center;\"><br>這個機制以\n Guido van Rossum (BDFL，Pythoners 都知道這是什麼意思), DavidBeazley, Raymond \nHettinger 等人為核心，以 PEP 為組織平臺，民主而有序，集中而開明。只要這個機制本身得以維繫，Python \n在可見的未來裡仍將一路平穩上行。</h1><h1 style=\"text-align: center;\"><br>最有可能向 Python 發起挑戰的，當然是Java。Java 的使用者存量大，它本身也是一種戰略定位清晰而且非常堅定的語言。</h1><h1 style=\"text-align: center;\"><br>但我並不認為 Java 有很大的機會，因為它本質上是為構造大型複雜系統而設計的。什麼是大型複雜系統？就是由人清清楚楚描述和構造出來的系統，其規模和複雜性是外生的，或者說外界賦予的。</h1><h1 style=\"text-align: center;\"><br>而 AI 的本質是一個自學習、自組織的系統，其規模和複雜性是一個數學模型在資料的餵養下自己長出來的，是內生的。</h1><h1 style=\"text-align: center;\"><br>因此，Java大多數的語言結構對於大資料的處理和 AI 系統的開發顯得使不上勁，你強的東西這裡用不上，這裡需要的東西你做起來又彆扭。</h1><h1 style=\"text-align: center;\"><br>而 Python 在資料處理方面的簡潔強悍早就盡人皆知。對比兩個功能相同的 Java 和 Python 機器學習程式，正常人只要看兩眼就能做出判斷，一定是 Python 程式更加清爽痛快。</h1><h1 style=\"text-align: center;\"><br></h1><div style=\"text-align: center;\"><br></div><div style=\"text-align: center;\">資料來源：<br><p>Python語言在人工智慧(AI)中的優勢- IT閱讀 - ITREAD01.COM</p></div><p style=\"text-align: center;\"><br><br></p><p style=\"text-align: center;\"><br></p>','2020-09-26 11:28:11.681184','2020-09-27 16:41:08.634269','superuser'),(20,'修改測試','tec','public','fcdjhgfukhk u修改測試','<br><p><br></p><p>fcdjhgfukhk u<br></p><p><br></p><p><br></p><p></p><h1><span style=\"font-weight: bold;\">修改測試</span><br></h1><p><br></p>','2020-09-26 11:45:44.391390','2020-09-26 14:52:27.173507','superuser'),(21,'cucucuc','tec','public','許多人想要學程式，希望未來能轉職為軟體工程師，但往往在琳瑯滿','<br><p></p><p>許多人想要學程式，希望未來能轉職為軟體工程師，但往往在琳瑯滿目的程式語言和工具中迷航，不知道從何開始。好不容易學會了一個語言，那接下來要學什麼呢？若因為毫無頭緒而消耗了學習熱忱，實在很可惜。<br><br>想成為前端、後端與全端工程師，必備的核心技能和就業門檻有何不同呢？你比較適合走哪條路呢？為了給更多有志成為軟體工程師的人們一條清楚的方向，我們請教從ALPHA Camp 畢業、已成功轉職軟體工程師的學長姐們，以及業界老師和助教，列出在實務上會應用到的核心技能與工具。本文統整出前端、後端與全端工程師技能表，希望能成為學習者在修習技能時的參考。<br><br><br>除了前端、後端與全端工程師，本文也會介紹 DevOps 工程師的技能與工作項目。雖然 DevOps 工程師需要一定的資歷才能勝任，但因為薪資待遇佳、工作挑戰大、也是一個不錯的職涯目標。</p><p><br></p>','2020-09-26 12:55:04.944843','2020-09-26 14:53:46.287430','root'),(22,'跟上時代，現代人需要學Python的五大理由!','tec','public','跟上時代，現代人需要學Python的五大理由理由一：容易學、','<div style=\"text-align: center;\"><br></div><p style=\"text-align: center;\"></p><div style=\"text-align: center;\"><h1>跟上時代，現代人需要學Python的五大理由</h1></div><p style=\"text-align: center;\"><br></p><h1 style=\"text-align: center;\">理由一：容易學、好上手</h1><p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">Python對於新手而言是相對容易學習與上手，也可以說是最容易使用的程式語言之一，主要在於它的語法是簡化而不複雜的，同時強調自然語言，更貼近使用者的習慣。由於Python降低了操作門檻，因此跟其他程式語言相比，可以更輕鬆且快速執行。</h2><p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">Python是在1980年代由荷蘭電腦工程師吉多·范羅蘇姆（Guido van Rossum）所開發，他當時設計的初衷，就是希望將Python設計成具通用、普遍性的語言，即使是業餘開發人員也可以輕鬆閱讀和理解。</h2><p style=\"text-align: center;\"><br></p><h1 style=\"text-align: center;\">理由二：成熟且具支持性的Python社群</h1><p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">經過三十年的養成，Python的社群已經成長茁壯，有足夠的能量可以支持從初階入門者到專家級別的開發人員。這個社群提供了大量有關Python語言的文件、指引和教學影片，讓不同級別或年紀的學習者與開發人員都可以使用，增強他們在撰寫Python程式所需的知識<strong></strong>。</h2><p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">任何一個程式語言，如果缺少了開發人員所提供的文件或支持，那麼它就很難被廣泛使用。Python就沒有這類的問題，因為它已經存在很長的時間，而且是最活躍的程式語言社群之一。這也意味著，如果有人對Python有疑問，他們可以從社群裡來自不同地方的開發人員獲得即時性的支持。</h2><p style=\"text-align: center;\"><br></p><h1 style=\"text-align: center;\">理由三：上百個Python函式庫與框架</h1><p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">因為背後強大的社群，Python有上百個出色的函式庫供開發者來使用，這可以大幅節省開發初期所耗費的時間與精力。除此之外，許多雲端服務供應商也以類似函式庫的方式提供跨平台支援的工具，這對開發者來說，是非常大的助益。</h2><p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">另外，還有許多專精於特定用途的函式庫，例如專門處理自然語言的NLTK(natural language toolkit)，或是應用於機器學習的 scikit-learn，都可以透過Python來操作。</h2><h2 style=\"text-align: center;\"><br></h2><h2 style=\"text-align: center;\">除此之外，還有許多函式庫與框架可以透過Python處裡</h2><h2 style=\"text-align: center;\">適用於繪製圖表的matplotib</h2><h2 style=\"text-align: center;\">適用於工程應用、科學和數學的SciPy</h2><h2 style=\"text-align: center;\">適用於HTML解析和XML的BeautifulSoup</h2><h2 style=\"text-align: center;\">適用於科學計算的NumPy</h2><h2 style=\"text-align: center;\">適用於服務器端Web開發的Django</h2><div style=\"text-align: center;\"><br></div><h1 style=\"text-align: center;\">理由四：多功能、可靠性與速度</h1><p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">若是詢問任何一位使用Python寫程式的開發人員，他們會完全同意Python是一個可靠的工具，而且比大多數市面上的程式語言還要快速。Python幾乎可以在任何類型的環境中使用，而且無論使用哪種平台，幾乎不會遇到任何效能損失的問題。</h2><h2 style=\"text-align: center;\">談到Python的多功能性，它可以在多種環境中使用，例如移動應用程式、電腦應用程式、網頁開發，以及硬體程式等。也因為它擁有大量的應用程式，Python的多功能性對使用者來說更具吸引力。</h2><p style=\"text-align: center;\"><br></p><h1 style=\"text-align: center;\">理由五：大數據、機器學習與雲端運算</h1><p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">雲端運算、機器學習和大數據是今天電腦科學界最熱門的趨勢，它們可以幫助許多企業改變和優化工作流程。相較於R語言，Python被認為更具通用性，成為數據科學和分析最受歡迎的工具，目前許多企業進行數據處理、分析的工作，都是以Python來進行。</h2><p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">不僅如此，每天都有成千上萬的機器學習專案正在使用數百個Python函式庫，例如用於神經網路的TensorFlow和用於電腦視覺OpenCV等。</h2><p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">人人學Python已經是未來的趨勢，它的易用性、多功能與廣泛應用，賦予許多非本科系的學生、白領工作者握有進入人工智慧領域的鑰匙。因此專家也建議，培養與機器對話的能力，不論未來機器人如何發展，都有十足的信心不被取代，而且如虎添翼。</h2><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\">資料來源：</p><p style=\"text-align: center;\">https://notcodingwilldie.blogspot.com/2018/04/python-windows-10-python.html</p><p style=\"text-align: center;\"><br></p>','2020-09-26 16:22:26.424821','2020-09-27 16:41:36.034938','superuser'),(23,'python-win10下使用方式學習','tec','public','《十分鐘學程式》PYTHON 環境建置 -- WINDOWS','<br><p></p><h2>《十分鐘學程式》PYTHON 環境建置 -- WINDOWS 10 上安裝 PYTHON<br>如果之前都沒有接觸過程式語言，然後想要從網路上自學的人，一開始一定是問谷哥該從甚麼語言開始學起。如果是正統體係出來的人多半是回答：『從C 語言開始學起』，雖然這在這個社會上已經很不切實際，但是如果有人這樣問我，我想我還是會這樣回答的，會這樣回答並不是沒有原因，畢竟很多人會覺得要從簡單的開始學起，為何一開始就要從這麼難的語言開始，原因很簡單，『如果學會了C，那麼恭喜目前多數的程式語言您都會了!!』。不過谷哥應該不會這樣回您，現今越來越多人推薦『從 Python 開始學起』。<br><br>Python 是一個很年輕的語言，年紀應該和我差不多，又或者大我幾歲而已。這麼新的語言適合新手學習嗎?老實說，還真的蠻適合的，原因有幾點：<br>1. Python 是一種直譯語言。<br>2. 擁有非常強大且龐大的 Library 庫。<br>3. 可跨平台使用。<br><br>鋪成那麼久，都快離題了，這堂課就是要教大家如何在 Windows 10 上建立 Python 環境。其實在 MAC OS 和 Linux 都已經有內建 Python，因此沒有安裝建構問題，不過 Windows 就是比較頑固，喜歡和別人不一樣因此我們需要手動幫他安裝 Python。<br><br>《在 Windows 10 上安裝 Python 》<br>Step 1.<br>上 Python 官網下載安裝檔。這邊我們使用 Python 3，因此選擇『Download Python 3.6.5』。當然隨著版本更新，之後一定不是 3.6.5 版。<br><br><br><br>Step 2.<br>下載完成後，點開安裝檔，可以直接點選『Install Now』完全使用他的預設值，包含預設目錄。不過因為預設目錄真的太深層了，因此我會去更改他的安裝目錄，點選『Customize installation』。<br><br><br>Step 3.<br>這邊的設定不用修改，直間點選『Next』。<br><br><br>Step 4.<br>我將 Python 安裝到 C:/Python365，大家也可以和我一樣，或是安裝到自己喜歡的目錄 (重點是自己要記得安裝在哪裡)。修改完安裝目錄後，直接點擊『Install』。<br><br><br>Step 5.<br>看到這個畫面就是已經安裝完成了。按『Close』把它關掉吧!!<br><br><br>Step 6.<br>接著我們要讓傲慢的 Windows 知道 Python 安裝在哪邊。鍵盤按下 『windows建』+ E 打開檔案總管，在『本機』點選右鍵，在點選『內容』。<br><br><br>Step 7.<br>點選『進階系統設定』。<br><br><br><br>Step 8.<br>此時就會進入系統內容，在『進階』頁面點選『環境變數(N)...』。<br><br><br>Step 9.<br>在上方使用者變數欄位找到 Path，點擊『編輯(E)...』。<br><br><br>Step 10.<br>按『新增』，把剛剛安裝目錄填到下方欄位，最後按下『確定』。<br><br><br>Step 11.<br>按下『確定』。把所有剛剛打開的設定頁面全部關掉。<br><br><br>Step 12.<br>最後我們要確定 Windows 是否已經知道 Python 的存在。接著我們利用 cmd 來確認是否真的有設定成功。按下『windows 鍵』+ R，開啟『執行』對話框，輸入『cmd』，並點擊『確定』。<br><br><br>Step 13.<br>輸入『python -V』，看吐出來的資訊版本號是否為剛剛安裝的版本，到這一步就已經安裝好嚕。其實根本不需要教學 XD。<br><br><br>Step 14.<br>一開始說過，Python 是直譯語言，所以其實不用安裝什麼 IDE 就可以開始寫 Python 程式了。用 Windows 內建的『記事本』也是可以寫的，不過沒那麼好用就是了。因此還是會安裝一些輔助的開發程式，我個人是使用 Sublime Text，下一堂課就教大家如何安裝 Sublime Text 以及如何在上面開發 Python 程式。</h2><p><br></p><p>資料來源：</p><p>https://aiacademy.tw/article-5-reasons-learning-python/</p><p><br></p>','2020-09-26 16:25:42.791042','2020-09-26 16:31:01.178326','superuser'),(24,'利用手機隨時隨地編寫python代碼','tec','public','現在越來越多人學習python，很多小夥伴都富有激情的，利用','<h2>現在越來越多人學習python，很多小夥伴都富有激情的，利用碎片化的時間都要學習，大家都知道pyhton是簡單易學的，但是光說不練，假把式，最好能編程並且運行，最好能有一款在手機上可以隨時隨地編寫python代碼，而且功能齊全的app。<br> <br>下面為大家列舉幾種，我知道的手機上的python編輯器。<br><br>Android系統：<br><br>Python編譯器是一款非常精鍊的APP，主要為Python初學者提供直接運行的功能，能夠隨手驗證一些小程序。<br><br>Python新手用戶製作的一款手機編程學習工具，支持手機Python代碼編譯、腳本測試等功能，介面清爽，功能實用！<br><br>該軟體支持直接從文件管理器中打開代碼文件，方便用戶瀏覽查看。<br><br>Qpython是一個Python引擎，只能運行在安卓系統上，它可以全圖形介面操作，非常友好。<br><br>內置了一個Python編輯器，可以直接在手機上寫Python代碼，支持縮進，語法高亮等特性。<br><br>也內置了一個ftp，可以很方便的拷貝電腦上的py文件到手機上運行。<br><br>由於內置了SL4A，可以很方便的調用安卓作業系統的一些API做些有趣的事情，比如可以通過SL4A獲取手機地理位置，打開藍牙，發送手機簡訊，打開手機攝像頭等等。<br><br>pydroid3，這是一個非常不錯的手機python編程軟體，它擁有非常強大的編譯器,可以幫助您編輯python程序，pydroid3手機版不需要電腦也能夠時刻提高您的個人代碼編輯水平!<br><br><br> <br>支持在命令行終端運行pip命令為pip命令提供了良好的圖形化管理介面，自動檢測代碼導入的庫如果沒有安裝會自動提示安裝，支持kivy、matplotlib等推行庫<br><br>pydroid3的符號面板比較豐富，避免了手機輸入法中找符號的繁瑣。<br><br>ios系統：<br><br>Pythonista是在iPad和iPhone上編寫Python腳本的一個完整的開發環境。<br><br>它包含了許多示例：繪畫遊戲動畫、圖像處理、自定義用戶介面和自動化腳本。<br><br>除了強大的標準庫之外，Pythonista還提供了與本地iOS特性交互的廣泛支持，比如聯繫人、提醒、照片、位置數據等等。全功能的代碼編輯器Pythonista的專業代碼編輯器提供語法高亮顯示、智能代碼完成以及專門為Python設計的擴展螢幕鍵盤。<br><br>一個方便的大綱視圖允許您高效地瀏覽您的腳本，並且多個選項卡可以輕鬆地在更大的項目上工作。圖形和多點觸控Pythonista有很多易於使用的2D圖形庫、多點觸控和音效庫。你甚至可以使用加速度計來創造運動控制的遊戲或互動實驗。</h2><div><br></div><div>資料來源：<br></div><div><p>手機有什麼python編譯器- 每日頭條</p></div>','2020-09-26 16:36:05.960994','2020-09-26 16:36:05.961026','superuser'),(25,'python到底可以做什麼呢？','tec','public','先說個笑話，很多人一開始學習Python 的時候，會感到無聊','<p>先說個笑話，很多人一開始學習Python 的時候，會感到無聊和枯燥，因為一開始都不知道那些循環語句呀、列表呀、元組等知識點的用武之地，所以慢慢的就沒什麼動力了，然後就去買滑板鞋，開始在地上摩擦，像魔鬼的步伐。逢人就說：“Python沒用，這玩意不好找工作，就是拿來玩玩～”<br></p><h3>最近有不少 b 友想知道 Python 除了爬蟲之外，還能玩點啥呢？那麼小帥b接下來就來說說我知道的可以使用 Python 做的事情，讓你發現更多的方向。</h3><p><br></p><h1>1、爬蟲</h1><p><br></p><h3>這玩意不用我多說了，我最近分享的大部分教程就是爬蟲，如果你對爬蟲感興趣的話可以看看我之前寫的那些文章，也可以看看這個：python如何賺錢？ python爬蟲如何進階？ python就業？如何快速入門python？ .....</h3><p><br><br></p><h1>2、數據分析</h1><p><br></p><h3>現在的人們越來越不理智了，總是把自己的想法強加到別人的身上，“感覺”會欺騙人，但是“數據”不會，數據是相對來說比較真實的反應，打開你的手機，看看在哪個應用的用時最長，你說你每天學習，但是一看，挖槽，抖音用了3 個小時，遊戲玩了4 個小時，你說你在學習？<br></h3><h3>這就是數據分析最簡單的解釋，對我們比較重視的事情，通過數據進行可視化分析，Python 讓你理智些，克制些。</h3><p><br><br></p><h1>3、機器學習</h1><p><br></p><h3>現在不是各種吹人工智能麼，機器學習就是人工智能的一個分支，它的應用太廣泛了，比如自然語言處理，搜索引擎，各種識別技術，數據挖掘等等。<br></h3><p><br></p><p><br></p><h1>4、APP開發</h1><p><br></p><h3>是的，python 可以開發OS X，Linux，Windows，iOS，Android 等平台的應用。如果你感興趣，完全可以使用 Python 開發一個屬於你自己的 App 然後上架。</h3><p><br><br></p><h1>5、遊戲開發</h1><p><br></p><h3>經常玩遊戲爽歪歪，有沒有想過自己搞一個遊戲給別人爽歪歪呢？ Pygame 就是一個不錯的 Python 庫，這個庫的牛逼之處在於它是免費開源的 Python 語言庫，使用它開發的遊戲幾乎可以運行在所有常用的操作系統裡面。</h3><p><br><br><br></p><h1>6、自動化腳本</h1><p><br></p><h3>自動化腳本用 Python 來寫是很爽的，那些頻繁的、重複的、無腦的操作，你都可以自己寫一個 Python 腳本讓電腦幫你操作，可以節省你大量的時間。別人一個文件一個文件的操作，一條命令一條命令的執行。你倒好，直接一鍵幹翻。</h3><p><br></p><h1>7、網站開發</h1><p><br></p><h3>web開發現在用 Python 的也不少了，開發起來簡單又高效，因為 Python 也有網站開發相關的框架，比如 Flask、Django、Bottle。有了它們，不管你是開發個人網站也好，企業網站也罷， Python 都能勝任。</h3>','2020-09-27 15:12:47.146007','2020-09-27 15:12:47.146055','superuser'),(26,'Python安裝pip及pip版本管理終極教程','tec','public','有時候電腦或服務器裡需要安裝多個版本的Python，比如Py','<h3>有時候電腦或服務器裡需要安裝多個版本的Python，比如Python2.7、Python3.5、Python3.6。同時存在多個版本的Python，如何安裝對應的pip成為一個頭疼的問題，本文從原理入手，詳解如何安裝對應Python版本的pip，當然也適合單一版本Python的pip的安裝。<br><br>本文所用系統環境：Ubuntu16。<br><br>pip，說到底只是Python的一個包，平時我們安裝Python包都是用pip安裝的，那麼pip怎麼安裝？最簡單的方法，可以使用下面命令：<br><br>sudo apt-get install python-pip<br>或<br><br>sudo apt-get install python3-pip<br>那麼如果要為Python3.5和Python3.6同時安裝pip這種方法就不行了，網上有很多方法，小編也是看的頭暈眼花，那麼下面小編介紹一種方法來從根本上解決多版本Python安裝對應pip的問題，以及對pip對應Python版本進行管理。<br><br>第一步，安裝pip包<br><br>上面說了，pip說到底就是Python的一個包。所以首先我們就要先安裝這個包，用下面兩行命令來安裝：<br><br>curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py<br>python get-pip.py<br>如果你要為Python3.6安裝pip，就把上面第二行命令換成：<br><br>python3.6 get-pip.py<br>同理，為Python3.5安裝則換成相應版本。然後查看一下是否安裝成功：<br><br>pip -V<br>顯示下面說明安裝成功。<br><br>pip 10.0.1 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)<br>其實到這已經成功安裝指定版本Python對應的pip，如果只為安裝pip則下一步可以不看。<br><br>第二步，管理pip對應的Python版本<br><br>我們發現，每次安裝pip，它都會把默認pip對應的Python修改，導致pip對應版本混亂。首先用下面命令查看pip對應的Python版本：<br><br>pip -V<br>pip2 -V<br>pip3 -V<br>可能pip對應的是Python3.6，pip3對應的也是Python3.6。如果想讓pip對應Python2.7，pip3對應Python3.5怎麼辦呢？<br><br>轉到下面目錄：<br><br>cd /usr/local/bin<br>然後ls一下可能會發現好多pip文件，比如pip、pip2、pip2.7、pip3、pip3.5等等。使用一下命令：<br><br>file pip<br>輸出：pip: Python script, ASCII text executable。發現pip其實是個Python腳本。於是我們用vim打開它：<br><br>#!/usr/bin/python3.6<br><br># -*- coding: utf-8 -*-<br>import re<br>import sys<br><br>from pip._internal import main<br><br>if __name__ == \'__main__\':<br>sys.argv[0] = re.sub(r\'(-script\\.pyw?|\\.exe)?$\', \'\', sys.argv[0])<br>sys.exit(main())<br>看第一行，第一行指定了這個腳本對應的python版本，如果想把pip對應的python版本改為2.7的，只需修改python3.6為python2.7即可。修改保存後執行：<br><br>pip -V<br>若出現下面提示<br><br>Traceback (most recent call last):<br>File \"/usr/local/bin/pip\", line 7, in &lt;module&gt;<br>from pip._internal import main<br>ImportError: No module named _internal<br>則說明修改後的python（上文修改的為python2.7）沒有安裝pip包，使用第一步的方法安裝pip包即可。<br><br>同理，如果想新建一個，比如新建一個pip3.6，touch pip3.6，然後把上面內容粘進去即可，其它版本也同理，最後別忘了為新建的文件加上可執行權限。<br><br>但是，不同版本pip對應的這個腳本文件的內容不同，上面顯示的是pip 10.0版本的，其它版本的腳本文件內容可能與之不同。直接改這個腳本文件來修改pip對應的python版本的前提是：當前腳本文件對應的Python版本與要修改對應的Python版本的pip包版本最好一致，不一致很可能出錯。最簡單的解決辦法是都升級為最新的pip版本。<br><br>到此為止，我們可以對pip為所欲為了。</h3><div><br></div><div>資料來源：</div><div>知乎<br></div>','2020-09-27 15:17:43.203151','2020-09-27 15:17:43.203184','superuser'),(27,'python中打開TXT文件報錯','tec','public','相信現在很多文件使用txt（文本文件）存儲信息比較方法。但是','<div style=\"text-align: left;\"><br></div><p style=\"text-align: left;\"></p><div style=\"text-align: left;\"><br></div><p style=\"text-align: left;\"></p><h3 style=\"text-align: left;\">相信現在很多文件使用txt（文本文件）存儲信息比較方法。但是Python如何打開txt而不會報錯，是一件頭疼的事情。本文試圖講清楚Python中open的使用[1]。</h3><h3 style=\"text-align: left;\"><br>1、open函數</h3><h3 style=\"text-align: left;\">為了能夠在Python中打開文件進行讀寫，那麼需要依賴open函數。 open函數主要運用到了兩個參數——文件名和mode。文件名是添加該文件對象的變量，mode是告訴編譯器和開發者文件通過怎樣的方式進行使用。因此在Python中打開文件的代碼如下：</h3><h3 style=\"text-align: left;\"><br>file_object = open(\'filename\', \'mode\')</h3><h3 style=\"text-align: left;\">mode</h3><h3 style=\"text-align: left;\">mode參數可以不寫，默認mode參數是“r”。 mode參數如下：</h3><h3 style=\"text-align: left;\"><br>• ‘r’ – 只讀模式，當文件處在“只讀”的模式時使用。</h3><h3 style=\"text-align: left;\"><br>• ‘w’ –寫入模式，將新信息編輯寫入文件中的時候使用（在使用該模式的時候、任何現存的同名文件的內容將會被擦除、從而寫入新的內容）</h3><h3 style=\"text-align: left;\"><br>慎用該模式：哪怕僅僅是運行了file=open(“filename”, “w”)這句話，那麼該文件中所有內容全部被擦除。</h3><h3 style=\"text-align: left;\"><br>• ‘a’ – append模式，將新數據加到文件末尾，不會擦除現存的同名文件的內容。</h3><h3 style=\"text-align: left;\"><br>• ‘r+’ – 特殊的“讀取”+“寫入”模式，當同時存在讀寫操作的時候使用。</h3><h3 style=\"text-align: left;\"><br>創建文本文件create a text file</h3><h3 style=\"text-align: left;\">file = open(\'testfile.txt\', \'w\')</h3><h3 style=\"text-align: left;\"><br>file.write(\'Hello World\\n\')</h3><h3 style=\"text-align: left;\">file.write(\'This is our new text file\\n\')</h3><h3 style=\"text-align: left;\">file.write(\'and this is another line. \\n\')</h3><h3 style=\"text-align: left;\">file.write(\'Why? Because we can. \\n\')</h3><h3 style=\"text-align: left;\"><br>file.close()</h3><h3 style=\"text-align: left;\">那麼在本地會出現一個叫做testfile的文本文件，裡面寫著</h3><h3 style=\"text-align: left;\"><br>Hello World</h3><h3 style=\"text-align: left;\">This is our new text file</h3><h3 style=\"text-align: left;\">and this is another line</h3><h3 style=\"text-align: left;\">Why? Because we can.</h3><h3 style=\"text-align: left;\">2、讀取：在python中讀取txt文件</h3><h3 style=\"text-align: left;\">將某個txt文件中的所有內容全部打印出來，先讀取再打印</h3><h3 style=\"text-align: left;\"><br>file = open(\'testfile.text\', \'r\')</h3><h3 style=\"text-align: left;\">print(file.read())</h3><h3 style=\"text-align: left;\">將會把該文本文件中所有的內容展示出來。</h3><h3 style=\"text-align: left;\"><br></h3><h3 style=\"text-align: left;\"><br>另一種讀取文件的方式是調用某些字符。</h3><h3 style=\"text-align: left;\"><br>例如，下面的代碼中，編譯器將會讀寫文本文件中儲存的前5個字符：</h3><h3 style=\"text-align: left;\"><br>file = open(\'testfile.txt\', \'r\')</h3><h3 style=\"text-align: left;\">print(file.read(5))</h3><h3 style=\"text-align: left;\">逐行輸出</h3><h3 style=\"text-align: left;\">如果想要逐行輸出——而不是一股腦把所有的內容打印出來、以至於沒有換行、所有內容都擠在一起，那麼需要調用readlines()函數。當每次調用這個方法的時候，將會把文本中的每一行作為一個元素放在list中，返回包含了所有行的list。</h3><h3 style=\"text-align: left;\"><br>file = open(\'testfile.txt\', \'r\')</h3><h3 style=\"text-align: left;\">print(file.readlines())</h3><h3 style=\"text-align: left;\">如果需要指定打出第2行，那麼代碼如下：</h3><h3 style=\"text-align: left;\"><br>file = open(\'testfile.txt\', \'r\')</h3><h3 style=\"text-align: left;\">print(file.readlines()[1])</h3><h3 style=\"text-align: left;\">循環文本文件</h3><h3 style=\"text-align: left;\">當讀取或者返回文件中所有行的時候，一個更加有效的方式是通過循環讀取。逐行輸出代碼如下：</h3><h3 style=\"text-align: left;\"><br>file = open(\'testfile.txt\', \'r\')</h3><h3 style=\"text-align: left;\">for line in file:</h3><h3 style=\"text-align: left;\">print(line)</h3><h3 style=\"text-align: left;\">3、文件寫入</h3><h3 style=\"text-align: left;\">file = open(\'testfile.txt\', \'w\')</h3><h3 style=\"text-align: left;\"><br>file.write(\'This is a test\')</h3><h3 style=\"text-align: left;\">file.write(\'To add more lines.\')</h3><h3 style=\"text-align: left;\"><br>file.close()</h3><h3 style=\"text-align: left;\">關閉文件</h3><h3 style=\"text-align: left;\">當操作完成之後，使用file.close()來結束操作，從而終結使用中的資源，從而能夠釋放內存。</h3><h3 style=\"text-align: left;\"><br>真實世界中的文件處理</h3><h3 style=\"text-align: left;\">打開文本文件：</h3><h3 style=\"text-align: left;\"><br>fh = open(\'hello.txt\', \'r\')</h3><h3 style=\"text-align: left;\">讀取文本文件：</h3><h3 style=\"text-align: left;\"><br>fh = open(\'hello.txt\', \'r\')</h3><h3 style=\"text-align: left;\">print(fh.read())</h3><h3 style=\"text-align: left;\">將新的信息寫入文本中、並擦除原來的信息：</h3><h3 style=\"text-align: left;\"><br>fh = open(\'hello.txt\', \'w\')</h3><h3 style=\"text-align: left;\"><br>fh.write(\'Put the text you want to add here\')</h3><h3 style=\"text-align: left;\">fh.write(\'and more lines if need be.\')</h3><h3 style=\"text-align: left;\"><br>fh.close()</h3><h3 style=\"text-align: left;\">在現存的文件中加入新的內容、不會擦除原來的內容：</h3><h3 style=\"text-align: left;\"><br>fh = open(\'hello.txt\', \'a\')</h3><h3 style=\"text-align: left;\">fh.write(\'We Meet Again World\')</h3><h3 style=\"text-align: left;\">fh.close()</h3><h3 style=\"text-align: left;\">4、with open使用聲明——statement</h3><h3 style=\"text-align: left;\">通過使用with statement處理文本文件，從而能夠提供更加間接的代碼和報錯機制。</h3><h3 style=\"text-align: left;\"><br>使用這個方法的好處之一是打開任何文件將能夠在操作結束之後自動關閉文件，因此不必再寫file.close()。</h3><h3 style=\"text-align: left;\"><br>with open(\'filename\') as file:</h3><h3 style=\"text-align: left;\">那麼例子如下：</h3><h3 style=\"text-align: left;\"><br>with open(\'testfile.txt\') as file:</h3><h3 style=\"text-align: left;\">data = file.read()</h3><h3 style=\"text-align: left;\">do something with data</h3><h3 style=\"text-align: left;\">當然，也能夠循環文本文件的方式操作：</h3><h3 style=\"text-align: left;\"><br>with open(\'testfile.txt\') as f:</h3><h3 style=\"text-align: left;\">for line in f:</h3><h3 style=\"text-align: left;\">print(line)</h3><h3 style=\"text-align: left;\">在文本文件中對行進行拆分</h3><h3 style=\"text-align: left;\"><br>with open(\'hello.text\', \'r\') as f:</h3><h3 style=\"text-align: left;\">data = f.readlines()</h3><h3 style=\"text-align: left;\">for line in data:</h3><h3 style=\"text-align: left;\">words = line.split()</h3><h3 style=\"text-align: left;\">print(words)</h3><h3 style=\"text-align: left;\">以上就是關於Python中open函數的使用。希望能夠幫助到大家。</h3><p style=\"text-align: left;\"><br>參考<br>^https://www.pythonforbeginners.com/files/reading-and-writing-files-in-python</p><p style=\"text-align: left;\"><br></p>','2020-09-27 15:41:53.755730','2020-09-27 17:11:12.887433','superuser'),(28,'Python','tec','public','Python 簡介⦁ 程序員：程序設計人員。⦁ 程序：&nb','<p>Python 簡介<br>⦁ 程序員：<br>程序設計人員。<br>⦁ 程序：<br>&nbsp;&nbsp;&nbsp; 一組計算機能識別和執行的指令，是實現某種需求的軟件。<br>⦁ 操作系統：<br>&nbsp;&nbsp;&nbsp; 管理和控制計算機軟件與硬件資源的程序；<br>&nbsp;&nbsp;&nbsp; 隔離不同硬件的差異，使開發程序簡單化。<br>&nbsp;&nbsp;&nbsp; 例如，Windows，Linux，Unix。<br>⦁ 硬件：<br>&nbsp;&nbsp;&nbsp; 主板--計算機的主要電路系統。<br>&nbsp;&nbsp;&nbsp; CPU --主要負責執行程序指令，處理數據。<br>&nbsp;&nbsp;&nbsp; 硬盤--持久化存儲數據的記憶設備，容量大，速度慢。<br>&nbsp;&nbsp;&nbsp; 內存--臨時存儲數據的記憶設備，容量小，速度快。<br>&nbsp;&nbsp;&nbsp; IO設備--鍵盤、鼠標、顯示器。</p><p>Python 定義<br>是一個免費、開源、跨平台、動態、面向對象的編程語言。<br>Python程序的執行方式<br>交互式<br>在命令行輸入指令，回車即可得到結果。<br>&nbsp;&nbsp;&nbsp; ⦁ 打開終端<br>&nbsp;&nbsp;&nbsp; ⦁ 進入交互式：python3<br>&nbsp;&nbsp;&nbsp; ⦁ 編寫代碼：print(“hello world”)<br>&nbsp;&nbsp;&nbsp; ⦁ 離開交互式：exit()<br>文件式<br>將指令編寫到.py文件，可以重複運行程序。<br>&nbsp;&nbsp;&nbsp; ⦁ 編寫文件。<br>&nbsp;&nbsp;&nbsp; ⦁ 打開終端<br>&nbsp;&nbsp;&nbsp; ⦁ 進入程序所在目錄：cd 目錄<br>&nbsp;&nbsp;&nbsp; ⦁ 執行程序： python3 文件名<br>Linux常用命令<br>&nbsp;&nbsp;&nbsp; ⦁ pwd：查看當前工作目錄的路徑<br>&nbsp;&nbsp;&nbsp; ⦁ ls：查看指定目錄的內容或文件信息<br>&nbsp;&nbsp;&nbsp; ⦁ cd：改變工作目錄（進入到某個目錄）<br>舉例：<br>&nbsp;&nbsp;&nbsp; ⦁ 在指定目錄創建python文件.<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; --目錄：/home/tarena/1905/month01<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; --文件名：exercise01.py<br>&nbsp;&nbsp;&nbsp; 2. 在文件中寫入：print(“你好，世界!”)<br>    &nbsp;&nbsp;&nbsp; 3. 運行python程序<br>&nbsp;&nbsp;&nbsp; 執行過程<br> <br>計算機只能識別機器碼(1010)，不能識別源代碼(python)。<br><br>&nbsp;&nbsp;&nbsp; ⦁ 由源代碼轉變成機器碼的過程分成兩類：編譯和解釋。<br>&nbsp;&nbsp;&nbsp; ⦁ 編譯：在程序運行之前，通過編譯器將源代碼變成機器碼，例如：C語言。<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- 優點：運行速度快<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- 缺點：開發效率低，不能跨平台。<br>&nbsp;&nbsp;&nbsp; ⦁ 解釋：在程序運行之時，通過解釋器對程序逐行翻譯，然後執行。例如Javascript<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; -- 優點：開發效率高，可以跨平台；<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; -- 缺點：運行速度慢。<br>⦁ python是解釋型語言，但為了提高運行速度，使用了一種編譯的方法。編譯之後得到 pyc文件，存儲了字節碼（特定於Python的表現形式，不是機器碼）。<br>源代碼 -- 編譯 --&gt; 字節碼 -- 解釋 --&gt; 機器碼<br>|————1次———|<br>解釋器類型<br>&nbsp;&nbsp;&nbsp; ⦁ CPython（C語言開發)<br>&nbsp;&nbsp;&nbsp; ⦁ Jython (java開發)<br>&nbsp;&nbsp;&nbsp; ⦁ IronPython (.net開發)<br>數據基本運算<br>pycharm常用快捷鍵<br>&nbsp;&nbsp;&nbsp; ⦁ 移動到本行開頭：home鍵<br>&nbsp;&nbsp;&nbsp; ⦁ 移動到本行末尾：end鍵盤<br>&nbsp;&nbsp;&nbsp; ⦁ 註釋代碼：ctrl + /<br>&nbsp;&nbsp;&nbsp; ⦁ 複製行：ctrl +d<br>&nbsp;&nbsp;&nbsp; ⦁ 選擇列：鼠標左鍵 + alt<br>&nbsp;&nbsp;&nbsp; ⦁ 移動行：shift + alt + 上下箭頭<br>&nbsp;&nbsp;&nbsp; ⦁ 智能提示：Ctrl + Space<br>註釋<br>給人看的，通常是對代碼的描述信息。<br>&nbsp;&nbsp;&nbsp; ⦁ 單行註釋：以#號開頭。<br>&nbsp;&nbsp;&nbsp; ⦁ 多行註釋：三引號開頭，三引號結尾。<br>函數<br>表示一個功能，函數定義者是提供功能的人，函數調用者是使用功能的人。<br>例如：<br>&nbsp;&nbsp;&nbsp; ⦁ print(數據) 作用：將括號中的內容顯示在控制台中<br>&nbsp;&nbsp;&nbsp; ⦁ 變量 = input(“需要顯示的內容”) 作用：將用戶輸入的內容賦值給變量</p>','2020-09-27 16:12:36.890740','2020-09-27 16:54:41.367065','superuser'),(29,'語句行','tec','public','語句行&nbsp;&nbsp;&nbsp; ⦁ 物理行：程序','<p><br></p><p>語句<br>行<br>&nbsp;&nbsp;&nbsp; ⦁ 物理行：程序員編寫代碼的行。<br>&nbsp;&nbsp;&nbsp; ⦁ 邏輯行：python解釋器需要執行的指令。<br>&nbsp;&nbsp;&nbsp; ⦁ 建議一個邏輯行在一個物理行上。<br>&nbsp;&nbsp;&nbsp; ⦁ 如果一個物理行中使用多個邏輯行，需要使用分號；隔開。<br>5. 如果邏輯行過長，可以使用隱式換行或顯式換行。<br>&nbsp;&nbsp;&nbsp; 隱式換行：所有括號的內容換行,稱為隱式換行<br>   &nbsp;&nbsp;&nbsp; 括號包括: () [] {} 三種<br>&nbsp;&nbsp;&nbsp; 顯式換行：通過折行符 \\ (反斜杠)換行，必須放在一行的末尾，目的是告訴解釋器,下一行也是本行的語句。<br>pass 語句<br>&nbsp;&nbsp;&nbsp; 通常用來填充語法空白。<br>&nbsp;&nbsp;&nbsp; 選擇語句<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; If elif else 語句<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ⦁ 作用:<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 讓程序根據條件選擇性的執行語句。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ⦁ 語法:<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if 條件1:<br>        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 語句塊1<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; elif 條件2:<br>        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 語句塊2<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; else:<br>        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 語句塊3<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ⦁ 說明:<br>    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif 子句可以有0個或多個。<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; else 子句可以有0個或1個，且只能放在if語句的最後。<br>if 語句的真值表達式<br>&nbsp;&nbsp;&nbsp; if 100:<br>        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; print(\"真值\")<br>等同於<br>&nbsp;&nbsp;&nbsp;&nbsp; if bool(100):<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; print(\"真值\")<br>條件表達式<br>  語法：變量 = 結果1 if 條件 else 結果2<br>  作用：根據條件(True/False) 來決定返回結果1還是結果2。<br>循環語句<br>while語句<br>&nbsp;&nbsp;&nbsp; ⦁ 作用:<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 可以讓一段代碼滿足條件，重複執行。<br>&nbsp;&nbsp;&nbsp; ⦁ 語法:<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; while 條件:<br>        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 滿足條件執行的語句<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; else:<br>        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 不滿足條件執行的語句<br>&nbsp;&nbsp;&nbsp; ⦁ 說明:<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; else子句可以省略。<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 在循環體內用break終止循環時,else子句不執行。<br>for 語句<br>&nbsp;&nbsp;&nbsp; ⦁ 作用:<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 用來遍歷可迭代對象的數據元素。<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 可迭代對像是指能依次獲取數據元素的對象，例如：容器類型。<br>&nbsp;&nbsp;&nbsp; ⦁ 語法:<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; for 變量列表 in 可迭代對象:<br>        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 語句塊1<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; else:<br>        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 語句塊2<br>&nbsp;&nbsp;&nbsp;&nbsp; ⦁ 說明:<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; else子句可以省略。<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 在循環體內用break終止循環時,else子句不執行。<br>range 函數<br>&nbsp;&nbsp;&nbsp; ⦁ 作用:<br>    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 用來創建一個生成一系列整數的可迭代對象(也叫整數序列生成器)。<br>&nbsp;&nbsp;&nbsp; ⦁ 語法:<br>   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; range(開始點，結束點，間隔)<br>&nbsp;&nbsp;&nbsp; ⦁ 說明:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 函數返回的可迭代對象可以用for取出其中的元素<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 返回的數字不包含結束點<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 開始點默認為0<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 間隔默認值為1<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 跳轉語句<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break 語句<br>&nbsp;&nbsp;&nbsp; ⦁ 跳出循環體，後面的代碼不再執行。<br>&nbsp;&nbsp;&nbsp; ⦁ 可以讓while語句的else部分不執行。</p><p><br></p><p>continue 語句<br>&nbsp;&nbsp;&nbsp; 跳過本次，繼續下次循環。</p>','2020-09-27 17:04:11.820560','2020-09-27 17:04:11.820593','superuser'),(30,'作用域LEGB','tec','public','作用域LEGB&nbsp;&nbsp;&nbsp; ⦁ 作用','<p><br></p><p>作用域LEGB<br>&nbsp;&nbsp;&nbsp; ⦁ 作用域：變量起作用的範圍。<br>&nbsp;&nbsp;&nbsp; ⦁ Local局部作用域：函數內部。<br>&nbsp;&nbsp;&nbsp; ⦁ Enclosing 外部嵌套作用域 ：函數嵌套。<br>&nbsp;&nbsp;&nbsp; ⦁ Global全局作用域：模塊(.py文件)內部。<br>&nbsp;&nbsp;&nbsp; ⦁ Builtin內置模塊作用域：builtins.py文件。<br>變量名的查找規則<br>&nbsp;&nbsp;&nbsp; ⦁ 由內到外：L -&gt; E -&gt; G -&gt; B<br>&nbsp;&nbsp;&nbsp; ⦁ 在訪問變量時，先查找本地變量，然後是包裹此函數外部的函數內部的變量，之後是全局變量，最後是內置變量。<br>局部變量<br>&nbsp;&nbsp;&nbsp; ⦁ 定義在函數內部的變量(形參也是局部變量)<br>&nbsp;&nbsp;&nbsp; ⦁ 只能在函數內部使用<br>&nbsp;&nbsp;&nbsp; ⦁ 調用函數時才被創建，函數結束後自動銷毀<br>全局變量<br>&nbsp;&nbsp;&nbsp; ⦁ 定義在函數外部,模塊內部的變量。<br>&nbsp;&nbsp;&nbsp; ⦁ 在整個模塊(py文件)範圍內訪問（但函數內不能將其直接賦值）。<br>global 語句<br>&nbsp;&nbsp;&nbsp; ⦁ 作用：<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 在函數內部修改全局變量。<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 在函數內部定義全局變量(全局聲明)。<br>&nbsp;&nbsp;&nbsp; ⦁ 語法：<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; global 變量1, 變量2, …<br>&nbsp;&nbsp;&nbsp; ⦁ 說明<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 在函數內直接為全局變量賦值，視為創建新的局部變量。<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 不能先聲明局部的變量，再用global聲明為全局變量。</p><p>nonlocal 語句<br>&nbsp;&nbsp;&nbsp; ⦁ 作用：<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 在內層函數修改外層嵌套函數內的變量<br>&nbsp;&nbsp;&nbsp; ⦁ 語法<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; nonlocal 變量名1,變量名2, ...<br>&nbsp;&nbsp;&nbsp; ⦁ 說明<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 在被嵌套的內函數中進行使用</p><p><br></p><p>有關 lst ,touple ,dict用法不在本文做闡述</p>','2020-09-27 17:08:55.188017','2020-09-27 17:08:55.188084','superuser'),(31,'面向對象六原則','tec','public','面向對象六原則&nbsp;&nbsp;&nbsp; 1.開閉','<br><p><br></p><p></p><h2>面向對象六原則</h2><h3>&nbsp;&nbsp;&nbsp; 1.開閉原則:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <br></h3><h3>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 開:針對後續擴展,可以加入新的需求<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 閉:在修改或者加入新需求的時候,不改動更底層的代碼<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 優勢:方便以後的修改維護</h3><h3>&nbsp;&nbsp;&nbsp; 2.類的單一職責:</h3><h3>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 單一:指功能單一,最好一個類只完成一個功能,或者說是引起這個類修改的原因只有一個<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 優勢:降低耦合,減少後續維護是代碼改動量</h3><h3>&nbsp;&nbsp;&nbsp; 3.依賴倒置:</h3><h3>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 客戶端代碼(調用的類)盡量依賴(使用)抽象的組件。把多個子類的共性提取出來,形成一個抽象的組件(父),在客戶端調用的時候,通過抽象的組件,再調用具體的類(子).相比較而言:抽象(父類)的是更穩定的,而實現(子類)是根據需求來變動的.為了在後期維護,增添功能時,減少代碼改動量.</h3><h3>&nbsp;&nbsp;&nbsp; 4.組合復用原則:</h3><h3>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 如果僅僅為了代碼復用優先選擇組合復用，而非繼承復用.組合的耦合性相對繼承低.組合復用是把B類作為A類的參數使用,而繼承是把參數和方法完全調用</h3><h3>&nbsp;&nbsp;&nbsp; 5.里氏替換:</h3><h3>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 父類出現的地方可以被子類替換，在替換後依然保持原功能.<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 從繼承講,子類是在保持父類原有的功能上,進行的擴寫,繼承了父類全部的參數和功能</h3><h3>&nbsp;&nbsp;&nbsp; 6.迪米特法則:</h3><h3>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 在滿足功能要求的基礎上，盡量減少數據的傳遞<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 目的:減少內與內之間的耦合,最終在後期維護時,減少維護量</h3><p><br></p>','2020-09-28 13:24:32.508750','2020-09-28 14:46:46.328082','superuser');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `username` varchar(11) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sign` varchar(50) NOT NULL,
  `info` varchar(150) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES ('andy333','andy333','aaa@aaa.com','96e79218965eb72c92a549dd5a330112','壓力＋休息＋努力＝成長!!','小小python程序猿','avatar/GaiaQSF.jpg'),('root','root','aaa@aaa.com','96e79218965eb72c92a549dd5a330112','長的嘿','黑嘉嘉女子圍棋冠軍','avatar/jj.jpg'),('root123','root123','aaa@aaa.com','96e79218965eb72c92a549dd5a330112','1111','1111','avatar/b04_OQ5VQEg.jpg'),('superuser','superuser','aaa@aaa.com','96e79218965eb72c92a549dd5a330112','','','');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-28 15:31:41
