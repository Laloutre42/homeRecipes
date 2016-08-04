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
INSERT INTO `recipe` VALUES (1,'CrÃ¨me catalane','120g de sucre suffise par rapport au 250 de la recette','https://www.meilleurduchef.com/cgi/mdc/l/fr/recette/creme-catalane.html','1 litre de lait\n6 jaunes d\'Å“ufs\n250 g de sucre en poudre\n50 g de MaÃ¯zena\n1 bÃ¢ton de cannelle (facultatif)\n1/2 citron (zestes)\ncassonade','DESSERT','ÿØÿà\0JFIF\0\0\0d\0d\0\0ÿÛ\0C\0\r	\n\n\r\n\r \' .)10.)-,3:J>36F7,-@WAFLNRSR2>ZaZP`JQROÿÛ\0C&&O5-5OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOÿÂ\0\0ð@\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0ƒ/[ÁÁTáèçË‚ž­\r­µ”\rµG¡9ºd(M<rÖ´b› 9\\D—¢]Ð¢…8\n)5ª\r¹ÐªÁð`ph`¸0\\\'(¶9ÉBØ–ÑV§\\&)ºsdÎX†¹‚ÓDÒŽ’]3˜iº4#U0o*ù¾lJ’zp|,’ÙŠç¨™’Õ®«Ä½Íò¨©ÊÀ§È¦UÒT-5åZà±–Äç¡uZ6¤´‚™4ÁÀw`¸8XOç:f$vŠ¤U`Ø—¥Y0¦yî¤¶šzJ#ÓÎ\\!	(†•²PA0BZK©ô\"Ÿ-\rÏO(ÁÂûø8X<DJ„áÕ-%­U0õ\nqŽUJNÉc<˜¤YæÖ²[¶&‰“Il[‚jø6m‘Q¬úÜ>œú‡¡XØó`´\\Ÿ‹ƒƒƒ€!^Lhî|Í%³Î»–«Glfù•²g¤×·ÕŽzb0ˆ¸¦—Œz¼3Y‹ÓƒÖ¾jùŒX<§ µ\\a‰¤óDl`±¤·\rèI_Ô…ÕOOGêgJÀžÈ(KVÅèjÉuÐý/èµÅhDÒ¦öZ\"ÓµJW‚[g¦tTz*9~³ëi”²yøÏ›EV,H\ZÔÔôwDÛ+‘%¿>êrýÜ¹Eë/Mª÷t˜ÕOÍÑZC4b&lå$¹+K\'68žªÍ±n™Á¤Ã\nŒç[|RbÖ\nu£tËep.œÍÆ_ÐgÌ]^UˆOg¡eè«69ÚÕy•©IL¤ØÆ«y#IEÌ¦%zT¤¤:…\r)¡1\0²‡.P1[+¶æu¿®ž9.´à›FŠ´ˆZrM\r@1cÔ¬aXœÙI¡\ZuÒÐàÄ’œeÊ¨ea&Z’@Ú‰ßèwÉà½¥‰ÉFækaU+¤£ƒ…ÁL«Å{T³Y¨ÀÀl¼æ¨b™@®\rJó£DM lY2ßïôó¢«ñué0ÉÂafš s\0Ðé^‹^•#g CÑG\rú.yÑvš“o2Û3£…Á£âD¥¥çN°Î˜ÄOGÝëæ(>s~Ã	1äFXª©7¢ÇèÃ\Z•±ì÷¡€\n‚j<:š‡rÆSANG­Æ\')®TÚöGyùÍÛQk)aƒŽkÏ;}–¾|Tx{uÐ5„œü‰œ”Å•ëN€-¸Æî\ZgZr²ËSjCA\na=HËŸG’è3˜Ô(¢Ü0™ÝùúMW›*n¹•TQB”Ëoo~&•ÝF\05%A9ˆï{Ð’ÉÌº¨ÏYªŒXƒ—{ÂsI£kžŠ›J©g,ë&—êçÌÖ€|êWsé1i—¦f×¢gÐ™êúÝü¯\n÷ºõÀ€!L¼ü\\§âˆêõÈ§bà:&Zf‘5§Jô¢y7+²sVqækµ\n}ñkoE>ÉúcKÅID)Íu“O§·Ÿ-ívŒÃ‡€\0™™pâÕ<.ZÙŸIØê‚Š\\\\Ó¬ZN­/ÒÆ\Z“¸ÎE²íÒòfbµ7LÎ³6¦T×	=¾KZÛ»j.g~îË4|\0	™Ÿ=R(¦l§£Anš†Tjs­†•dJõ®°qšé¢Ûë.i4Õq$J\ZÚP„¡¢æ61£¿Ð‚2}-Ý40\\\Z&gÃàR®©×€$£UÌ¡çÂ\\ºÉk‡%Ö÷”h‘^&¸SQ2 !c8{8]Ýè\0ya³¿¯¸ú400\0sÌÇ‡.Lè<·­™\'9H¦š)­zk?1éè,Ó4ûÌÉ„@Ô¬‰>‡¬«îï\0DamËoW¡0z\0\nGÏ‚Ôr*m“m Æ´ÄhVÑz&kLÜà„È‹šŸ95-8\r\"¬¬îô Rüù|Ù×MýMÂ#ÌÃ5Ì’‹\ZÕd›Á°D2FD\"ás–Ð¶¥r¨b˜áè¨œmîï˜NÏž§Ï{4ÓÐÕp`p`Á/?š I¥Ï¢Å˜Ø‚†‹Ä€±©óÄ	_Bs`>LYƒjÎÞîî\nuÏž8Üç_Cr«8$ˆ´‘†A+‚`Ê[†bàÑh(J¼É\"±ÔÕ›àÐððÏ£ÙÛ£ÀÁ.1ñr\nvk¯W¢@)Òž³˜ŠòÝÉà`µ˜ŽHÉ 6´0\r.K†ÌÀÄÍMÝü,g‡—ŒmGDRD­A6Cà~l¤Ñpð40Z=AË>K Ä<–\0€³@€jiîïààP!$)ÏeùÌlu‰¦Ì8SÔÍ‚Ž$†Äù‚Œpä˜,£†ÂgëìP„ŒDó+RL&Èx€“¦‰VCCSÖhj\\ÂK™ˆ&°–#…­\0ãš±,\rO\0C[tÇ™¿ZÒRœ³FÂ°8A(dÒ‰Q—£Ôôd=§£Ðààáð¸880XÐˆ5cèO.©ÀIP]%¿ÿÄ\0(\0\0\0\0\0\0\0\0!1 \"A#02@BÿÚ\0\0üq±¡›æQÆÆÄøÑÔ\\ý•ô²R\'&ÏGR øÇ\"·þ¨ÇÌ²þŸ´ëUý¬žž^¢¯rÛ©l÷¡1Ö9Ú\\{M>Ç¾Ó½¤ÙÔ]·¯Í2x¡ó$pÊ³²#Ù$Ž¨´‹\'dŸfÒÓÑÑŒr}	É¤ÿ\0=‘Gb˜Ù¾%˜Ø‹)•FÄb\'†[7î£\\l±v#Š\\z5þžÇìÅƒ+‡•‹ÀÈ/ü}á´•ãS/ÂÊW‡™‡$ñŠˆÙ–…÷w;\rŽÄÒnMñhèÙÒ×çîÈðˆñqÈ±Ê4¿Òå3\'‹ŽËðœ8ôleÆÛ–L²eš\Z({%éã­†wêÖY4hêhÑƒÅ¥ÆÍÎãÊ–OšOžE•1Z6oŸ\"tlì:.È¢Y±´[6#7Z*¸êk†Œ3þO¤è¬§v:hn™Õˆdö!Öåú¿#!‚G•‘rÆ¤\\2Äôv6d-hßâŸW‹,äŸ#RB[\ZÐ’XJ)PÒ*%}ãEÔÈ²v&-1â3y¨–ÛášárÑÔR%Í>~-¹¬~sDù8,]ñì¬oWâdn<|Ò|yGãd¦¼Vt™*¼i›†LžvJË‘ÎŒœ|Ë¡ðm?D>Ò|‡Èw#ßâÌ¿FHxÊ…}é”\'H^Fd3È?›äÍòåùòs.V(Ëdx´Éñdœ8Ð”¯ÃÉüóXqÑ^•âÚi5ú~ÿ\0#I¬Ø¾:áö_ånˆðÉÅ/CŠHÏrÈË+ÈÇB{ü\\Ë+«ÃsÃáýk*w„ÐÞ‡C´Sæb¬éxÒ¨úü{NÝ¤vDþÃšPe]ÈÀ|(êoOñìÐñãµ“Çh~ë‹÷÷,¾\Z†f3S1E9ñ›—´›¤SÚjSœ½{{zÞN×’:¦‰Í);ï²mŠìyWUæ_É<Ûß\rhíÕ]aÌœzèÊ¥+=?ãbúÐÑKC£nÇ‘ã³\r;‡êâõåìN+È”ãUR¦_ÄÔõjc×É=¶_¢1%T”Í÷šù¨”Ùôtš/²ükMy\Z\'ÊN–Y©Éû)Åê«Gz0üžMùö¾NŽ¥HçOGSM<yz»êç§UºëTÅy\Zù§¼|vþlCòÑŽ“2Vˆòô<Ÿ$gû•»ž§è×ê;–|­—5K¥2&Ñ¤‹­óí™2,þB7Ã)¾Ë(°¦£JrÍî_S\'³éã¥µ]åøòÏÓîÞ<uÚ§ÞG·þÚMWlgé¿Õ¿†ÛUVŸM¿·®?šÌt•*üirÄ–ÓhØ³ì­Y­1Š^òb¬sSsŸ¢jî¥¸”ñv1a„µ,uD©ê‡´¿j¡îŠöø¼ebõî^;ØŸãS³ûãB•JLkDä¤ûÆú¢ñe1·\'ý=L0º\"ú4¦ÉvuÐò¤|‚È‡ÆŒ¹7Î½Óã<ú–c½‹–2¤føÇ‘£Ó}+³]Ä©6wr,É«\Z¦ñÍk¦‰RÏ/L”»Mã®Ý\'õØË“ñ|RÚ©êåéã¤×:\Z.65Çõ4M“ÈñQNÐ®hª>ÔVšÈé>Ý»ºÃQÜÅ%èÚGn2^¿ÐÙk´µ¢)Ë–šün*NqÑÙ&*›Lx¥•‹±±zJ4ÿ\0Tv;ãè§é­¿fÙ¾¡£üysuU’û<y:½þU)«Ž¼}$Yíq±3±ØìlÙ³|6‘8òYyqbøkf¸ö:?ùh^\ZZã\rþm#.>§ôbËxÉŒ9éìLÙ³fÍŽÒök>Fo#.cÞJG.;Jå¢Ç“<<t#FÒ|ÕÌŸ#cyÔ9mõ£FŽöÅHFÙ¶~Ç±ÔŽöý³©£ÖNÛÇÆ½\Zâñ÷\\´™qòGÓ%éÇÕe™ºã’³SbûÇMÏf|Œìv;zÙ´vGc|m6~§¯ôO×àäÉ‹åN\\1SÓÊ «t}M#¨½q³ï¾4h×¡zçfÅb¤øŠúåÜ¡ùVlŒþCÓÍ‹NlÒ=›BÛ\'¨ºèÞÏ]6z4ZÐµÆäôu:Š}žõ¾=ñö!ù(ù²Pû³ühy‡’ŸY¤¸ßú=žÏg³µfÙÙŽ¶ÖF,š>sæ>_2u.,ýÄìý„é½*CÊÎÌöu4¸Ù³úZ4hÑÔèbw‰«UÍd™+3gÈÏÿÄ\0+\0\0\0\0\0\0 !1A0Q\"aq2@RB±ÿÚ\0?ÛÔ—¥icÞË/zh¤Ç\ZÓ!M‹¬.ªfhOâ‘(”P…«_5™l£’ÌÌý©öd‹ÛeŒ–©êÇ­Q‰_FfZÑÈº…—³“P1LJÑ¢KDQEhöQ_Fg\ZÑE£Fs‰ÜGtîŽe–)™¡4Q(X¡˜•­•¶µ¢¶9¨’ëýªÙ—Åb‘˜õR‡!²ôˆ¨qD–Ç¤gc’;¤ec‘>·¤7­˜Šm˜3`bQ[¨Q\ZÛfEî]Aõ™	’–ª&\"ˆ–Ö4Qˆú{¬½‹|U˜j…¬_ÙÇ­ÊcOE£#Iy%%è”Û(è#\'ª[(å1uÔBëÄïDîÄï¥èÔ~‡Ô3{2FEëe¢“;glíŽ:V•¢Ö+jÒŠ+mi{ÖÛkÀºŒî‡çJÖ¹+HE45Z1|_Ä“1f#[¬RZ$P¼•§MÓ\Z\'\Z\"÷X÷P¢ßtä>“^LR¿8F~‡ñ¾ŽW‚3ûÑyÝÕé×+K,~,¿f[iú#	ˆâ~ŠEB¸D`ïÀÿ\0cé·ìÂoÉXù0Œ¹;QûM¡ôèq­”%(—O“¸´[:<u².Ç­‘éYQ‹9¯Ð¾ÊÏfGmÝŠKìVø%\'T_$y1DšC¡L\\ù\Z£¶8W½Ôú\"²å!çcWÃ:ÅëbyrJ?f~ŸE.XãÈ•r‡F-®9GŠJgiy–’OÚ ¾‰t“äí¸»!ô>9%m•#µäÁ†¾Ç47ö%—~«^œkl–J™8âéëb&aÿ\0$zÍ’%ùsd\Zú$i{ýŠåäªåD]Gíúhàz$M?H¼|‰Æ~—ÑÏ¿þ’ê$K®ßø¢Ÿ–\Z/ÅiÚBUºQRTÉEÅÓ×§<xz&ò)Ê\"ê\'ìNÕƒ#5/Ðä‹~‘(Éù8O‚*Fxù\'Ô~‹—³ðÿ\0Ò%Öçñ.LQ^ËúÕq¯Oú¯R\Z#,¸{å%D¢âéë	WÞ‰ýŽf^œ—”G¯Ê2ð/Ä‹³«&…7ÈúÑ~†ÛôTŸ³´½œ!ï½gÇäF^žùEIS%L­#/E—ôx,²¢ÇÒ^ŠšðËš^Å\ZÇÑ™%kJ‹+ÙWÁ\\1;ß$¤©’Ž>u‹Óø/ì´\Z¡˜×+JWEÑ&Ÿ›ª¹²22OÎö¯†JbVìÌ‹DŸÐØæ[{›Üüë%kHàq1z^êÝ{%¢{eçgQrDLýü(eh¥ñSó±ï’çd£bžëÕ¥W\ZÞ¶‘Üú/âooR>È±nC“µ¥Sù8ø%ºQÇ”FBz¹iGÁEkEkEQE|Ûcf%?³#É_zäddY—¡HÉŠLÌR3b™Ü;Œî´ËJÝ#$ds¥ŽE”ÊßF(Á¸¨¨˜„vQØ‰ØGöçöçcöv™ÛàÌK,ÈÈ´ZhÌÈä¢´½/Eþb`>‘?éß¢P”|ëEiÿÄ\0(\0\0\0\0\0\0\0\0 !01AQ\"@q2arÿÚ\0?ÕöÒÙÝ/Äˆ·_Œ÷z+NòI=·³à‹½êÍÝwq111>™ôÏ¦`bE˜î•š#gyìÁ‰·6ªŸ««»«½“uN²I‘š22222Òµîò!è®î‘\Z¡]ÕCfC¬ÊÜˆ“$3!WjüA‚,®Ñev6d:„@Ì‰2´	T.›öSÓJÕ^/ÜJêÍHúH«¡>Ï¢ÅÒe]Ïã±tã‹ …Ó¥^IGqYÓÑvfÓh#W¬‘ÚT&‡L]v\'àäŽÌ£%ààtïCähª‹&N’K~v‘±Ö¬½¨ÇWÉ<™ì]Xò*§x1Õy½tÇ6DÚN:ä‡Z<¢	&Ðx>ÓþJjh]V.¢~„õpô^Ez©\Zø&î£6ü\r~Ç%NIâKCxòg\"ýœ(9&¯cqàUü™1TÉº½>tÓ\Zø2*êzFG¤„ŒÎ}#òD˜´x)BãÉÇ£G2„&Dsµ+V†£I<•tòþ¬SG\r[Ï&>Š—?Ä}¬¤ª¥¨¤¨å4Dy\'à¢_ƒ“/ƒ÷ugÁESÆÍHÔ]¢I$}:XèhUsÈªCPT~­0O¶?¹ÊøI	ø©ø)èñ÷boÖÈ‘©àj\n+Ë÷³R5kL™—ÉŠgÓø*¡®Gd¤ö`Ú„}ô¦ŠiöeM>ŒÛðsìÕë^Ï¢š²Ù©\ZŽÄ™±º_”E\'Úg‰d\nŸcB2´|îîÑã”STó³RTšÕsh´Z~F#žÛ½HhMÓÉ>ÖÍSZ5‹ÌbBÚ/\Z;Ô¸³)«Ú*¦?- {3§W§¼SíiÉ=ö\ZÑ¡ÞŠ§±R#¸CÚcV‡j\\=2W«ÇàI;ÕµTZŸŽ¡²4n;Y9Ò/&ZFñh\"Ñx  fD³öJ3%Ú-û$’{I$’I$“´’I$•33\'h#I\'ñäó¤H©1?ÿÄ\04\0\0\0\0\0\0\0\0!1 \"AQ02aq‘#@R¡3BbrÁÑP‚±ÿÚ\0\0?ù§zâ67Ëƒ²¸tš%úJrþÓ¤×¨POU\'®ŠäTPj‡òQNi¿j„è»ô¨^¬P®µ]È’5¼Õvk‡Þ½þzœšÊHÒ´]K©u*ª©¨§ù¼¡f*Šœ¹Âžãæ/GÈªª®7ùaÊ®,¡9Wuùg±øjuµÏ\"N¨Éâ>êïÝ9ùw„±MÄ…u*EUI”®¯Ò´]AN58–c\nÊdTïK&Pb&ª¤lœ\'ò\'Mù%KˆWZëû.µù‹ó\nŸ%ú¼©©Ù!‚T-¢˜YT“Èb›M9”e˜©(F9•èTŠ!é¾)©Cý3äå…Öx¯¡N!`›:­’Z…O6~€‡¢Û²hƒc£,©pD;!ŽôbñûÎ[@¢Ë¤‘îžÙ•#TÇÜ¦0œ%Aáfâ2oÄsºxMîÅN¨]‹ì²’Ö¼ºHõD³žÉ¢€\0™Ú\'¦&Ctn™…+–\n8é)r\ròÑjM\nx…tõC`Ü¬“î³–Š`&áìº§±[²êŸ¢lÎšé]e“ÞðËêÞJLBbe–!Ð#ÙSÙ8yYWXú„ê~ÌB\"ËÑôt~¢Ü‡	šôl¿ƒ3ªœ”â¼ÅÖX¦³L)²n\'‹ó`Œ“WÂhÕRYc\'Õ<LvLÁ•Ð.ú„î|!R¥ÄÑ¡O_â~î˜ÞRh°÷@~Èj½(ŒZ°BèÉ\r9A‹E¾ëâ†ýÁd‰ÆÉ®‡Oz­û.˜aè©÷Eî>Šì\\hë%ÖO¢&Áû)2› oGî‰4D”{)®¯0Íe7ñN¾,rÙÓpátñ™-¿Ìxp](°¯.~ŠRYæ²}W@t÷‡ô¾¨{ OØ¦Nef‰e,QtÉÅ¥9ÝH,¼GìË7:ÿ\0¤§g¦©–Ü¶‹ÁEƒú/í<1Ñ,Ð¯‡Äe¤J`\\\0ë5VêTîª,mTŠI2š¹\r5²˜/)r\'kPw	ÉS¨ªTÔ¤œ—²i„S³7Mº²L½—G)Æ6·½“RR.³²’z*”AW‚¼LûYš,-\ry4²÷ºqŠjsS³÷m‚vI1S²ªXf©?§ýDšêlÓˆÓ_D~J²íŠ¬·³ûYÍÈþ­\"SæL©CtoÉñ8›ì¢1zœí”CãÕX¿«nŸæÃK$WMøv‹Uð\"ü8þˆ”ÛÇ%ƒøYxw£ì_îš2Ãé~ËÎ0L{àÍÒe¢cï½³Á2²Aî§!uC“ª¯²¡Y§ê«Š®¤éh‹HfœÔÆøª†ºŽŸñ1ÀÕ*fàYCÊ¯µ®¥f««æºB¢¢§…Ò¥ÎÚ?ýMcc;Ü1åLÙ2¤	[&åS¶m‚¸æT¦²ÂÉ£Ìº>ÖÎke «cöƒdìÍ,R³K4äH)ž6SšÊmÝMmòTT]*†ÍSÂ\\Ô†-–öKæ%8vR¶fÉ/ÿÄ\0(\0\0\0\0\0\0!1AQaq‘ ¡ÁÑá±ðñ0ÿÚ\0\0?!ún\Z´&†ÒáZ;QÊ¬CÜC‘º6S%*[ÚT¨œË!¬\'³R#‚Ôq\nF¡ˆG‘!ò¿ù42­b7£4&Ø½æ™Od¥#ôïöï4Çó¹*jÿ\0‹î&×éÿ\0ÈÍr¶sÝ‰²;•„Ë¬¡9Pó#Lêá;¨‚.¿’ Ñã0;”Ùx¦2\"Ì“7ì~EÚ–îÜ‰_‹‹nNÇaá‹Þ	nº‘-9Ç÷\r–V–C N‹¦4 £	E\\ †œP…±’`‰,FÊ…\rhNŠÁE\nÛ²È5hA…\Zú$•¨t.ÓmÉ=‘=#Ô$±u9YRÑ(É›tDòazÞF›b	úÓ‚hŒ«Ñ‡fZOƒqö›ÈIÂÇáøfú0ËtPZ6BP–›`12J&)¹¤“ôp¯,s¿R6I„A+bZÎ°Œ²ÐZräI!«…¡ò’s¦šC‰Œ\Z8i€²FÂw¥ÄNðOô/¤JÐËTÈFDw:NÃv\ZÜ‰JbR:«ÃÞÁ ’r’3aA•Î„¤-41 BÜBÁ(ØÈ¬¬Á¦³6YÆtÇ|	Ü¦Ù“\"Ç¸OLWbG¡¡ÀÊ	#°†è¶•‘ˆL‚£™EAÞèzÉ[­Å”~CRÆ6\0ËcwÀý@ {9BÍ\nÞ¦àìHFò¢Xr|·£BQ¢G õ\"¤HÚ†Z¡Œ”\0Uc´l#à\"*ôÇ4¡DÂ|ß#rùxÍZÐ¯é_˜¸iü•/ðPR!>Yu7³„‘„¼ØìU›1Ä$Í”!ÑHH;$M·>4==¡.ÌðÏÉ“þ¨êÍŸvï°ÚÙ~Go#!<¼›Â?(•À±¢Ì#!` ²Êh+AH–E\rÆÉÒ‰žQÈÚØtH”,ÐÆÄ›Ÿ§.¾ÿ\0éú¼þÅ\"}\"Ý”9r\"I\'BùˆLØYBS[ô<DI¿§öM{ÈæZ®ÿ\0cªj5,ëL.ô\"F ¬KÀôÍ	Îß\'é¥ò+ƒFÿ\0‘$êáV‹X¨Ï’*RÆ…É,¿5ãâïyXôÊ]=Ê®„ÙºoMÅbþâ(H<pþ§’¥Dèw¹v#h\ZàÆcEíô‚Âµ¬1±I¦åÄ²$6raTÅšÿ\05¤“á«H¹{#q4IxÚ(„ñ\ZY „®,V§Zã3ƒ)5Ø²„{§‘6Qº°Ñ\r´|;&5l˜AÑ³\'7ìeDC+gÀ¤ˆ=!`LaÉAÇ²Ä“\\7gŒcYlÈßd#j:\"N„µEl™óðIžùßë“¬%î„‰ºÄcÉ÷ãPÌ«Ä\rž3äž\nÖæÑ;²™žPQäT‘“=ÍŒ„›äQ„þÂoì\"3ŽÀÂÛRtRb@uÍ™åE¡ì›ùHÔ¦r8sƒ­.SbÏxÓj¨äX°üì˜Ü®O\n	Rb-Ë¤PogÐÙÁ>t¹b““k§É9°–Š2à%yÐÔW8|·Oð)Ëý¢¢Îö#Aà!ò+\\P;2èZB:IX¸ÝÈÎµ²¦{ä´hN)\rP‰\'m(!¹p:M6é©?cÑÛ:&2×yÀª‚SÈ¿\'„›‘P7‰&pæôIÏLjQÕ”¼E¡5‰NDË§É†¡Œ£VEîlž»h»dÕ¶1gÀYMç&Å7VëÛ&Kr©Hø·,½¼äwòPü˜‰+„%›5Èë×ÿ\0àÍ–3ñ??Ó¶D˜Ý,µ#/K‹Á\"Z‚¾çÆMÞ¹ü~‡§èU®Ô„Jð&\0ê…ìfânØ$ME\nä\"I¯‡”È<-ÖI\\™l ˆÛO²9¶-·\'’oš‘8züRÖwdŸPB\r‰[­\rB-²©ÍÛHHª-ÿ\0£UJôÝ\"<p$pŒ³¦7Ü(Ýù*x$Õ¡‹hiª„ø¼•ÊJ9›íJÃœ=WîAš»Ê“ÑägTO	_úBL\'-Šk„Åe(«dsÞÕD›S7V4ÉÜp¨ºÄ»íé«@¢›äÞõ„Tœ‹u„,yÚ”áôH‹mæ7cuš\n¬,i’r§<‘Íª2$©µÓ7¶½¬­d\rDcvA\r¥ä_Áà…ËÂ}r!¥6¢`¾µƒÂ[˜qç°‰ò‰r?“ s¸õÊ¬Juk‘”qàtRjJŒ©Iô(¡˜%KâG,©z@Ò›í%CËàò<ÃÈ¿Òe¿BFøÂ^¢×M1©ËCXd9ÃÝp0—4BÐ›èh¤:DC¼‰örA&ÀiCE\"¸«¦‰:H‚¨ÑI¤®ß°dZÁ\rA6‡½ù´še!î6ÄDŠUÚ’žèw&ød•/ð‡¯A%(3Èv£;o~„,[l‰Såè‡§†;\'LmYØGñ¹Ù“Ù`z²FV ‡ÇMÓF×&ê×Ü^ÒeK\"©!“	M&OÜj¢/\"˜Ã\"ihKY€bbù\"’ô¶&äX	!–Û;Bÿ\0£8ÒÌl;‡³‚Ù”eõÿ\0¤ŒÞEDM¬#ÜÙK\'ƒï¤(\Z²‚r¡áÀ³Hºr3iHð:ìºçÁðOCf&’ :øXQ:­.92OÀ¡„C/Ndm$´\"(Û9ý¿ÌÉ¸àî+ý.¶óŠra÷ÒöHÚ5¥ÊTKÊÚð1‘…·&ï•ÇbM¯²lrD¦=ÔÙ»òV&^Â´ÌEÃa4BU>nÛiN¡_KÞ²\Z’?7w¤VÅ5iMÛü);¢ƒÃ[£ÓäiCµpšE+¼AÀÏˆbWAâyMBðnü	g&š·\nÉD¾Op5V0².7Á75–\\Åp1P˜bN\rüùüDÍÛJ—é/°I™ð2ºOÈ¶U·…çô>ÀU{%8>áIÌ¢¢úÄÚ_N™ê	=øŽÿ\0BYs¬Ò	‘n’¿pd¾1ÁÉ:“`A50’èßs ?hHºœ\r® \'0£·T¡Þ“ó“ö7\n†3äŒŸF6Äs?V3ç$\"ÂD›MÐëJß$ºã\'¤)Y{Z$øfG\r{‡˜*-Æ<¶PzÓÉ”RBO½º\r6!¦ª´ˆ9¡Ä<HE*ûº)´\\°Ÿ±˜³Øà¥ò,šìœ,ú¥´RÙDÉ[f_ÓkH.„Óý\'Au#ñDs\n‚r_#©ÃÊ!s÷ ŽÇzxÁîI2C$Ü\\‰¥ï·‘0}Â²âtß >™‹ÅILh”.¤A(O™cÙ4¶ìb†Ì¼	É£a‘4Åu^‰•(•Ë)uì—aü!Æ=ˆàîA—Áþø³æ!-%nÌjmïÀCòX•xÖþ‚X•ÉÂ0¶”‡yòÉjU!!F>´%’oí¼F-*Vï§{lÌ5[Iw!<?G%17e×,ÀÚ\'‘+aø?\"N8\n!V9Dñ_rKØS*	÷3…®Ä³Ò9ÍÄ*J3\"ga34…a÷Ž‘ET%yóô{/’ùdÂ%“‰ò\'‘&YÞYB•:¡’$±\Zéì\'|‰ šc&Ð3`àÂNPƒµ(vÃ$+#íaC{ÀÙ–ÙKq#³pÃmÚ^l-ˆ_\\AAH´\Z±¢d&–ôò6K1#|&o°¸D95ìÿÚ\0\0\0\0\0\0_¥F-îfËÕ;t¶YBdƒÏUB wîú³+f‚Qï‹Ÿã´ª(äh\n¹Ö,œvÖ¡ïµ1+€@#„‘ç¬ä…€x4„€€›mÒ9ÂN\0=’Ÿ”˜Vô¦$€a¦UÉ„;–¸~tK1Ø*»¡?R¶2@ÖïnÃÓl\"ŸÎV-Õõ¹à 	 cw4ð,úÈ¶[4©2>t,³ôØù0eQÀËHøL#ãæ,”ˆžl\n†\rž°‡vøü`ÿ\0bÿ\0cZ\r5Bó9Ü<ˆÔ¸´vÒD“c\\}ËfVÔG|A“0çnp/€lúZ9Ót®±;j¨”²‚Ç §\\õôíg Âýª=”RfYu×—jJZëdmûš¶RŽ8ÉQ5ñT·`þ&ŠFœ\0¯6zxy\0{k…}„Â•.õoïìÞsW^ß¡f0p@<ô\n-ýðÏï˜ÙÖ³¸€ûëOGgëÚX/—`\"Ä\ZX ë<Ði”Æ©9é#Ä` ËpîÒ>½H‚^ùD¯¿ßà?CôD†ÔKM»Þôá6•Ú@*9Â¿{¢hïÐ)/ÞÊ¤¶ßäÍ¿â¾ÿÄ\0(\0\0\0\0\0\0!1AQ aðÁq‘¡Ñ±áñ0ÿÚ\0?úCka‹»àqq÷}ÛOLÄ$\'Ð9;²zì½-NázatÎpø`MðùÛ|/¤Âáà7ÇIã™[™.H[|/á=Ë¾Ú‚ÝèlsøZ!Ò0XLçÍ¥¤§Å‰L±lx5µµ–¼òðçáÃÃXãÎÆ,æ@e†×¦SêSÅV²²¿M2BØ`OP…ƒ$#Â\"|ñ¦YgÒ¶l¤c¸6»EÍ÷xÍ„)!“±îO©>‰o«_S¨Ï¨ÈY}2#»Xú•.L‚å/Õ³×ÐÏ+2ÇÃî›Ý2Ÿr¶·6YeÍ­©N›™…ãÀ–$pÂØ„‘°}Ë8„~à0äl&\"waW››\"\nÔEögã‡õ,õ,—l²êÍ¹±„Ë’’7>\rõh¶K{ú{˜âW‰Nvs¹Ò{ƒd`Á½Zõ	tÀd„gÄ~%M‘½X}_rLrõ>-Ÿ)…|>t…I¶Øk—K †ˆá´8[° w›k\03ˆ°-PþW+ƒÄ—6¾ñÌC,ùØñaàæÊØc¿Ñss\0bZu ™¿c?â\nqt—3nX>mÙô_Ñi±}ÜžãæG´ºCoÍ„÷,ðsÍƒ\"9ô„ŒæsÔÌX°°°°±ñ8Núµ¿0G<Y„>à½–†Ë„x`ÙÌj.q1¸s®|)CqãmòÆ_¢Õ÷purùß ½\\ã$…¶&Ø?G=–=–`ÓO!__¼	Œ¼Ï,;ô=m§¢¶èãéÒh[’æ]Ž\r«¶Vdáp [œ³ÎÇ*Ùzv4îé³ÁÃ¾Lf~-`Á?Oý‘ºæÓÜ»ç¨w·®£9Åºc“Á§»gvZÜÛ‰<œ\'„Ü	$„Y¸‹Eæa¬ÜÃrs$1,ŒNê*ƒøA1™é×‚Ô9]bãÃ¶ŒYØy`:â9nã€âLJN\'ÀƒËàæ\0E·A’¦F›\r¤<?ÄÃÕ|¾lË ûöˆ)1”&ì¥ŸmÄtÁž	“×‘ŽŒBï÷Cplˆ\ZþúÂq&žÿ\0X•çu“ÏÏúˆÃÿ\0™Zÿ\00nšýúÃc?Žÿ\0ÅëÙ/‡:ÜM@\Z˜È^ÿ\0·þÂŸ¿êË?0æšIÆ0öÌ0%]R¡¹Áóþ \0èxîÁô¤*xÙ¯Q#¿¿¿âÖê•ÿ\0%Ëž0ÌGÄÀTïïâ\rí§Ä°Cmèüó?­½?‘hÙìýþc¤@ÆQì´µ{cÚSðxÿ\074_çôµ¥eõ:à¹¦r÷-\0ð!Ë)ÿ\0å¡8ÿ\0ú³K„öœº§ù,=þ­Á7ùžê…ÅjÈæq¯QÓXÁÓûX\0s;¹È2^yö³ÍÚUg‘•ëkå¶„ëËphYæÊ=xÿ\0cjab{.G«p±G„Ÿ‘âÎ2wx½bBÉ´uæÈ—¥ð‡™oOªÂØ)Í9\\É‹¦ÀQ–Èy…Ì“y·#ŽYgƒ»·w·ÁP?0$\"8Û/×\0,9BÌìûÁÄàÞ«Äqæ6ó{EÝQÇ€Ø3n©;°òxB:.´Ël§²AÛiºÙòI¾®˜ß›¦ëÀL˜1Œˆãõ(‡Y2Ë†í;é¸´pKIÌ°ð’gŽ#Ž¥^Û©lÞc/Ç#—¹1O(i\0Åbwõ\0†_k:…w›‡»Ó’¸Ìú˜NÖŽÈ™’_-¶Èó/¢XYKæîó¬CX:€œGßêM˜\\6{t6ø|wá‡¶fì²å¤Ö,-øÝ¸æ‹òÊh÷\'ÔÄòcê$Øä]çYÉüÈfoüÈpÃ¾7-–Y}K–ïW¥Ù~.<ÚÚH¤>Œ),nÖD€õå¸<5µ÷1›aäï÷ñ*™üÉ¿õ/nm]z´;³oÁnûžÔ á*êìÍ¹Þ\'žlœ„‡æ‹Ÿ‰ÇéÍÉh¹xPµz´;dú½iW$ÇÜ>ßà÷¼\\ž®s’WâßS‡«‰‹‹‹VSÕÙãñpO=xyõ\"ôZZZ«’„–¯Vý¶@üH MGºHìX\'«å‘¯röXîG¦Zu(ónäØ˜™à|½Åéù\\²ZðÏKg-zA&9Çž‹opÇ¹CÜ¤å wàÜ¯SŽÊêËœÂ;ñ:¼“ñZä„L”yðÆÇâÉ,õt’”ô\\½Ø{dxvõ	Ü~öüA½ÀY!ñaì‚û7ÈGÃ-êÏÔ¯‡ÖÉ}ØôÚ\"or^á»n@ãbÀfØê[«^‹)RÛ\\7¸\'qÇR-l\\¾YdYe–Yg†,2O1g°V_ÿÄ\0&\0\0\0\0\0\0\0!1A Qaq‘¡ð0±Á@ÿÚ\0?øž\'ÀøÈ<3¾>	à¶ÈÀ…“Å·VÝ–Ç?ñ’ÈðyfÓnú„X­ãm\'%qod\0qŒ^=¹¤ôÄœÖÏ~\rî%·Ÿ›!0Á–^aXD«+\nI†á.Ú–°»k3{·ÆürÈYäCÀD\'Sð…ÚImøp·Ç6¼çÃ>@ýBaCû¿\\‡ÝŸ¸Ï¸g»E£ÔÇÃ|ÉÇƒ„ž/P¹‡\"\r¿˜ž£ïhtZÜÜÙã.nmaN=Ú›q±–C8KÀB	4†O‚ÄœCo€ì{˜ã¯ZI,È;oÉgîÇÜÅˆÆË¨Ó‘9g`±ƒc;ž	¥Âõl¾uçÆÁÚuÔáÜŽ×Á†5¶%í€w»—Ppa±É¶Ù³8žfbx8x	ÆÏ!qØäÒ\nq0ó+ÔÁÌÄæêÉ8-÷r.W›kÅÕ$ÎRÐâÍ–xeŸ–dÌø-ø^æ\\0Ždú½	ŸLß{Ò@å°öÀíº’À·$ûl=Ÿ^*3<w#uð$ÙòCÃrõãÇ¸ñç›[þ-üZÚµ³ÖÚ½½¶}ÀŸŽ[ðm¡“	òE¾5ËÀ]àÊç+âÏo0gRáÍ‡ÁîÐî[1¹œXtølƒÙ+{“Æ^¼áˆŽH2Á€Ÿ°.Ì•Øã”Žll1æSÌ—ƒ#Ì3ì2³LÜ!zóç>	{%]Þ¼ôxMº»DM”¨<AÊžXó» nÅ‰»I»Éh3\'‘¶éÇî!§$ @¼(š¸”ÆÁÏ÷£ü\raÈ\\£¾\\,\0ºxA1·éä´usaÃñ¹bidÈ«Ëp±\rR\Zlæå&á\n¶K¿ïÖ>±îQ£±ÔÑÅ¼ãñÄƒ—Õ§FRJ	66îä—ÂÄ^ß&3;Ÿ’v+$¶ÂŸïÖ9òsø‘ð¿ùçõlQãýÝ·!÷ýÂ€_Ä$»³Ÿ÷Äé»`Í”E½rÀÎ Ôá:vòW¼‡G÷j²œÜv\Zåf¦Ï.gŒïâ	ŒË	mÀÄ¸óÿ\0vgƒñêAÙÿ\0{·ÞŸ³ýX,H´Ïã#‡þ¬$	C{?V¬\rÍæÜn¸æà í³ƒ7÷²F5üHS_ÔD•`0C¼ÅÞî¥Ï>6àäïägÖ\'–ôAÜc•ÌÄÛ§âYB@âqÀÈ¹lf­¢ð°y®Æ<ÄÄ].!\"$jÇPæ–CI²ºY½¶çV®-ÇŽñŽÂ§V~CÈ±º–Ø3ôÿ\0§d­‡PWæÇ%‚(í7ˆï˜Š°V1I€q1L}®²pX_¥¾í>î×·À¤å	ÌCO‘ŒdXÜ\\g%‡g#ÉõÌ‚r_ƒéy<«#áe¦­„Ô‚vJ8[—´˜£Ž$ü[—;=\\ð‚c0ä+€8ùÆG’z¸¹€öZò#P=ÈR3mS,¸NìÝâ=›7¶0è¹`Û®.5ËÄº„„ûŸ/9ð1ˆ|€Le‰^¬”œ|{´tØž¥÷–†0ƒ2>Ìñ;úNºçŒfÃVžîïrónÙÏ_0LeçêÓx³d2Lðž6Û|sà,²€Â aêMÔ¸÷\r­ÆÂûŽ?Ç&?+¹Ñ9ôx5Ž=HlødÙdÇDëˆ4qp­Ó¥×ZôÛ3È|4¹\ZOŒx÷ðà±gõœxÛvÝûƒÂÇkÑgÛn\\ß¼1Öß~3nl¹‰÷dÉv‡MðþdJÊ¾ vZvâCÊ}Iá,²Ë˜Û[[Vì‚ïÂd4><7„’áà‘„õ`vÆ=Íºß6óo‡ÆøYðyfA¿æ{º–ï•>§]Çn½\\ä&\0öØ:%}Î½ÙvÙ$,‚pâBfo‘ÀÆFÕ«v>¤l~­[dz´è±ö±—ÐK{‚ÔäpIõ)íó­­­­­«v¼àfåa¸´·Œ‹K7lýÁû‘Ä™8è–{…p°µ-ú\'‡,ç©×ã¿üN^åNËl…Ð–»ÿÄ\0\'\0\0\0\0\0!1AQaq‘¡±ÁÑðá0ñÿÚ\0\0?ý !J²s&æM2ûÄ¥u9a0@M’Çº¿üù–¨€Œió32v©Ca^§Ê/R‚52P/¼Ë\'£ÓOê1BÉ‹•nÏ¨Ò!Žå,©]Ã²ëù‰d¸|²ð¯Ñ-Áx\Z¯þ:™+ƒ»ùÍÎ¤`ÔC‰c¦ÀýÁ¹H¨[\ršÄžÖÐÑžóŽ³Ô+ã\ZU?‰~Äû4ÿ\0\Ze\\|äÑHJ‹äU~bÇ1	öÉþ9ˆu¿‘OD¿Œ÷ˆU6…8ªþ`aŒè­D³nUyŒ ß|¿ÜRe:¦j‘™d3†<_Q¯Ùq[	2ôÔƒÝkdÃeR“>\n7¶¿PÃsdR–óL[£uîí`§š¸Ž^{G{©m´¢ðÓîª5\\ìp´öÁÌÙ3=JèOD³Éõ/ßâUË\Zò°]ÂHZ(›™‚¨T«!Ë¥ú•±µÝ.\0À®¥êjP<505­ë˜Ükî	Ðï\\Å.ª/Vf˜½Át”æ+ZxŠ³™©Ä–s.ù<FEÝÃâÑ\\±[¯!P3tœÊZIDÇ‰gd§d{&ÊR‹6,‰Xc]¥ž_q?™`f.R³$æ#ÌS¿øex¨4q#_8˜!ÄÔBÉ¹°³d—M€V‰v‰@Ò©¼™Ì>Qòe‘|K—æ\\ø)1ü]SC*š·Ê³I}A_ˆ¡µø •¨\'¨ª£Ü^aÂÎä´/5IªÁfXæR®V›€Ày‡\" âRÜnÊ2H€æ0áˆ™73gOrüÏ	ió8ÿ\0ŠÛ‚ˆ¿Eí!8D>¥<øT²	)Ô²b-°€aúŒ.½Öe¨ø1ÐØÏY‚}Ç&•%0Ë‰¬ƒÍDJÀýËj0¢î¥´€Ôìý©¤¡FµZŒ´Ç0aT—gø”#^H2¡r»#îlÜ¥‘÷0ÿ\0$g>,À0}\\v÷äžr²4æ¦…÷ˆÓŸÄ Óõ“êRß›õ1Å<Â®Ö3‡Ü Õ@¢	¥ŒØŸÔT}ÄuÁ5uÒ·@›÷ÎÞ®\\Õ{‰ &µhkÓ3(Ø¿q„ µ•9…ÍÓŒìb1±¨˜ÚbŸiÉL	Ø‰w¸,Ü¬w1	‰›–•¥Xˆ«‚(2û•8`SqŽ\"Ë,æ2¨W6ÎÜ6v9Þß¾¾êNFðce˜êY€˜Ñ&	øÌÇqLVEfš—zsQ˜vÜ¼ýF6»³ôK{V`õ›­V\Z™sù–Ä¼KLåÞ%†¥B!Ce†e\Z‚ðJ59„²aÀÄ\ZF\nA9óõN\na;§3A=$[öSaí.`^íž5•,lI®¦¦ÐE}ÔÚ‡øÁ3˜+¾¡ òÊëBûSS\0ùJ.‚¶œE?ãÂÇsÓø·ÕÌúz•TpÜ|¢²^¥ñYsÎP˜ôôÃ¬0Ç1\\«ÔÒb®€¸¥ûP˜ºgv€âßIIŸ©8+Ñ€d=n~6¥#¥^Zª¼ J$O…þfÛo(7~¿–lšò Þk0h¹^¢âT¥&²;z„}LÒ¾ÄÏñ8½Ö>ãec‰}â†â»–fð6Ç¤ÒD[ µÉ×³ú–Úi,µÇ¶9ƒdcþ\\¹p°%4~ Â§½þ™˜¯viõ®ƒó	þyMåLÑ‚Ène-,â\" S¿P>²lŠÄ ùÊÿ\0(Ê˜”Qxñ,0¶œ|Cþ!8}0ýÂøÐ¢ë\'õ.kËø}Ô\n´ºO×Q†*Â¦¥:ÿ\0”01Æ¿£‚(ä˜B%ž\"pf¤9ÿ\0Šy¥hûXƒsv5è¿à–•Xi·oÄ¼ÊÂÈâY‹˜aÌ@bø„èÍ¹x^ˆ)¢ï µJ®Ê• m›,Á–¥ã¡ü|ÃÞIh|µÌ\ZJÑW4 )øƒBï>‡øš›œno‰@baYy2zH‘3š(¿óˆ±uq¡íÙòW˜´kaŸý<eˆÿ\0Á)Æü0ÑØýJÖ5)ê\nsÿ\0Ô­Äò®\n3âÔxÌ0\0 0eÔa@*nïàn&Ú\0¼ƒJ ‚J/°‹lèn_áö9}E£ø/p\ZÝÛÀgî\\8ä9¸ÀCb•×orø¦¬·O œTáG±ŠhÑ £Æ j[¦ëÇ\\âC\0š\'£kâ\nW u>bÁ7L-1Áx¬y 4¡ü§$âG¡ßQ6†$´6Õ}Ai‡6<ö+0®¹M&öK¸-j\\)T¨8ITäå1-Æ0(¿²e?0/\r£ž®šC¯–aèB©&ÓN µ¨½BK0î>šÀ=ôU˜²ðÃn†ÑåÃ>á›©ÑÆ|šOPHî7-†Ã–Ú\\LýjÕQæÀoñj*tœ1Vœ|Ägº¯‡Oæ(3•À¯ní—»`ÓÈßúàá¼ÉQ\\Q‘6¥¡¡_ëæ$ ÉÍIMa%…¿d&jV¦¸óGmXhOÑ8 F‹s¬ÆðùNÏ%ú‹‡Á¥ÏOõ¨œ=…lØ=‡QJÏÕ¦ó\\Å´ÃµäŽ°ê Ð…‚õDr•Ü½xk‹<eýFlÄ¶Å°5Ìb0¤\nÈ×†+†S“àåóh¼ü¼ç‚á\rî+Ó··‰ y,qQ×™€Ò« 6ý~a½ÅÐÄ.D£Q›Óu`¦µÙ¤ä|Ny:ïGøu+¼íÈog\'³=’îÕé‡Úè<Æ’à²à#”ÇÛuÂjÕy‹¤eeKÈ5î	8lîìœ&ÜFihÙ¡y\\³² å0 W¼û–äx+1º­W>\"õ6AÂ}jåäÏo”Z’Œï4PÓúTB‡‹<Ù¿P“MJqX†–uG‡pæC%¶ð§üFCÈãù‚ƒ^9£g²’g? Ûu¥@¸ScTyBúXÜ9¤8>Œf8%Z£¡æá6Ž—Ø[—ÁpN)_˜ŠnžÙPÚJŠ†SF0ÕÝ\\¸Ap\nbfŽ\rµ+ˆm,;[®jX…¿ò˜cV)ÓÃâU[Ê÷2ÀK4QvrÎEç¦”Ç4IVZK§º‹ì\Z•íÆ°ÅÆ\nS^ ˜|[Ã16ê)LqßÌ|TdÐ®–V\nâ³ŸçÔ£b€0.¬ÿ\00dÓ\r,Í¿ [K“„\r;Ýclo’N%dÛa¼}×Ô)et éíû¨E‰QÝ­Ðþã’r[äÓÇ0êy-Î—yeKu³%œ—ÙÖº…Ä¾•ìxó,…áºøìæôhêÍ{…Á°°/û3Ûl.úJ´G;->LCRQ\rUzú„ÈTd«3oÒB¬¤¸Õß.na‘j1Ê¸„0óáy}K\0l\ZvávÍê\0Á\0µsœ1 ”»cÕŒ?¨øÂ¶-ËË5xÛõ”°-,¹JÛPcÄoÂÊÀ3˜—E¥©kÂ¯é„¡©wnË¾Í,Ô’ÿ\0¦\0Ÿo²Dà3ê‘@þ jº®Å¦@(\0.\0z­jq%[I³»£s**©0˜‹´Uþ{Ìf;†Š{tÐšÀ.ýÿ\0äzˆ(L¿Ôb¦R\\ÊÞ±Ê§¾e¸+Î8ÏÄ£ž¦hŽ±ÌiWK¶k¸›Z½„å”­1üÄ°6\nês‚msrÔ=\r‡ÄAÁy`6M…xNÎ¹·U(LÖß&+»\"*‹ÌÕÁZÍD¿UoÔÿ\0ˆÖ¢Y-çMw™”×øSµmñ+yâåoùœ}Ä1^9®&@-3\nó‘1²½@É1Ùð½ø0\nL!Cš\ZÓXj`2†‡	’pÂ¯ô\ZMùWòPÑVLà•åy‰¦ˆ«QW¹€G×ˆB#òø”MGéæ¢`…÷ýzˆ§4ÎCÄ·ì#?S\0>Abý@ÔŸe“k¨Â­´2b•¶kOq@|UB»ÄfCE$Ãæ[ð€`·UÌ\0œðß!ã·™v)ò†üLd‡ÌAÙC$ Îå	VÊã\rŠá÷ýÀìá¿êj}¼x‚æÜþã%Švñö¾à{øŠ¸áÁõ<]aêSs5®bh¢ÄÝìŒ$&÷ð¿¨_-i½&“Ù*éJRÎëŸ‰€S*½rL©|´eþ\"3²5/$=¡0”i¥Å®Ó¬A¼óR‘®AœÑ;W8ÑÚ²\'>éŽ,GåI]¦n8¨„ï\\b¸Yh[uEÍ½@ÍvEk·ÌQR9ø„¢žz˜r}ëOíüc@ã:ÿ\0È®€sG¨…‘ß¸€^9c“gÑzŽ<UH….‹5}º`L¯„äÿ\0È\\£§\'©aÙz\\Ëp@ñû‰CŒgGòO[ßÜâú¸,SÉ`^³‹þ%ƒ˜ Àà<J^ì]<ùŠá¬×Ï^à\n‹º÷\09cÐ‰ošMŸÜ–Ëê48¾`ìêãeÎÒ:CWoq‚S§¶š©fˆ¶qüË²î]Møeº\0°z%Üª¼Ôè	e×ÜEÛx!jÚáxïz”ƒ{û…á{îXGÍOoÄrig‹ÏÜØc÷\ZWŒÊ[N.`öF­¤¥õ‡‹˜m£Üè¦\0=/éâa,5Uáé‚Lâ5X }½ÌwmÖ\"–¬wÿ\0°žFúÎF³ÝË«v=½ôË©+\nþâ—2ákÃî`Ú2:œø9ØÙf„ÈŽÛ¹ƒ8•›=ÜAø˜b8I^LyEÁã«ú…t(ûFÓÌºß–bø3UÏq&j¸Û˜¾mN³+«W€6¾	tèË»Ø9®ë8¸Š¼…®måã\ZÑ)MŠo€.µÄ	;Ôì9‡!Åº¨`¾õ\\ÄaCíû•yAÏî-.#…ÑŸ2Ö:½ºßÄXLÑÝë#céžÖN¡\Z‹˜¶ðü=ÇUÐ—GÀ.¦ßº•n®\"6sîû2x–¶¥QwÑÓù†`d;ULRÚÅÂKØÎ|*ïXrGUj[ÇÏ\'Ïx¸´K/Äs–ù”µlc˜v ¸¿¸·qêÄ­Å<À^eÿ\0…—Ñ¿\Zeû~h™\"Î1a‚ºy0KDV\\ÆŒÕ	†AŽ±-bÅwâ#NF*>ðKyò/^µ90\rî—¦Áh w¼,,–x|ó1éÇˆ\ZÊÛh_î.¼•Ýÿ\0–Ý×ˆRüÌ!r˜BØéê>ÚÝÀš»ê:S/™¦Ó°ôD@<\" FI“ç¨4‰…\0çýÑúG)r—wÇæPð¢9¶SâÏ0`­á«Òî±´‡Qµ)çþŸî¡¦ÀÂòL¹…³ÜU\"@o.n[‹Rð-V·ÚÁ-v:zèw‹j½ZMù—oÎ<CiN¬DÍl\"8nÝ8ˆ+:Ô¢î„èYL‡FÇLÅå^M¼ß£Gª×¸ö3É)ð.Š˜uvN2LŽ¢µÔ#Çß\'±ÏÜJíØ]|ÈÍ÷2å÷ÔÈÇø¹CÄ,›W¸?0ç?Rÿ\0Õ\"~	™ŠîÖŸ‰æutó¦})ï¸µ0F\'ef¯ýQb DSÀ?“1Š9‚¿Ëîfp\'Ç†(Û¦ðÍd/Ü)Q÷r×í¨ïùbÖÝ+Ñ*Ã%ôx–£tµ>ÍG6•tÀüòyˆY®Çûîbz989ùkÌCŠ{+¤¿öã›-Ä\r‹¸c÷B,Ë_Gç™bÔû«·øŽ:ß‚jù9˜®DWšœå~D]ÙRuŽEãÏ@ƒ#Èù˜`bt;”IŠÚË¤ô÷ô½Â¹ûË›w ‰Ú|¨Êäwgš©í/hnëaà–04¯¨-ÚðúcÕÌ`ýË\0¨p~f4xi—¯€üÇ	È~ \n <íRŠààù‹.+\ZWU+½N~á¤\n0¼Âì~¼ÂÐë6¼°u>q_rÕ¤fëCâmJÕ¿(íŠNPßÌ°9|TDÑ~ÇÔ^Ï\0Í•—)©ø”Ó¨4ÀÜìBT5L‰±\08f¿¶ÏQ†Í#¤õcî\"¬vŽX7ÎÉ`>î 57éõ\nwtJÀm~c:8È^~%§$ÀY¡¡© =â¸ˆªØc¹€ZÓ1U|\\BÞÃJÚx©J1ŒkÄÜJpÓXþég™‹G©ò}J_Â.74*ÕzœFN,¯7xüÇ›Ô V]Q,pâZè9!µCõ„¡Àò[©UUe’h9˜¼K |Ë7ÌIô&º¸zHù÷`üŽ\"t~e‹8ã1¼ÕÛÉ˜ý+7\r–]×\\@:™6¯Pß•¶)ƒ™±øšêÀÜ}¹šËŒâ	EêCTýÃNgI—Ô\r¥u`ÅÉ\\­^gƒáˆÁR³L2(ƒ#²dšÒx›¡Õ<@ØZÑ—V.‹kCr˜ÜÞVr:÷®ƒÍN›£q¸;ã˜æ|ûÙp9o¿/`¾ßSõÑ¢`v4[ÕˆðR8ß-‚~h³¥v¥®Ö>þáu·ÜÍÊû˜ŸÍ2êå”]{Ô?]À5Nâœv 	@¼Ô(ä!˜©¶&Õ8ƒ{D(¯”àz.ûÝ;‹É\\ê]Ÿcæ!h=1Mçmä€Ó½Æ°.‹ŠQ¾š•YIsæª…#0\r1ú˜s˜¦ßB ˜¶“{âR¡z„»;b¥ª°Á¨Ô¼;„‘é5Ñÿ\0>$Ç™lþæL¢S’;uõÃLò zù:eÑß%CÙýEq˜Ñ¿Ì;Â.1ºöËÖ·vŸÿÙ','image/jpeg',4,30,1,5),(2,'Gnocchis fritti','Des gnocchis avec une pÃ¢te Ã  pizza et de la tomate','https://www.meilleurduchef.com/cgi/mdc/l/fr/recette/gnocchi-fritti.html',NULL,'PLAT','ÿØÿà\0JFIF\0\0\0d\0d\0\0ÿÛ\0C\0\r	\n\n\r\n\r \' .)10.)-,3:J>36F7,-@WAFLNRSR2>ZaZP`JQROÿÛ\0C&&O5-5OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOÿÂ\0\0ð@\0ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0åg‘¬ªÐ4.tbšék#±#V±	v´Qq)A*ÆÊª RÖ…¥vr‘²¶ÜÒ]1X¹®[5¦k\ZÐJÔµ´‚ƒªƒ\\)\0*WaP–3(Îzu±q3tåÍaF¦ñ°eRÈ\\Ðk#.šé*Ê‚2™CQK,Ð¹…ÜJTÙnKTØXìÅF-\"²ËhßÏÔþ~Òëá.~¿Mèù°‹(çhH«4ËbÌˆèµ»E3³Uk`ÁÌÚ‚@”áVZÁƒ—WŸëÖvtláè:x]ÓŸ;Ïëvù¾óÓ×“,‡7ŸnO?h±ÑíâR	–ÅJ›–(¦k…!„´˜äZÙ\n»;-zV¹ýœ^í3ŸK%jºg•¾ïsÛŒ‡LôýV³çù}ó-Wkºø†S\"¦çŸsbÁ¡!ÜUÇ1(¢#º½ÜõËÏ¨ç\\~~š5ß8ç¢-F®÷žN™nÓ¿?C‡~_]¾Lyö¯ï_&YqçV¹lÅ¬s®$µ`Ä[²Î¬¹‘B`¨\n;êšæqõááé¹œºèë1ïÃ£Ÿ§üŒ×óª1ô¥¸ºù›ŽŠÞÏÕ«^~÷ö	DÇ/$Ãsšª\n.×ŽUH¤Ð¨N…¹Ó¡/£jŽ~Œ0Mªe;ñ#|¯x{]o±³xoDé‹·w/GCŽ‹¿—^\Z·È‹¨)8RåEì;i\"Œ=M‡4V%}\\=qòëÀÆÓ¬©ÏÑ^¼Ú3Óátùãîêy»åé¼Ê¾œßŽŒ™5c.Ð7ž×§Âû˜BŽT¤qõ”Ø¹LK;¶ã™ÑoB;íDäyýžw§\r<¾ƒuâÈôK•®Nž}9èÌìùö¹³³§Ëž{´éW¡Î{³ÈeÝêót:ð„ \"^N³,\\ )^‘\nœv¥ëKUÍãéçùýX{åw‚g©™íŸ~uïçmçïÍ¬5ÏØüFcW¬…Ãsµeª]¸v½#!*8g6Ë•vK3ã¥ ØÛ—×¡—©,®?g—¦wùª×n®Œz™9®éÙõÀæä´hÆ¦jwØË32îì†cÛŸoÕâ²†SÉˆC*ÄgLš« »ŸZu–³¾/—ÛÏô|´5SÑ³Ÿ¼dÏ¹§4ùÓ&U¦Mó\n&5sì9V®ŒÇaw=ïoÍmB‡‹EbQSq)ÍQßÖ{Ñ*“‘çöó33»ÍRÈ³QÒ·:xÐÒ,)Àúx“6›Ûf=Î‚2ôÅë—¬ïâqB6Á\0ZVt‘U¢	v¯¯¹°#›ÏÕÊçìVJÑW‰@Þ­—g8ÜÂL×<ÏO·B®²k:¥vv33|ÓÛÉëwÀ–„8<2ˆvË•yƒáÇ¬5ÙÎåèåóöæÐÐ^æ½àæ´së³mÁåšo|u8é\Z¼î¹kcšÌ¯>¿W‹¼Í¬!pSÍÙ;åiÌ“-­—ª×¤¹³ÏÙÊÏ¥s¢™éðã/L½9äÖ:<;k™y}*úrw>´n“Ú·Á¹ÝÝt7Ç¹ÓÄë›X@O;5Q’çÏk@U (æw\Z>^ÕK×ŸhYÓóèåsŸ?{) ÜŠíÍÇ¦¬bÝót™7åk[ñ±»ß®î¾XC˜róI£®œª ³€º-DŽóýÜùó¯¨w¯;¯\nåé“WŒoœùÛïÉôxösë§ŸeX­gl¡ª­r¦¶fç¹ìtòõ·çµ„82æ[‡­ ï€‚¹Jù­\\½˜séÙÓÍÑ×›uÂ±¾[sÇê]è\\šçÓãL^®ºV²RÝ3P³¢SOAÛåê¹‚O=šÂÔŠ/|â’@¨,çÉ®Þúš°l–RaÏ^Wf|í>Ÿ&ÿ\0°ŒÚÖn¹>¼4c®i«¶::òô¾n„‡\"0¬W@„ùÙ\0M\0@ÅË	{•e…\n´™sÕ|;/sO^9ùû3ç¶Y¾¦üzwË$ëÐ×›^¹²3	¦”8(I«§8Q†*Ê;q¹aBD%R\nÑv\"Ü8ôzuwärQŠ_=,S[é¥ß:ZJ!Fad2Éê\ZÒB„!H•H6È\"ÈC!Á›¹T²„×Ó•…e•iÃ×¿XB„!B%@NL¼™\\¦@ŠVE¥šºòe ðL¡éK½l„!B„(çG*h&®Ã.Á•È3P+5o”@Ì£NTu+)ŒyŽ5VŠ¨é®ùXB„!gh3iWFÉ«¥$]‡U-–š·Î”R,‚Æ	 ±A!Z0v\nêÍê«Ä™F•ó\nÜ´ÉHbRÍÐJHC5‹*¢Q\n\0Êh(†Õ¡\n¬Òš±”qKQ@‘`E+âêì!aÿÄ\0)\0\0\0\0\0\0\0!\"1 A20#3B4ÿÚ\0\0‡Ž€}“ÆÆÀöS‰Žp¦MÇ8fƒi›²wâ!Á\'’|pDEÌÛãŽ[£¯0Î2«’Ã6¼Úf!è³€\'©‚Ój¤öv°Áº)Ì#0‡æÃgËvõâ²Ç,7ÅÎTð9e~áq+mËqç˜	-Zœ€øÏ\nÇ<™ŠÀh7åÿ\0iÄ¯[9åi™˜êë,Ìy¢«l?{C ¹gáê6þ6 -¨Éß3<àÄýO´nzbˆQàÎXc¯ŒÄ-ÎrfTÅŽsVrg&¦«Ÿ\'²­:Ô´]‹þVè©²[£¶¨´ÿ\0`c´5L˜Ioa¢ãÈ\'§©ë¡™Àè$B`ç¦x­\ZÒA­•ñË¡˜\rJÇ¹Uw›%76ïÉHŽt²õÝf5?ù@FªZv§ã4¶– àFXœK!ÀŸ]J”À?À:itFÈŠ¨ºê¦yJr<°¾QÔ\"œ‰SøøÄ´Òé©­âÜ-%nú\rÛ]?þ†8Ž5×\Z–®5¼3¹ë§¨ï¼nŒœõÐéwKœ¥uêsQ–jDÃCr(ÜpoÈ_6¯q-ÒÐá‘ÁÜ»MòÀ!ª3‘9 žo$¤á¶”G cvñÑi{¦jmò90…Ø¹È$l,6—X£1ŸjnF„7–r®%uªðB3\ZŽ[!íý9ÇLÎ<!ô »2°@»¦ÕØjTš}/uúkvÌÂc˜¾jå¢ÁÉ¡fHÆmM¶ÒkšuDŒx¨ì+}pGWEu·Hrt?À\r.‡fßlOqÎJ\0ªCÛƒœLJS·T²Ü5øÅ öÚ{pÙVÜ­j»F‡\\5a~%Žã{Õ“jSèû®Ç¨ÖâÄêFEˆka3¾1˜¼¶Ó¸œ/wœh+zjFÖ»+q°áëe‚¶ÍÆlâlÂ6Ö®HÊZÄÅ¶È?²30aâN—õø0,]¬H\nÙ÷	°ÁâEîX\\\"ƒüwþnš–›O“37â3Z&\\ÿ\0Æ¥aöž·áPÆ¹ì28ØH«Br>ÖàËxLCÄôwwOãÿ\0ótÕƒ—â)Úž›Ü®°aZÖng€•YÁôDzîÎ\'s,Ã–Uî§ TÊ›µgÆú»µ“O<MÆ+A´ÂNpc3øÓ/Kk;D>î0Æm|WÅF`{$E*e‹’õ0‚R|÷.wr“`UÜ\0_\"Ÿ¯ÆÆQÀëè¬f\0!Ìþ2ÀÉ×UþÂ#\rÐøÊÆàÍ‘ÀFµ-0Z0àØVRS=?ˆt\06)*³”õñ±0ÿ\0|L	ôÕÀqÓ3MgkQÐ¡îªÉc§ÇÜk=ÐfsNý¦bcê÷-k–ÆÂ2Œ0\0pƒ2½Ä–¾±Ü-å@ž\"vªÍÚ|ÎTãAÅÕ7MIe;ö—…H›¸Î¡\nÆâ!Ë{cºcÄ¶&œ€à˜Î²Ü˜0e×t,Òù—ò·–ò/&Ü1p&[½åÑªeËŠ®f¶ôe·éÊÌ‰œK¨®¶£Ó…BQÌ_v>\ZÓ™^åkl2¯;lŒ…lþt?jWbØ¿p7îv­\Z\'Sb\n«3YË‘†‡Qu-´^í,Üëµ„á=†_,>ÞæÒö 	åa\\	JŒ3MàGÀ5þª¢n+4|ÛðÖ¾8lˆ 8ëÄÆf 4©†qU•·eMŸã6î-[§iÒd\0ßiÀW÷b™WùjŸ¹l+·Ç\nŒÚEÝºh“	ðÔ>ë€Ìc>¡<Ï}!«VŽ„D$E5­–i0O‚%uâèF¤j¢ªÇ)·›xTîÓ‰bäÝÌåÊðQCÂÇ;’õtµ¶V&ÑºÏ¸Æ`zéõoèìÙc\Zµ’t+\0ø[T!£´HÌFÌŠê\"\ZÆNÒ8Ú={.æO]5m¼àôSþ½õ1Ðò…‡“£&£ò5ƒ?\Z©øâ=6F ØSH‹.¬¡\r\näé+ÖéA#Heu…¥ÖŠ“p€ôÿ\0©îc¡ë™ÿ\0!¼¾ÜÏm5½Äþ¢mèÂ5@Á¦X‹´|,±kRÍsbb0g?³ã\"}ˆÎôÛM«uÙ‰·-qÝÀ;Œtõ²Ë×M§»öy™òn´9]Ev-ƒûÉ\0]«žà1×ÐèzsKŸjbA{D<ç$5z€GöÙ«QžÒ:ªdb>ØÁë§Ñä‘xƒžš‚ÆÅ\r‹™Ä­6ÌžÕ‹w&%–TV0¬®?¢ÝBW,¶Ëp{hl\'jŒòyž=àuúûýˆœøŽ&Þg9PKºd\0QwaÆfkÕ:•µ£X‰²’ß‘\\:„–_c@:ba=ÎrrBŸnXéŸ‡9ŸRÜv¨ñMÙ˜\0AÔ¯SÌçj´Æ\'5¹þÁ\'€ñÌ<ÌÏ¿ÿÄ\00\0\0\0\0\0\0\0!1 0AQ\"2@a#BPq3R`ñÿÚ\0?ñW~:ðWuÞ¼ºì‡Ù?²nü»ß’á$¬Fè^%â¿!ý‡N·ÕDÔtÃú”Ì¸WÃÛÓø^Ÿý¨Ñ¦äiHs§DºyznC“£áÆ&\\K˜éæJ..Ÿxà“IŠ	lŒÐ¸ß©U³(¢¼/Ï®Ý.ZzÄ‰HØ{pEÛà_2³s&=kò<D±Ê<‘ÞhºÝ•©ÙÔo\rG>3Q~rF8ë–“\'L×ÒG§Úä=¶5!í%«ÔþÍ;’–’YaîFZ¸9F%\'7bÙÛ/Ñ	ÝŽNèê%û{_wö	véñ~ñmÈ›²^è[pdÏ®:E–*Éõ{-Šõ1CT·.ÏìË-2±M5bÊõ|¦³6Uè7à²þËœ\"ØòÍ»²Ë)Rd7äžñzNŸ§ø†LoÒûB:¥B‚„vB—¹CŠ{2xœw‰i[ÉPðM\rVÏÅEæÃ«2ï%&-µ#£kâƒPåF$¢¬ÏS»àÃ‰GwÈâÍ7Ïgì-¶Cu±¹!1Ædã¥×ü•ß­W±‘KV¢<Xð¤í:>j²1s‘5“„zvd1¤µ##ÓD\'­Y}›‡³?¡¢1hwF~oÌkÂ»ôð¾±9èZŒCÕsÿ\0ÂYW¸Ú\\ÍHœÜÝ˜£¦(”uì,rÙÇrKØç’¨m®íŒÉ†O:»®ý393äs•z.ðÄÜ5\n^¤qûŠ^å·Ûq\\y?µoD¢$ýH­ì—4;2Ã\\o×Î¯\'¡‹\"ka!&ø1à·¿nYïÚ¨Q$™Ê%ÌYTBqàþ‹wg®ý¥²±ù–lW‡§úY–?»sO¢+I®ø({3žNK¡²ü5k“õ\'¿$!8ÊÇ7	S\\‹a´IéD²&©ÎL}Ò½°d‡ÍtC¹ÏrL{!«_%{&]¡­JŒxõI¶.D£õ^ã\ZõÄ?wùO¶¦ÿ\0&›ÿ\0dlÉü¥jVB­ö½¬ôÜØ½Ê#ê×¸×° Ì—µ5ze•+?Bò,]“iÚ1çÕ³ífEªc¥iáìA¸º‘ý!·2}(µIz+Z…-Æ){‰ú\ZõÜŸOÆÄààéøÚ}/ÇÁÈºuê|(pÆŸ¡®¹GàHoÜ–Elƒ×ó1½ÌªÑôª#Q™Vš&&ÜmúŠß#|OÓá^n9üHêD1$ÊŠ5sR¢7¦]®ÒÛ‘]—Fx7ów[‘ù¶cÖšŒx$‰ÅÉ5êcÈ‘¸ÙÔK}>æÆnÑ«ÿ\0óGÜ—Qì9_hå”EÝ‰Þâ[œìŒŽ¢5]¡¾ãDrÞÇá‹nÒü‰Os\'Õ÷8òiä„âÖÅ®,Ë—VÞ†Ìªí~ÂÅîÈÆ+ìèÞíöü™§¦6?»ÔûC.“ã\"Y¶¤K+fª\\Ž=º©~ÓQ(«öD¦äíÿ\0óˆú©’wÿ\0SKøj+Â×eöV_–»ó÷5Úÿ\0Š¿6ûW‹ÿÄ\0)\0\0\0\0\0\0\0\0\0!1 @AQ0\"2Pa`qBÿÚ\0?í+úBiþäåq!ô¿’»™}ÃÉÈXËÉ)Q)2žÇ;ã={ÐÝ‘ús¾¥ØÍy<\rúï/Ø¾¢J‹ðaKI­\nq—åäÕ˜~ºè¯žR¥dqSäž+¿¤XÉ±V„‡$QT&MOÉ«,5ç*íqeà‰!IxF†ièŠ´J„‘·`û‰ï°£CŒy9àD®r“¤9>\rÐ‹—‚ŠF$œÑ‡:äþXõÙ4ñ4ìa½­Ž{Ñ< ?©‘Ùš‰·À˜½”-…E×Ï‘åÐ«øÉ‰ìp?¸Ô#R[ÒQbV÷tìUä÷#°òkÑyaqÚb²Å¸ãèÒi¶\\\r¦\"BY¥×’ÿ\0¢qòi0ñÛæY¼ñD$‚%-ö-²¨£adéñ—úi¢«$ö¡•¹…:uÙÊ:‡;ef¬“ºT-…/c¡¡”YW’çà_&/ÜkòrKm…›ôj,ç‚Š(«\ZÉ1néš;ÐçÖu¨þ6p7\\—“Ø„ô²OaÊÍÄßŸ¢²ýN¶ë_ôb&œ´Ùj,rOØÛ*>ãlSò\"<á.:×Êãë*ÌÄzˆX›îIjÝec^L5¹&™Øþ’ÄÇC‰b›¾»/Ù}o-lÔüš²¡£õ”Y±¤Pd¶àdy$í”i#¾Ìk<>Éª7äVP¢J%döYD‹ðM«\nIBÊ/}Æ3‚²jÇ‡å\n,Ò%“‚f„Oš6!».ùÉ3I],\\w2†¢P®E£M:c~ˆòQ¬m¾˜ïßJ\Z‡‚üÂ­ÈÅ\"P/,48£@•~\rÁ\Záïû}|ëðõÞ×kÿÄ\06\0\0\0\0\0\0!1AQ\"a 2q‘¡0BR±ÁÑ#bð@‚’²áñÿÚ\0\0?ÓÅ-G®îX—ô/¨êÅ´]á:[aÝz\'ùc¥aÌ\n U6‘bÆ¢ÜoHØ}–5ùa¡k„ëêBYVrú1¯è5¡¯ÌËN:¶Ð}%˜›Û^æZ¯&<¬UlÜ™j¾^©*ªuR‡.g^â‰ó~‹~&|>a”ÓU.ow¹Jþñþo©ÏAG0âJõò”OšÊ|ÉÃ»7N,õ*üëôüY.|6ß˜“)ÛŠ6/c’¢’U‹T´E:½Ž«>äü:\\ì]ü4E*–½D²/™d­ÜëMz¢åŸ¹–lh¸\"®“©UIÆÍ\n1qU¹|6 ·ƒDvÃ¶¶9Û„·2Æ¾dUñ~Òj§EÇ©K~ÇåÊù¤šWÚ.Wð}¦fû¥¡Õ3ÜþK6ÙËh;h^Ì½»Ÿ¡Ó¨í†˜tÝFäønYa|§Ku!ü:¶;¢Y*Ôìu¦„õ	oê5ñ–æ•N5,³Ôå‰[+ÖIYZìy~§âõ!V N¨iéÚD’O’éC2¿ÐÛÁ©ÍObjûŒÿ\0i£Ù–•	j½ÏS5_#Xöm	\'U¦þ†‡4½GÛ“[•Ïæ\nïnäoø™“EZ\"«Œô!Ó>¢é¡\'aµT§Éeî]ö-ƒXÕ[hµRÖÄ5Ä¾/ÅVÙr:’“­Gr)jêÛÁ2dW-KijA\Z-Ùh©YMu.X‚ÞÌw3¿D\\ér¸\"¥\r;!ÞïÁ%pÐËE‘ª¸÷%ï¦9ë_Óÿ\0¶bY‰‘·\'Uˆ^”ÿ\0\"®¨%$]–´“Ä´?r_¶¥ønM(óPé«	|s9ŽK­HWL†¤ÌéSÉú²=Èµ1©—*\'V:¾\'‘}qNa®wàV#è:œÚÂOCØ…§%ïší#Ÿ‘k—ÔóIý¼\Z¿‘*þ©J/_FÇMT{¦~þãú”ULšÿ\0á˜Ë\Z?3R˜‘ÞÏ¾¢f²à·SýJháa•m«\"ÎG~•s÷.XTEõc:¥÷àÍE/L-©Ì*Xæ$š™Òý„Y4àU/2ÓXŠióv5÷.¾Dl+Ij®znh£‚7ÅkÊá.1umQUOwbÊû+QÁÉMu¥iäbr(XwOälk ÓæKØí†¥Tðü0Ìµ|Æ94Ô„EPf§Mé9§êtEÉ‹D®O÷b³+jE\'î¶\n|;ZKŠò‘¬¢\\{a5;´JÜ¾‡CßÊAæDÕ£%xaÈÑµ7RMßù3QïIš²éÁýßCY»Æúlp:ž»’üïè\"í©Ðµ?S.‹ƒK@ï¡tÏä¾úŽ~GJ¶(lÍÏÔOŒ?µø:=Ÿí†¾ä[äÅùäÍðõà¶§¥OëFM[lOs7Õ™WÍŠ¹/«;‹¦6\"=¤M£¿qüÇ–ljË;‘RÐµÛ3Õ§•ˆ ^*íø™+sÎýçùlgêNü•Ò­y?»F)÷\'Œûq„A4™žŒØ±Sr)3ÌãÐ¾šûgq¤×rU‰3Sî KŸt?Âu]vÙj‰Ù[ÐšpýËéúÕìñ—¡‘ÑU^Äu{›IûÐÑ’ÕÍc¹s”}WcüÔšWl£Ñ\'xdµYtH­èS‘E>:kä™‡ÜÒ”nu9íl©UÙº_Tš&~GÃã1‘ûaOäýÉÚ¬nJ:•øŒpõZžÆ«W}¦ssž{™;›É=¼tež•-¢pàI«m‹ô³*‹\Zû¡ôúßU7õKr*RŒÔ6×èC²Ba)œ:&N©S ž¶.ÈºXwr´;—Øqs3´4æ§êM/Ã,ÎìÛjU÷NŠÿ\0ä-–êøMJ_èM.WsN•Ék¿ÐËKÓV°«áÕªºî\'šgõ/M9¹Eéb’Úl8.$GáàWÂYo™\rrh\'@ê%4ûóØ«Eû“¼_¿…S1™îq‡|t:®vHôÓ3­°N|n;G¦REÓª4,pUUNì}*®Dç2úu?3Yàª’½àÍÏ†«YX™9¹§±½õNþeÑjì4ïOêSÊíQý*]+/ÉTÒö2š\\ÍWº5!l+„÷;}…+¨õýI\"•îS‹«‚äïU°àËN1†¸3ËmaŽ¨ögÙ|\\ÙêN½ùñMgT|iÍÁ/Áå4‰Ý—K±[Ë¦ëaYæÁ	l¼d½ñ½™ÛÃ—AföÂ¥]3ðéÓŸcìæhzsOÜyfZÔ ü¤»¾å´ÛSVÑMŸbõ²ÆwØï«f‘‚v\Z4kÇ¡km”Ô_2u/æZýö…çæ[Ãš¯þ™ªµ[%²$DÁÄxàylž£±õ53*”Šº~\\£jÚ“5f½1¦:<,¤Mkáxæ•üá:¿\nÐŸ„Ôþ%Émw\\ –áÒÿ\0‘£ß‚Ânñ¾‚\'Ã¶\nâÊº¦1?!ÉÂGK‡ÉÏé÷ÑðúßÐšêöÙ\Z§ü¸w.½QbpßÁÇÔî^—Cª\'ô2S«*q›¹9mÁ¾ÄkQü.ÂÏKSº&–ŸÜÆµpu>ŸÊq\'A-¦E™–ÃiW}þáx>tæ¤~†g« »z÷-©®eßR2Ž)rf*åñz—Õ©aÕRDRÛö5\"ÒýŽ˜¥p8Î=Ç—RØo÷=‰*ô3W<)àõÂÚri|cgõ?•feòÕÅDÓîŽ”EZóÏÜé;4Jvx#“X&H‹ÿÄ\0)\0\0\0\0\0!1AQaq‘¡± ÁÑðá0ñ@ÿÚ\0\0?!»º²NùîqÏÉ8êàÊ²»ƒc¹N)¼³á˜´ÎYÊ÷RáÁ\\(…ëâ9V©—2×©tòÔ(ŸiC3–ÐËMÀMCl%+ê·H§ êÝÀÑ—ì™%ë£ÌÔo;ƒœ`¼q—{•@^æC¾jõ4€:`¢Q¯ø€ÖÉõ\0ä¥óãºÜ»s}Í4Fy>±»9º™\r®}(âq>Õ²ƒLÎŸ1h$Íg~ÙKß¦P©‘Ï˜d·²¾.+¸a\nRv’ôŽIˆMï\nøüÇg£¾ewn|\\ÈmXq¨*—WÑV‘½AEŠå4m[oûÅAQ\0Í¿îæWÐºüÅµ4kÿ\0’ë2Z=Ê+n¯’s¯#OL²´Ã|BÁ2 ù‹`”Yãû1öœÓÇˆD³¯.e€ëCµÌn—0¼»‚éZù—.ïxXDåÙ¶îdPÞmð‰Ú8»ˆq…#\nV)Î1,uòL®„á0l³3!VÌ¼¨üË­:TWS*°q%¯Žà3hªê=x5xKq\nm\\_1=Çp—9ˆ0p:$òF˜û¢C	åþ Ï…7†±óÃˆM…€5Ü(GeGˆûœô%ÍÔDkøªÀ1®|Ähg8Ó0 .òæ.O†Kx–jŠ\\ŒV˜›”º.k[îxV{Žý·Ü÷¯0H¾ÍF‰CÊÃ\nÏ=ýå-0¹™žeêéñ\n“éÆÅ:fdçLSt\"Œ¼Ýo7r•Rä.C¸Y©çà®î)F(öÄ#,5ëã÷Ù\'ÇäHòAÕûløJ› tJf\Z4.ùD…¿æU[gPËJïÇÄ×í¯˜ÊŸ%Ü QCvÜUë€2 šãŸ3fSÓ‰›ç¾ãŒSú–àÕV3öˆ;Èƒ”ÒŠŠ×5Î &æ8Ì	Bˆœœ±S¥êåõ‚ubU1¥˜l^9­,pç†Ó5Ô\Z™×Ä\\Ê™;gßÈIñ‡~e«a³@…—úó¾jYË.µú·,;6½A\Z–7ƒÑ\rFFà ïi0‹¾Ì¢k+íoÁ1<bÛÙ\\©u1­)r¤”á,ñ2YýGÉIš)˜\n¬|2Œª-dÇQxüEÊ~0FïW€ÌÔyÃ9ºav+ÌÛPí^%Ó,\Zàÿ\0=`œnŠþ,å‚È×Âþe£ Òiq½ƒýø€i^#UqÈZ“êWRÓµjž-ú‰UNŽ ¾Îk°ÙSK]±¸2©cÄÉCá&p[H~ ‹-óSAô]L:;£,Ø5¿ä\\îFÇ³†\\€¾—“ýÌ²Xÿ\0“,_ö.ñ*µ¹³fIë[LßÏK-,ºó8Wr©Ä(Þæ2êå~Öÿ\0s,o8„àÓµ3ËÒZäª€xT{™•Ó‰ø$ÓGCÀî8hÎbµë„)Q7˜ªäÕÚ@^z/R§\'Äo\'­xƒn\"ßÌjÍŒ>îÃ˜‰àÒ¬jõö¦˜“‰`¥MÜÈ@«rœE8âpéüÄ,¥°È\0ù®gB½º˜ÆUÐÜ?~ç;œ\rK(¼¥©^(ýˆ¬»”øì—ËúýÔÙkIÜ„ÌÍNÖ|Íu_qµP\\ü™h©E,uz]¤Ã©^.HJ‡Çr­6º”‘Mç¸³/øN<UZÎ1,PÔ„,ù%v54ý\0PÌ?¡¸•ÌÉ%LÒ÷}D\\+Êâ#ÅT¤âˆvB(­€áX‡‘Jÿ\0¼ÅYðoû‰½\röúEE”f‹¨I¶U”üKA§‘¦*\0>³rË•‚lƒÐU_ú€é“¶í]J&B,á9<¨G»/˜ÂÒ“k$6Š*JŠÆë¨Ã(ºc/¸Ú\nNiñq|DÜx¬=Aƒ\ZÂ:æÉ\ZÏÁy…c/ˆ7_ïÄI£Ú†”\'ìE0m@ÚK¿Üü§¥?•õ$,@V²v…•¼¹•x<õýÍ…QµÇ¨Ã‰„Ð¼Ï\0ç³«æ\n»5ž+ÍA$\nY²_BW&z\Z}þ–Ü+èX¯]ûbX`ü|B†„} ¹ø\\{ˆê¦ÛglªýN¨o@B¬o0bæ£O‘ª\0k,Ç™yÔ·lR£Ž#5þ))@YWÌâÝæ¥H·ï¤Ø<Lž›×¸ž¡A·Ë®yýwJ€ænU)›–+¾%Ùpà®`žªŽ?Þ!Õt¿2·ÜÑ¹NçL_ã%Ïêª(Å¤ÒwE¿Ü1Ð¢³Á…O½K”Å#±+eôšƒÊÆ.œ«ãP]§¿…”ó‹în¬æTPöÿ\0V‹œ\'øƒ’ÁVø•³ÀS›ðu‡ÍÆÇmôíaÄì…Ùê*±ŸËûTŒNƒTÙOÉ”y”.OÜyèkæS“µ\r±¥kyZæ )ÕÄN“™Z}žbLhm£û•<¿Q	¦Ö5L·$Xi\Z?3 ^ÞXíºóÝÃ Ùx® ö?É(Ô9ðq¬@àu¢ä4õ@U\\Üÿ\0ècð©Üò¢þ&c½›úÿ\0\'.b§câ;·UÖ ò~ÝHéê^yïÔUy›†2ÿ\0’£\n¤ÉðKQ»ëø@-¶õðÇ\nœ?Þñè˜¦_©8ì¸qÜ&×Cä–²ü@­Õ(ºH+A\rÕ›·æt…èKJ²ÉKœÄÐ–(G¶Uš¾•\Zs¥j ´œv°Uê[Æjl=nÜ	A…ŒšŠsÁQ\nº¾¢×þûýÅy÷dÀsãÅLÔª*ò‡#á8y,+käþàm§F½ˆjæã·1®Àþ €Ž…9¹c‘f“žø…÷ŒPŸy€{ßD²ÁOÊCÍXõ(º£Ž\"R3ò1õ•èŽr}a4	ñ\nl|´”-ž%‚‡‚n…é²Us§d³Â3\Z×Ôn\"Tá…¶•üÊñ˜®·”¨ÐWîôõrˆl\\D”×µ¢|Á+%Vš7ß´§{îóã¿^bZ/¦â¶ð6y!I`x¬ÿ\0Ÿ°U<š½ÊÃ±bu,¯d„µ”Xåõ€ôŒ3:Êh/U7g:ÌÅÖž>ñ‡È…h:î&@\rSÜAyË?y‡‡Y§´D/)¢¬SŒW_1¶Øÿ\0j%2«U¦ä­@JØú‰€[mþýTÕÜ¶q*‹eË`cZV:¥GœÊsŠ™;‹‹o²j#_‰¬Þþ¯p§»üîrêÝ?ž?V/Cl^Üé5…üË1E› [hvî)n½ÆÒx™¯W&fšš(„iéI²¼ë©gäJ}¡ê|Ê7Ë3®=LåÊÇó9s«e¸>¸Ì@f>H\raê\0(ýÁÑ­)¼öQBæ2^Îã£,ÜAÅ×$¢€5ÅñM3h¶ }e”†¹þ’ÏŒ5ÑëúŽVóô8 ­þÁuù!.ûÍðÌÂ>ãUÁ”çÔ6ÛðJ,¥óPgÚk^ÞfS!»†—Œ¤¢Úm3YfÛ©cOv€—ñ‰ÂHåÄÈ+	ÛøJ\rT±’•YñûÜFÂ_F\Z°U¨4¥ÓcÌÎ­Epî)F	Æá×=)-¨ygýŒâJ¯ær7\\Òà]Ý4Íá\0­ùù`ëÂã+†ÉnCÇ?Ú ¹V|» ïRuÛŽ§´‹F›åâ©mN’6)-÷uÑ.P*ÏÞUko1¬©¸¼Txs,×á2Î©Ô¥ßK˜kŠ¤¾%™Gm‘«­´+GQV%Íp™&?´™(b©O]}¥ˆzgYuüÄÊãÑ&§ùÑq¢[å:ËÏ¨T ûº¢ëÌ¸NS!Ë\Zê a:û[Ÿ÷™Vñˆ³a\\€%Àþ	üGsL\\ËúJ5=ÅëV¥Íª°eªA5N3ýKNV_7.ˆ”8åð¬Î ˆÙœx–µ9YâZªÕå:ê\'k‡1æf³2ºe;Ý‰IiÝòè—…¿cöÑåd³‰™C«PÐÚsÒW¾â£/ÙúÑ*\rØ‘ ^æ*1ºÛ/0ªKË™lÀÁY&…Pý¦¸º#ÝÌòbh²åñMªep·9^wâV&C0œó*Š½Ø3ÜQöLë‚ßP½l÷š×¦fÎÙñ`Ô_qM6=‘7¶UÔª5uhú%•í¨$»¶èx?hX¶ûÜ\rnû8[X8ÿ\0äEV6¸–Þ\\¼06aÿ\0eê p\r¡žÁXÄÕÇž>eˆ	¡þÜgEJþ#YÈ­<<Çfd¤ï\0jRÔáíT§2ØûHÔ®ÀÎ^çÐŒºêXI}ª.Ø%&0ÃÔÅ~%wìuQ	œj\0/MôÂšYÂÄÓC Ò†ê½¢§‹±8¨\\óŒƒh>`¢ýmþ÷óÃp\\\\ñôƒx9jµs(ygÜ±]nÒÙðu‰“ƒõF£œÒ{_©•öñupÿ\0C1Q½&þepvÙŸ3Ä\Z\\¶A¡2Ê`~·\nH+³Í ó‘£l¡4n¡aYwÜðgëYK6ÌøÇÅÿ\0Si<\n‡ª•ÈòLDnç_Ü_ÅGÊGÞef4ZÀÞð2£XÖ ƒ­îËÏ‰“Nã?2«ƒÜ]ï­™\"ÔÍùó2æhÔ%w-¾%©©Ð®lCzÄ<Â¯Æþï„é?¯æT¯ÙSvNz^Â£Éžà®4ä+Ãs.ifC1ÝÑ–ýT·_#ÃšúBYOûE×6û|NE<R ý.„¾s&[³j[Ã\Z©„i(å²¹Ünì<6}>%Zƒ¯s²~ƒ¹\\¤ævÑÓ,r<¬ÜÛ–œpqåz¯ÌÃo0\0M(¦ªù&qö÷ÿ\0’œJDŽ‘Èc¿Ã \0Ð~´~–3ÐmxU]ìµåGæ5,]“È3yV¼E…_¬6Ø_Öó™eu6îU•+³8¹À47¨¨)Âf4àË… k\\MÎ³9ÀÂ¶ºÿ\0Ò¥`o~ÌeŽ/×¢dQn.{ŠÇŠÌ\\+-³çO³ægrù]Kµ±ÁpÇÄæ3Yaª·ÜçèíŠÜ8™»­ôbi„ïÌrÎ16ã3±\ZÂSàº~²÷plßÿ\0€èAµc\nGà™Ý–UÏÌ¡õ+\Z™¥Zø†ñ·Ž¥¦NõíÍÝÔ¼\'+p s0*æ#ŠâºÈ@Æîà.4ÓèîsÝêL1Ï>àš/Ž%‚É<¯‰ŠY\\ÛV¼xZ(à\njmû0å\Z×·ñ/ÿ\0[‘;oò™£ä‚+hfQY½=¹œ],sƒ‹pÏ—ÍÄ¸íYñ+2Õ%\\ÀS¸¼¢f±êVbð—\n`Ü@\ZËQ—m7Úc¬º *h[ÏˆP¼:C€ãÂ}â(\0U´w.Šðþå£Èe&\"lÍ¼@{áæ]ÚªÏ§^¢Ï þåažüY»nŒÀŸ¿ì+8¶\ZŠªnþf”>_Ää£ÀÂfJj£‰l—5Ä¤Ê2^>ðä*ï|B›|N%k2çÉe	×o¨èþÈ\nª¢iLD^!™Dåp/qBK*|\0ƒñ\r·œÒ»ÀMWˆ#C8E-ŽÄã¹@7¹ÂràÅÕÊ¯ÈxpþŸžib—Ý\níjð£ûè?<CwuÁ‡ULmŠš#ÄÐÎ¥F\"ÀÇEÐÁ¢p–=›Jå™(–86ÃdÉø@Ó~2î.`×¾|K¶¾„r»ÅzCu¬Ë»}ÜÊð`á™æl&Ì úµ\nŒ7.Ü)p`«ªs¹‚föBmé†Øí²ÈŒƒ!YÇä`¼ƒ›ðóLÄeó.KgÏ<Äg:\'èÄ¸ëô®FxûÅCY>ò¸Ø˜Ný 0ÜÝc^9˜ðš‹–2úÀ‹¥³ît$ÕJµB¾³ÿÚ\0\0\0\0\0\0c”N‰ÑÏºLY]³ÑÜ‚»r[¿õý¦Î?kªRòÖu7ö,;œœÛ¨K1¡I·²	†\r¶q¡’ Bqs\'œO¢+HE­– iÏÔõà6_Eÿ\0m9€$d‹ÉÎsc¥©Há!D²dð%Üq!(€h—Yx€cZ½m¼ÕðA.«(oQ}g¦›x\0Uà,9ÁþíJ$CÞ”\0…W‰I”:ìˆï±õ\0?©ý6¹z/ƒ`\0Aqx¬ÀžÖ1†cw@À0\0Í¦ý·ã{dMöLÕh\0Í ú#ÇQï˜uMÈ\08K=ó°Š¢¦Seí¸\0õ9w¤¾éÝRW”—\0\0w¤ƒ=`q•Î‡U\0V°Žå3ÿ\0¦­ Z©¿[\0 òûYõJ¨ˆn»v“!¾¤@Åƒ«§“žÿ\0üi“$\0Šû«QA\0	5ümp\0	\n½‚QÎ`¡?H€8\0\0\0eÀ\n@Ð#öÚ„@\0\0\0\0[y¶þý¦·Ô\0\0\0\0FÕ°Ì•löûTË\0\0„¨¨é‡²þûÕÆÎ·\\,_Ýáº–bùe7	n4“!/»¾EÿÄ\0)\0\0\0\0\0!1A Qa0q‘¡±ÑáðÁñ@ÿÚ\0?Îv-nÜ8^y,;ytøt9vpìlÌ…YKvÏwæÓ¥¼¶×¼bÞô]ø$»‡›Y©ò7¶6gÃÍÜÙ9{Œ±Hß,_2‚‘¦@,,³‘°;³‘“æÓ2ØÄ°&vÌùåä›L‡‘e‰½±‰ä¿\r‹âÐdáMklfu³YÓrUË;Ë‡*\'ìÆFÆ3%õuz·9<üdIUµ—¤YØ2ÔnÛyø»m³¯[\'Í¿kVþ7«ÓÑÿ\0¬V½.ã¿¹\'½ûyúŽx¼v-\0¿	u“dÏ¹Â\r“¾\"À—-ßƒ–„§¨ß’ß¼ãâl´-Œñaâ~`XlauÄ¾c\0Ùà}\\–ùûÎÝ…¬1±êÎ0‹1—³Ç?k®\\ñ—Ÿžzž|ïÁ?³x¿<x¹±îEÂÀ¼Öèë-¢äÑ<1&Ã±ÏK\'O0Ú,úÁÿ\0ØÛHhßŽÉ9t¸ùœL†‡–‰Õïný†ÉÎ?Ó÷#æÈšÛ\"ØÆ›%2+¸ÖHX¶Mƒ¿Õ¼æ?¼/‚g^$ú¢\Zý¤ð¹…þ7OŸ0ì~mc//6ÇŸSpœyceŸ	—±øDÛá°AzYH:XLï˜CùßçøµÃ÷»[®ÿ\0X¾Èóþ#ß\nj¬ãìïíhO,cËí	#æ»2«ôÖd¼ø	ûGÇ‚3Ü¯¨5ÙØóòß—)Ï_–Úþ<D¯ý²Â-I\"]D‰\"à{í×ÇÛö¼9 6)ä‰àv	ÍØ,!ü‚ÿ\0+Ÿ×Þ×Èž~ó^$hwéÍ3oã—qgÁ7Ÿ€vÏŒõ>Ÿ¿›#¾¥HôþÐ’ùxþ}þ–5³{]z×ÇÇ`P˜©êÚáx°ØVA\Z˜‹Ç«ÅvìÕ³UÆWIeÌ¸yðlYù½B¬òë¯Îfc’!¤xÈ®’©ÈÝe8Fšƒìƒ§YOÑbK½ž³Ä;2eÊ‘Óc&3	¶iÈéÏ¨Ù–Íí¿æÌìîÜ’ðù@¯»vÛVêñ92ø8Ò6Vj¼Ø$ñ\"QÉà:oW–¼	PŒ„å	rs@ÀŠ2ÍÖäˆãõl›rðdF\ré<ig><>Lób1L°ê“ð£êwÐÎ;0@r\\»’ï¹0æÏÝÀÎn6 W;(u¡6‰Ù:ö`MÍ¸/û?GKaHEìêéaéd|ºg†6ÔMÙŒ; ïö°W¶a–šyH>á7w½‹ÝåÓÉþœ6ë%vëø•Î¯09\\ŽîC÷–—D~Ý!§e&ŸKÒ ºßì²aiHÉái<lFAt¾$tX8¶ƒÌ¡‚¼~?7G­BÑ%C‚N‡Å¡.À« v÷êm›3¶åç¥—‹Ê ;û¿Å„IkšÐäÇ¹\Zø`-\n(KHäcUä³Ç˜Ÿsñx_·»$ê§ÄdÚð©nqÞþÖëß¨[œËC»ðoÞÜxƒcÎ@ß‡]Á8€örÏ´£ƒ íÈØ~äñ(âG¸NòHSÜ…3¯Þ\"³Š…v¬µ\0åÐƒ#1}ïˆ2bOR):Èüb;Ù‡<X[	’c\nLH€xÿ\0{_\'’ÓÑ¶y §¥£-„Xÿ\0Üðÿ\0Û\0›D¢žJúPõ“¤ÎC¨Z©\ræz#DföþŸëøØOêÄ>É=¤<Ÿ>’Ù¶«HG\rAgÄ?›\nÔÏ³þbôJ8¸ÐmšrF¶ÉÕƒ8•\'>Ò	CaŒ8‹ …Ö4\'_7ß#ûZ¨€&Ìç=ÿ\0/¨wëîÇžÎO‘!7¿Ã=Ì@anùìf\\™Õ,šn0–Wÿ\0 †Ë<Í7{3ÏÆ½q‘†yAÁœ“2=	_Åôˆç.Û>ŸÌ‘¶õËg~bø;Y+nvgŽÚX°÷®Y3yx@6ÀK\\P\nÔ_~ q”&\'E =\'a\\LZ}¬÷ñ±ùøçÐ-¶¾ Xq¸x‡–ü¦Ê°ihœÀ x\\Nòüœ´7írñ\n¯íçÔ(ïó½´!ó\'Sb	XìðüÝ»ò^þ‡ŸIóîñ	á³œŽ}_’üž2l‹\\ƒ0Þ¼ŽÁ»îZfØ€,.=$HÚ:ü†°sèõ³Ãé>}üdiý-mlîÇˆÍÙ\0~Ò-_¤í˜v\"Í²K3ç>œ¼[y¼?¯¿Hk\0#¶_ˆ³.{µõú/É‡›{ÿ\0âÍ˜[ynX\\Ù	õP!‡ïúÂ`µ›aîPÙñ°o,>¶yŽyýd<¼Þ> }ß¤â\0öñZŒ‘,s±ã’æPƒ{oßã>¾\'£Ãà‚>$O¯Äf÷ç¥çãHDŸ.üij|dÍïêN}]Äù#ÒàÏÑ¿ñ»Ël‹R^¾=vÞmÿÄ\0!\0\0\0\0\0! 1AQ0aq@ÿÚ\0?ÿ\0÷Âÿ\0e¶1ñËžXó™sÆí—ÖÙ¶g±÷ÎþYg¸Ûž7ÂçËlÛçË`ñßY¶çû§ËíÀô×{ã,nzv/‡màg›išYã,²ÏCì¾3lÏBç‚Ëç‡¶YeØ$ñ–x7nYn¤ðø«¸@so¿²Ü´|kŽØ0g“°e—þùn¾BÅ±yJÍÃ.¯bMpdYî¬ÜšÆwÉÄƒ³ø^Z~>5²Á±±)ý±ùà³Çäÿ\0<\ZDØÀÄŽ@ÎN˜–Ï|R¬~[‹·1E	±Q‹–ábcÛöcb\"˜ù[à·Æ/È×÷ÆÜqAÀçöŸ¨Ñ’ÐgÏü¾4Œ-¤…Ø`\'ÞD“_3#Ëÿ\0gß<|õÛïžÝñÛ·ÏHÛ§ÒùnÕ•pšÜõÌ¥š¼¹\r«…ö˜[†ÝÓa>p²ýÉ|ïrùáðY|Ÿ—O D„ ¢{ƒn\\´qgì,²49°®ÉÑ,×WÔû!ÿ\0%Ôü.B¿aO]Çnÿ\0,F>‰ÈìY|žÛçFÈ €öF|!§d²M)CË01!Ü¶Ö‹i` ˆ»™ðù?$D=S<|mg|<ðsÏï¯>¾Ä€`\Zc%…u°ØÖ$íÌæÄ[\\·A{±^0RÁæZcæì»=¾\\»òÏïnlì<õcJŒ4BùÞ¶ß–¿ØA¤:å„ÙÀý,±Óž#¹c„`µôõË;n>;àDé*q¸ããáÙkçC¯ÉãnB|Mˆ;îX[õj62ÇP¹©\0âD>Y¿W-ŸÐ“º_ø—ÆÈún÷NøFÎÉ¶%ÌÈSù?|ˆÆe¨p$KµÒG,„¦B¦@ÈZ_˜ü›Ùù\r5å€À¸rÕs °\0gÀŸat„ùbz\r+üœatÄhÆþ£ý¾–þmƒÂSÔôžq\'žBm\0[7rÐ6aÖÑùíöåöÏä9Æ|&Ú|¨\nÍ1ì¹™<D‡åÛ.íËÑhQ»øÉ{²9g³À4`Ä5rÉ Âxhh»KžýrûûeÏþ_;föp÷Á¹à¨oÈ# Ï°‘—!”	¤KCÍ\rÞ;>Ýà“2¨¯[±wRSíÇ¤Äd«Ý/ž	\'ìÁÛ™owÆ	Œ¤Äùaûr\\É9· \"ìˆgìeÄ·âÈl¿aZ±F~ÏôÙ(ÚÅA„@?¤Og°Ž3âã	ñ„Ãùo6ÔêÊbF?²¨NæìeH²^“P²òivi©5cN7_¡‚/»/rZ¾»žœó–IØ²NrÓô¦«ÜB$I¹}bÉ¦döÏØÀ¸{âÙZã5ØÞÌg©!©¥q‡9\ZÄ¾­ÿ\0}7Õ¶ á³à´}°³Ålõ)nµZ|³\\²qù(9a±C/Ï—Ï’¿d§/—ŸÛí®g¦]ô~ÍùvßÒÙ²|—_¶L‡,?öÒƒ‚:ˆßÁðšÌ¾<aGï#ûàk=7.6ã“ã,_–£¶úïöA‡\"Ûâ‘jÔùuöpëi«+§#þìXz.Ûo#[çºÛèöÏaŒšîYþFuó¢áá<m²û%–ø,Ÿõß\rõøk.ÜÌ<3Ï\'Ã&<gdÛçÿ\0\nåõ×ÇÏ_ž›ë³üßd“ù|ÿ\0W’¿–Çc·ìá}ìåòëé‘èòwí¼‹|=5»ù|ÿ\0’þ]ð„‹{ÉûËqò–ç¶=òû7\'þH²gßLÏÛŸÛŸÛCá/žyüðýƒ–rGÆÄx<¯!ä{swËÒzÒìkößñÍ‡-!¶,í—ÿÄ\0)\0\0\0\0!\01AQaq‘¡±ÁÑð áñ0@ÿÚ\0\0?\0œîõß¼ˆÅÛ•Äpã¬ù:?L‘%”Ä&×¯x$²Ä™ãe\0&#SË‡èIà§^óY€–âüâº¨†4ÙèŽp%Ð$^#÷‘íjw5#9\nÜ!ºôŒRÃµ%¸³‚d¤’%Àë¬BÈÁ3Wu‰â†;‹â~ù#ME/ÙcdQW”^5”ÔIeWŸŽòQêdu%~µŒ&ë\"5òýp± €fMåÿ\0Ì5)7µË|sóŽ§hY)¹òW2ÝÈ¡O&\nïã˜œ®\'GÃ›èÙ„#ôÞB!]\0ÃÉë—&\\@ÃÚÍdàEzó,þ2\\ððêIÝc(–«¬[î¹É Ë`{ÞV‘\"ÞÇYnH‡#ÈqÐ¨|ŸÎD…/îýä†HTv”E@–­ìÞ­ÂÉõž9	æ?îABO«ørå;:ÏœÝLŸ\r‘ˆ!Ã=dµ\08#³\\à@Œ%«øŽœ‘³v!ùYˆË$§4\\ò^1(RàëËûÄBD\n„7>+&ÙÀDµv‡^1.C\0›têï(‹	xXûqÞJ11&çç\"Ÿ	qg}KY7¥ÀÝU_X†A§R!@”ñ7ÒIÆ \")G—·œe—!Œù\'(Ð² FÃñ¤‹„ð×ÆJ^g²-æòÛ^v®HŽëx@VhP‚/Q“Ôƒd¦I?ôÜcèbUòMGœ\0ÈH„„\"£‰Ây¨FPÐ4>ø²€…ˆ6ÄÖYo‡‚;Žüa I‰0DQzÉ%]„Ú\Zî˜ºk-\\3¼ˆâ%’QÞÚ¼KÂ«²­·e\nTRb¸b„•´•ç\\àÔÌÈ‰Ð¾rÉI mg~‚Z¢cûÎ¶&²¤Œ(É‰Ö¼`²G™GìÅ\n1OŸx•)HnßŒ\n¢@áWFÁ GÞDUÙ.W©ªã ²\n¹}:Íã[Iø=w€Þe¾žŸx¡Ó[ÈvÐ…Ä:ÂÃ³/dÑøœ`QHú^†2ØÍ‡ÊLFk‘ŒÀ@tÜ•%ñÖJf³I]>cÆÐI™ ÷õË¡‰± ºÈ??|\\¤©ø}>ùÔãXÓŽÉïµÂ¾|¢.µ8\0ÄÂMüÑ6àÕ“cz¿Œ\"PD/•óƒpÆ\"AÕGœ±8€‰Žk¼šÇJ!ÿ\0|áOI¡vCk€)ª‚@Ú±¥ë%& @F`ÆÜ´H¹GX±\r„\\>ñv„“ö¾°Ø‰¤¬E>ÜFK\'7˜x¹&fh×Šûb¤Ú\reZ™ðþ™¨6÷zùõ4³ˆA|a¤6¢>‘HfDx¤˜ïI‰3õ§ŒªYg[÷ç&E*Mÿ\0iNó]†&üBüOœšœb\n©õ“n\0\"—)‡ˆ$¥ËHòÁèÕéwþœ„¿Kš&ß&#	)>ù|.µ‹$¤ŠñÊtgÐîŠú¹já ypm£ŒÝ™D x§7ñYqXÒ<½dd5\rtbÏŸ{ÉBCM÷ó@ù^BYL0HÈ()tÝ¶˜‹\r˜M4§D÷Þ/¸¢^k_œP;v—.¶Ê¢K}ÜD…‰ZøzËQ$„=‘¸<bZàc’5_|%(n\ZÍ\0²‘QÔó…HWŽ~g3$r¬—ÓÄÛá0B\0jcÜ÷ïdÍ‡Ç~q¨/#hûóŒžöžŽ1M \r?aË­¦¥{¿HÔ‘\r}g™WräOœ \0Ò§£ã&X€Ìœñß¬™µIz$÷áz_@ü†* ‚H› çï”¿Rf\n;ÄÆðƒ÷ÅÔ?áÆk*EG’–õÀq.ã\rº!ÈCt5–Ä Q/ç±Ã\ZtÍ)¨èøÁˆZœU,bÖFñÑOÃS’ÁÀó#Ì_;ÅÜò1;WŒcª•7m«²zèÈ•à//ËKdx\'åŒ\nO¹Æ103¡ýâHŠh¿Cþá°‰i‹_^ÅÇ=Lh2á¶‘¶5ñ‰8¤\ZÐÛ{÷œâ\rF£×R/å#+”±/96×šâ¦0½ºûâPT>dÈ€ÚÙòuŒzSqû{N°oD$	±BXƒOÆ6R>ûÂj68œO	ë¬l+A25Z~0Sl†öøÀ„¡dptË8ALÔ&Ev{|a1Ú^|ÑàØ(§$Ù¡ð›ó1Óˆø´EÓkÖ·€Oºß÷ã°G)\")¥ ¾’\Z q•^	•á—ã¶oÓá1XÙÊ(f\'§!ð‰ –”o³£<!São×yU°ãoëƒËüO*?¬È\0…ÚšIÙãÖ>ªu²òc^˜‡ˆÓô8àOÈ”yÂI÷“ÿ\0¸A•($ò¼Q@¡)Ô3]ÿ\0ÜD-+ªûáƒC5<äËXÕ òÄš9‘™Ôªs0u›^!•ÏO¬1N¤Tþñ¥×¹ýdxRoÌä¹• SŒ 	$±Ï¿.þñÑÎúÊ48—hOÆ!œR°ø‹GXÒ“§G\ZÉ,€”2ø\nÇœÈ³Kgš¼±À…ËÑã\"ºâÚþ0R\"K\r!ÛB¯`\rÄràŠP#¢ÍÛËâ1hd3|ÏèÅg\\±–~˜.ì§©ê!­Î/ñäT\noÛ±JHˆ:C½ÜøÈå™²vS—™¤äàRIµåëŒd]ÁÇ„FáOóõÉi·E<ü8€<Ð@-Y‹ÀÄY2öNÿ\0æDÐ*Vý¦J ÑÝ¿ß¦€s4\ZAçë•j·çÑãž(cRo\0àCÃ\r¸“\'t@zÿ\0ÌzvR„ÚýfÏl°”íæM|`˜elTó>¤Œ*’QsqöÂd—»n8ùÂ41º8÷’Bõ³¬{;€D^^u©Îq<Jé»?3“tDqçùÁÈj|˜Šm:T›«øÉ¼ŒwóçY!Œ%\"\"Ëëñ‰\0 -ÂÈvÌë«ÍÃÙ•9N®Â\0M¯ëøÀïXå*R>‰ñÏeO1lªv¼Ÿ|ròŠåÌ˜v%Ì´¥gæOKâpAª–Cä¤RzÄ*\0\0\"á;Á#Š,Bk*þ¿¬¥#%-	O£\\àåd‚Ø»_ÁÎ6h FÑ1ç¸0‘~ó-{ó“7ïÑñâ	(Øß„™$¼‘ÄùÀ¬CcT†§œË|Ï…™YLm	ˆëúÞD:E¡íÜãZm‘¢Mñœ…*AÜ=b‹lS9>+žLy˜Ä‚$Ù7nµç\0‹$ÂØŒp~ºáÃb\0@c‰Ê Š2<’œãSáD³†DË³dH×“x§FˆÅÜ¤¬)6=Ã÷Ä6NÒV|¼åKÒŠÙ\ZêYlJƒ©wã*ÒÍ‰Zƒ¸ÖCÂL¼!úk»ÃA¼xà:õ¼4’Ùö×œ¬ìµ¼Æ£\0¨D£¦xŽ\'Æ9F1\"%ÊNÿ\0XWy#QûÊÕ\Z¼Øˆ÷zÕd¯£Zùã5÷$‘ÿ\0CÎ—\r#Øì|˜Ò\rF@	õOJ/t~Eç\Zyì‚°Â•øâ0žã	VH`Ð¦åíãƒC7¶£B›/xÂ‘Jhí„Fs#6/\\G+‘Ðh×——\"ˆ©=d:ydÔbÙrÂÇ±§“ã&i\ZˆF‹eˆóx†ù °4·É!ÆER\0ìP·¼\ZÕ9äü²ÿ\0ˆ8I*ÉèŽ^rUSvIè£Ë„¤¹TUw	Nð+*6Oó! Ö)\nPà…ÄÚQ-¿4b®š¤xŒa\nKOY&‚£)0-»Ño	\0bÔ»\\ºôxÈØ¾/˜ÊÅ„íëºÖ#w’·ýÖHÈJ£o¼œJà:|cˆPD8ª™. öO/æ1ƒ7¬‰RåÇYR‰;WÃ¹Ã­ÑCi‰ªï&E´Â#ý?Ð0\nR`Y\Z±ð—=vzÎ\0ŽyùÅš¡yŒ£:\0qÕåŽY4A9¸ãÄûŒb	Išƒ‡¥\0‰:m\\œÁ(õxŽqq*»›—Aç¥×<<üI•ë-º>’yÀ@‰A`ëÏŒ5Â‡t‰_Ÿðà\"„rˆD{××â‘’„BÔ’*ßˆÈAWáÅÚ™é,<	yªÄ&C–´šŸ82Fž!aðæ&÷Šm’	ÇýÃ¹f\r:Â»˜S.ÊÎXPa\'DgVô\"$ð¾±$L»ëÃ.Fäåœ 4“Ì~1€tœY(fy³kcÄÒÚÐ¦‡ƒ½ÆNÌ±È¯¦!exÈEF§×é†ìž¬Ì–¬ý?ÔBmdÈI¶\ZžÏÖm‰/x-ûÁºçŠàË€d–\0pÔg¬t\0–$ äðqç	#E· çí‡Šª2xáÅÁôœz‹áç#PŠ3S:}obI	‚×.£Šã-îXúÛíÁöÁ0ƒãÓðï&(bV*<çž5‡(59&Aäž0ŽÞ·Ïë\Z@­ië&š#6Œ½Á®lÀ“ÿ\0»ë\0z`‡PŽ¾Põ´¨çþã†d‡IÜÇ~ðpV_ë·÷”š€ÇGiÞ&R]i©ñ¹¤Úêçxv:©¢ù¾O\\‚ÂXÐèíç&QÒ$í¯Ã6à\n\0)ž°¦6Høž|ä-a°4¯%ïŠH’?êå•±-öd\Zê&`~žõfCh©Ê]+Ù³ÑnçHPxŸ¾G\03Ü«€s%Žnç¼J²jc ß³$(†Y™ò?¼ö_R8||™t§iï\Z¡ì„DÌè;èÊ}(®`{ÿ\04ÈàT1™}\"ï±$‚;7ÿ\0qZÔ‰*jaŸišÐ¬Nô[\ZÑ€%ê[Ÿœ•g„î9a0àp~ˆŒ…Vµ\'âY¾ €Ó1çŸ8ð&ÈQù^ñð©<Î-Ty÷³ÖN‰lðG=â„÷Ìz	¼X¦ Kpó8TL$ÁcM.)4µ„ñ÷È`¦›LnyŸ¶H*Au×É²j;³Æ ˆéÃÅa‹F>Véÿ\0UÂ	D¸7ë„ë”HØÚäìœ•¯Ž3–ÙÉLL\Z\'[&Q\nt‘îrBQM:}wë}dÈaááÈÐŒŸ[>L€¹¿óÏ‡ Ìº¤zœCû‘Lüoü·ÝL×ð˜mBlð|äÅŽt²õÌwŒ ’ƒCäú2)HjÅ-ƒÎ& @\0G±{ã*<’Z!tA\'z¬\r¥„4ž^²x„©)›ž˜óœ\"M&doÜcë¥;‘×OžrøÃÒèóïZÉúóŽBI ãÖM,h–ßXTc+Í\Zÿ\0žprR`™©þÖ©2÷Áð‡‹ßÛucgÐøÄX°‰…xŒUC03ñF;l;¢?Ú!âî6ØÅ~1y–^•óZ0ºM.|dÁm*ì:÷›¥mˆNÇ½d¢h%ß‡Ï<ã¯‡ðxiáËqAz^|Ž6c(êëòNäIm“÷ÿ\0–øÉâ€\"‰ê²LI‰˜íÝë$¤€Ý±ÃÛoÑ™t¼¾\\™!×¿^ga*Rúxó“DÊ0¥MÛüâJ›y˜øÄ‘$‰½|¦2>\0ìNÁúà¡I‘XÀ€Yžflç{66Ì4˜–*š³Á»ÿ\0ÌM2C;H÷x$ê”Ät™õ3ž**1bgç8‡ï`•ïÎ	Ži&Ó¨˜KçX|t!-Kƒ½b\\f0ãÆP£¯õq’»@\nlJÈyšÁèŸJ|\r	§—Œh¨Š¯:)_l]X™1©«ëœÔ¦†‰‡Ä<ÖKOãÉªEüúr[B\n´†þvy3ZCË·‰MžŽ¤³‘­_ù0%Th3—j#‘Q0*p¬¾\0o\rFÐKPø8Às‘Ð=<â±V5>O80ú$DO‹ï £Á	ßÓç‚%c’%ú¼z2äŒ &DúÌyŒj0D< ñxßð²±)eæpd¦;J£Gd–yÉÚHÀ9G)ñŠèBÑIËÙ7\\Æ*²úä<n‡8‘¿&]ÒQIPˆu%¾hÀš‚”rÁ½}±\Z”µ‹³â>ØÙj´¤\Z_˜ôbÉÒTîð\0h?ØÒJÅ`˜d…øÀe%x¨ûo6”Q {…¯ŠË YEº‡oÓŒÓlüøëjD_(X|˜Œá°óqG¾k!(\0FÇ¼™4Y<¼\Zða<…µjÂ®®Ö±„‰2\'CÎœrpOgˆ˜óñŒ°A2«fC“¼MÐU)òp?œ†7Bpÿ\0ˆí3$ýšçƒÞYDxe*€z\Z_¶DB‚Â0ÉÖäŸÚÅ6í\n¥ÜiÂÎG{Ÿxª™©SH€ãþáp5ÎÍ¾›¿£¤I‹ã8”ÖõÜçz2Ü‰u<š\'dÕ?0:¾¦rf QÁãë€ò½j4¤àóÎú·\r‡,þ²HÒfÑ¤ù‡\rWûACa%t!/Æ7À~?ÎÝ\0Eç@EP*fßU9/Ð\ZÔÓë&%µ.Šyuóh›2üŸ\nž,”\\—+U”@GÉÇ§\n>žcˆì³Œ%‚†4ã{LÓ‡O\'×`á\nL`IÑŸ8hv<?8Ä:›\rI×qÇš^ö8™(÷ÙïW,É´´…ŠñÖ)•”#Èâ°CÊPwØäŸEÅG¿Ç×\0ÀÀÖè\\\0Ð¶Y\rüå™\n„%ˆß÷¼¬\"Â%úeúâå®Y?ƒ°0‰5:Á,„À#ªÃŒÀ@Pâ#Ÿ\\b¼ 7ÉúÁŽ9Ètðž²RŠ@¤?ÇxP‘ bKaÓéèÂGÖœ®“‡ýd¼ÉÐmÇ°h§˜áïÚ\"ƒæ)déÖ>RÁ\'94.„#åˆò˜ÞDQ[0Ó\r<Î_Ô³Ä8½6Üu‡N–‡wã Òah/¨ý_\"C$ã³¼‰œÐÕ<8|íàäÆý8d\nÆYÈ íSõÃÓ2ìy>HÊ0H“ÓüâØ”„’lÈF‘€ ó€U‘`äbËH”ìbÿ\0:Ë ¸QÑ€%\"O^SŒª5”šWù’ e#SàþñA;\"èýáW¹d±´?Ÿ‡HA-ÁŽ¼U&;SÐ>–u–§EFãïÉÂ¤4£¿QãGï\n	\r#\náÆUIªr¼þ­ÅI‡ÒpÑþŠ,É\"E”cRÁ80D ƒQÌ<xÃIRm‰5®õŽ\Zg\".9‹øÅèåË_\\ýò˜§ÀíÂDÙÔãÊ™5€í3½=˜6H.g¾p\"b¦AÍ÷XÇ€AVœ0ö\"Ï§xhKÃ9A0Å¯me‹¨ŒU–\\£±¹Ö$ØdGy$\0ØÕ»ñy(™Œ Ùë‰æpGKx=ó…DÒk\0¤³ìÊ![yGXÐë2\"Öñ§ÊÒ*F¾þò_iÈ¯$~0Ø°„Ëµ§o8a\'ˆB Úþ2„Œ\"@¤Š|iŒ„!£¦G˜qŠ.‡@yEá	%µ.òÿ\0•»×-kFï¯–þ˜5þ‚ÔÄÓV§ËÆ\" C°á`êÜRHA	ð÷ƒ¤\n¼‚bN²Y©*Šc…ã èßk…neW÷ŒˆÛšÂÙèä¡;ND\"E#¢›*cÆDÄ‚eI`GãÞ\0˜HFÔ•›=‘…ÉIGWsõBçtèÉrÚ*±¹F _Y,`è±€\0ˆ‚\"1Ùo)ÓVawx.Ï>r¦AÍçûÖ4¨’Å9BýÎ²Ä¥ðÿ\0ÌšôŒœÏãõ\0d”Û¼ŠQ»ØŸÎEfä/cÞp\0¸€ÉhÁ¸=hÉ¨Eìç)ÈÑµzzÿ\0¸ËUÁÂ¹ÉYAXè¯5¹a—¢úÇ%šBŸ‚a~ªÏù£*\'@ù`Æ@˜ÚÄí=¿œ“x@Š“çœD›PDã©í\'dì*XC«îîñm\n-a\0ê\\_x§ ?¼¡¸êqMÞ\"N\nÁ$ç9 ‹9Ÿ²¢Ë“P|\Z·j0^·)ü>01*h%á;0GR‘é!ßpÔIÖh¢3Ís._á\'T.\'ÅVvÁD½¬ßs€4ÃrœfØ´F§¿ïy054Ññœö­²\'ÆEŠ„ÿ\0.7-`È[˜‹ôà$é\'®_ŒîŽ#ËË$ic‰˜ØÃg8+JËh† éw7äYe’ÚŸÝd n™Ó¶\0aôº=ó“\0®=’9…½;\'P}Æ7’½òÄìx>øàp\0Ò¾+äë*Y¨LÃ\'<ÉÖE²Ð7àì÷ã IÂbQH¹bÊæ¸Änc³ð`%×YÃ¹½F$I3\n­Á‹•^ž9¼\0AJc^±Áƒ–ý¿Îl€W |…ÇŽX/£~·÷Å\\&ÌöËÃMgSÀY¶n—š,Ê_8c_å	†ŽÄ“,Z>˜Sâ\0™%Â¥ûÃ«¥•#í¿\\dH$	’:5—ÃÚ‘ìY5M» ïÒqÞ5%Ò|9e¢i<}qcR2±>ñ;JWäÒ|˜&:\'ß%ÁêwßkËç#5þ^)åtmðd»³•Y~5d½\05íÒ_³¶\Z#ž4ºÃ	²ôÖ¼aŽ„Wl²ìž2  ƒ{pO\'?9\ZDš:<f‰H_;É‘Nüd	´8¯¾ ûä–&É\0ÒœOž²Òš=ð:ô¸%Kòâ÷<š	©Üd\\V…âøñ†—ÈT½–èÀ³í©EHáìïãÿ\0Œó„`\ZÊ¨údJi?œ•mØÃõÉ°7i˜þp\"¤\0ê?ÂÁÏŒ!š½±—ø–±ö\"€±V/,kX6þHÍ¨£ÇQãËdB“Së!MÜ/;ÜÏì1‚>\0!	¾äëÞ#9GÖ\0+Y,ÕOWñQxÜÞ²<5ýÞA” ¼Îñì)àÖ\0aÕÇëTÀÁþ8É¼145ãw‘•˜¥ÏÇÆS/-:%=nüãìD<Éýpût\rÄscõ×&LÉ²yûd?üÜJbÎŒGúB»e?#Ñçé9C&KAà¬8®ü>ñÏ65_ÙÉ‹6	&V*\\\\3‘d\Z™M\"½ï²¥Š¬‚ñ·g\rñ“‹(‡zf:|ûŒ–Àˆ¥¼’s9LIœ¡B÷¡bÒ•Î	“}¾ñ»VÀÇüâ\"¥ \'Œha& Æà) ¿1“UE¥×OP?|¦ÙIPÁsã˜fÆ•/“Žç±\0h»Täó›{F$:#Ù.É1ÌËÛ§ù)ÿ\0ðh‘€<¸Q‚©Ó|Ÿ—èä\Zï\\+©7ý2gL¡&û‰±’CuÁ¯ã\0Çtü~²š5›ÄhCë?!;0×~1!PY> úfNŒ£[˜¤ðn[Cÿ\0{ÅÒK«Ê¶Ó¹Èí‘oÑÞùÂ7zþ™H%9-^£ç$T\"ÛÖK\nm†…èêq\'ŒšAAÄñ„SoPÑ}ßã$~éh&ÆùzÖ,„co\"CõËp(v<yÂ¸¨€\'‘=p\0F*tœ<8 š2\\ë€AOþŠÖS/]ŸÛ’ð>Éoå [/sÜ×XÂ\rÐîøb°³Z²IÛÞý®<CVÌXù3EK³¡Gm<ìHÃQÀ\Z“G†ÙáÊ‹C×üÉoj?=cH¤©bMÂOàó”âêPÎø?Œš$<ãJnO®NÉ^?ó*êuî\rà‰’6Å”–*rCøã*à×oƒ÷‘8t<ìÊœñš(‚?ìYçú};Ÿ:ÁËÙ8CN™Ö\"@t%qäw¬“\"‰(KÑ÷È_qˆ9GÄ8€ä€\"°mŠ®0\0½âßÕ#po	`sy‚‡˜Ï)®oüÿ\0â›:›x>þ2cY!ÀéžþkÆ9Õ`œCó“å2)Èr¾:Ë$mÁ2šQ¢9»ÅÁIaÉyâèp//œU¢óF¤?ä¥\ZfŠì—˜yÈëª5£ž[ÓY2Vb~Ž¼d\00ÒlÎ¼wó ‚Å$jÉÀ…L‡ÆüF\"c’¯¤=ûÊ”a|äìj@¯-àÑK“ÚÛüàP:»gûÎ6&Óu,=G&;Ñ öQµ|w” DKß\0Zñ–4ì}Lm·(£DL÷÷Æ¦•1nÚþ/tÕaGÐA¿x’ð\nI¥ëÆJ$½ÆÙýa¹rP•6Nxó€i&†ï,“úÀ)âM–oçì˜p)¤ú$óÎ0Òzÿ\0€ÂÑôÞ:à8gÂbq/õkÙàCó6 ðXù­&làëß>wƒ…©©mûõ€&ö¡üþq$¤‰ÝŸÞñ‘\Z‘ïGóˆƒ¦b.øðàd¿Ì+ÅcM‚$Åñ×ç\"±-y£\n3êåfFz©ú™HSÙtÍœ¦¤ÆP%iM9Ÿ¥=c•Aì.…å&r\0©K¡©ßÎC)~0S\r:W_kÖIW(Aº·Æh „&UÊþr¥ÝRãq8£ì¸kÑç\'FC‘Ùãåû`+N&à¯Y6	\0Ä¶ÏFx¡(rÏùÊ-,¬\ZërM‡‘ø×s†å§@Zî~0$ÕÙw}qš†x‚ƒ™f×í‰Lpñ†‰ )b‡ï—’èŠùÿ\0˜2É	xñY2€¨5²15*I0OCïï$Ãd]õ˜‹7yY‹1wd3F«#Ý&Ëìü›<âÝ‰íÉîÈ0’kzÄJ[˜¼…5?Ÿ20¸kòbBÀð‹È\0X\"PíïùÇÙÄUv³ê1†B0Ÿ1Â=ùÉ$ˆ­#èüïŽæô…jBjß²>ø‘]Cî~d¦À\Zîw×>ò ÔÑëþø3ÿÙ','image/jpeg',3,NULL,NULL,NULL);
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
