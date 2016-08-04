-- MySQL dump 10.13  Distrib 5.6.28, for Win64 (x86_64)
--
-- Host: localhost    Database: homerecipes
-- ------------------------------------------------------
-- Server version	5.6.28-log

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
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangelog`
--

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` VALUES ('00000000000001','jhipster','classpath:config/liquibase/changelog/00000000000000_initial_schema.xml','2016-08-01 23:30:16',1,'EXECUTED','7:088448cd8ce4f9b9b9211b5e698272c3','createTable, createIndex (x2), createTable (x2), addPrimaryKey, createTable, addForeignKeyConstraint (x3), loadData, dropDefaultValue, loadData (x2), createTable (x2), addPrimaryKey, createIndex (x2), addForeignKeyConstraint','',NULL,'3.4.2',NULL,NULL),('20160801052829-1','jhipster','classpath:config/liquibase/changelog/20160801052829_added_entity_WineTasting.xml','2016-08-01 23:30:16',2,'EXECUTED','7:5c49c7017d82f45bbd76a0b7aa69ace1','createTable, dropDefaultValue','',NULL,'3.4.2',NULL,NULL),('20160801053116-1','jhipster','classpath:config/liquibase/changelog/20160801053116_added_entity_Recipe.xml','2016-08-01 23:30:16',3,'EXECUTED','7:b944fcac6dc574303169cc0a96d4d3c9','createTable','',NULL,'3.4.2',NULL,NULL),('20160801053117-1','jhipster','classpath:config/liquibase/changelog/20160801053117_added_entity_Wine.xml','2016-08-01 23:30:16',4,'EXECUTED','7:dcb496e4b32795a2bfafa7030fa737d8','createTable','',NULL,'3.4.2',NULL,NULL),('20160801052829-2','jhipster','classpath:config/liquibase/changelog/20160801052829_added_entity_constraints_WineTasting.xml','2016-08-01 23:30:16',5,'EXECUTED','7:28a3a4a182c2129afc22d7ac4774a9ad','addForeignKeyConstraint','',NULL,'3.4.2',NULL,NULL),('20160801053130','arnaud','classpath:config/liquibase/changelog/20160801053130_update_entity_Recipe.xml','2016-08-02 23:13:12',6,'EXECUTED','7:408cc6c98f76c2b8939267f2d6b1a4e7','addColumn (x3)','',NULL,'3.4.2',NULL,NULL);
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangeloglock`
--

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_authority`
--

DROP TABLE IF EXISTS `jhi_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_authority`
--

LOCK TABLES `jhi_authority` WRITE;
/*!40000 ALTER TABLE `jhi_authority` DISABLE KEYS */;
INSERT INTO `jhi_authority` VALUES ('ROLE_ADMIN'),('ROLE_USER');
/*!40000 ALTER TABLE `jhi_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_persistent_audit_event`
--

DROP TABLE IF EXISTS `jhi_persistent_audit_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_persistent_audit_event` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(255) NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_persistent_audit_event` (`principal`,`event_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_persistent_audit_event`
--

LOCK TABLES `jhi_persistent_audit_event` WRITE;
/*!40000 ALTER TABLE `jhi_persistent_audit_event` DISABLE KEYS */;
INSERT INTO `jhi_persistent_audit_event` VALUES (1,'admin','2016-08-01 21:31:06','AUTHENTICATION_SUCCESS'),(2,'admin','2016-08-02 21:11:01','AUTHENTICATION_SUCCESS');
/*!40000 ALTER TABLE `jhi_persistent_audit_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_persistent_audit_evt_data`
--

DROP TABLE IF EXISTS `jhi_persistent_audit_evt_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_persistent_audit_evt_data` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`name`),
  KEY `idx_persistent_audit_evt_data` (`event_id`),
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_persistent_audit_evt_data`
--

LOCK TABLES `jhi_persistent_audit_evt_data` WRITE;
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` DISABLE KEYS */;
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (1,'remoteAddress','0:0:0:0:0:0:0:1'),(1,'sessionId','C7A061C7744F3E9EF5DBCB8E4114FAD7'),(2,'remoteAddress','127.0.0.1'),(2,'sessionId','F448A091742C43E10E64745C8F396F3E');
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_persistent_token`
--

DROP TABLE IF EXISTS `jhi_persistent_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_persistent_token` (
  `series` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `token_value` varchar(255) NOT NULL,
  `token_date` date DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`series`),
  KEY `fk_user_persistent_token` (`user_id`),
  CONSTRAINT `fk_user_persistent_token` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_persistent_token`
--

LOCK TABLES `jhi_persistent_token` WRITE;
/*!40000 ALTER TABLE `jhi_persistent_token` DISABLE KEYS */;
INSERT INTO `jhi_persistent_token` VALUES ('9jhzxFz5fg+R99KAHUr5AQ==',3,'T5yyLrgxiDUiIB9A1X5emg==','2016-08-02','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36');
/*!40000 ALTER TABLE `jhi_persistent_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_user`
--

DROP TABLE IF EXISTS `jhi_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(5) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `idx_user_login` (`login`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `idx_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_user`
--

LOCK TABLES `jhi_user` WRITE;
/*!40000 ALTER TABLE `jhi_user` DISABLE KEYS */;
INSERT INTO `jhi_user` VALUES (1,'system','$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG','System','System','system@localhost','','en',NULL,NULL,'system','2016-08-01 21:30:16',NULL,'system','2016-08-01 21:30:16'),(2,'anonymoususer','$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO','Anonymous','User','anonymous@localhost','','en',NULL,NULL,'system','2016-08-01 21:30:16',NULL,'system','2016-08-01 21:30:16'),(3,'admin','$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC','Administrator','Administrator','admin@localhost','','en',NULL,NULL,'system','2016-08-01 21:30:16',NULL,'system','2016-08-01 21:30:16'),(4,'user','$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K','User','User','user@localhost','','en',NULL,NULL,'system','2016-08-01 21:30:16',NULL,'system','2016-08-01 21:30:16');
/*!40000 ALTER TABLE `jhi_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_user_authority`
--

DROP TABLE IF EXISTS `jhi_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_user_authority`
--

LOCK TABLES `jhi_user_authority` WRITE;
/*!40000 ALTER TABLE `jhi_user_authority` DISABLE KEYS */;
INSERT INTO `jhi_user_authority` VALUES (1,'ROLE_ADMIN'),(3,'ROLE_ADMIN'),(1,'ROLE_USER'),(3,'ROLE_USER'),(4,'ROLE_USER');
/*!40000 ALTER TABLE `jhi_user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `ingredients` varchar(255) DEFAULT NULL,
  `type_of_recipe` varchar(255) DEFAULT NULL,
  `image` longblob,
  `image_content_type` varchar(255) DEFAULT NULL,
  `note` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `complexity` int(11) DEFAULT NULL,
  `persons` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Crème catalane','120g de sucre suffise par rapport au 250 de la recette','https://www.meilleurduchef.com/cgi/mdc/l/fr/recette/creme-catalane.html','1 litre de lait\n6 jaunes d\'œufs\n250 g de sucre en poudre\n50 g de Maïzena\n1 bâton de cannelle (facultatif)\n1/2 citron (zestes)\ncassonade','DESSERT','����\0JFIF\0\0\0d\0d\0\0��\0C\0\r	\n\n\r\n\r \' .)10.)-,3:J>36F7,-@WAFLNRSR2>ZaZP`JQRO��\0C&&O5-5OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO��\0\0�@\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0�/[���T���˂��\r���\r�G�9�d(M<rִb� 9\\D��]Т�8\n)5�\r�Ъ��`ph`�0\\\'(�9�Bؖ�V�\\&)�sd�X����DҎ�]3�i�4#U0o*��lJ�zp|,�ي����ծ�Ľ�򁨩���ȦU�T-5�Z����uZ6����4��w`�8XO�:f$v��U`ؗ�Y0�y�z�J#��\\!	(���P�A0BZK��\"�-\r�O(����8X<DJ���-%�U0�\nq�UJNɏc<��Y�ֲ[�&��Il[�j�6m�Q����>����X��`�\\������!^Lh�|�%�λ��Glf���g�׷Վzb0�����z�3Y�Ӄ־j��X<���\\�a���Dl`���\r�I_ԅ��OOG�gJ���(KV��j�u��/��hDҦ�Z\"��JW�[g�tTz*9~��i��y���EV,H\Z����wD�+�%�>�r�ܹE�/M��t��O��ZC4b&l�$�+K\'68��ͱn����\n��[|Rb�\nu�t�ep.���_�g�]^U�Og�e�69��y��IL��ƫy#IE��%zT��:�\r)�1\0��.P1[+��u���9.���F���ZrM\r@1cԬaX��I�\Zu���Ē�eʨea&Z�@����w�ཥ��F�kaU+�����L��{T�Y���l��b�@��\rJ�DM�lY2�����u�0��af��s�\0��^�^�#g C�G\r��.y�v��o2�3�����D���N�Θ�OG���(>s~�	1�FX��7����\Z������\n�j<:��r�SANG��\')�T��Gy���Qk�)a��kϝ;}��|Tx{u�5������ŕ�N�-���\ZgZr��SjCA\na=H˟G��3��(��0����MW�*n��TQB��oo~&��F\05%A9��{В�̺��Y��X��{�sI�k���J�g,�&����ր|�Ws�1i��f��gЙ�����\n�����!L��\\����ȧb�:&Zf�5�J��y7+�sVq�k�\n}�koE>��cK�ID)�u�O���-�v�Ç�\0��p��<.ZٟI�ꂊ\\\\ӬZN�/��\Z���E����fb�7Lγ6�T�	=�KZۻj.g~��4|\0	��=R(�l��An��Tjs���dJ���q����.i4�q$J\Z�P����61��Ђ2�}-�40\\\Z&gÐ�R����$�U̡��\\��k�%����h�^&�SQ2 !c8{8]��\0ya�����400\0s�Ǉ.L�<���\'9H��)�zk?1��,�4����@Ԭ�>�����\0Dam�oW�0z\0\nG�ς�r*m�m ƴ�hV�z&kL���ȋ��95-8\r\"���� R��|��M�M�#��5̒�\Z�d���D2FD\"�s�ж�r�b��訜m���NϞ��{4���p`p`�/?� I�ϢŘ؂��Ā�����	_Bs`>LY�j����\nuϞ8��_Cr�8$����A+�`�[�b��h(J��\"��՛����ϣ�ۣ��.1�r\nvk�W�@)Ҟ�������`���H� 6�0\r.K�����M��,g����mGDRD�A6C�~l��p�40Z=A�>K �<�\0��@�ji����P!$)�e��lu���8�S�͂�$�����p�,���g��P��D�+RL&�x����V�CCS�hj\\�K��&��#��\0㚱,\rO\0C[tǙ�Z�R��F°8A(d҉Q����d=�������880XЈ5c�O.��IP]%���\0(\0\0\0\0\0\0\0\0!1 \"A#02@B��\0\0�q����Q������\\����R\'&�GR���\"�����̲����U����^��r۩l��1�9�\\{M>Ǿӽ���]���2x��$p���#�$����\'d�f������r}	ɤ�\0=�Gb�پ%�؋)�F�b\'�[7��\\l�v#�\\z5����Ń+�����/�}���S/��W���$�ٖ��w;\r����nM�h����������qȱ�4���3\'����8�le�ۖL�e�\Z({%�㭏�w��Y4h�hу���͝��ʏ�O�O�E�1Z6o�\"tl�:.ȢY��[6#7Z*��k��3�O�謧v:hn�Ս�d�!����#!��G��rƐ�\\2���v6d-h��W�,�#RB[\ZВXJ)P�*%}�E�Ȳv&-�1�3y�����r��R%�>�~-��~sD�8,]��oW�dn<|�|yG�d��Vt�*�i��L�vJˑ���|ˏ��m?�D>�|��w#��̿FHx��}�\'H^Fd3�?�������s�.V(�dx���d�8Д�����Xq�^���i5�~�\0#I�ؾ:��_�n����/C�H�r��+��B{�\\�+��s���k�*w��އC�S�b��xҨ��{NݤvD�Ý�Pe]��|(�oO����㵓�h~����,�\Z�f3S1E9����S�jS��{{z�Nג:���);��m��yWU�_ɏ<��\rh��]a̜z�ʥ+=?�b���KC�nǑ�\r;�������N+Ȕ�UR�_���jc��=�_��1%T���������t�/��kMy\Z\'�N�Y���)��Gz0��M����N��H�OGSM<yz���U��T�y\Z���|v�lC�ю�2V���<�$g��������;�|��5K�2&Ѥ����2,�B7�)���(���Jr��_S\'��㥵]���Ϗ���<uڧ�G����MWlg�տ�ۏUV�M���?��t�*�irĖ�hس�Y�1�^�b�s�Ss��j��v1a��,uD�ꇴ�j�����eb��^;؟�S���B�JLkD������e1�\'�=L0�\"�4��vu��|�ȇƌ�7ν��<��c���2�f�Ǒ��}+�]ĩ6wr,ɏ�\Z���k��Rύ/L��M��\'��˓�|Rک�����:\Z.65��4M���QNЮh�>�V���>ݻ��Q��%��Gn2^���k���)˖��n*Nq��&*�Lx������zJ4�\0Tv;��魿fپ���ysuU��<y:��U)���}$Y�q�3���lٳ|6�8�Yyqb�kf��:?�h�^\ZZ�\r�m#.>��b�xɌ9���Lٳf͎��k>Fo#.c�J�G�.;J�Ǔ<<t#F�|�̟#cy�9m��F���HFٶ~ǱԎ������N��ƽ\Z���\\��q�G�%���e��㒳Sb��M�f|��v;zٴvGc|m6~���O���ɋ�N\\1S�ʠ�t}�M#��q�4hסz�f�b�����ܡ�Vl��C�͋N�l�=�B�\'������]6z4�Zе���u:�}���=��!�(��P���hy���Y����=��g��f�َ��F,�>s�>_2u.,�������*C����u4�ٳ�Z4h���bw��U�d�+3g����\0+\0\0\0\0\0\0 !1A0Q\"aq2@RB���\0?����ic���/zh��\Z�!M��.�fhO�(�P��_5�l�������d��e����ǭQ�_FfZ�Ⱥ����P1LJѢKDQEh�Q_Fg\Z�E�Fs��Gt�e�)��4Q(�X���������9�����ٗ�b���R�!��qD�Ǥgc�;�ec�>��7���m�3`bQ[�Q\Z�fE�]A��	���&\"����4Q��{���|U�j��_�ǭ�cOE�#Iy%%��(�#\'�[(�1u�B���D�����~��3{2FE�e��;gl�:V���+jҊ+mi{��k������Jֹ+HE45Z1|_ē1f#[�RZ$P���M�\Z\'\Z\"�X�P�߁t�>�^LR�8F~��W�3��y����+K,~,�f[i�#	��~�EB�D`���\0c���o�X�0��;Q�M���q��%(�O���[:�<u�.����YQ�9�Н���fGm݊K�V�%\'T_$y1D�C�L\\�\Z���8W���\"���!�cW�:���byrJ?f~�E.X�ȕr�F-�9G�Jgiy��O� ��t���!�>9%m�#������47�%�~�^�kl�J�8���b&a�\0$z��%�sd\Z�$i{�����D]G��h�z$M?H�|��~��Ͽ���$K������\Z/�i�BU�QRT�E��ק<xz&�)�\"�\'�N��#5/��~�(��8O�*Fx�\'�~�����\0�%���.LQ^���q�O��R\Z#,�{�%D����	Wމ��f^���G��2�/ċ��&��7���~���T�����!�g��F^��EIS%L�#/E��x,����^���˚^�\Z�љ%k�J�+�W�\\1;�$����>u���/�\Z���+JWE�&������22O����JbV�̋D����[{����%kH�q1z^��{%�{e�gQrDL��(eh��S���d�b��ե�W\Z޶���/�ooR>ȱnC���S�8�%�QǔFBz�iG�EkEkE�QE|�cf%?�#�_z�ddY��HɊL�R3b��;����J�#$ds��E���F(����������vQ؉�G����c�v�ې��K,�ȴZh��䢴�/E��b`>�?�ߢP�|�Ei��\0(\0\0\0\0\0\0\0\0 !01AQ\"@q2ar��\0?�����/���_��z+N�I=��������wq111>��Ϧ`bE�#gy����6���������uN�I��22222ҵ��!��\Z�]�CfC��܈�$3!Wj�A�,��ev6d:�@̉2�	T.��S�J�^/�J��H�H��>Ϣ��e]��t㋠�ӥ^IGqY��vf�h#W���T&�L]v\'��̣%���t�C�h��&N�K~v��֏����W�<��]X�*�x1�y�t�6D�N:�Z<�	&�x>��Jjh]V.�~��p�^Ez��\Z�&�6�\r�~�%NI�KCx�g\"��(9&�cq�U��1Tɺ�>t��\Z�2*�zFG����}#�D��x)B��ǣ�G�2�&Ds�+V��I<�t���SG\r[�&>��?�}��������4Dy\'�_��/��ug�ES��H�]�I$}:X�hUsȪCPT~�0O�?���I	���)���bo�ȑ��j\n+���R5kL��Ɋg��*��Gd��`ڄ}���i�eM>���s���^����٩\Z�����_�E\'�g�d\n�cB2�|����ST�RT�Րsh�Z~F#�۽HhM��>��SZ5�̐bB�/\Z;Ը�)��*�?-�{3�W��S�i�=�\Zѡފ��R�#��C�cV�j\\=2W���I;յT�Z����4n;Y9�/&ZF�h\"�x � fD��J3%�-�$�{I$�I$���I$�33\'h#I\'���H�1?��\04\0\0\0\0\0\0\0\0!1 \"AQ02a�q�#@R�3Bbr��P����\0\0?��z�67˃��t�%�Jr�ӤרPOU\'���TPj��QNi�j����^�P��]Ȓ5���vk�޽�z���HҴ]K�u*�������f*�����/GȪ��7�aʮ,�9Wu�g��ju��\"N���>���9�w��Mąu*EUI���Ҵ]AN58�c\n�dT�K&Pb&��l�\'�\'M�%K�WZ��.����\n�%�����!�T-��YT��b�M9�e��(F9��T�!�)�C�3���x��N!`�:��Z�O6~����۲h�c�,��pD;!��b���[@�ˤ��ٕ#T�ܦ0�%A�f�2o�s�xM��N�]�첒ּ�H�D��ɢ�\0��\'�&Ctn��+�\n8�)r\r��jM\nx�t�C`ܬ��`&��캧�[�꟢lΚ�]e������JLBbe�!�#�S�8yY�WX���~�B\"���t~�܇	��l��3������X��L�)�n\'��`��W�h�RYc\'�<LvL���.���|!R����O_�~��Rh��@~�j�(��Z�B��\r9A�E�����d��ɮ�Oz��.�a��E�>��\\h�%�O�&��)2� oG�4D�{)��0�e7��N�,r��p�t�-��xp](��.~�RY沐}W@t�����{�OئNef�e,Qt���9�H,�G��7:�\0��g���ܶ��E��/�<1�,Я��e�J`\\\0�5V�T�,mT�I2��\r5��/)r\'kPw	�S��TԤ���i�S�7M���L��G)�6���RR.���z*�AW��L�Y�,-\ry4���q�jsS��m�vI1S��Xf�?��D��l���_D~J�퍊����Y����\"S�L�Cto��8��1z��C��X��n���K$WM�v�U�\"�8�����%��Yxw��_�2��~��0L{���e�cｳ�2�A�!uC�����Y�꫊���h�Hf����������1��*f�YC�ʯ���f���B����ҥ��?�Mcc;�1�L�2�	[&�S�m���T���ɣ̺>��ke �c��d��,R�K4�H)�6S��m�Mm�TT]*��S�\\Ԇ-��K�%8vR�f�/��\0(\0\0\0\0\0\0!1AQaq�� ������0��\0\0?!�n\Z�&���Z;QʬC�C��6S%*[��T���!�\'�R#��q\nF��G�!��42�b7�4&ؽ�Od�#�����4��*j�\0��&���\0��r�s݉�;��ˬ�9P�#L��;��.�����0;��x�2\"̓7�~Eږ��܉_��nN�a��	n���-9��\r�V�C �N��4��	E\\ ��P���`��,F��\rhN��E\n�۲�5h�A�\Z�$��t.�m�=�=#�$�u9YR�(��tD�az�F�b	�ӂh��чfZO�q���I����f�0�tPZ6BP�����`12J&)�����p�,s�R6I�A+bZΰ���Zr�I!�����s��C��\Z8i��F�w��N�O�/�J��T�FDw:N�v\Z܉JbR:���� �r�3aA�΄�-41 B�B�(�Ȭ�����6Y�t�|	ܦ��\"ǸOLWbG����	#��趕��L���EA��z�[�Ŕ~CR�6\0�cw��@�{9B�\n����HF��Xr|��BQ�G��\"�H��Z����\0Uc�l#�\"*��4�D�|�#r�x�ZЯ�_��i��/�PR!>Yu7�������U�1�$͔!�HH�;$�M��>4==�.���ɓ���͟v��~Go#!�<���?(�����#!` ��h+A�H�E\r��ҁ��Q���tH�,��ě��.��\0�����\"}\"ݔ9r\"I\'B��L�YBS[�<DI���M{��Z��\0c�j5,�L.�\"F �K���	��\'��+�F�\0�$��V�X�ϒ*Rƅ�,�5���yX��]=���ٺoM�b��(H<p����D��w�v#h\Z��cE��µ��1�I��Ĳ$6raTŚ�\05��ᝫH�{#q4Ix�(��\ZY���,V�Z�3�)5ز�{��6Q���\r�|;&5l�Aѳ\'7�eDC+g���=!`L�a�Aǲē\\7g�cYl��d#j:\"N���El���I���듬%���c���P̫�\r�3�\n���;���PQ�T��=͌���Q���o�\"3����RtRb@u͙�E���HԦr8s��.Sb�x�j���X���ܮO\n	Rb-ˤPog���>t�b��k��9���2�%y��W8|�O�)ˁ�����#A�!�+�\\P;2�ZB:IX��Ȑε��{�hN)\rP�\'m(!�p:M6�?c��:&2�y���Sȿ\'���P7�&p��I�LjQՔ�E�5�ND˧Ɇ���VE�l��h�dն1g�YM�&�7V��&Kr�H��,���w�P���+�%�5����\0�͖3�??ӶD��,�#/K��\"Z����M޹�~���U�ԄJ�&\0��f�n�$ME\n�\"I����<-�I\\�l���O�9�-�\'�o��8z��R�wd�PB\r�[�\rB-����HH�-�\0�UJ���\"<p$p���7�(��*x$ա�hi�������J9��JÜ=W�A��ʁ���gTO	_�BL\'-�k��e(�ds��D�S7V4��p��Ļ��@������T��u�,yڔ��H�m�7cu�\n�,i�r�<�ͪ2$���7����d\rDcvA\r��_�����}r!�6�`����[�q����r?��s��ʬJuk��q�tRjJ��I�(��%K�G,�z@қ�%C���<�ȿ�e�BF��^��M1��CXd9��p0�4BН��h�:DC����rA&�iCE\"����:H���I��߁�dZ�\rA6�����e!�6�D�U����w&�d�/���A%(3�v�;o~�,[l�S��臧�;\'LmY�G�ٓ�`z�FV ���M��F�&���^�eK�\"�!�	M&O�j�/\"���\"ihKY�bb�\"���&�X	!��;B�\0�8��l;���ٔe��\0���EDM�#��K\'��(\Z��r����H�r3iH�:����OCf&� :�XQ:�.9�2O���C/Ndm$�\"(�9����ɸ��+�.��ra���H�5��TK����1���&��bM��l�rD�=�ٻ�V&^´�E�a4BU>n�iN�_K޲\Z�?7w�V�5iM��);���[���iC�p�E+�A�ψbWA��yMB�n�	g&��\n�D�Op5V0�.7�75�\\�p1P�bN\r���D��J��/�I��2�OȶU����>�U{%8>�I̢����_N��	=����\0BYs��	�n��pd�1��:�`A5�0��ߍs�?hH��\r� \'0��T�ޓ��7\n��3䌟F6�s?V3�$\"�D�M��J�$��\'�)Y{Z$�fG\r{��*-�<�Pz�ɔRBO��\r6!����9��<HE*��)�\\���������,��,���R�D�[f_�kH.���\'Au#�Ds\n�r_#���!s� ��zx���I2C$�\\��﷑0}²�t� >���ILh�.�A(O�c�4��b�̼	��a�4�u^��(��)u�a�!�=���A�������!-%n�jm��C�X�x���X���0���y��jU!!�F>�%�o�F-*V{l�5[Iw!<?G%17e�,��\'�+a�?\"N8\n!V9D�_rK�S*	�3��ĳ�9��*J3\"ga34��a���ET%y��{/��d�%���\'�&Y�YB�:��$�\Z��\'|����c&�3`��NP��(v�$+#�aC{�ٖ�Kq#�p�m�^l-�_\\AAH�\Z��d&���6K1#|&o��D95���\0\0\0\0\0\0_�F-�f��;t�YBd��UB w���+f�Q���(�h\n��,�v֡�1+��@#����䅀x4����m�9�N\0=����V��$�a�UɄ;��~tK1�*��?R�2@��n��l\"���V-���� 	�cw4�,�ȶ[4��2>t,����0eQ��H�L#��,���l\n�\r���v��`�\0�b�\0cZ\r5B�9�<�Ը�v�D�c\\}�fV�G|A�0��np/�l�Z9�t��;j����� �\\���g����=�RfYuחjJZ�dm����R�8�Q5�T�`�&�F�\0�6zxy\0{k�}�.�o���sW^ߡf0p@<�\n-�����ֳ����OGg��X/��`\"�\ZX �<�i�Ʃ9��#�` �p��>��H�^�D����?C�D��KM����6��@*9¿{�h��)/�ʤ���Ϳ���\0(\0\0\0\0\0\0!1AQ a���q��ѱ��0��\0?�Cka���qq�}�OL�$\'�9;�z�-N�zat�p��`M���|/������7�I�[�.H[|/��=˾����ls�Z!�0XL�ͥ��ŉL�lx5����������X���,�@e�צS�S�V���M2B�`OP��$#�\"|�YgҶl�c�6�E��x̈́)!����O�>�o�_S�Ϩ�Y}2#�X��.L��/ճ���+2����2�r��6Ye�ͭ�N�������$p�؄��}�8�~��0�l&\"waW��\"\nԏE�g��,�,�l��͹��˒�7>\r�h�K{�{��W�Nvs��{�d`���Z�	t�d�g�~%M��X}_rLr�>-�)�|>t�I��k�K ����8[��w�k\03��-P�W+�ė6���C,���a����c��ss\0bZu ���c?�\nqt�3nX>m��_�i�}ܞ��G��Cö́�,�s̓\"9��s��X������8N���0G<Y�>བ��˄x`��j.q1�s�|)Cq�m��_���pur�� �\\�$��&�?G=�=�`�O!__�	���,;�=m�������h[��]�\r��Vd�p [����*�z�v4���þLf~�-`�?O�����ܻ�w���9źc����gvZ�ۉ<�\'��	$�Y���E�a���rs$1,�N�*��A1��ׂ�9]b�ö�Y�y`:�9n��LJN\'�����\0E�A��F�\r�<?��Ս|�l� ���)1�&���m�t��	�ב��B��Cpl�\Z����q&���\0X��u�������\0�Z�\00n�����c?��\0���/��:�M@\Z��^�\0������?0�I�0��0%]R������\0�x����*xٯQ#�������\0%˞0�G��T���\r�İCm���?��?�h����c�@�Q촵{c�S�x�\074_�����e�:๦r�-\0�!�)�\0��8�\0���K������,=���7����j��q�Q�X���X\0s;��2^y����Ug���k����phY��=x�\0cjab{.G�p�G�����2wx�bBɴu�ȗ����oO���)�9\\ɋ��Q��y�̓y�#�Yg���w��P?0$\"8�/�\0,9B������ޫ�q�6�{E�Qǀ�3n�;��xB:.��l��A�i���I���ߛ���L�1����(�Y2���;���pK�Ḭ�g�#��^۩l�c/Ǎ#��1O(i\0�bw�\0�_k�:�w���Ӓ����N֎ș��_-���/�XYK����C�X:��G��M�\\6{t6�|wᇝ�f���,-��ݸ����h�\'���c�$��]�Y���fo��pþ7-�Y}K��W��~.<�ڝ�H�>�),n�D���<5��1��a����*��ɿ�/nm]z�;�o�n��Ԡ�*��͹�\'�l�����������h�xP�z�;d��iW$��>�����\\��s�W��S�������VS����pO=xy�\"�ZZZ�����V��@�H�MG�H�X\'�呯r�X�G�Zu(�n�ؘ��|����\\�Z��Kg-zA&9���opǹCܤ� w�ܯS���˜�;�:����Z�L�y�����,�t���\\��{d�xv�	�~��A��Y!�a쏂�7�G�-��ԯ����}���\"or^�n@�b�f��[�^�)R�\\7�\'q�R-l\\�YdYe�Yg�,2O1g��V_��\0&\0\0\0\0\0\0\0!1A Qaq����0��@��\0?��\'���<3�>	�����ŷVݖ�?���yf�n��X��m\'%qod\0q��^=���Ĝ��~\r�%���!0��^aXD�+\nI��.ږ��k3{���r�Y�C�D\'S���Im�p���6���>@�BaC��\\�ݟ�ϸg�E����|�ǃ��/P��\"\r������htZ����.nmaN=ڛq���C8K�B	4�O�ĜCo��{��ZI,�;o�g���ň�˨���9g`��c;�	���l�u����u��܎���5�%�w��P�pa�ɶٳ8�fbx8x	��!q���\nq0�+�������8-�r.W�k��$�R��͖xe��d��-��^�\\0�d��	�L�{�@������$�l=�^*3<w#u�$��C�r��Ǹ��[�-�Zڵ��ڽ��}����[�m��	�E�5��]���+��o0gR�͇����[1��Xt�l��+{���^���H2�����.������ll1�S�̗�#�3�2�L�!z��>	{%]޼�xM��DM��<A��X� n���I��h3\'�����!�$ @��(���������\ra�\\��\\,\0�xA1���usa��bidȫ�p�\rR\Zl��&�\n�K���>��Q�����ż��ă�էFRJ	66���^�&3;���v+$���9�s������lQ��ݷ�!��_�$������`͔E�r�Π��:v�W��G�j����v\Z�f��.g����	��	m�ĸ��\0vg���A��\0{�ޟ��X,H���#����$�	C{?V�\r���n��� �7��F5�HS_�D�`0C�����>6����g�\'��A�c���ۧ�YB@�q�ȹlf���y���<��].!\"$j�P�C�I��Y���V�-ǎ�§V~Cȱ���3��\0�d��PW��%�(�7��V1I��q1L}��pX_���>�׷���	�CO��dX�\\g%�g#��̂r_��y<���#��e���ԂvJ8[������$�[�;=\\��c0�+�8��G�z����Z�#P=�R3mS,�N���=�7�0�`ۮ.5˝ĺ����/�9�1�|�Le�^���|{�t؞����0�2>���;�N��f�V���r�n��_0Le���x�d2L�6�|s�,��� a�MԸ�\r�����?�&?+��9�x5�=Hl�d�d�D�4qp�ӥ�Z��3�|4�\ZO�x���g��x�v�����k�g�n\\߼1��~3nl����d�v�M��dJʾ�vZv�C�}I�,�˘�[[V���d4><7�������`v�=ͺ�6�o���Y�yfA��{���>�]�n�\\�&\0���:%}ν�v�$,�p�Bfo���Fիv>�l~�[dz������K{���pI�)�󭭭���v��f�a�����K7l�����ę8薝{�p��-�\'�,����N^�N�l�Ж���\0\'\0\0\0\0\0!1AQaq��������0���\0\0?�� !J�s&�M2�ĥu9a0@�M����������i�32�v�Ca^��/R�52P/���\'��O�1Bɋ�nϨ��!��,��]�����d�|����-�x\Z��:�+�����Τ`�C�c�����H�[\r�����ў��+�\ZU?�~��4�\0\Ze\\|��HJ��U~b�1	���9�u��OD�����U6�8��`a��D�nUy� �|��Re:�j��d3�<_Q��q[	2����kd�eR�>\n7��P�sdR��L[�u��`����^{G{�m�����5\\�p�����3=J�OD���/��U�\Z�]�HZ(�����T�!˥�����.\0����jP<505���k�	��\\�.�/Vf���t��+Zx����Ės.�<FE���э\\�[�!P3t��ZIDǉgd�d{&�R�6,�Xc]��_q?�`f.R�$�#�S��ex�4q#_8�!��B����d�M�V�v�@ҩ���>Q�e�|K��\\��)1�]SC�*��ʳI}A_���� ��\'����^a�ΐ�/5�I��fX�R�V����y�\" �R�n�2�H��0��73gOr��	i�8�\0�ۂ��E��!8D>�<�T�	)Բb-��a��.��e��1���Y�}ǁ&�%0ˉ���DJ���j0���������F�Z���0aT�g��#^H2�r�#�lܥ��0�\0$g>,�0}\\v���r�4榅��ӟ� ����R���1�<®֐3�ܠ�@�	��؟�T}�u�5uҷ@���ޮ\\�{��&�hk�3(ؿq����9�����b1������b�i�L	��w�,ܬw1	�����X���(2��8`Sq�\"�,�2�W6��6v9�߾��NF�ce��Y���&	���qLVEf��zsQ�vܼ�F6���K{V`���V\Z�s��ļKL��%���B!Ce�e\Z��J59��a��\ZF\nA9��N\na;�3A=$[��Sa�.`^�5�,lI����E}�����3�+������B�SS\0�J.���E?���sӏ�����z�Tp�|��^��Ys�P���ì0�1\\���b�����P��gv���II��8+рd=n~6�#�^Z���J$O��f�o(7~��l�� �k0h�^��T�&��;z�}LҾ���8��>�ec�}�⻖f�6Ǥ�D[ ��׳���i,�Ƕ9�dc�\\�p�%4~�§�����vi����	�yM�Lт�ne-,�\"�S��P>�l�Ġ���\0(ʘ�Qx�,0��|C�!8}0���Т�\'�.k��}�\n��O�Q�*¦�:�\0�01ƿ��(�B%�\"pf�9�\0�y�h�X�sv5����Xi�oļ����Y��a�@b�����x^�)�� �J�ʕ m�,�����|��Ih|��\ZJ�W4�)��B�>�����no�@baYy2zH�3�(��uq����W��ka��<�e��\0�)��0���J�5)�\ns�\0ԭ���\n3��x�0\0�0e�a@*n��n&�\0��J��J/��l�n_��9}E��/p\Z���g�\\8�9��Cb��or����O��T�G��hѠ�� j[���\\�C\0�\'�k�\nW u�>b�7L-1�x�y 4���$�G��Q6�$�6�}Ai�6<�+0��M&�K�-j\\)T�8IT��1-�0(��e?0/\r����C��a�B�&�N����BK0�>��=�U����n����>ᛩѐ�|�OPH�7-����\\L�j�Q��o�j*t�1V�|�g���O�(3���n헻`�������Q\\Q��6���_��$���IMa%��d&jV���GmXhO�8�F�s����N�%������O���=�l�=�QJ�զ�\\Ŵõ䎰� Ѕ��Dr���xk�<e�FlĶŰ5�b0�\n�׆+�S����h�����\r�+ӷ���y,qQי�ҫ 6�~a����.D�Q��u`��٤�|Ny:�G�u+���og\'�=������<ƒ���#���u�j�y��eeK�5�	8l��&�Fih١y\\����0�W����x+1��W>\"�6A�}j���o�Z���4P��TB��<ٿP�MJqX���uG�p�C%���FC�����^9�g��g? �u�@�ScTyB�X�9�8>�f8%Z����6���[��pN)_��n��P�J��SF0��\\�Ap\nbf�\r�+�m,;[�jX����cV)�����U[��2�K4Qvr�E����4IVZK�����\Z������\nS^ �|[�16�)Lq��|TdЮ�V\nⳟ�ԣb�0.��\00d�\r,Ϳ [K��\r;�clo�N%d�a�}��)et ����E�Qݭ���r[���0�y-ΗyeKu�%���ֺ�ľ��x�,������h��{����/�3�l.�J�G;->LCRQ\rUz���Td��3o�B�����.na��j1ʸ�0��y}K\0l\Zv�v��\0�\0�s�1���cՌ?��¶-��5x����-,�J�Pc�o���3��E��k��鄡�wn˾�,Ԓ�\0�\0�o�D�3�@� j��Ŧ@(\0.\0z�jq%[I���s**��0�����U�{�f;��{tК�.��\0�z�(L��b�R\\�ޱʧ�e��+�8�ģ��h���iWK�k��Z���唭1�İ6\n�s�msr�=\r��A�y`6M�xNι�U(L��&+�\"*����Z�D�Uo��\0�֢Y-�Mw����S�m�+y��o��}�1^9�&@-3�\n��1��@�1���0\nL!C�\Z�Xj`2��	�p���\ZM�W�P�VL���y����QW��G׈B#���MG��`����z��4�Cķ�#?S\0>Ab�@ԟe�k�­�2b��kOq@|UB��fCE$��[��`�U�\0���!㷙v)��Ld��A�C$���	V��\r���������j}�x�����%�v����{������<]a�Ss5�bh����$&��_-i�&��*�JR�량�S�*�rL�|�e�\"3�5/$=�0�i�ŮӬA��R��A��;W8�ڲ\'>�,G�I]�n8���\\b�Yh[uEͽ@�vEk��QR9����z�r}�O��c@�:�\0Ȯ�sG���߸�^9c�g�z�<U�H�.�5}�`L����\0�\\��\'�a�z\\�p@���C�gG�O[�����,S�`^���%�����<J^�]<�����^�\n���\09cЉo�M�����48�`���e��:CWoq�S����f��q�˲�]M�e��\0�z%ܪ���	e��E�x!j��x�z��{���{�XG�Oo�rig����c�\ZW��[N.`�F�������m���\0=/��a,5U��L��5X�}��wm�\"��w�\0��F��F��˫v=��˩+�\n��2�k��`�2:��9��f�Ȏ۹�8��=�A���b8I^LyE����t(�F�̺��b�3U�q&j�ۘ�mN�+�W�6�	t�˻�9��8�����m��\Z�)M�o�.��	;��9�!ź�`��\\�aC���yA��-.#�џ2�:����XL���#c��N�\Z�����=�UЗG��.�ߺ�n��\"6s��2x���Qw����`d;ULR���K��|*�XrGUj[��\'�x��K/�s����lc�v ����q�ĭ�<�^e�\0����\Ze�~h��\"�1a��y0KDV\\ƌ�	�A��-b�w�#NF*>�Ky�/^�90\r���h w�,,�x|�1�ǈ\Z��h_�.����\0��׈R��!r�B���>������:S�/��Ӱ�D@<\" FI��4��\0����G)r�w��P�9�S��0`����Q�)������L����U\"@o.n[�R�-V���-v:z�w�j�ZM��o�<CiN�D�l\"8n�8�+:Ԣ��YL�F�L��^M���G�׸�3�)�.��uvN2L����#��\'���J��]|����2�������C�,�W�?0��?R�\0�\"~	����֟��ut�})︵0F\'ef��Qb DS��?�1�9����fp\'ǆ(ۦ��d/�)Q�r����b��+�*�%�x��t�>�G6�t���y�Y����bz989�k�C�{+����-�\r��c�B,�_G�b������:߂j�9��DW���~D]�Ru�E��@�#���`bt;�I��ˤ����¹�˛w���|���wg����/hn�a��04��-���c��`��\0�p~f4xi�����	�~ \n�<�R�����.+\ZWU+�N~�\n0���~����6��u>q�_rդf�C�mJտ(�NP�̰9|TD�~��^�\0���)���Ө4���BT5L���\08f���Q���#��c�\"�v�X�7��`>� 57��\nwtJ��m~c:8�^~%�$�Y����=⸈��c��Z�1U|\\B��J��x�J1��k��Jp�X���g��G��}J_�.74*�z�FN,�7x�ǛԠV]Q,p�Z�9!�C�����[�UUe�h9��K |�7�I�&��zH��`��\"t~e�8�1���ɘ�+7\r�]�\\@:�6�P���)��������}��ˌ�	E�CT�ÏNgI��\r�u`��\\��^g���R�L2(�#�d�ҝx���<@�ZїV.�kCr����Vr:����N��q�;���|��p9o�/`��S���`v�4[Ո�R8�-�~h��v���>��u��������2��]{�?]�5N�v�	@��(�!����&�8�{D(���z.��;��\\�]�c�!h=1M�m�ӽư.��Q����YIs��#0\r1��s���B����{�R�z��;b��������;���5��\0>$ǁ�l��L��S�;u��L�z�:e��%C��Eq�ѿ�;�.1���ַv���','image/jpeg',4,30,1,5),(2,'Gnocchis fritti','Des gnocchis avec une pâte à pizza et de la tomate','https://www.meilleurduchef.com/cgi/mdc/l/fr/recette/gnocchi-fritti.html',NULL,'PLAT','����\0JFIF\0\0\0d\0d\0\0��\0C\0\r	\n\n\r\n\r \' .)10.)-,3:J>36F7,-@WAFLNRSR2>ZaZP`JQRO��\0C&&O5-5OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO��\0\0�@\0��\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0�g����4.tb��k#�#V��	v�Qq)A*�ʪ Rօ��vr�����]1X��[5�k\Z�JԵ�����\\)\0*WaP�3(�zu�q3t��aF��eR�\\�k#.��*ʂ2�CQK,й��JT�nKT�X��F-\"��h����~���.~�M����(�hH�4�b̈���E3�Uk`��ڂ@��VZ���W���v�tl��:x]ӟ;��v����ד,�7�nO?h����R	��J��(�k�!����Z�\n�;-zV���^�3�K�%j�g���sی�L��V���}�-Wk���S\"��s�b��!�U�1(�#�����Ϩ�\\~~��5�8�-F���N�nӿ?C�~_]�L�y���_&Yq�V�lŬs�$�`�[�ά��B`�\n;��q���鹜���1�ã����ם�1����������ի^~��	D�/$�s���\n.׎UH�ШN��ӡ/�j�~�0M��e;�#|�x{]o��xoD鋷�w/GC����^\Z�ȋ�)8R�E�;i\"�=M�4V%}\\=q����Ӭ���^��3��t�����y���ʾ�ߎ��5c.�7�ק���B�T�q��عLK;���oB;�D�y��w�\r<��u���K��N�}9���������˞{��W��{��e���t:�� \"^N�,\\�)^�\n�v��KU������X{�w�g���~u��m��ͬ5���FcW���s�e�]�v�#!*8g6˕vK3� �ۗס��,�?g��w���n��z�9�������hƦjw���32��c۟o���SɈC*�gL�� ��Zu���/����|�5Sѳ��dϹ�4��&U�M�\n&5s�9V���aw=�o�mB��EbQSq)�Q��{�*�����33��RȳQҷ:�x��,)��x�6��f=΂2��뗬��qB6�\0ZVt�U�	v����#������VJ�W�@ޭ�g8��L�<�O�B��k:�vv33|����w���8<2�v˕y��Ǭ5����������^���s�m��o|u8�\Z��kc�̝�>�W��ͬ!pS��;�i̓-���פ������ϥs�����/L�9��:<;k�y}*�rw>�n�ڷ����t7ǹ���X@O;5Q���k@U�(�w\Z>^�K�ןhY����s�?{)�܊��Ǧ�b��t�7�k[�߮�XC�r�I���� ���-D�������w�;�\n��W�o������x�s맟eX�gl���r��f��t���組82�[�� ���J��\\��s�����כu±�[s��]�\\����L^��V�R�3P��SOA��깂O=��Ԋ/|�@�,�ɮ����l�Ra�^Wf|�>�&�\0����n�>�4c�i��::���n��\"0�W@���\0M\0@��	{�e��\n��s�|;/sO^9��3�Y���zw�$��כ^��3	��8(I��8Q�*�;q�aBD%R\n�v\"�8�zuw�rQ�_=,S[���:ZJ!Fad2��\Z�B�!H�H6�\"�C!���T���ӕ��e�i�׿XB�!B%@NL��\\�@�VE����e� �L���K�l�!B�(�G*h&��.���3P+5o�@̣NTu+)�y�5V����XB�!gh3iWFɫ�$]�U-���ΔR,��	 �A!Z0v\n���ęF��\nܴ�HbR���JHC5�*�Q\n\0�h(����\n�Қ��qKQ@�`E+���!a��\0)\0\0\0\0\0\0\0!\"1 A20#3B4��\0\0���}�����S��p�M�8f�i��w�!�\'�|pDE���[��0�2���6��f!賀\'���j��v����)�#0���g�v���,7��T�9e~�q+m�q��	-Z����\n�<���h7��\0iį[9�i����,�y��l?�{C��g��6�6�-���3<���O�nzb�Q��Xc���-�rfTŎsVrg&���\'��:Դ]��V該[�����\0�`c�5L�Ioa���\'��롙��$B`�x�\Z�A������\rJǹUw�%76��H�t���f5?�@F�Zv��4����FX�K!��]J��?�:itFȊ���yJr<��Q�\"��S��Ĵ�驭�܍-%n�\r�]?��8�5�\Z��5�3�맨�n�����wK��u�sQ�jD�Cr(�po�_6�q-����ܻM��!�3�9 �o$���G cv��i{�jm�90�ع��$l,6�X�1�j�nF�7�r�%u��B3\Z�[!��9�L�<!���2�@����jT�}/u�kv��c����j����fH�mM��k�uD�x��+}pGWEu�Hrt�?�\r.�f�lOq�J\0�Cۃ�LJS�T��5�� ��{p�Vܭj�F�\\5�a~%��{ՓjS���Ǩ����FE�ka3��1���Ӹ�/w�h+zjFֻ+q���e��͝�l�l�6֮HʁZ����?�30a�N���0,]�H\nف�	���E�X\\\"���w�n���O�3�7�3Z&\\�\0��a����P���28�H�Br>����xLC��wwO��\0�tՃ��)ڞ�ܮ�aZ�ng���Y��Dz��\'s,���UTʛ�g������O<M�+A��Npc3�ӝ/Kk;D>�0�m|W�F`{$E*e���0�R|�.wr�`U�\0_\"����Q����f\0!��2���U��#\r�����͑�F�-0Z0��VRS=?�t\06�)*����0�\0|L	���q�3MgkQА���c���k=�fsN��bc��-k���2��0\0p�2�ď����-�@�\"v���|�T��A��7MIe;���H��Ρ\n��!�{c�cĶ&����βܘ0�e��t,�������/�&�1p&[��Ѫeˊ�f��e���̉�K����ӅBQ��_v>\Zә^�kl2�;l��l�t?jWbؿp7�v�\Z\'Sb\n�3Y����Q�u-�^�,�뵄�=�_,>���� 	�a\\	J�3M�G�5���n+4|��־8l� 8���f�4��q�U��eM��6�-[�i�d\0�i�W�b�W�j��l+��\n��Eݺh�	��>��c>�<�}!�V��D$E5��i0O�%u��F��j����)��xT�Ӊb�������QC��;���t��V&Ѻϸ�`z��o���c\Z��t+\0�[T!��H�F̊�\"\Z�N�8�={.�O]5m���S���1������&��5�?\Z���=6F��SH�.��\r\n��+��A#Heu��֊�p���\0��c���\0!����m5�����m��5@��X��|,�kR�sbb0g?��\"}����M�uى���-qݝ�;�t����M���y��n�9]Ev-���\0]���1���zsK�jbA{D<�$5z�G�٫Q��:�db>����䑐x������\r��ĭ6��Ջw�&%�TV0��?��BW,��p{hl\'j��y��=�u�������&�g9PK�d\0Qwa�fk�:���X���ߑ\\:��_c@:ba=�rrB�nX韇9�R�v��M٘\0AԯS��j��\'5����\'���<�Ͽ��\00\0\0\0\0\0\0\0!1 0AQ\"2@a#BPq�3R`���\0?�W�~:�Wu޼���?�n���ߒ�$�F�^%�!��N��D�t����̸W����^���Ѧ�iHs�D�yznC����&\\K���J..�x��I�	l�иߩU�(��/Ϯ�.ZzĉH�{pE��_2�s&=k�<D��<��h�ݕ���o\rG>3Q~rF8떓\'L��G���=�5!�%����;���Ya�FZ�9F%\'7b��/�	ݎN��%�{_w�	v��~�mț�^�[pdϮ:E�*��{-��1CT�.���-2�M5b��|��6U�7����\"��ͻ��)Rd7��zN����Lo��B:�B��vB��C�{2x�w�i[ɏP�M\rV��E���2�%&-�#�k��P�F$���S���ÉGw���7�g�-�Cu��!1�d�א����W��KV�<X��:>j�1s�5���zvd1��##�D\'�Y}���?��1hwF~o�k»���9�Z�C�s�\0�YW��\\�H��ݘ��(�u�,r���rK�璨m��ɆO�:���393�s�z.���5\n^�q��^��q\\y?�oD�$�H��4;2�\\o�ί\'��\"ka!&�1෿nY�ڨQ$��%�YTBq���wg�������lW���Y�?�sO�+I��({3�NK���5k��\'�$!8��7	S\\�a�I�D�&��L}ҽ��d��tC��rL{!�_%{&]��J�x�I�.D��^�\Z��?w��O���\0&��\0dl���jVB������ؽ�#�׸װ�̗�5ze�+?B�,]�i�1�ճ�fE�c�i��A����!�2}(�Iz+Z�-�){��\Z�ܟO�������}�/��Ⱥu�|(�pƟ���G�HoܖEl���1�̪���#Q�V��&&�m���#|O��^n9�H�D1$ʊ5sR�7�]��ۑ]�Fx7�w�[���c֚�x$���5�c�ȑ���K}>��nя��\0��GܗQ�9_h�E�݉��[�쌎�5]���Dr���n����Os\'��8�i���Ů,˗Vކ̪�~�����+����������6?���C.��\"Y��K+f�\\�=��~�Q(���D����\0����w�\0SK�j+��e�V_����5��\0��6�W���\0)\0\0\0\0\0\0\0\0\0!1 @AQ0\"2Pa`qB��\0?�+�Bi���q!�����}���X��)Q)2�Ǎ;�={�ݑ�s����y<\r��/ؾ�J��aKI�\nq���՘~�诞R�dqS�+��X�ɱV��$QT&MOɫ,5�*�qe��!I�xF�i芴J���`��ﰣC�y9�D��r��9>\rЋ���F$��ч:��X��4�4�a���{�<�?��ٚ������-�E�ϑ�Н��ɉ�p?��#R[�QbV�t�U��#��k�yaq�b�Ÿ���i�\\\r�\"BY����\0�q�i0���Y��D$�%-�-���ad���i��$�����:u��:�;ef���T-�/c���YW���_&/�k�rKm���j,炊(�\Z�1n�;���u��6p7\\��؄��Oa��������N��_�b&���j,rO���*>�lS�\"<�.:����*��z��X��Ij�ec^L5�&������C�b���/�}o-l��������Y��Pd��dy$�i#��k<>ɪ7�VP�J%d�YD��M�\nIB�/}�3��jǇ�\n,�%��f�O�6!�.��3I],\\w2��P�E�M:c~��Q�m����J\Z���­��\"P/,48�@�~\r�\Z���}|�����k��\06\0\0\0\0\0\0!1AQ\"a 2q���0BR���#b�@�������\0\0?��-G��X��/��Ŵ]�:[a�z�\'�c�a�\n U6�bƢ�oH�}�5�a�k���BYVr�1���5����N:��}%���^�Z�&<�Ulܙj�^�*�uR��.g^��~�~&|>a��U.ow�J���o��AG0�J��O��|�û7N,�*����Y.|6ߘ�)��6/c���U�T�E:���>��:\\�]�4E*��D�/�d���Mz�培�lh�\"����UI��\n1qU�|6 ��Dvö�9ۄ�2ƾdU�~�j�EǩK~�������W�.W�}�f����3��K6��h;h^̽���Ө톘t�F��nYa|�Ku!�:�;�Y*��u����	o�5���N5,���[+�IYZ�y~���!V�N�i��D�O��C2������Obj���\0i��ٖ�	j��S5_#X�m	\'U����4�Gۓ[���\n�n�o���EZ\"���!�>��\'a�T��e�]�-�X�[h�R��5ľ/�V�r:���Gr)j���2dW-KijA\Z-�h��YMu.X���w3�D\\�r�\"�\r;!���%�p���E����%�9�_��\0�bY���\'U�^��\0\"��%$]���Ĵ?r_���nM(�P�	�|s9�K�HWL����S���=ȵ1��*\'V:�\'�}qNa�w��V#�:���OC؅�%����#��k���I��\Z��*��J/_F�MT{�~����UL��\0��\Z�?3R���Ͼ�f��S�Jh�a�m�\"�G~�s�.XTE�c:����E/L-�̝*X�$�����Y4�U/2�X�i�v5�.�Dl+Ij�znh��7�k��.1umQUOwb��+Q��Mu�i�br(XwO�lk���K�톥T��0̵|�94ԄEPf�M�9��tEɋ�D�O�b�+jE\'�\n|;ZK�򑬢\\{a5;�Jܾ�C��A�Dգ%xa����7RM���3Q�I��������CY���lp:������\"�е?S.��K@�t����~GJ�(l���O�?���:=�톾�[�������ට�O�FM[lOs7ՙW͊��/�;��6\"=�M��q�ǖlj�;�Rе�3է�� ^*���+s����lg�N��ҭy�?�F)�\'���q�A4���رSr)3��о��gq��rU�3S�K�t?�u]v�j��[Кp������񗡑�U^�u{�I��ђ��c��s�}Wc�ԚWl��\'xd�YtH���S�E>:k䙇�Ҕnu9�l�U��_T�&~G��1��aO���ڬnJ:���p�Z�ƫW}�ss�{�;��=�te��-�p��I�m���*�\Z������U7�Kr*R��6��C�Ba)�:&N�S���.ȺXwr�;��qs3��4��M/�,���jU�N��\0�-���MJ_�M.WsN��k���K�V���ժ��\'�g�/M9�E�b��l8.$G��W�Yo�\rrh\'@�%4��ثE���_��S1���q�|t:�vH��3��N|n;G�REӪ4,pUUN�}*�D�2��u?3Y�����φ�YX�9�����N�e�j�4�O�S��Q�*�]�+/��T��2�\\�W�5!l+���;�}�+���I\"��S�����U���N1��3�ma���g�|\\��N���MgT|�i��/��4�ݗK�[˦�aY��	l�d���×Af�¥]3��ӟc��hzsO�yfZԠ������SV�M�b���w��f��v\Z�4kǡkm��_2u/�Z�����[Ú�����[%�$D��x�yl����53*���~\\��jړ5f�1�:<,�Mk�x���:�\nП���%�mw\\�����\0���߂�n��\'ö\n�ʺ�1?!��GK���������К���\Z���w.�Qbp�����^�C�\'�2S�*q��9m���kQ��.��KS�&���Ƶpu>��q\'A-�E���iW}��x>t�~�g� �z�-��e�R2�)�rf*��z���a�RDR��5\"�����p8�=ǗR�o�=�*�3W<)����ri�|cg�?�fe���D�EZ����;4Jvx#�X&H���\0)\0\0\0\0\0!1AQaq���� ����0�@��\0\0?!���N��q��8��ʲ���c�N)��ᘴ�Y��R��\\(����9V��2ש�t��(�iC3���M�MCl%+�H�����ї�%���o;��`�q�{�@^�C�j�4�:`�Q������\0����ܻs}́4Fy>��9��\r�}(�q>ղ�L��1h$�g~�KߦP��Ϙd���.+�a\nRv��I�M�\n���g��ewn|\\�mXq�*�W�V��AE��4m[o��AQ\0Ϳ��Wк���4k�\0��2Z=�+n��s�#OL���|B�2���`�Y��1����ǈD��.e��C��n�0����Z��.�xXD�ٶ�dP�m���8��q�#\nV)�1,u�L���0l�3!V̼��˭:TWS*�q%���3h��=x5x�Kq\nm\\_1=�p�9�0p:$�F���C	���υ7���ÈM��5�(GeG����%��Dk���1�|�hg8�0 .��.O�Kx�j�\\�V����.k[�xV{������0H��F�C��\n�=��-0���e���\n����:fd�LSt\"���o7r�R�.C�Y����)F(��#,5����\'��H�A��l�J� tJf\Z4.�D���U[gP�J�����ʟ%� QCv�U�2���3fSӉ���S����V3��;ȃ�Ҋ��5Π&�8�	B����S�����ubU1��l^9�,p��5�\Z���\\ʙ;g��I�~e�a�@�����jY�.���,;6�A\Z�7��\rFF� �i0��̢k+�o�1<b��\\�u1�)r���,�2Y�G�I�)�\n�|2��-d�Qx�E�~0F�W�����y�9�av+��P�^%�,\Z��\0=`�n��,�����e���iq�����i^#Uq�Z��WRӵj�-��UN� ��k��SK]��2�c��C�&p[H~ �-�SA�]L:;�,�5��\\�Fǳ�\\�����̲X�\0��,_�.�*���fI�[�L��K-,��8Wr��(��2��~��\0s,o8��ӵ3��Z�䪀xT{���Ӊ�$�GC��8h�b��)Q7�����@^z/R��\'�o\'�x�n\"��j͌>�Ø��Ҭj�������`�M��@�r�E8�p���,���\0��gB����U��?~�;�\rK(���^(������������kI܄�́N�|�u_q�P\\��h�E,uz]�é^.HJ��r�6���M��/�N<UZ�1,P��,�%v54�\0P�?�����%L��}D\\+��#�T��vB�(���X��J�\0��Y�o���\r��EE�f��I�U��KA���*\0>�r˕�l��U_�����]J&B,�9<�G�/��ғk$6�*J����(�c/��\nNi�q|D�x�=A�\Z�:��\Z��y�c/�7_���I�چ�\'�E0m@�K�����?���$,�@V�v�����x<��ͅQ�ǨÉ�м�\0糫�\n�5�+�A$\nY�_B�W&z\Z}���+�X�]�bX`�|B��} ��\\{����gl��N�o@B�o0b�O���\0k,�ǙyԷlR��#5�))@YW����H����<L��׸��A�ˮy�wJ��nU)��+�%�p�`���?�!�t���2��ѹN�L_�%��(Ť�wE��1Т���O�K��#�+e�����.���P]������n��TP��\0�V��\'����V����S��u����m��a����*����T��N�T�Oɔy�.O��y�k�S��\r��kyZ�)��N��Z}�bLhm���<�Q	��5L�$Xi\Z?�3�^�X���� �x� �?�(�9�q�@�u��4�@U\\��\0�c����&c����\0\'.b�c�;�U֠�~�H��^�y��Uy���2�\0��\n����KQ���@-����\n�?����_�8�q�&�C���@��(�H+A\r՛��t��KJ��K��Ж(G�U���\Zs�j���v��U�[�jl=n�	A����s�Q\n��������y�d�s��LԪ*�#�8y�,+k���m�F��j��1��������9�c�f������P�y�{�D��O�C�X�(���\"R3�1���r}a4	�\nl|��-�%���n��Us�d��3\Z��n\"T������񘮷���W���r�l\\D�׵�|�+%V�7ߴ�{���^bZ/���6y!I`x��\0��U<���ñbu,�d���X�����3:�h/U7g:��֞>���h:�&@\rS�Ay�?y���Y���D/)��S�W_1���\0j%2�U���@J����[m��T�ܶq*�e�`cZV:�G��s��;��o�j#_�����p����r��?�?V/Cl^���5���1E� [hv�)n���x��W&f��(�i�I���g��J}�ꝏ|�7�3��=L����9s�e�>��@f>H\ra�\0(��ѭ)��QB�2�^���,�A��$��5��M3h� }e�����ό5����V��8 ���u�!.�����>�U����6��J,���Pg�k^�fS!�������m3Yf۩cOv����H���+	���J\rT���Y���F��_F\Z�U�4��c�έEp�)F	���=)-�yg���J��r7\\��]�4��\0���`���+��nC�?� �V|� �Ruێ���F����mN�6)-�u�.P*��Uko1����Txs,��2Ωԥ�K�k���%�Gm����+GQV%�p�&?��(b�O]}��zgYu�����&���q�[�:�ϨT�����̸NS!�\Z�a:�[����V�a\\�%��	�GsL\\��J5=��V�����e�A5N3�KNV_7.��8���� �ٜx��9Y�Z���:�\'k�1�f�2�e;ݏ�Ii�����c���d���C�P��s�W��/���*\rؑ�^�*�1��/0�K˙l��Y&�P����#���bh���M�ep�9^w�V&C0��*���3�Q�L��P�l����f���`�_qM6=�7�UԪ5uh�%��$���x?hX���\rn�8[X8�\0�EV6���\\��06a�\0e� p\r���X��Ǟ>e�	���gEJ�#Y��<<�f�d��\0jR���T�2��HԮ��^�Ќ��XI}�.�%&0���~%w�uQ	�j\0/M�Y���C�҆꽢���8�\\�h>`��m����p\\\\��x9j�s(ygܱ]n���u����F���{_����up�\0C1Q�&�epvٟ3�\Z\\�A�2�`~�\nH+�� �l�4n�aYw��g�YK6�����\0Si<\n�����LDn�_�_�G�G�ef4Z���2�X� ����ω�N�?2���]���\"����2�h�%w-�%��ЮlCz�<¯����?��T��SvNz^£ɞ�4�+�s.ifC1�і�T�_#���BYO�E�6�|NE<R �.��s&[�j[�\Z��i(偲��n�<6}>%Z��s�~��\\��v��,r<��ۖ�pq�z���o0\0M(���&q���\0��JD���c�� \0�~�~�3�mx�U]���G�5,]��3yV�E�_�6�_��eu6�U�+�8��47��)�f4�˅ k\\M��9�¶��\0ҥ`o~�e�/עdQn.{�Ǌ�\\+-��O��gr�]K���p���3Ya�������8����bi���r�16�3�\Z�S��~��pl��\0��A�c\nG��ݖU�̡�+\Z��Z��񷎥�N����Լ\'+p�s0*�#����@���.4���s��L1�>��/�%��<���Y\\�V�x�Z(�\n�jm�0�\Z׷�/�\0[�;o���+hfQY�=��],s��pϗ�ĸ�Y�+2�%\\�S����f��Vb�\n`�@\Z�Q�m7�c�� *h[ψP�:C���}�(\0U�w.������e&\"l��@{��]ڪϧ^�� ��a��Y�n�����+8�\Z��n�f�>_����f�Jj��l�5�����2^>��*�|B�|N�%k2��e	�o����\n��iLD^!�D�p/qBK*|\0��\r��һ�MW�#C8E-���@7��r����ʐ��xp���ib��\n�j���?<Cwu��ULm��#��ΥF\"��E���p�=�J�(�86�d���@�~2�.`׾|K���r��z�Cu�˻}���`��l&����\n�7.�)p`��s��f�Bm������!Y��`�����L�e�.Kg�<�g:\'�ĸ����Fx��CY>�ؘN�� 0��c^9�𚋖2������t$�J�B����\0\0\0\0\0\0c�N��ϺLY]��܂�r[�����?k�R��u7�,;��ۨK1�I��	�\r�q���Bqs\'�O�+HE���i����6_E�\0m9�$d�ɏ�sc��H�!�D�d�%�q!(�h�Yx�cZ�m���A.�(oQ}g��x\0U�,9���J$C��\0�W�I�:����\0?��6��z/�`\0Aqx����1�cw@�0\0ͦ���{dM�L�h\0� �#�Q�uM�\0�8K=󰊢�Se�\0�9w����RW���\0\0w��=`q�·U\0V���3�\0�� Z��[\0 ��Y�J��n�v�!��@�������\0�i�$\0���QA\0	5�mp\0	\n��Q�`�?H�8\0\0\0e�\n@�#�ڄ�@\0\0\0\0[y������\0\0\0\0Fհ̕l��T�\0\0���釲����η�\\,_�ẖb�e7	n4�!/��E��\0)\0\0\0\0\0!1A Qa0�q��������@��\0?�v-n�8^y,;yt�t9vp�l̅YKv�w�ӥ����b��]�$���Y��7�6g����9{��H�,_2���@,,���;�����2�İ&v����L��e�����\r���d�Mklfu�Y�rU�;��*\'��F�3%�uz�9<�dIU����Y�2�n�y��m��[\'ͿkV�7����\0�V�.㿹\'��y��x�v-\0�	u�d���\r��\"��-߃����ߒ߼��l�-��a�~`Xlauľc\0��}\\�����݅�1���0�1��ǐ?k�\\����z�|��?�x�<x���E������-���<1&ñ�K\'O0�,���\0��Hh���9t���L������n����?��#�Ț�\"�ƛ%2+��HX�M��ռ�?�/�g^$��\Z����7O�0�~mc//6ǟSp�yce�	���D�ᐰAzYH:XL�C��������[��\0X����#�\nj�����hO,c��	#�2���d��	�Gǂ3ܯ�5����ߗ)�_���<D����-I\"]D�\"�{������9 6)��v	��,!���\0+����Ȟ~�^$hw��3o�qg�7��vό�>���#��H��В�x�}��5�{]z���`P�����x��VA\Z��ǫ�v�ճU�WIe̸y�lY��B����fc�!�xȮ����e8F��샧YO�bK�����;2eʑ�c&3	�i��Ϩٖ������ܒ��@��v�V��92�8�6Vj��$�\"Q��:o�W��	P���	rs@���2�����l�r�dF\r�<ig><>L�b1�L����w��;0@r\\���0�����n6 W;(u�6��:�`M͸/�?GKaHE���a�d|�g�6�Mٌ; ���W�a��yH>�7w��������6�%v���ί09\\��C���D~�!�e&�K� ���aiH��i<lFAt�$tX8��̡��~?7G�B�%C�N�š.�� v��m�3��祗�� ;���ńIk���ǹ\Z�`-\n(KH�cU����s�x_��$��d��nq����ߨ[��C���o��x�c�@߇]�8��rϴ�� ���~��(�G�N�HS܅3��\"���v��\0�Ѓ#1}�2bOR):ȍ�b;ٍ�<X[	�c\nLH�x�\0{_\'��Ѷ�y ���-�X�\0ܝ��\0�\0�D��J�P�����C�Z�\r�z#Df������O��>�=�<�>�ٶ�HG\rAg�?�\n�ϳ�b�J8��m�rF��Ճ8�\'>�	Ca�8� ��4\'_7�#�Z��&��=�\0/�w��Ǟ�O�!7��=�@an��f\\��,�n0�W�\0 ��<�7{3�ƽq��yA���2=	_���.�>�̑���g~b�;Y+nvg��X���Y3yx@6�K\\P�\n�_~�q�&\'E =\'a\\LZ}�������-���Xq�x����ʰih�� x\\N����7�r�\n����(��!�\'S�b	X���ݻ�^���I���	᳜�}_����2l�\\�0޼�����Zf؀,.=$H�:���s�����>}�di�-ml�����\0~�-_��v\"ͲK3�>��[y�?��Hk\0#�_��.{���/ɇ�{�\0�͘[ynX\\�	�P!����`��a�P��o,>�y�y�d<��>�}ߤ�\0��Z��,s����P�{o��>�\'�����>$O��f����HD�.�ij|d���N}]��#���ѿ��l�R^�=v�m��\0!\0\0\0\0\0! 1AQ0aq@���\0?�\0���\0e�1�˞X�s���ٶg����Yg��۞7���l���`��Y���������{�,nzv/�m�g�i�Y�,��C�3l�B��燶Ye�$�x7nYn������@so��ܴ|k��0g��e���n�BűyJ��.�bMpdY����w�ă��^Z~>5����)�������\0<\ZD��Ď@�N���|R�~[��1E	�Q���bc��cb\"��[��/�����qA�����ђ�g���4�-���`\'�D�_3�#���\0g�<|�����۷�Hۧ��nՕp����������\r����[��Ӑa>p���|�r���Y|��O D� �{�n\\�qg�,�49����,�W��!�\0%��.B�aO]�n�\0,F>���Y|���FȠ��F|!�d�M)C�01!����i`������?$D=S<|mg|<�s��>�Ā`\Zc%�u���$�̍��[\\�A{�^0R��Zc��=�\\�����nl�<�cJ��4B��޶ߖ��A�:����,���#�c�`����;n>;�D�*q�����k�C���nB|M�;�X[��j62�P��\0�D>Y�W-�Г�_�����n��N�F�ɶ%��S��?|��e�p$�K��G,��B�@�Z_������\r5���r�s �\0g��at��bz\r+��at�h�������m���S���q\'�Bm\0[7r�6a���������9�|&�|�\n�1칙<D���.���hQ���{�9g��4`�5rɠ�x�hh�K��r��e��_;f�p����o�# ϰ��!�	�KC�\r�;>���2��[�wRS�Ǥ�d��/�	\'��ۍ�ow�	����a�r\\�9� \"�g�eķ��l�aZ�F~���(��A�@?�Og��3��	���o6���bF?���N��eH�^�P��ivi�5cN7_��/�/rZ�����IزNrӍ����B$I�}bɦd�����{��Z�5�ސ�g�!��q�9\Z����\0}7ն ᳏�}���l�)n�Z|�\\�q�(9a�C/ϗϒ�d�/����g�]�~��v��ٲ|�_�L�,?����:����̾<aG�#��k=7.6��,_�������A�\"��jԐ�u�p�i�+�#��Xz.�o#[�����a���Y�Fu���<m��%��,���\r��k.��<3�\'�&<gd���\0\n�����_�����d��|�\0W����c���}�������w�|=5��|�\0��]���{���q�獶=���7\'�H�g�L�۟۟�C�/�y�����rG��x<�!�{sw��z��k���͇-!�,���\0)\0\0\0\0!\01AQaq������� ��0@��\0\0?\0���߼���ە�p���:?L�%��&ׯx$�ę�e\0&#Sˇ�I�^�Y����⺨�4��p%�$^#���jw5#9\n�!��Rõ%���d��%��B��3Wu���;��~�#ME/�cdQW�^5��IeW���Q�du%~��&�\"5��p� �fM��\0�5)7��|s�hY)��W2�ȡO&\n�����\'GÛ�ل#��B!]\0���&\\@���d��Ez�,�2\\���I�c�(���[�� �`{�V�\"��YnH�#�qШ|��D�/����HTv�E@����������9	�?�ABO��r�;:Ϝ�L�\r���!�=d�\08#�\\�@�%������v!�Y��$�4\\�^1(R�����BD\n�7>+&��D�v�^1.C\0�t��(�	xX�q�J11&��\"�	qg}KY7���U_X�A�R!@��7�IƠ\")G���e�!��\'(в F�񐤋��׏�J^g�-���^v�H��x@VhP�/�Q�ԃd�I?��c��bU�MG�\0�H��\"���y�FP�4>�����6��Yo��;��a I�0DQz�%]��\Z���k-\\3���%�Q�ڼK«���e\nTRb�b������\\���ȉоr�I mg~�Z�c���&���(��ּ`�G�G��\n1O�x�)Hnߌ\n�@�WF� G�DU�.W��� �\n�}:��[I�=w��e���x�Ӑ[�v���:�ó/d���`QH�^�2�͇�L�Fk���@tܕ%��Jf�I�]>c��I� ��ˡ�� ��??|\\���}>���Xӎ�����|�.�8\0��M��6�Փcz��\"PD/��p�\"A�G��8���k���J!�\0|�OI�vCk�)��@ڱ��%& @F`���H�GX�\r�\\>�v�����؉��E>�FK\'7�x�&fh׊�b��\reZ�����6�z���4��A�|a�6�>��HfDx���I�3����Yg[��&E*M�\0�iN�]�&�B�O���b�\n���n\0\"�)��$��H�����w����K�&�&#	)>�|.��$���ʍtg�����j� ypm��ݙD x�7�YqX�<�dd5\rtbϟ{�BCM��@�^BYL0Hȁ()tݶ��\r�M4�D��/��^k_�P�;v�.�ʢK}�D��Z��z�Q$�=��<bZ�c�5_|%(n\Z�\0��Q��HW�~g3$r������0B\0jc���d͇�~q�/#h�����1M�\r?a˭��{�Hԑ�\r}g�Wr�O��\0ҧ��&X�̜�߬��Iz$���z_@��*��H���R�f\n;�����ŏ�?��k*E�G����q.�\r�!�Ct�5�ĠQ/��\Zt�)�����Z�U,b�F��O�S����#�_;���1;�W�c��7m��z����//�Kd�x\'��\nO��1�03���H�h�C�ᰉi�_^��=Lh2����5�8�\Z��{���\rF��R/�#+��/96ך��0����PT>d�����u�zSq�{N�oD$	�BX�O�6R>��j68�O	�l+A25Z~0Sl������dpt�8AL�&Ev{|a1�^|���(�$١��1ӈ��E�kַ�O�����G)\")� ��\Z q�^	����o��1X��(f��\'�!�� ��o��<!S�o�yU��o���O*?��\0�ښI���>�u���c^�����8�O��y�I���\0�A�($��Q@�)�3]�\0�D-+����C5<��X� �Ě�9��Ԫ�s0u�^!��O�1N�T���׹�dxRo�乕�S��	$�Ͽ.������48�hO�!�R���GXғ�G\Z�,��2�\nǜȳKg����������\"����0R\"K\r!ېB�`\r�r���P#�����1hd3|���g\\��~��.짩�!��/���T\no���JH�:C����噲vS������RI���d]�ǄF�O���i�E<�8�<Ѝ@-Y���Y2�N�\0�D�*V��J �ݿߦ�s4\ZA��j�����(cRo\0�C�\r��\'t@z�\0�zvR�ځ�f�l����M|`�elT�>��*�Qsq��d��n8��41�8��B���{;�D^^u��q<J�?3�tDq����j|��m:T���ɼ���w��Y!�%\"\"���\0 -��v����ٕ9N��\0M�����X�*R>���eO1l�v��|�r���̘v%̴�g�OK�pA��C䐤Rz�*\0\0�\"�;�#�,Bk*�����#%-	O�\\��d�ػ_��6h F�1�0�~�-{�7����	(����$������CcT����|υ�YLm	����D:E����Zm��M�*A�=b�lS9>+�Ly�Ă$�7n��\0�$�،p~���b\0@c�ʠ�2<���S�D��D˳dHד�x��F��ܤ�)6=���6N�V|��KҊ�\Z�YlJ��w�*�͉Z���C�L�!�k��A��x�:��4���ל���ƣ\0�D��x�\'�9F1\"%�N�\0XWy#Q���\Z�؈�z�d��Z��5�$��\0CΗ\r#��|��\r�F@	�OJ�/t~E�\Zy산����0��	VH`Ц���C7��B�/x�Jh�Fs#6/\\G+��hח�\"��=d:yd�b�r�Ǳ���&i\Z�F�e��x�� �4��!��ER\0�P��\Z�9����\0�8I*��^rUSvI�˄��TU�w	N�+*6O�!��)\nP����Q-�4b���x��a\nKOY&��)0-��o	\0bԻ\\��x���/��ń���#w����H�J�o��J�:|c�PD8��. �O/�1�7��R�ǏYR�;Wùí�Ci���&E��#�?�0\nR`Y\Z��=vz�\0�y�Ś��y��:\0q��Y4A9�����b	I����\0�:m\\���(�x�qq*����A���<<�I��-�>�y�@�A`�ό5t�_���\"�r�D{��⑒�BԒ*����AW��ڙ�,<	y��&C����82F�!a��&��m�	����f\r:»�S.��XPa\'�DgV�\"$�$L���.F����4��~1��t�Y(fy�kc���Ц����N��ȯ�!ex�EF���재̖��?�Bmd�I�\Z���m�/x�-�����ˀd�\0p�g�t\0�$ ��q�	#E� �퇐��2x�����z���#P�3S:}obI	��.���-�X������0�����&(bV*<�5�(�59&A���0�޷��\Z@�i�&�#6����l���\0��\0z`�P��P������d�Iܝ�~�pV_�������Gi�&R]i�񍹤���xv:����O\\��X����&Q�$��6�\n\0)���6H��|�-a�4�%��H�?�啱-�d\Z�&`~��fCh��]+ٳ�n�HPx��G\03ܫ�s%�n�J�jc�߳$(�Y��?��_R8||�t���i�\Z��D��;��}(�`�{�\04��T1�}\"���$�;7�\0qZ��*ja�i�ЬN�[\Zр%�[���g��9�a0�p~���V�\'��Y����1�8�&�Q�^���<�-Ty���N��l�G=����z	�X� Kp�8TL$�cM.)4�����`��Lny��H*Au�Ɂ�j;�� ����a�F>V��\0U�	D�7���H��������3���LL\Z\'[&Q\nt��rBQM:}w�}d�a���Ќ�[>L����χ ̺�z�C��L�o���L��m�Bl�|�Ŏt���w� ��C��2)Hj�-���& @\0G�{�*<�Z!tA\'z�\r��4�^�x��)����\"M�&do�c�;��O�r������Z���BI����M,h���XTc+�\Z�\0�prR`�����2���������ucg���X���x�UC03�F;l;�?�!��6��~1y�^��Z0�M�.|d�m*��:���m�Nǽd�h%߇�<�����xi��qAz^|�6c(���N�Im���\0����\"��LI������$��ݱ�ۍoљt��\\�!׿^ga�*R�x�D�0�M���J�y����$��|�2>\0�N���I���X��Y�fl�{66�4��*�����\0�M2C;H�x$��t��3��**1bg�8��`���	�i&Ө�K�X|t!-K��b\\f0��P���q��@\nlJȐy���J|\r	���h���:)_l]X�1���Ԧ����<�K��O�ɪE��r[B\n���vy3ZC˷�M������_�0%Th3�j#�Q0*p��\0o\rF�KP�8�s��=<�V5>O80�$DO�� ��	����%c�%��z2� &D��y�j0D< �x��)e�pd�;J�Gd�y��H�9�G)��B�I��7\\��*����<n�8���&]�QIP�u%�h�����r��}�\Z�����>��j��\Z_��b��T��\0h?��Jŏ`�d���e%x��o6�Q {���ˠYE��oӌ��l���j�D_(X|��ᰐ�qG�k!(\0FǼ�4Y<�\Z�a<��j®�ֱ��2\'CΜrpOg����A2�fC��M�U)�p?��7Bp�\0��3$����YDxe*�z\Z_�DB��0�����6�\n���i��G{�x���SH����p5�������I��8�����z2܉u<�\'�d�?0:��rf� Q����j4������\r�,��H�fѤ��\rW�ACa%t!/�7�~?��\0E�@EP*f�U9/�\Z���&%�.�yu�h�2��\n�,��\\�+U�@G�ǧ\n>�c�쳌%��4�{L��O\'�`�\nL`Iџ8hv<?8�:�\rI�q�ǚ^�8�(���W,�������)��#��C�Pw��E�G���\0����\\\0жY\r��\n�%������\"�%�e���Y?��0�5:�,��#�Ì�@P�#�\\b��7�����9�t�R�@�?�xP��bKa����G֜����d���mǰh�����\"��)d��>R�\'94.�#������DQ[0�\r<�_Գ�8�6�u�N���w� �ah/���_\"C�$㳼����<8|�����8d\n�Yȏ �S���2�y>H�0H����ؔ��l�F����U�`�b�H��b�\0:� �Qр%\"O^S��5��W�� e#S���A;\"���W�d��?��HA-�����U&;S�>�u��EF��ɍ¤4��Q�G�\n	\r#\n��UI�r����I��p���,�\"E�cR�80D��Q�<x�IRm�5���\Zg\".9������_\\�����D�����5��3�=�6H�.g�p\"b���A��XǀAV�0�\"ϧxhKÏ9A0ůme���U�\\����$�dGy$\0�ջ�y(������p�GKx=�D�k\0����![yGX��2\"����*F���_i�ȯ$~0ذ�˵�o8a\'�B���2��\"@��|i��!��G�q�.�@yE�	%�.��\0���-kF�����5�����V�ˍ�\"�C��`��RHA	����\n��bN�Y�*�c�� ��k�neW���ۚ����;ND�\"E#��*c�DĂeI`G��\0�HFԕ�=���IGWs�B�t��r�*��F��_Y,`���\0��\"1�o�)�Vawx.�>r�A����4���9B�βĥ��\0̚�����\0d�ۼ�Q�؟�Ef�/c�p\0���h��=hɨE��)�ѵzz�\0���U�¹�YAX�5��a����%�B���a~����*\'@�`�@����=���x@���D�PD��\'�d�*XC����m\n-a�\0�\\_x� ?����qM�\"N\n�$�9��9�����P|\Z�j0^�)�>01*h%�;0GR��!�p�I�h�3�s�._�\'T.�\'�Vv�D���s�4�r�fشF���y054�����\'�E���\0.7-`�[����$��\'�_��#��$ic����g8+J�h���w7�Ye�ڟ�d n����\0a��=�\0�=�9��;\'P}�7�����x>���p\0Ҿ+��*Y�L�\'<��E��7���� I�bQH�b���nc��`%�Yù�F$I3\n����^�9�\0AJc^�������l�W�|���X/�~���\\&����MgS�Y�n��,�_8c_�	��ē,�Z>�S�\0�%¥�ë��#�\\dH$	�:5��ڑ�Y5M����q�5�%�|9e�i<}qcR2��>�;JW��|�&:\'�%��w�k��#5�^)�tm�d����Y�~5d�\05��_��\Z#�4��	��ּa��Wl��2� �{pO\'?9\ZD�:<f�H_;��N�d�	�8�� ��&�\0ҜO����=�:���%K����<�	���d\\V������T������EH�����\0��`\Zʨ�dJi?��m���ɰ7i���p\"�\0�?����!��������\"��V��/,kX6�Hͨ��Q��dB�S�!M�/;���1�>\0!	����#9G�\0+Y,�OW�Qx�޲<5��A������)��\0a���T���8��145�w�������S/-:%=n���D<��p�t\r�sc��&Lɲy�d?��JbΌG�B�e?#���9C&KA�8���>��65_�ɋ6	&V*\\\\3�d\Z�M\"���������g\r�(�zf:|��������s9LI��B��bҕ�	�}���V����\"��\'�ha& ���)� �1�UE��OP?|��IP�s��fƕ/����\0h�T��{F$:#�.�1��ۧ�)�\0�h��<�Q���|����\Z�\\+�7�2gL�&������Cu���\0��t�~��5��h�C�?!;0�~1!PY>��f�N��[���n[C�\0{��K�ʶӹ���o����7z��H%9-^��$T\"��K\nm����q\'��AA���SoP�}��$~�h&��z�,�co\"C��p(v<y¸��\'�=p\0�F*t�<8��2\\�AO���S�/]����>�o� [/s��X�\r���b��Z�I����<CV�X�3EK��Gm<�H�Q�\Z�G�����C��Ɂoj?=cH��bM�O����P��?��$�<�JnO�NɁ^?�*�u�\r���6���*rC��*���o���8t<�ʜ�(�?�Y��};��:���8CN��\"@t%q�w��\"�(K���_q�9G�8��\"�m��0\0����#po	`sy����)�o��\0��:�x>�2cY!���k�9�`�C��2�)�r�:�$m�2�Q�9���Ia�y��p//�U��F�?�\Zf�엘y��5��[�Y2Vb~��d\00�lμw� ��$j���L�����F\"c���=���a|��j�@�-��K�����P:�g��6&�u,=G&;� �Q�|w� DK�\0Z�4�}�Lm�(��DL��Ʀ�1nڍ�/t�aG�A�x��\nI���J$����a�rP�6Nx�i&��,���)�M�o��p)��$��0�z�\0�����:�8g�bq/�k��C�6 �X��&l���>w����m���&����q$��ݟ��\Z��G󈃦b.���d���+�cM�$����\"�-y�\n3��fFz���HS�t͜���P%iM9��=c�A�.��&r\0�K����C)~0S\r:W_k�IW(A���h �&U��r��R�q8��k��\'FC�����`+N&�Y6	\0Ķ�Fx�(r��ʁ-,�\Z�rM����s��@Z�~0$��w}q��x���f����Lp񆉠)b����\0�2�	x�Y2��5�15*I0OC��$�d]���7yY�1wd3F�#�&����<�݉����0�kz�J[���5?�20�k�bB����\0X\"P������Uv��1�B0�1�=��$��#�������jBj߲>��]C�~�d��\Z�w�>� �����3��','image/jpeg',3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wine`
--

DROP TABLE IF EXISTS `wine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `type_of_wine` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `note` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `image` longblob,
  `image_content_type` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wine`
--

LOCK TABLES `wine` WRITE;
/*!40000 ALTER TABLE `wine` DISABLE KEYS */;
/*!40000 ALTER TABLE `wine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wine_tasting`
--

DROP TABLE IF EXISTS `wine_tasting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wine_tasting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL,
  `note` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `wine_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_winetasting_wine_id` (`wine_id`),
  CONSTRAINT `fk_winetasting_wine_id` FOREIGN KEY (`wine_id`) REFERENCES `wine` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wine_tasting`
--

LOCK TABLES `wine_tasting` WRITE;
/*!40000 ALTER TABLE `wine_tasting` DISABLE KEYS */;
/*!40000 ALTER TABLE `wine_tasting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-02 23:23:51
