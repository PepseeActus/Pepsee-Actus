-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: local
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_gc_comment_pairing`
--

DROP TABLE IF EXISTS `wp_gc_comment_pairing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_gc_comment_pairing` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `wp_comment_id` mediumint(9) NOT NULL,
  `gc_comment_id` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_gc_comment_pairing`
--

LOCK TABLES `wp_gc_comment_pairing` WRITE;
/*!40000 ALTER TABLE `wp_gc_comment_pairing` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_gc_comment_pairing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_imagify_files`
--

DROP TABLE IF EXISTS `wp_imagify_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_imagify_files` (
  `file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `file_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `modified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `width` smallint(2) unsigned NOT NULL DEFAULT '0',
  `height` smallint(2) unsigned NOT NULL DEFAULT '0',
  `original_size` int(4) unsigned NOT NULL DEFAULT '0',
  `optimized_size` int(4) unsigned DEFAULT NULL,
  `percent` smallint(2) unsigned DEFAULT NULL,
  `optimization_level` tinyint(1) unsigned DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `error` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `path` (`path`),
  KEY `folder_id` (`folder_id`),
  KEY `optimization_level` (`optimization_level`),
  KEY `status` (`status`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_imagify_files`
--

LOCK TABLES `wp_imagify_files` WRITE;
/*!40000 ALTER TABLE `wp_imagify_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_imagify_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_imagify_folders`
--

DROP TABLE IF EXISTS `wp_imagify_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_imagify_folders` (
  `folder_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`folder_id`),
  UNIQUE KEY `path` (`path`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_imagify_folders`
--

LOCK TABLES `wp_imagify_folders` WRITE;
/*!40000 ALTER TABLE `wp_imagify_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_imagify_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=4258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://pepseeactusv3.local','yes');
INSERT INTO `wp_options` VALUES (2,'home','http://pepseeactusv3.local','yes');
INSERT INTO `wp_options` VALUES (3,'blogname','PepseeActus','yes');
INSERT INTO `wp_options` VALUES (4,'blogdescription','Toute l&#039;actualité Dancehall des french west-indies','yes');
INSERT INTO `wp_options` VALUES (5,'users_can_register','0','yes');
INSERT INTO `wp_options` VALUES (6,'admin_email','christophe.sbastien@gmail.com','yes');
INSERT INTO `wp_options` VALUES (7,'start_of_week','1','yes');
INSERT INTO `wp_options` VALUES (8,'use_balanceTags','0','yes');
INSERT INTO `wp_options` VALUES (9,'use_smilies','1','yes');
INSERT INTO `wp_options` VALUES (10,'require_name_email','1','yes');
INSERT INTO `wp_options` VALUES (11,'comments_notify','1','yes');
INSERT INTO `wp_options` VALUES (12,'posts_per_rss','10','yes');
INSERT INTO `wp_options` VALUES (13,'rss_use_excerpt','1','yes');
INSERT INTO `wp_options` VALUES (14,'mailserver_url','mail.example.com','yes');
INSERT INTO `wp_options` VALUES (15,'mailserver_login','login@example.com','yes');
INSERT INTO `wp_options` VALUES (16,'mailserver_pass','password','yes');
INSERT INTO `wp_options` VALUES (17,'mailserver_port','110','yes');
INSERT INTO `wp_options` VALUES (18,'default_category','5','yes');
INSERT INTO `wp_options` VALUES (19,'default_comment_status','open','yes');
INSERT INTO `wp_options` VALUES (20,'default_ping_status','open','yes');
INSERT INTO `wp_options` VALUES (21,'default_pingback_flag','1','yes');
INSERT INTO `wp_options` VALUES (22,'posts_per_page','4','yes');
INSERT INTO `wp_options` VALUES (23,'date_format','j F Y','yes');
INSERT INTO `wp_options` VALUES (24,'time_format','H:i','yes');
INSERT INTO `wp_options` VALUES (25,'links_updated_date_format','F j, Y g:i a','yes');
INSERT INTO `wp_options` VALUES (26,'comment_moderation','','yes');
INSERT INTO `wp_options` VALUES (27,'moderation_notify','1','yes');
INSERT INTO `wp_options` VALUES (28,'permalink_structure','/%postname%/','yes');
INSERT INTO `wp_options` VALUES (30,'hack_file','0','yes');
INSERT INTO `wp_options` VALUES (31,'blog_charset','UTF-8','yes');
INSERT INTO `wp_options` VALUES (32,'moderation_keys','','no');
INSERT INTO `wp_options` VALUES (33,'active_plugins','a:8:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:1;s:43:\"featured-video-plus/featured-video-plus.php\";i:2;s:44:\"graphcomment-comment-system/graphcomment.php\";i:3;s:61:\"image-regenerate-select-crop/image-regenerate-select-crop.php\";i:4;s:19:\"imagify/imagify.php\";i:5;s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";i:6;s:24:\"wordpress-seo/wp-seo.php\";i:7;s:29:\"wp-postviews/wp-postviews.php\";}','yes');
INSERT INTO `wp_options` VALUES (34,'category_base','','yes');
INSERT INTO `wp_options` VALUES (35,'ping_sites','http://rpc.pingomatic.com/\nhttp://api.feedster.com/ping\nhttp://api.feedster.com/ping.php\nhttp://api.moreover.com/ping\nhttp://api.moreover.com/RPC2\nhttp://api.my.yahoo.com/RPC2\nhttp://api.my.yahoo.com/rss/ping\nhttp://bblog.com/ping.php\nhttp://bitacoras.net/ping\nhttp://blo.gs/ping.php\nhttp://blog.goo.ne.jp/XMLRPC\nhttp://blogdb.jp/xmlrpc\nhttp://blogmatcher.com/u.php\nhttp://blogsearch.google.com/ping/RPC2\nhttp://blogsearch.google.fr/ping/RPC2\nhttp://blogupdate.org/ping/\nhttp://bulkfeeds.net/rpc\nhttp://coreblog.org/ping/\nhttp://geourl.org/ping\nhttp://ipings.com\nhttp://mod-pubsub.org/kn_apps/blogchatt\nhttp://ping.amagle.com/\nhttp://ping.bitacoras.com\nhttp://ping.blo.gs/\nhttp://ping.blogg.de/\nhttp://ping.bloggers.jp/rpc/\nhttp://ping.blogmura.jp/rpc/\nhttp://ping.cocolog-nifty.com/xmlrpc\nhttp://ping.exblog.jp/xmlrpc\nhttp://ping.feedburner.com\nhttp://ping.myblog.jp\nhttp://ping.rootblog.com/rpc.php\nhttp://ping.syndic8.com/xmlrpc.php\nhttp://ping.weblogalot.com/rpc.php\nhttp://ping.weblogs.se/\nhttp://pinger.blogflux.com/rpc/\nhttp://pingqueue.com/rpc/\nhttp://rcs.datashed.net/RPC2/\nhttp://rpc.blogbuzzmachine.com/RPC2\nhttp://rpc.blogrolling.com/pinger/\nhttp://rpc.britblog.com/\nhttp://rpc.icerocket.com:10080/\nhttp://rpc.newsgator.com/\nhttp://rpc.pingomatic.com/\nhttp://rpc.tailrank.com/feedburner/RPC2\nhttp://rpc.technorati.com/rpc/ping\nhttp://rpc.twingly.com\nhttp://rpc.weblogs.com/RPC2\nhttp://rpc.wpkeys.com/\nhttp://services.newsgator.com/ngws/xmlrpcping.aspx\nhttp://signup.alerts.msn.com/alerts-PREP/submitPingExtended.doz\nhttp://topicexchange.com/RPC2\nhttp://trackback.bakeinu.jp/bakeping.php\nhttp://workbench.cadenhead.org/weblog-pinger/\nhttp://www.a2b.cc/setloc/bp.a2b\nhttp://www.bitacoles.net/ping.php\nhttp://www.blogdigger.com/RPC2\nhttp://www.blogoole.com/ping/\nhttp://www.blogoon.net/ping/\nhttp://www.blogpeople.net/servlet/weblogUpdates\nhttp://www.blogroots.com/tb_populi.blog?id=1\nhttp://www.blogshares.com/rpc.php\nhttp://www.blogsnow.com/ping\nhttp://www.blogstreet.com/xrbin/xmlrpc.cgi\nhttp://www.feedsubmitter.com\nhttp://www.holycowdude.com/rpc/ping/\nhttp://www.imblogs.net/ping/\nhttp://www.lasermemory.com/lsrpc/\nhttp://www.mod-pubsub.org/kn_apps/blogchatter/ping.php\nhttp://www.newsisfree.com/RPCCloud\nhttp://www.newsisfree.com/xmlrpctest.php\nhttp://www.pingerati.net\nhttp://www.pingmyblog.com\nhttp://www.popdex.com/addsite.php\nhttp://www.snipsnap.org/RPC2\nhttp://www.weblogalot.com/ping\nhttp://www.weblogues.com/RPC/\nhttp://xmlrpc.blogg.de\nhttp://xping.pubsub.com/ping\nhttps://phobos.apple.com/WebObjects/MZFinance.woa/wa/pingPodcast','yes');
INSERT INTO `wp_options` VALUES (36,'comment_max_links','2','yes');
INSERT INTO `wp_options` VALUES (37,'gmt_offset','','yes');
INSERT INTO `wp_options` VALUES (38,'default_email_category','1','yes');
INSERT INTO `wp_options` VALUES (39,'recently_edited','a:4:{i:0;s:132:\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/plugins/acf-content-analysis-for-yoast-seo/yoast-acf-analysis.php\";i:1;s:51:\"/app/public/wp-content/themes/pepseeactus/style.css\";i:2;s:47:\"/app/public/wp-content/themes/magneto/style.css\";i:3;s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (40,'template','pepseeactus','yes');
INSERT INTO `wp_options` VALUES (41,'stylesheet','pepseeactus','yes');
INSERT INTO `wp_options` VALUES (44,'comment_registration','','yes');
INSERT INTO `wp_options` VALUES (45,'html_type','text/html','yes');
INSERT INTO `wp_options` VALUES (46,'use_trackback','0','yes');
INSERT INTO `wp_options` VALUES (47,'default_role','subscriber','yes');
INSERT INTO `wp_options` VALUES (48,'db_version','48748','yes');
INSERT INTO `wp_options` VALUES (49,'uploads_use_yearmonth_folders','1','yes');
INSERT INTO `wp_options` VALUES (50,'upload_path','','yes');
INSERT INTO `wp_options` VALUES (51,'blog_public','0','yes');
INSERT INTO `wp_options` VALUES (52,'default_link_category','0','yes');
INSERT INTO `wp_options` VALUES (53,'show_on_front','page','yes');
INSERT INTO `wp_options` VALUES (54,'tag_base','','yes');
INSERT INTO `wp_options` VALUES (55,'show_avatars','1','yes');
INSERT INTO `wp_options` VALUES (56,'avatar_rating','G','yes');
INSERT INTO `wp_options` VALUES (57,'upload_url_path','','yes');
INSERT INTO `wp_options` VALUES (58,'thumbnail_size_w','150','yes');
INSERT INTO `wp_options` VALUES (59,'thumbnail_size_h','150','yes');
INSERT INTO `wp_options` VALUES (60,'thumbnail_crop','1','yes');
INSERT INTO `wp_options` VALUES (61,'medium_size_w','300','yes');
INSERT INTO `wp_options` VALUES (62,'medium_size_h','300','yes');
INSERT INTO `wp_options` VALUES (63,'avatar_default','mystery','yes');
INSERT INTO `wp_options` VALUES (64,'large_size_w','1024','yes');
INSERT INTO `wp_options` VALUES (65,'large_size_h','1024','yes');
INSERT INTO `wp_options` VALUES (66,'image_default_link_type','','yes');
INSERT INTO `wp_options` VALUES (67,'image_default_size','','yes');
INSERT INTO `wp_options` VALUES (68,'image_default_align','','yes');
INSERT INTO `wp_options` VALUES (69,'close_comments_for_old_posts','','yes');
INSERT INTO `wp_options` VALUES (70,'close_comments_days_old','14','yes');
INSERT INTO `wp_options` VALUES (71,'thread_comments','','yes');
INSERT INTO `wp_options` VALUES (72,'thread_comments_depth','5','yes');
INSERT INTO `wp_options` VALUES (73,'page_comments','','yes');
INSERT INTO `wp_options` VALUES (74,'comments_per_page','50','yes');
INSERT INTO `wp_options` VALUES (75,'default_comments_page','newest','yes');
INSERT INTO `wp_options` VALUES (76,'comment_order','asc','yes');
INSERT INTO `wp_options` VALUES (77,'sticky_posts','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (78,'widget_categories','a:3:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}i:3;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (79,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (80,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (81,'uninstall_plugins','a:3:{s:30:\"acf-quickedit-fields/index.php\";a:2:{i:0;s:24:\"ACFQuickEdit\\Core\\Plugin\";i:1;s:9:\"uninstall\";}s:49:\"advanced-database-cleaner/advanced-db-cleaner.php\";a:2:{i:0;s:24:\"ADBC_Advanced_DB_Cleaner\";i:1;s:14:\"aDBc_uninstall\";}s:27:\"wp-super-cache/wp-cache.php\";s:22:\"wpsupercache_uninstall\";}','no');
INSERT INTO `wp_options` VALUES (82,'timezone_string','Europe/Paris','yes');
INSERT INTO `wp_options` VALUES (83,'page_for_posts','96','yes');
INSERT INTO `wp_options` VALUES (84,'page_on_front','53','yes');
INSERT INTO `wp_options` VALUES (85,'default_post_format','0','yes');
INSERT INTO `wp_options` VALUES (86,'link_manager_enabled','0','yes');
INSERT INTO `wp_options` VALUES (87,'finished_splitting_shared_terms','1','yes');
INSERT INTO `wp_options` VALUES (88,'site_icon','253','yes');
INSERT INTO `wp_options` VALUES (89,'medium_large_size_w','768','yes');
INSERT INTO `wp_options` VALUES (90,'medium_large_size_h','0','yes');
INSERT INTO `wp_options` VALUES (91,'wp_page_for_privacy_policy','3','yes');
INSERT INTO `wp_options` VALUES (92,'show_comments_cookies_opt_in','','yes');
INSERT INTO `wp_options` VALUES (93,'initial_db_version','38590','yes');
INSERT INTO `wp_options` VALUES (94,'wp_user_roles','a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:20:\"wpseo_manage_options\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:35:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:13:\"wpseo_manager\";a:2:{s:4:\"name\";s:11:\"SEO Manager\";s:12:\"capabilities\";a:38:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;s:20:\"wpseo_manage_options\";b:1;s:23:\"view_site_health_checks\";b:1;}}s:12:\"wpseo_editor\";a:2:{s:4:\"name\";s:10:\"SEO Editor\";s:12:\"capabilities\";a:36:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;}}}','yes');
INSERT INTO `wp_options` VALUES (95,'fresh_site','0','yes');
INSERT INTO `wp_options` VALUES (96,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (97,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (98,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (99,'widget_archives','a:3:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}i:3;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (100,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (101,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-1\";a:2:{i:0;s:10:\"archives-3\";i:1;s:12:\"categories-3\";}s:13:\"array_version\";i:3;}','yes');
INSERT INTO `wp_options` VALUES (102,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (103,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (104,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (105,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (106,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (107,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (108,'nonce_key','RsLq)@35VKMvt1%dGLqb:!#~:Oj,cEbk{0~V]54BLZg)rAjPl=n{bz me@#Q5`-k','no');
INSERT INTO `wp_options` VALUES (109,'nonce_salt',' N=UOB=o9`S%e;wltJPN )_^jCe?jp$g _zM5.j!G{+h,xC)mEbQiB;yu9v/t7`w','no');
INSERT INTO `wp_options` VALUES (110,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (111,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (112,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (113,'cron','a:13:{i:1600809442;a:1:{s:33:\"graphcomment_cron_task_fetch_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:2:\"1h\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1600810810;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1600813905;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600814355;a:3:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1600822800;a:1:{s:18:\"imagify_sync_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600830000;a:1:{s:46:\"imagify_update_library_size_calculations_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1600866081;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600869600;a:1:{s:20:\"imagify_rating_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600883754;a:1:{s:19:\"wpseo-reindex-links\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600889960;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600899977;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1601410774;a:1:{s:16:\"wpseo_ryte_fetch\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','yes');
INSERT INTO `wp_options` VALUES (114,'theme_mods_twentyseventeen','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1541682221;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes');
INSERT INTO `wp_options` VALUES (144,'current_theme','PepseeActus','yes');
INSERT INTO `wp_options` VALUES (145,'theme_mods_pepseeactus-theme','a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1563126568;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}s:18:\"custom_css_post_id\";i:-1;}','yes');
INSERT INTO `wp_options` VALUES (146,'theme_switched','','yes');
INSERT INTO `wp_options` VALUES (151,'theme_mods_twentyfifteen','a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:2;}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1563303975;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-1\";a:0:{}}}}','yes');
INSERT INTO `wp_options` VALUES (152,'_transient_twentyfifteen_categories','1','yes');
INSERT INTO `wp_options` VALUES (222,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (275,'recently_activated','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (276,'acf_version','5.9.0','yes');
INSERT INTO `wp_options` VALUES (381,'mic_make2x','true','yes');
INSERT INTO `wp_options` VALUES (401,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:29:\"christophe.sbastien@gmail.com\";s:7:\"version\";s:6:\"4.9.10\";s:9:\"timestamp\";i:1557240278;}','no');
INSERT INTO `wp_options` VALUES (580,'theme_mods_magneto','a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:9:\"main-menu\";i:2;s:11:\"menu-footer\";i:3;}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1562788066;s:4:\"data\";a:6:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:12:\"home_sidebar\";a:0:{}s:16:\"footer_sidebar_1\";a:0:{}s:16:\"footer_sidebar_2\";a:0:{}s:16:\"footer_sidebar_3\";a:0:{}s:16:\"footer_fullwidth\";a:0:{}}}}','yes');
INSERT INTO `wp_options` VALUES (581,'widget_bk_latest_posts','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (582,'widget_bk_most_commented','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (583,'widget_bk_latest_review','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (584,'widget_bk_top_review','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (585,'widget_bk_social_counter','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (586,'widget_magneto_social_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (587,'widget_bk_latest_comments','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (588,'widget_bk-twitter','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (589,'widget_bk_flickr','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (590,'widget_bk_slider','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (591,'widget_bk_facebook','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (592,'widget_bk_googlebadge','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (593,'widget_widget-ads','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (594,'widget_bk_shortcode_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (600,'recovery_keys','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (601,'db_upgraded','','yes');
INSERT INTO `wp_options` VALUES (606,'widget_loginwithajaxwidget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (612,'r_notice_data','{\"type\":\"redux-message\",\"title\":\"<strong>Redux v4 Beta:  We Need Your Help!<\\/strong><br\\/>\\r\\n\\r\\n\",\"message\":\"The long in-development Redux v4 Beta is nearing completion and we could really use your help!  To learn how to do so, please read our latest blog post: <a href=\\\"https:\\/\\/reduxframework.com\\/2018\\/11\\/redux-4-0-we-need-your-help\\/\\\">Redux 4.0 - We Need Your Help!<\\/a>\",\"color\":\"rgba(0,162,227,1)\"}\n','yes');
INSERT INTO `wp_options` VALUES (613,'redux_blast','1562787688','yes');
INSERT INTO `wp_options` VALUES (614,'redux_version_upgraded_from','3.6.15','yes');
INSERT INTO `wp_options` VALUES (616,'magneto_option','a:115:{s:8:\"last_tab\";s:1:\"0\";s:16:\"bk-primary-color\";s:7:\"#ef886b\";s:17:\"bk-retina-display\";s:1:\"1\";s:16:\"bk-smooth-scroll\";s:1:\"1\";s:14:\"bk-site-layout\";s:4:\"wide\";s:10:\"bk-body-bg\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:9:\"bk-rtl-sw\";s:1:\"0\";s:17:\"bk-sb-location-sw\";s:5:\"right\";s:19:\"bk-sb-responsive-sw\";s:1:\"1\";s:7:\"bk-logo\";a:9:{s:3:\"url\";s:0:\"\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";s:5:\"title\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:3:\"alt\";s:0:\"\";s:11:\"description\";s:0:\"\";}s:12:\"bk-logo-hide\";s:1:\"1\";s:18:\"bk-logo-margin-top\";s:2:\"50\";s:21:\"bk-logo-margin-bottom\";s:2:\"50\";s:12:\"bk-header-bg\";a:7:{s:16:\"background-color\";s:4:\"#fff\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:20:\"bk-header-top-switch\";s:1:\"1\";s:15:\"bk-top-bar-type\";s:4:\"dark\";s:13:\"bk-top-bar-bg\";a:1:{s:16:\"background-color\";s:0:\"\";}s:19:\"bk-ajaxlogin-switch\";s:1:\"1\";s:23:\"bk-social-header-switch\";s:1:\"0\";s:16:\"bk-social-header\";a:13:{s:2:\"fb\";s:0:\"\";s:7:\"twitter\";s:0:\"\";s:5:\"gplus\";s:0:\"\";s:8:\"linkedin\";s:0:\"\";s:9:\"pinterest\";s:0:\"\";s:9:\"instagram\";s:0:\"\";s:8:\"dribbble\";s:0:\"\";s:7:\"youtube\";s:0:\"\";s:5:\"vimeo\";s:0:\"\";s:2:\"vk\";s:0:\"\";s:4:\"vine\";s:0:\"\";s:8:\"snapchat\";s:0:\"\";s:3:\"rss\";s:0:\"\";}s:14:\"bk-header-type\";s:7:\"default\";s:16:\"bk-search-button\";s:6:\"enable\";s:19:\"bk-search-button-bg\";a:1:{s:16:\"background-color\";s:0:\"\";}s:17:\"bk-main-menu-type\";s:4:\"wide\";s:14:\"bk-menu-scheme\";s:4:\"dark\";s:15:\"bk-main-menu-bg\";a:1:{s:16:\"background-color\";s:0:\"\";}s:20:\"main-menu-border-top\";a:6:{s:10:\"border-top\";s:3:\"0px\";s:12:\"border-right\";s:3:\"0px\";s:13:\"border-bottom\";s:3:\"0px\";s:11:\"border-left\";s:3:\"0px\";s:12:\"border-style\";s:5:\"solid\";s:12:\"border-color\";s:4:\"#ddd\";}s:23:\"main-menu-border-bottom\";a:6:{s:10:\"border-top\";s:3:\"0px\";s:12:\"border-right\";s:3:\"0px\";s:13:\"border-bottom\";s:3:\"0px\";s:11:\"border-left\";s:3:\"0px\";s:12:\"border-style\";s:5:\"solid\";s:12:\"border-color\";s:4:\"#ddd\";}s:18:\"bk-main-nav-layout\";s:4:\"left\";s:19:\"bk-fixed-nav-switch\";s:1:\"1\";s:14:\"bk-menu-effect\";s:7:\"jump_up\";s:23:\"bk-header-logo-position\";s:4:\"left\";s:23:\"bk-header-banner-switch\";s:1:\"0\";s:16:\"bk-header-banner\";a:2:{s:6:\"imgurl\";s:7:\"http://\";s:7:\"linkurl\";s:7:\"http://\";}s:16:\"bk-banner-script\";s:0:\"\";s:17:\"bk-backtop-switch\";s:1:\"1\";s:12:\"bk-footer-bg\";a:7:{s:16:\"background-color\";s:0:\"\";s:17:\"background-repeat\";s:0:\"\";s:15:\"background-size\";s:0:\"\";s:21:\"background-attachment\";s:0:\"\";s:19:\"background-position\";s:0:\"\";s:16:\"background-image\";s:0:\"\";s:5:\"media\";a:4:{s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}}s:21:\"bk-footer-padding-top\";s:2:\"50\";s:24:\"bk-footer-padding-bottom\";s:2:\"50\";s:7:\"cr-text\";s:0:\"\";s:18:\"bk-body-font-setup\";a:2:{s:9:\"font-size\";s:4:\"16px\";s:14:\"letter-spacing\";s:0:\"\";}s:26:\"bk-module-title-font-setup\";a:2:{s:9:\"font-size\";s:4:\"20px\";s:14:\"letter-spacing\";s:0:\"\";}s:28:\"bk-widget-sidebar-font-setup\";a:2:{s:9:\"font-size\";s:4:\"18px\";s:14:\"letter-spacing\";s:0:\"\";}s:27:\"bk-footer-widget-font-setup\";a:2:{s:9:\"font-size\";s:4:\"16px\";s:14:\"letter-spacing\";s:0:\"\";}s:16:\"bk-top-menu-font\";a:6:{s:11:\"font-family\";s:8:\"Rajdhani\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"500\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";}s:17:\"bk-main-menu-font\";a:6:{s:11:\"font-family\";s:8:\"Rajdhani\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"600\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";}s:23:\"bk-main-menu-font-setup\";a:3:{s:9:\"font-size\";s:0:\"\";s:14:\"letter-spacing\";s:0:\"\";s:5:\"color\";s:0:\"\";}s:14:\"bk-review-font\";a:6:{s:11:\"font-family\";s:8:\"Rajdhani\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"600\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";}s:12:\"bk-meta-font\";a:6:{s:11:\"font-family\";s:14:\"Archivo Narrow\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";}s:13:\"bk-title-font\";a:6:{s:11:\"font-family\";s:8:\"Rajdhani\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"600\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";}s:12:\"bk-body-font\";a:6:{s:11:\"font-family\";s:4:\"Lato\";s:12:\"font-options\";s:0:\"\";s:6:\"google\";s:1:\"1\";s:11:\"font-weight\";s:3:\"400\";s:10:\"font-style\";s:0:\"\";s:7:\"subsets\";s:0:\"\";}s:24:\"bk-small-post-font-setup\";a:2:{s:9:\"font-size\";s:0:\"\";s:14:\"letter-spacing\";s:0:\"\";}s:28:\"bk-post-cat-contentin-layout\";s:13:\"no-background\";s:17:\"bk-meta-review-sw\";s:1:\"1\";s:17:\"bk-meta-author-sw\";s:1:\"1\";s:15:\"bk-meta-date-sw\";s:1:\"1\";s:19:\"bk-meta-comments-sw\";s:1:\"1\";s:14:\"bk-breadcrumbs\";s:7:\"disable\";s:24:\"bk-breadcrumb-font-setup\";a:2:{s:9:\"font-size\";s:0:\"\";s:14:\"letter-spacing\";s:0:\"\";}s:11:\"opt-spacing\";a:5:{s:11:\"padding-top\";s:0:\"\";s:13:\"padding-right\";s:0:\"\";s:14:\"padding-bottom\";s:0:\"\";s:12:\"padding-left\";s:0:\"\";s:5:\"units\";s:2:\"px\";}s:19:\"pagebuilder-sidebar\";s:7:\"disable\";s:14:\"bk-blog-layout\";s:0:\"\";s:14:\"blog_post_icon\";s:0:\"\";s:17:\"blog-page-sidebar\";s:0:\"\";s:18:\"blog-stick-sidebar\";s:7:\"disable\";s:16:\"bk-author-layout\";s:0:\"\";s:16:\"author_post_icon\";s:0:\"\";s:19:\"author-page-sidebar\";s:0:\"\";s:20:\"author-stick-sidebar\";s:7:\"disable\";s:18:\"bk-category-layout\";s:7:\"masonry\";s:18:\"category_post_icon\";s:0:\"\";s:21:\"category-page-sidebar\";s:0:\"\";s:22:\"category-stick-sidebar\";s:7:\"disable\";s:17:\"bk-archive-layout\";s:12:\"classic-blog\";s:17:\"archive_post_icon\";s:0:\"\";s:20:\"archive-page-sidebar\";s:0:\"\";s:21:\"archive-stick-sidebar\";s:7:\"disable\";s:16:\"bk-search-layout\";s:12:\"classic-blog\";s:16:\"search_post_icon\";s:0:\"\";s:19:\"search-page-sidebar\";s:0:\"\";s:20:\"search-stick-sidebar\";s:7:\"disable\";s:16:\"bk-search-result\";s:3:\"yes\";s:17:\"bk-single-featimg\";s:1:\"1\";s:19:\"single-page-sidebar\";s:0:\"\";s:20:\"single-stick-sidebar\";s:7:\"disable\";s:9:\"bk-og-tag\";s:1:\"1\";s:18:\"bk-sharebox-top-sw\";s:1:\"1\";s:12:\"bk-fb-top-sw\";s:1:\"1\";s:14:\"bk-fb-top-text\";s:0:\"\";s:12:\"bk-tw-top-sw\";s:1:\"1\";s:14:\"bk-tw-top-text\";s:0:\"\";s:12:\"bk-gp-top-sw\";s:1:\"1\";s:14:\"bk-gp-top-text\";s:0:\"\";s:12:\"bk-pi-top-sw\";s:1:\"1\";s:14:\"bk-pi-top-text\";s:0:\"\";s:13:\"bk-stu-top-sw\";s:1:\"1\";s:15:\"bk-stu-top-text\";s:0:\"\";s:12:\"bk-li-top-sw\";s:1:\"1\";s:14:\"bk-li-top-text\";s:0:\"\";s:14:\"bk-sharebox-sw\";s:1:\"1\";s:8:\"bk-fb-sw\";s:1:\"1\";s:8:\"bk-tw-sw\";s:1:\"1\";s:8:\"bk-gp-sw\";s:1:\"1\";s:8:\"bk-pi-sw\";s:1:\"1\";s:9:\"bk-stu-sw\";s:1:\"1\";s:8:\"bk-li-sw\";s:1:\"1\";s:15:\"bk-authorbox-sw\";s:1:\"0\";s:13:\"bk-postnav-sw\";s:1:\"1\";s:13:\"bk-related-sw\";s:1:\"1\";s:21:\"bk-related-font-setup\";a:2:{s:9:\"font-size\";s:0:\"\";s:14:\"letter-spacing\";s:0:\"\";}s:13:\"bk-comment-sw\";s:1:\"1\";s:16:\"bk-recommend-box\";s:1:\"1\";s:19:\"recommend-box-title\";s:0:\"\";s:29:\"bk-recommend-title-font-setup\";a:2:{s:9:\"font-size\";s:0:\"\";s:14:\"letter-spacing\";s:0:\"\";}s:16:\"recommend-number\";s:0:\"\";}','yes');
INSERT INTO `wp_options` VALUES (617,'magneto_option-transients','a:2:{s:14:\"changed_values\";a:0:{}s:9:\"last_save\";i:1562787868;}','yes');
INSERT INTO `wp_options` VALUES (618,'smk_sidebar_generator','a:1:{s:8:\"sidebars\";a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (619,'_transient_smk_sidebar_generator_option_v2','1','yes');
INSERT INTO `wp_options` VALUES (629,'theme_mods_soledad-child','a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1563064059;s:4:\"data\";a:24:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:12:\"main-sidebar\";a:0:{}s:8:\"footer-1\";a:0:{}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:8:\"footer-4\";a:0:{}s:18:\"header-signup-form\";a:0:{}s:18:\"footer-signup-form\";a:0:{}s:16:\"footer-instagram\";a:0:{}s:13:\"top-instagram\";a:0:{}s:16:\"menu_hamburger_1\";a:0:{}s:16:\"menu_hamburger_2\";a:0:{}s:18:\"penci-shop-sidebar\";a:0:{}s:17:\"penci-shop-single\";a:0:{}s:16:\"custom-sidebar-1\";a:0:{}s:16:\"custom-sidebar-2\";a:0:{}s:16:\"custom-sidebar-3\";a:0:{}s:16:\"custom-sidebar-4\";a:0:{}s:16:\"custom-sidebar-5\";a:0:{}s:16:\"custom-sidebar-6\";a:0:{}s:16:\"custom-sidebar-7\";a:0:{}s:16:\"custom-sidebar-8\";a:0:{}s:16:\"custom-sidebar-9\";a:0:{}s:17:\"custom-sidebar-10\";a:0:{}}}}','yes');
INSERT INTO `wp_options` VALUES (630,'soledad_active_status_last_time','1562788614','yes');
INSERT INTO `wp_options` VALUES (631,'widget_penci_about_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (632,'widget_penci_facebook_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (633,'widget_penci_latest_news_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (634,'widget_penci_slider_posts_news_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (635,'widget_penci_popular_news_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (636,'widget_penci_social_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (637,'widget_penci_quote_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (638,'widget_penci_pinterest_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (639,'widget_penci_list_banner_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (640,'shop_catalog_image_size','a:3:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"732\";s:4:\"crop\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (641,'shop_single_image_size','a:3:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"732\";s:4:\"crop\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (642,'shop_thumbnail_image_size','a:3:{s:5:\"width\";s:3:\"150\";s:6:\"height\";s:3:\"183\";s:4:\"crop\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (675,'theme_mods_hestia','a:11:{i:0;b:0;s:29:\"hestia_contact_form_shortcode\";s:14:\"[pirate_forms]\";s:28:\"ti_about_recommended_plugins\";a:1:{s:19:\"themeisle-companion\";s:7:\"visible\";}s:18:\"nav_menu_locations\";a:0:{}s:28:\"zerif_frontpage_was_imported\";s:9:\"not-zerif\";s:13:\"ti_prev_theme\";s:11:\"pepseeactus\";s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1563130018;s:4:\"data\";a:10:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-1\";a:0:{}s:17:\"subscribe-widgets\";a:0:{}s:19:\"sidebar-woocommerce\";a:0:{}s:15:\"sidebar-top-bar\";a:0:{}s:14:\"header-sidebar\";a:0:{}s:17:\"sidebar-big-title\";a:0:{}s:18:\"footer-one-widgets\";a:0:{}s:18:\"footer-two-widgets\";a:0:{}s:20:\"footer-three-widgets\";a:0:{}}}s:13:\"show_on_front\";s:4:\"page\";s:24:\"hestia_feature_thumbnail\";s:74:\"http://pepseeactusv3.local/wp-content/themes/hestia/assets/img/contact.jpg\";s:31:\"hestia_feature_thumbnail_buffer\";s:74:\"http://pepseeactusv3.local/wp-content/themes/hestia/assets/img/contact.jpg\";}','yes');
INSERT INTO `wp_options` VALUES (676,'hestia_contact_form_legacy','1','yes');
INSERT INTO `wp_options` VALUES (677,'hestia_install','1563103943','yes');
INSERT INTO `wp_options` VALUES (678,'hestia_had_elementor','no','yes');
INSERT INTO `wp_options` VALUES (679,'hestia_time_activated','1563130018','yes');
INSERT INTO `wp_options` VALUES (702,'themeisle_companion_install','1563104097','yes');
INSERT INTO `wp_options` VALUES (703,'translatepress_avg_affiliate_id','91096','yes');
INSERT INTO `wp_options` VALUES (713,'optml-version','2.0.7','yes');
INSERT INTO `wp_options` VALUES (716,'optimole_wp_install','1563125505','yes');
INSERT INTO `wp_options` VALUES (717,'optml_notice_optin','yes','yes');
INSERT INTO `wp_options` VALUES (738,'otter_blocks_install','1563125528','yes');
INSERT INTO `wp_options` VALUES (739,'themeisle_blocks_settings_redirect','','yes');
INSERT INTO `wp_options` VALUES (745,'wpforms_version','1.5.3.1','yes');
INSERT INTO `wp_options` VALUES (746,'wpforms_activated','a:1:{s:4:\"lite\";i:1563125587;}','yes');
INSERT INTO `wp_options` VALUES (749,'widget_wpforms-widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (750,'_amn_wpforms-lite_to_check','1563991628','yes');
INSERT INTO `wp_options` VALUES (751,'wpforms_review','a:2:{s:4:\"time\";i:1563125587;s:9:\"dismissed\";b:0;}','yes');
INSERT INTO `wp_options` VALUES (755,'widget_cwp_latest_products_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (756,'widget_cwp_top_products_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (757,'widget_wppr_top_reviews_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (758,'wp_product_review_install','1563125632','yes');
INSERT INTO `wp_options` VALUES (762,'visualizer_install','1563125658','yes');
INSERT INTO `wp_options` VALUES (766,'theme_mods_pepseeactus','a:32:{i:0;b:0;s:28:\"ti_about_recommended_plugins\";a:1:{s:19:\"themeisle-companion\";s:7:\"visible\";}s:18:\"nav_menu_locations\";a:1:{s:6:\"menu-1\";i:2;}s:13:\"show_on_front\";s:4:\"page\";s:28:\"zerif_frontpage_was_imported\";s:9:\"not-zerif\";s:13:\"ti_prev_theme\";s:6:\"hestia\";s:24:\"hestia_feature_thumbnail\";s:74:\"http://pepseeactusv3.local/wp-content/themes/hestia/assets/img/contact.jpg\";s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1563303931;s:4:\"data\";a:10:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-1\";a:0:{}s:17:\"subscribe-widgets\";a:0:{}s:19:\"sidebar-woocommerce\";a:0:{}s:15:\"sidebar-top-bar\";a:0:{}s:14:\"header-sidebar\";a:0:{}s:17:\"sidebar-big-title\";a:0:{}s:18:\"footer-one-widgets\";a:0:{}s:18:\"footer-two-widgets\";a:0:{}s:20:\"footer-three-widgets\";a:0:{}}}s:31:\"hestia_feature_thumbnail_buffer\";s:74:\"http://pepseeactusv3.local/wp-content/themes/hestia/assets/img/contact.jpg\";s:26:\"hestia_page_sidebar_layout\";s:13:\"sidebar-right\";s:27:\"hestia_enable_scroll_to_top\";b:1;s:21:\"hestia_general_layout\";b:0;s:17:\"hestia_about_hide\";b:1;s:20:\"hestia_headings_font\";s:10:\"Montserrat\";s:16:\"hestia_body_font\";s:10:\"Montserrat\";s:12:\"accent_color\";s:7:\"#f1c40f\";s:16:\"background_color\";s:6:\"ecf0f1\";s:28:\"hestia_buttons_border_radius\";d:50;s:23:\"hestia_header_alignment\";s:4:\"left\";s:21:\"hestia_search_in_menu\";b:0;s:20:\"hestia_header_layout\";s:7:\"default\";s:28:\"hestia_header_gradient_color\";s:7:\"#e67e22\";s:30:\"hestia_featured_posts_category\";a:1:{i:0;s:1:\"1\";}s:30:\"hestia_alternative_blog_layout\";s:23:\"blog_alternative_layout\";s:20:\"hestia_features_hide\";b:1;s:23:\"hestia_features_content\";s:1027:\"[{\"icon_value\":\"fa-wechat\",\"color\":\"#e91e63\",\"text\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\",\"link\":\"#\",\"text2\":\"undefined\",\"title\":\"Responsive\",\"subtitle\":\"undefined\",\"social_repeater\":\"undefined\",\"id\":\"social-repeater-5d2cd8ab04c87\",\"shortcode\":\"undefined\"},{\"icon_value\":\"fa-check\",\"color\":\"#00bcd4\",\"text\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\",\"link\":\"#\",\"text2\":\"undefined\",\"title\":\"Quality\",\"subtitle\":\"undefined\",\"social_repeater\":\"undefined\",\"id\":\"social-repeater-5d2cd8ab79a1a\",\"shortcode\":\"undefined\"},{\"icon_value\":\"fa-support\",\"color\":\"#4caf50\",\"text\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\",\"link\":\"#\",\"text2\":\"undefined\",\"title\":\"Support\",\"subtitle\":\"undefined\",\"social_repeater\":\"undefined\",\"id\":\"social-repeater-5d2cd8ab57b2d\",\"shortcode\":\"undefined\"}]\";s:27:\"hestia_testimonials_content\";s:1371:\"[{\"text\":\"&quot;We have no regrets! After using your product my business skyrocketed! I made back the purchase price in just 48 hours! I couldn&#039;t have asked for more than this.&quot;\",\"link\":\"\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/themes\\/hestia\\/assets\\/img\\/5.jpg\",\"title\":\"Inverness McKenzie\",\"subtitle\":\"Business Owner\",\"social_repeater\":\"undefined\",\"id\":\"customizer_repeater_56d7ea7f40d56\",\"shortcode\":\"undefined\"},{\"text\":\"&quot;Your company is truly upstanding and is behind its product 100 percent. Hestia is worth much more than I paid. I like Hestia more each day because it makes easier.&quot;\",\"link\":\"\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/themes\\/hestia\\/assets\\/img\\/6.jpg\",\"title\":\"Hanson Deck\",\"subtitle\":\"Independent Artist\",\"social_repeater\":\"undefined\",\"id\":\"customizer_repeater_56d7ea7f40d66\",\"shortcode\":\"undefined\"},{\"text\":\"&quot;Thank you for making it painless, pleasant and most of all hassle free! I am so pleased with this product. Dude, your stuff is great! I will refer everyone I know.&quot;\",\"link\":\"\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/themes\\/hestia\\/assets\\/img\\/7.jpg\",\"title\":\"Natalya Undergrowth\",\"subtitle\":\"Freelancer\",\"social_repeater\":\"undefined\",\"id\":\"customizer_repeater_56d7ea7f40d76\",\"shortcode\":\"undefined\"}]\";s:19:\"hestia_team_content\";s:4335:\"[{\"icon_value\":\"fa-facebook\",\"text\":\"Locavore pinterest chambray affogato art party, forage coloring book typewriter. Bitters cold selfies, retro celiac sartorial mustache.\",\"link\":\"\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/uploads\\/2019\\/07\\/F073036-1-300x300.jpg\",\"title\":\"Desmond Purpleson\",\"subtitle\":\"CEO\",\"social_repeater\":\"[{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb908674e06&quot;,&quot;link&quot;:&quot;facebook.com&quot;,&quot;icon&quot;:&quot;fa-facebook&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb9148530ft&quot;,&quot;link&quot;:&quot;plus.google.com&quot;,&quot;icon&quot;:&quot;fa-google-plus&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb9148530fc&quot;,&quot;link&quot;:&quot;twitter.com&quot;,&quot;icon&quot;:&quot;fa-twitter&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb9150e1e89&quot;,&quot;link&quot;:&quot;linkedin.com&quot;,&quot;icon&quot;:&quot;fa-linkedin&quot;}]\",\"id\":\"customizer_repeater_56d7ea7f40c56\",\"shortcode\":\"undefined\"},{\"icon_value\":\"fa-facebook\",\"text\":\"Craft beer salvia celiac mlkshk. Pinterest celiac tumblr, portland salvia skateboard cliche thundercats. Tattooed chia austin hell.\",\"link\":\"\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/themes\\/hestia\\/assets\\/img\\/2.jpg\",\"title\":\"Parsley Pepperspray\",\"subtitle\":\"Marketing Specialist\",\"social_repeater\":\"[{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb9155a1072&quot;,&quot;link&quot;:&quot;facebook.com&quot;,&quot;icon&quot;:&quot;fa-facebook&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb9160ab683&quot;,&quot;link&quot;:&quot;twitter.com&quot;,&quot;icon&quot;:&quot;fa-twitter&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb9160ab484&quot;,&quot;link&quot;:&quot;pinterest.com&quot;,&quot;icon&quot;:&quot;fa-pinterest&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb916ddffc9&quot;,&quot;link&quot;:&quot;linkedin.com&quot;,&quot;icon&quot;:&quot;fa-linkedin&quot;}]\",\"id\":\"customizer_repeater_56d7ea7f40c66\",\"shortcode\":\"undefined\"},{\"icon_value\":\"fa-facebook\",\"text\":\"Pok pok direct trade godard street art, poutine fam typewriter food truck narwhal kombucha wolf cardigan butcher whatever pickled you.\",\"link\":\"\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/themes\\/hestia\\/assets\\/img\\/3.jpg\",\"title\":\"Desmond Eagle\",\"subtitle\":\"Graphic Designer\",\"social_repeater\":\"[{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb917e4c69e&quot;,&quot;link&quot;:&quot;facebook.com&quot;,&quot;icon&quot;:&quot;fa-facebook&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb91830825c&quot;,&quot;link&quot;:&quot;twitter.com&quot;,&quot;icon&quot;:&quot;fa-twitter&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb918d65f2e&quot;,&quot;link&quot;:&quot;linkedin.com&quot;,&quot;icon&quot;:&quot;fa-linkedin&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb918d65f2x&quot;,&quot;link&quot;:&quot;dribbble.com&quot;,&quot;icon&quot;:&quot;fa-dribbble&quot;}]\",\"id\":\"customizer_repeater_56d7ea7f40c76\",\"shortcode\":\"undefined\"},{\"icon_value\":\"fa-github-square\",\"text\":\"Small batch vexillologist 90&#039;s blue bottle stumptown bespoke. Pok pok tilde fixie chartreuse, VHS gluten-free selfies wolf hot.\",\"link\":\"\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/themes\\/hestia\\/assets\\/img\\/4.jpg\",\"title\":\"Ruby Von Rails\",\"subtitle\":\"Lead Developer\",\"social_repeater\":\"[{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb925cedcg5&quot;,&quot;link&quot;:&quot;github.com&quot;,&quot;icon&quot;:&quot;fa-github-square&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb925cedcb2&quot;,&quot;link&quot;:&quot;facebook.com&quot;,&quot;icon&quot;:&quot;fa-facebook&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb92615f030&quot;,&quot;link&quot;:&quot;twitter.com&quot;,&quot;icon&quot;:&quot;fa-twitter&quot;},{&quot;id&quot;:&quot;customizer-repeater-social-repeater-57fb9266c223a&quot;,&quot;link&quot;:&quot;linkedin.com&quot;,&quot;icon&quot;:&quot;fa-linkedin&quot;}]\",\"id\":\"customizer_repeater_56d7ea7f40c86\",\"shortcode\":\"undefined\"}]\";s:26:\"hestia_clients_bar_content\";s:1691:\"[{\"text\":\"undefined\",\"link\":\"#\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/plugins\\/themeisle-companion\\/obfx_modules\\/companion-legacy\\/inc\\/hestia\\/inc\\/img\\/clients1.png\",\"title\":\"undefined\",\"subtitle\":\"undefined\",\"social_repeater\":\"undefined\",\"id\":\"social-repeater-5d2cd8abb9878\",\"shortcode\":\"undefined\"},{\"text\":\"undefined\",\"link\":\"#\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/plugins\\/themeisle-companion\\/obfx_modules\\/companion-legacy\\/inc\\/hestia\\/inc\\/img\\/clients2.png\",\"title\":\"undefined\",\"subtitle\":\"undefined\",\"social_repeater\":\"undefined\",\"id\":\"social-repeater-5d2cd8abb3f7d\",\"shortcode\":\"undefined\"},{\"text\":\"undefined\",\"link\":\"#\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/plugins\\/themeisle-companion\\/obfx_modules\\/companion-legacy\\/inc\\/hestia\\/inc\\/img\\/clients3.png\",\"title\":\"undefined\",\"subtitle\":\"undefined\",\"social_repeater\":\"undefined\",\"id\":\"social-repeater-5d2cd8ab5cb62\",\"shortcode\":\"undefined\"},{\"text\":\"undefined\",\"link\":\"#\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/plugins\\/themeisle-companion\\/obfx_modules\\/companion-legacy\\/inc\\/hestia\\/inc\\/img\\/clients4.png\",\"title\":\"undefined\",\"subtitle\":\"undefined\",\"social_repeater\":\"undefined\",\"id\":\"social-repeater-5d2cd8ab7cea9\",\"shortcode\":\"undefined\"},{\"text\":\"undefined\",\"link\":\"#\",\"text2\":\"undefined\",\"image_url\":\"http:\\/\\/pepseeactus.local\\/wp-content\\/plugins\\/themeisle-companion\\/obfx_modules\\/companion-legacy\\/inc\\/hestia\\/inc\\/img\\/clients5.png\",\"title\":\"undefined\",\"subtitle\":\"undefined\",\"social_repeater\":\"undefined\",\"id\":\"social-repeater-5d2cd8aba2fcf\",\"shortcode\":\"undefined\"}]\";s:19:\"hestia_top_bar_hide\";b:1;s:11:\"custom_logo\";i:256;}','yes');
INSERT INTO `wp_options` VALUES (767,'hestia_sync_needed','','yes');
INSERT INTO `wp_options` VALUES (782,'wpseo','a:29:{s:8:\"tracking\";b:0;s:15:\"ms_defaults_set\";b:0;s:40:\"ignore_search_engines_discouraged_notice\";b:0;s:25:\"ignore_indexation_warning\";b:0;s:29:\"indexation_warning_hide_until\";b:0;s:18:\"indexation_started\";b:0;s:28:\"indexables_indexation_reason\";s:0:\"\";s:31:\"indexables_indexation_completed\";b:0;s:7:\"version\";s:6:\"14.8.1\";s:16:\"previous_version\";s:6:\"14.0.4\";s:20:\"disableadvanced_meta\";b:1;s:30:\"enable_headless_rest_endpoints\";b:1;s:17:\"ryte_indexability\";b:1;s:11:\"baiduverify\";s:0:\"\";s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";s:9:\"site_type\";s:4:\"news\";s:20:\"has_multiple_authors\";b:0;s:16:\"environment_type\";s:7:\"staging\";s:23:\"content_analysis_active\";b:1;s:23:\"keyword_analysis_active\";b:1;s:21:\"enable_admin_bar_menu\";b:1;s:26:\"enable_cornerstone_content\";b:1;s:18:\"enable_xml_sitemap\";b:1;s:24:\"enable_text_link_counter\";b:1;s:22:\"show_onboarding_notice\";b:0;s:18:\"first_activated_on\";i:1563126954;s:13:\"myyoast-oauth\";b:0;}','yes');
INSERT INTO `wp_options` VALUES (783,'wpseo_titles','a:104:{s:10:\"title_test\";i:0;s:17:\"forcerewritetitle\";b:0;s:9:\"separator\";s:7:\"sc-pipe\";s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:41:\"%%name%%, Author at %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:63:\"You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:35:\"Page not found %%sep%% %%sitename%%\";s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:53:\"The post %%POSTLINK%% appeared first on %%BLOGLINK%%.\";s:20:\"noindex-author-wpseo\";b:0;s:28:\"noindex-author-noposts-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:1;s:12:\"disable-date\";b:0;s:19:\"disable-post_format\";b:0;s:18:\"disable-attachment\";b:1;s:23:\"is-media-purge-relevant\";b:0;s:20:\"breadcrumbs-404crumb\";s:31:\"Error 404: La page n\'existe pas\";s:29:\"breadcrumbs-display-blog-page\";b:0;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:12:\"Archives for\";s:18:\"breadcrumbs-enable\";b:1;s:16:\"breadcrumbs-home\";s:4:\"Home\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:18:\"Vous avez cherché\";s:15:\"breadcrumbs-sep\";s:1:\"/\";s:12:\"website_name\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:11:\"person_logo\";s:0:\"\";s:14:\"person_logo_id\";i:0;s:22:\"alternate_website_name\";s:0:\"\";s:12:\"company_logo\";s:90:\"http://pepseeactusv3.local/wp-content/uploads/2020/03/pepseeactus_logo_picto_noir_2019.png\";s:15:\"company_logo_id\";i:250;s:12:\"company_name\";s:11:\"PepseeActus\";s:17:\"company_or_person\";s:7:\"company\";s:25:\"company_or_person_user_id\";b:0;s:17:\"stripcategorybase\";b:1;s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:13:\"showdate-post\";b:0;s:23:\"display-metabox-pt-post\";b:1;s:23:\"post_types-post-maintax\";s:8:\"category\";s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:13:\"showdate-page\";b:0;s:23:\"display-metabox-pt-page\";b:1;s:23:\"post_types-page-maintax\";s:1:\"0\";s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:19:\"showdate-attachment\";b:0;s:29:\"display-metabox-pt-attachment\";b:1;s:29:\"post_types-attachment-maintax\";s:1:\"0\";s:18:\"title-tax-category\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:28:\"display-metabox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:0;s:18:\"title-tax-post_tag\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:28:\"display-metabox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:0;s:21:\"title-tax-post_format\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:31:\"display-metabox-tax-post_format\";b:0;s:23:\"noindex-tax-post_format\";b:1;s:12:\"title-artist\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:15:\"metadesc-artist\";s:0:\"\";s:14:\"noindex-artist\";b:0;s:15:\"showdate-artist\";b:0;s:25:\"display-metabox-pt-artist\";b:1;s:25:\"post_types-artist-maintax\";s:1:\"0\";s:22:\"title-ptarchive-artist\";s:51:\"%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%\";s:25:\"metadesc-ptarchive-artist\";s:0:\"\";s:24:\"bctitle-ptarchive-artist\";s:0:\"\";s:24:\"noindex-ptarchive-artist\";b:0;s:11:\"title-music\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:14:\"metadesc-music\";s:0:\"\";s:13:\"noindex-music\";b:0;s:14:\"showdate-music\";b:0;s:24:\"display-metabox-pt-music\";b:1;s:24:\"post_types-music-maintax\";s:1:\"0\";s:21:\"title-ptarchive-music\";s:51:\"%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-ptarchive-music\";s:0:\"\";s:23:\"bctitle-ptarchive-music\";s:0:\"\";s:23:\"noindex-ptarchive-music\";b:0;s:11:\"title-album\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:14:\"metadesc-album\";s:0:\"\";s:13:\"noindex-album\";b:0;s:14:\"showdate-album\";b:0;s:24:\"display-metabox-pt-album\";b:1;s:24:\"post_types-album-maintax\";s:1:\"0\";s:21:\"title-ptarchive-album\";s:51:\"%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-ptarchive-album\";s:0:\"\";s:23:\"bctitle-ptarchive-album\";s:0:\"\";s:23:\"noindex-ptarchive-album\";b:0;s:26:\"taxonomy-category-ptparent\";s:1:\"0\";s:26:\"taxonomy-post_tag-ptparent\";s:1:\"0\";s:29:\"taxonomy-post_format-ptparent\";s:1:\"0\";}','yes');
INSERT INTO `wp_options` VALUES (784,'wpseo_social','a:19:{s:13:\"facebook_site\";s:37:\"https://www.facebook.com/PepseeActus/\";s:13:\"instagram_url\";s:38:\"https://www.instagram.com/pepseeactus/\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:19:\"og_default_image_id\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:21:\"og_frontpage_image_id\";s:0:\"\";s:9:\"opengraph\";b:1;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:11:\"PepseeActus\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:11:\"youtube_url\";s:56:\"https://www.youtube.com/channel/UCrgv-BXDaZ39gdWUl_c7qHQ\";s:13:\"wikipedia_url\";s:0:\"\";s:10:\"fbadminapp\";s:0:\"\";}','yes');
INSERT INTO `wp_options` VALUES (795,'WPLANG','fr_FR','yes');
INSERT INTO `wp_options` VALUES (796,'new_admin_email','christophe.sbastien@gmail.com','yes');
INSERT INTO `wp_options` VALUES (819,'themeisle_blocks_settings_tour','','yes');
INSERT INTO `wp_options` VALUES (822,'dismissed-hestia_info_woocommerce','1','yes');
INSERT INTO `wp_options` VALUES (846,'imagify_settings','a:13:{s:7:\"version\";s:6:\"1.9.10\";s:7:\"api_key\";s:40:\"dc230a2a88070cf1cd5a16ce80d8d0a246d17ba7\";s:18:\"optimization_level\";i:1;s:13:\"auto_optimize\";i:1;s:6:\"backup\";i:1;s:15:\"convert_to_webp\";i:1;s:12:\"display_webp\";i:0;s:19:\"display_webp_method\";s:7:\"picture\";s:7:\"cdn_url\";s:0:\"\";s:4:\"exif\";i:0;s:16:\"disallowed-sizes\";a:0:{}s:14:\"admin_bar_menu\";i:1;s:13:\"partner_links\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (847,'imagify_data','a:4:{s:7:\"version\";s:6:\"1.9.10\";s:25:\"total_size_images_library\";d:0;s:29:\"average_size_images_per_month\";d:0;s:22:\"previous_quota_percent\";d:14.9;}','yes');
INSERT INTO `wp_options` VALUES (848,'imagify_folders_db_version','100','yes');
INSERT INTO `wp_options` VALUES (849,'imagify_files_db_version','102','yes');
INSERT INTO `wp_options` VALUES (926,'neve_upsell_off_exp','1563217664','yes');
INSERT INTO `wp_options` VALUES (958,'obfx_data','a:3:{s:13:\"core_settings\";a:0:{}s:13:\"module_status\";a:9:{s:14:\"social-sharing\";a:2:{s:14:\"showed_notices\";a:0:{}s:6:\"active\";b:1;}s:14:\"uptime-monitor\";a:1:{s:14:\"showed_notices\";a:0:{}}s:16:\"google-analytics\";a:2:{s:14:\"showed_notices\";a:0:{}s:6:\"active\";b:1;}s:16:\"companion-legacy\";a:1:{s:14:\"showed_notices\";a:0:{}}s:18:\"template-directory\";a:1:{s:14:\"showed_notices\";a:0:{}}s:10:\"menu-icons\";a:1:{s:14:\"showed_notices\";a:0:{}}s:14:\"mystock-import\";a:1:{s:14:\"showed_notices\";a:0:{}}s:13:\"policy-notice\";a:2:{s:14:\"showed_notices\";a:0:{}s:6:\"active\";b:1;}s:12:\"safe-updates\";a:2:{s:14:\"showed_notices\";a:0:{}s:6:\"active\";b:0;}}s:15:\"module_settings\";a:3:{s:12:\"safe-updates\";a:1:{s:18:\"auto_update_checks\";s:1:\"0\";}s:14:\"social-sharing\";a:55:{s:16:\"display_on_posts\";s:1:\"1\";s:8:\"facebook\";s:1:\"1\";s:21:\"facebook-desktop-show\";s:1:\"1\";s:20:\"facebook-mobile-show\";s:1:\"1\";s:7:\"twitter\";s:1:\"1\";s:20:\"twitter-desktop-show\";s:1:\"1\";s:19:\"twitter-mobile-show\";s:1:\"1\";s:19:\"g-plus-desktop-show\";s:1:\"1\";s:18:\"g-plus-mobile-show\";s:1:\"1\";s:22:\"pinterest-desktop-show\";s:1:\"1\";s:21:\"pinterest-mobile-show\";s:1:\"1\";s:21:\"linkedin-desktop-show\";s:1:\"1\";s:20:\"linkedin-mobile-show\";s:1:\"1\";s:19:\"tumblr-desktop-show\";s:1:\"1\";s:18:\"tumblr-mobile-show\";s:1:\"1\";s:19:\"reddit-desktop-show\";s:1:\"1\";s:18:\"reddit-mobile-show\";s:1:\"1\";s:8:\"whatsapp\";s:1:\"1\";s:21:\"whatsapp-desktop-show\";s:1:\"1\";s:20:\"whatsapp-mobile-show\";s:1:\"1\";s:17:\"mail-desktop-show\";s:1:\"1\";s:16:\"mail-mobile-show\";s:1:\"1\";s:16:\"sms-desktop-show\";s:1:\"1\";s:15:\"sms-mobile-show\";s:1:\"1\";s:15:\"vk-desktop-show\";s:1:\"1\";s:14:\"vk-mobile-show\";s:1:\"1\";s:17:\"okru-desktop-show\";s:1:\"1\";s:16:\"okru-mobile-show\";s:1:\"1\";s:19:\"douban-desktop-show\";s:1:\"1\";s:18:\"douban-mobile-show\";s:1:\"1\";s:18:\"baidu-desktop-show\";s:1:\"1\";s:17:\"baidu-mobile-show\";s:1:\"1\";s:17:\"xing-desktop-show\";s:1:\"1\";s:16:\"xing-mobile-show\";s:1:\"1\";s:19:\"renren-desktop-show\";s:1:\"1\";s:18:\"renren-mobile-show\";s:1:\"1\";s:18:\"weibo-desktop-show\";s:1:\"1\";s:17:\"weibo-mobile-show\";s:1:\"1\";s:16:\"display_on_pages\";s:1:\"0\";s:12:\"network_name\";s:1:\"0\";s:6:\"g-plus\";s:1:\"0\";s:9:\"pinterest\";s:1:\"1\";s:8:\"linkedin\";s:1:\"0\";s:6:\"tumblr\";s:1:\"0\";s:6:\"reddit\";s:1:\"0\";s:4:\"mail\";s:1:\"0\";s:3:\"sms\";s:1:\"0\";s:2:\"vk\";s:1:\"0\";s:4:\"okru\";s:1:\"0\";s:6:\"douban\";s:1:\"0\";s:5:\"baidu\";s:1:\"0\";s:4:\"xing\";s:1:\"0\";s:6:\"renren\";s:1:\"0\";s:5:\"weibo\";s:1:\"0\";s:16:\"socials_position\";s:1:\"2\";}s:13:\"policy-notice\";a:5:{s:20:\"enable_policy_notice\";s:1:\"1\";s:18:\"policy_notice_text\";s:183:\"En poursuivant votre navigation, vous acceptez l’utilisation de cookies qui permettront notamment de vous offrir contenus, services, et publicités liés à vos centres d\'intérêt.\";s:11:\"policy_page\";s:1:\"0\";s:17:\"notice_link_label\";s:18:\"Voir charte cookie\";s:19:\"notice_accept_label\";s:9:\"J\'accepte\";}}}','yes');
INSERT INTO `wp_options` VALUES (961,'obfx_token','87efe439cd92b0084bdb6c57ef5a0a34611a4e70151770386520397e743e447d','yes');
INSERT INTO `wp_options` VALUES (962,'obfx_google_accounts_tracking_codes','a:2:{i:0;O:8:\"stdClass\":2:{s:12:\"account_name\";s:11:\"PepseeActus\";s:13:\"tracking_code\";s:13:\"UA-49685610-1\";}i:1;O:8:\"stdClass\":2:{s:12:\"account_name\";s:12:\"Pepsee-Actus\";s:13:\"tracking_code\";s:13:\"UA-58308557-1\";}}','yes');
INSERT INTO `wp_options` VALUES (997,'recovery_mode_email_last_sent','1599164424','yes');
INSERT INTO `wp_options` VALUES (1093,'wpsupercache_start','1563392670','yes');
INSERT INTO `wp_options` VALUES (1094,'wpsupercache_count','0','yes');
INSERT INTO `wp_options` VALUES (1096,'supercache_stats','a:3:{s:9:\"generated\";i:1564229756;s:10:\"supercache\";a:5:{s:7:\"expired\";i:0;s:6:\"cached\";i:0;s:5:\"fsize\";i:0;s:11:\"cached_list\";a:0:{}s:12:\"expired_list\";a:0:{}}s:7:\"wpcache\";a:5:{s:7:\"expired\";i:0;s:6:\"cached\";i:0;s:5:\"fsize\";i:0;s:11:\"cached_list\";a:0:{}s:12:\"expired_list\";a:0:{}}}','yes');
INSERT INTO `wp_options` VALUES (1182,'theme_mods_twentysixteen','a:1:{s:18:\"custom_css_post_id\";i:-1;}','yes');
INSERT INTO `wp_options` VALUES (1183,'theme_mods_twentynineteen','a:1:{s:18:\"custom_css_post_id\";i:-1;}','yes');
INSERT INTO `wp_options` VALUES (1184,'_transient_twentysixteen_categories','1','yes');
INSERT INTO `wp_options` VALUES (1230,'do_activate','0','yes');
INSERT INTO `wp_options` VALUES (1248,'widget_akismet_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (1439,'youtubeprefs_alloptions','a:80:{s:6:\"apikey\";s:39:\"AIzaSyD-lUB5PDzdWTGIJeTkrG5gf-xjYCvtRzg\";s:3:\"rel\";s:1:\"0\";s:14:\"modestbranding\";i:1;s:10:\"responsive\";i:1;s:14:\"responsive_all\";i:1;s:16:\"gallery_pagesize\";i:15;s:15:\"gallery_columns\";i:3;s:16:\"not_live_content\";s:0:\"\";s:10:\"ytapi_load\";s:5:\"light\";s:12:\"gdpr_consent\";i:0;s:20:\"gdpr_consent_message\";s:360:\"<strong>Please accept YouTube cookies to play this video.</strong> By accepting you will be accessing content from YouTube, a service provided by an external third party.\r\n\r\n<a href=\"https://policies.google.com/privacy\" target=\"_blank\" rel=\"noopener\">YouTube privacy policy</a>\r\n\r\nIf you accept this notice, your choice will be saved and the page will refresh.\";s:19:\"gdpr_consent_button\";s:22:\"Accept YouTube Content\";s:8:\"nocookie\";i:0;s:9:\"onboarded\";i:1;s:7:\"version\";s:4:\"13.1\";s:9:\"centervid\";i:0;s:6:\"glance\";i:0;s:8:\"autoplay\";i:0;s:14:\"cc_load_policy\";i:0;s:14:\"iv_load_policy\";i:1;s:4:\"loop\";i:0;s:8:\"showinfo\";i:1;s:2:\"fs\";i:1;s:11:\"playsinline\";i:0;s:6:\"origin\";i:0;s:8:\"autohide\";i:2;s:2:\"hl\";s:0:\"\";s:4:\"dohl\";i:0;s:5:\"theme\";s:4:\"dark\";s:5:\"color\";s:3:\"red\";s:3:\"pro\";s:0:\"\";s:13:\"playlistorder\";i:0;s:8:\"acctitle\";i:0;s:7:\"migrate\";i:0;s:15:\"migrate_youtube\";i:0;s:22:\"migrate_embedplusvideo\";i:0;s:8:\"controls\";i:2;s:10:\"oldspacing\";i:0;s:13:\"frontend_only\";i:1;s:9:\"widgetfit\";i:1;s:16:\"evselector_light\";i:0;s:18:\"stop_mobile_buffer\";i:1;s:15:\"restrict_wizard\";i:0;s:21:\"restrict_wizard_roles\";a:5:{i:0;s:13:\"administrator\";i:1;s:6:\"editor\";i:2;s:6:\"author\";i:3;s:11:\"contributor\";i:4;s:10:\"subscriber\";}s:11:\"ajax_compat\";i:0;s:11:\"defaultdims\";i:0;s:5:\"width\";s:0:\"\";s:6:\"height\";s:0:\"\";s:10:\"defaultvol\";i:0;s:3:\"vol\";s:0:\"\";s:21:\"gallery_collapse_grid\";i:0;s:28:\"gallery_collapse_grid_breaks\";a:1:{i:0;a:2:{s:2:\"bp\";a:2:{s:3:\"min\";i:0;s:3:\"max\";i:767;}s:4:\"cols\";i:1;}}s:20:\"gallery_scrolloffset\";i:20;s:19:\"gallery_hideprivate\";i:1;s:17:\"gallery_showtitle\";i:1;s:18:\"gallery_showpaging\";i:1;s:16:\"gallery_autonext\";i:0;s:17:\"gallery_thumbplay\";i:1;s:18:\"gallery_channelsub\";i:0;s:22:\"gallery_channelsublink\";s:0:\"\";s:22:\"gallery_channelsubtext\";s:23:\"Subscribe to my channel\";s:20:\"gallery_customarrows\";i:0;s:18:\"gallery_customnext\";s:4:\"Next\";s:18:\"gallery_customprev\";s:4:\"Prev\";s:9:\"debugmode\";i:0;s:17:\"admin_off_scripts\";i:0;s:17:\"old_script_method\";i:0;s:9:\"vi_active\";i:0;s:20:\"vi_hide_monetize_tab\";i:0;s:12:\"vi_endpoints\";s:0:\"\";s:8:\"vi_token\";s:0:\"\";s:13:\"vi_last_login\";s:19:\"2000-01-01 00:00:00\";s:23:\"vi_last_category_update\";s:19:\"2000-01-01 00:00:00\";s:9:\"vi_adstxt\";s:0:\"\";s:14:\"vi_js_settings\";a:15:{s:5:\"divId\";s:20:\"ytvi_story_container\";s:8:\"language\";s:5:\"en-us\";s:11:\"iabCategory\";s:0:\"\";s:4:\"font\";s:5:\"Arial\";s:8:\"fontSize\";i:12;s:8:\"keywords\";s:0:\"\";s:9:\"textColor\";s:7:\"#000000\";s:15:\"backgroundColor\";s:7:\"#ffffff\";s:11:\"vioptional1\";s:0:\"\";s:11:\"vioptional2\";s:0:\"\";s:11:\"vioptional3\";s:0:\"\";s:5:\"float\";b:1;s:10:\"dfpSupport\";b:1;s:13:\"sponsoredText\";s:0:\"\";s:13:\"poweredByText\";s:0:\"\";}s:12:\"vi_js_script\";s:0:\"\";s:15:\"vi_js_posttypes\";a:0:{}s:14:\"vi_js_position\";s:3:\"top\";s:26:\"vi_show_gdpr_authorization\";i:1;s:22:\"vi_show_privacy_button\";i:0;}','yes');
INSERT INTO `wp_options` VALUES (1455,'fvp-settings','a:5:{s:4:\"mode\";s:6:\"manual\";s:6:\"sizing\";a:2:{s:10:\"responsive\";b:1;s:5:\"width\";s:3:\"640\";}s:9:\"alignment\";s:6:\"center\";s:8:\"autoplay\";a:1:{s:6:\"always\";b:0;}s:12:\"default_args\";a:1:{s:7:\"youtube\";a:4:{s:14:\"modestbranding\";s:1:\"1\";s:14:\"iv_load_policy\";s:1:\"3\";s:3:\"rel\";s:1:\"0\";s:8:\"showinfo\";s:1:\"0\";}}}','yes');
INSERT INTO `wp_options` VALUES (1456,'fvp-version','2.3.3','yes');
INSERT INTO `wp_options` VALUES (1679,'acf-image-aspect-ratio-crop-version','2.2.0','yes');
INSERT INTO `wp_options` VALUES (1685,'sirsc_db_version','5.44','yes');
INSERT INTO `wp_options` VALUES (1820,'dpsp_location_sidebar','a:5:{s:6:\"active\";s:1:\"1\";s:8:\"networks\";a:3:{s:8:\"facebook\";a:1:{s:5:\"label\";s:8:\"Facebook\";}s:7:\"twitter\";a:1:{s:5:\"label\";s:7:\"Twitter\";}s:9:\"pinterest\";a:1:{s:5:\"label\";s:9:\"Pinterest\";}}s:7:\"display\";a:9:{s:5:\"shape\";s:7:\"rounded\";s:14:\"icon_animation\";s:3:\"yes\";s:8:\"position\";s:4:\"left\";s:11:\"show_labels\";s:3:\"yes\";s:7:\"spacing\";s:3:\"yes\";s:11:\"show_mobile\";s:3:\"yes\";s:11:\"screen_size\";s:0:\"\";s:10:\"show_count\";s:3:\"yes\";s:11:\"count_round\";s:3:\"yes\";}s:17:\"post_type_display\";a:4:{i:0;s:4:\"post\";i:1;s:6:\"artist\";i:2;s:5:\"music\";i:3;s:5:\"album\";}s:12:\"button_style\";s:1:\"1\";}','yes');
INSERT INTO `wp_options` VALUES (1821,'dpsp_location_content','a:5:{s:6:\"active\";s:1:\"1\";s:8:\"networks\";a:3:{s:8:\"facebook\";a:1:{s:5:\"label\";s:5:\"Share\";}s:7:\"twitter\";a:1:{s:5:\"label\";s:5:\"Tweet\";}s:9:\"pinterest\";a:1:{s:5:\"label\";s:9:\"Pinterest\";}}s:7:\"display\";a:13:{s:5:\"shape\";s:7:\"rounded\";s:14:\"icon_animation\";s:3:\"yes\";s:8:\"position\";s:3:\"top\";s:12:\"column_count\";s:1:\"3\";s:7:\"message\";s:18:\"Sharing is caring!\";s:11:\"show_labels\";s:3:\"yes\";s:7:\"spacing\";s:3:\"yes\";s:11:\"show_mobile\";s:3:\"yes\";s:11:\"screen_size\";s:0:\"\";s:10:\"show_count\";s:3:\"yes\";s:16:\"show_count_total\";s:3:\"yes\";s:20:\"total_count_position\";s:5:\"after\";s:11:\"count_round\";s:3:\"yes\";}s:17:\"post_type_display\";a:4:{i:0;s:4:\"post\";i:1;s:6:\"artist\";i:2;s:5:\"music\";i:3;s:5:\"album\";}s:12:\"button_style\";s:1:\"1\";}','yes');
INSERT INTO `wp_options` VALUES (1823,'dpsp_version','1.6.1','yes');
INSERT INTO `wp_options` VALUES (1824,'dpsp_first_activation','1564236952','yes');
INSERT INTO `wp_options` VALUES (1825,'dpsp_settings','a:7:{s:16:\"twitter_username\";s:11:\"PepseeActus\";s:20:\"tweets_have_username\";s:3:\"yes\";s:30:\"facebook_share_counts_provider\";s:14:\"authorized_app\";s:15:\"facebook_app_id\";s:0:\"\";s:19:\"facebook_app_secret\";s:0:\"\";s:20:\"twitter_share_counts\";s:3:\"yes\";s:13:\"always_update\";s:1:\"1\";}','yes');
INSERT INTO `wp_options` VALUES (1826,'dpsp_version_update_1_5_1','1','yes');
INSERT INTO `wp_options` VALUES (1827,'dpsp_version_update_1_6_1','1','yes');
INSERT INTO `wp_options` VALUES (1828,'_transient_dpsp_facebook_access_token','a:2:{s:12:\"access_token\";s:184:\"EAAG6HjufeZBIBAEwa3Nvp0GIOvInB7rQrJs20rmJka4J7ghHCGxDmodez9auB9rTJgE4TN9XQMnnc1oBekZC0eJHoPNp3fEcx3XFaSqQrLBwDbvjjve7566e68JtSCKJ4eJ01ZAcj7ZAxEMQwcGZA5B7mDLKWONPjLVZBVZCYWnbOOYJGhq1N2C\";s:10:\"expires_in\";i:1569421285;}','yes');
INSERT INTO `wp_options` VALUES (1831,'dpsp_top_shared_posts','{\"artist\":{\"154\":0},\"music\":{\"167\":0}}','yes');
INSERT INTO `wp_options` VALUES (1845,'admin_email_lifespan','1616357074','yes');
INSERT INTO `wp_options` VALUES (1972,'_site_transient_imagify_user_images_count','717','no');
INSERT INTO `wp_options` VALUES (2116,'_transient_sirsc-plugin-notice_adons_notice','1','yes');
INSERT INTO `wp_options` VALUES (2150,'wpseo_ryte','a:2:{s:6:\"status\";i:-1;s:10:\"last_fetch\";i:1600806251;}','yes');
INSERT INTO `wp_options` VALUES (2427,'category_children','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (2451,'acf_duplicate_repeater_version','3.0.8','no');
INSERT INTO `wp_options` VALUES (2508,'sirsc_override_medium_size','','yes');
INSERT INTO `wp_options` VALUES (2509,'sirsc_override_large_size','','yes');
INSERT INTO `wp_options` VALUES (2510,'sirsc_admin_featured_size','','yes');
INSERT INTO `wp_options` VALUES (2511,'sirsc_use_custom_image_sizes','a:2:{s:5:\"sizes\";a:0:{}s:6:\"number\";i:0;}','yes');
INSERT INTO `wp_options` VALUES (2514,'medium_crop','0','yes');
INSERT INTO `wp_options` VALUES (2515,'large_crop','0','yes');
INSERT INTO `wp_options` VALUES (2560,'sirsc_types_options','a:7:{i:0;s:4:\"post\";i:1;s:4:\"page\";i:2;s:15:\"acf-field-group\";i:3;s:9:\"acf-field\";i:4;s:6:\"artist\";i:5;s:5:\"music\";i:6;s:5:\"album\";}','yes');
INSERT INTO `wp_options` VALUES (2561,'sirsc_settings','a:14:{s:7:\"exclude\";a:2:{i:0;s:9:\"1536x1536\";i:1;s:9:\"2048x2048\";}s:11:\"unavailable\";a:0:{}s:17:\"force_original_to\";s:0:\"\";s:22:\"complete_global_ignore\";a:2:{i:0;s:9:\"1536x1536\";i:1;s:9:\"2048x2048\";}s:12:\"placeholders\";a:0:{}s:12:\"default_crop\";a:3:{s:9:\"thumbnail\";s:2:\"cc\";s:24:\"pepseeactus-ArtistsFront\";s:2:\"cc\";s:6:\"banner\";s:2:\"cc\";}s:15:\"default_quality\";a:8:{s:9:\"thumbnail\";s:2:\"82\";s:6:\"medium\";s:2:\"82\";s:12:\"medium_large\";s:2:\"82\";s:5:\"large\";s:2:\"82\";s:9:\"1536x1536\";s:2:\"82\";s:9:\"2048x2048\";s:2:\"82\";s:24:\"pepseeactus-ArtistsFront\";s:2:\"82\";s:6:\"banner\";s:2:\"82\";}s:14:\"enable_perfect\";b:0;s:18:\"regenerate_missing\";b:0;s:19:\"disable_woo_thregen\";b:0;s:18:\"sync_settings_ewww\";b:0;s:20:\"listing_tiny_buttons\";b:0;s:17:\"force_size_choose\";b:0;s:21:\"leave_settings_behind\";b:0;}','yes');
INSERT INTO `wp_options` VALUES (2635,'_transient_jetpack_assumed_site_creation_date','2017-09-13 22:54:00','yes');
INSERT INTO `wp_options` VALUES (2805,'ssba_buttons','{\"buffer\":{\"full_name\":\"Buffer\"},\"diggit\":{\"full_name\":\"Diggit\"},\"email\":{\"full_name\":\"Email\"},\"facebook\":{\"full_name\":\"Facebook\"},\"facebook_save\":{\"full_name\":\"Facebook Save\"},\"flattr\":{\"full_name\":\"Flattr\"},\"linkedin\":{\"full_name\":\"LinkedIn\"},\"pinterest\":{\"full_name\":\"Pinterest\"},\"print\":{\"full_name\":\"Print\"},\"reddit\":{\"full_name\":\"Reddit\"},\"stumbleupon\":{\"full_name\":\"StumbleUpon\"},\"tumblr\":{\"full_name\":\"Tumblr\"},\"twitter\":{\"full_name\":\"Twitter\"},\"vk\":{\"full_name\":\"VK\"},\"whatsapp\":{\"full_name\":\"WhatsApp\"},\"xing\":{\"full_name\":\"Xing\"},\"yummly\":{\"full_name\":\"Yummly\"}}','yes');
INSERT INTO `wp_options` VALUES (2807,'widget_ssba_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (2808,'ssba_selected_tab','classic','yes');
INSERT INTO `wp_options` VALUES (3046,'wpmdb_settings','a:12:{s:3:\"key\";s:40:\"d2QmKb8Gi7snGIos+NOC9mr5pWt38c+1YQBRxom1\";s:10:\"allow_pull\";b:0;s:10:\"allow_push\";b:0;s:8:\"profiles\";a:0:{}s:7:\"licence\";s:0:\"\";s:10:\"verify_ssl\";b:0;s:17:\"whitelist_plugins\";a:0:{}s:11:\"max_request\";i:1048576;s:22:\"delay_between_requests\";i:0;s:18:\"prog_tables_hidden\";b:1;s:21:\"pause_before_finalize\";b:0;s:14:\"allow_tracking\";N;}','no');
INSERT INTO `wp_options` VALUES (3047,'wpmdb_schema_version','2','no');
INSERT INTO `wp_options` VALUES (3048,'wpmdb_usage','a:2:{s:6:\"action\";s:8:\"savefile\";s:4:\"time\";i:1585261293;}','no');
INSERT INTO `wp_options` VALUES (3049,'wpmdb_state_timeout_5e7d2aed853e2','1585347698','no');
INSERT INTO `wp_options` VALUES (3050,'wpmdb_state_5e7d2aed853e2','a:22:{s:6:\"action\";s:19:\"wpmdb_migrate_table\";s:6:\"intent\";s:8:\"savefile\";s:3:\"url\";s:0:\"\";s:9:\"form_data\";s:311:\"action=savefile&save_computer=1&gzip_file=1&connection_info=&replace_old%5B%5D=&replace_new%5B%5D=&replace_old%5B%5D=%2F%2Fpepseeactusv3.local&replace_new%5B%5D=%2F%2Fhttp%3A%2F%2Fchristophes.sgedu.site&replace_guids=1&exclude_transients=1&save_migration_profile_option=new&create_new_profile=&remote_json_data=\";s:5:\"stage\";s:7:\"migrate\";s:5:\"nonce\";s:10:\"2063b2105c\";s:12:\"site_details\";a:1:{s:5:\"local\";a:10:{s:12:\"is_multisite\";s:5:\"false\";s:8:\"site_url\";s:26:\"http://pepseeactusv3.local\";s:8:\"home_url\";s:26:\"http://pepseeactusv3.local\";s:6:\"prefix\";s:3:\"wp_\";s:15:\"uploads_baseurl\";s:46:\"http://pepseeactusv3.local/wp-content/uploads/\";s:7:\"uploads\";a:6:{s:4:\"path\";s:82:\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2020/03\";s:3:\"url\";s:53:\"http://pepseeactusv3.local/wp-content/uploads/2020/03\";s:6:\"subdir\";s:8:\"/2020/03\";s:7:\"basedir\";s:74:\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads\";s:7:\"baseurl\";s:45:\"http://pepseeactusv3.local/wp-content/uploads\";s:5:\"error\";b:0;}s:11:\"uploads_dir\";s:33:\"wp-content/uploads/wp-migrate-db/\";s:8:\"subsites\";a:0:{}s:13:\"subsites_info\";a:0:{}s:20:\"is_subdomain_install\";s:5:\"false\";}}s:4:\"code\";i:200;s:7:\"message\";s:2:\"OK\";s:4:\"body\";s:11:\"{\"error\":0}\";s:9:\"dump_path\";s:130:\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/wp-migrate-db/local-migrate-20200326222133-lplnv.sql.gz\";s:13:\"dump_filename\";s:34:\"local-migrate-20200326222133-lplnv\";s:8:\"dump_url\";s:101:\"http://pepseeactusv3.local/wp-content/uploads/wp-migrate-db/local-migrate-20200326222133-ns5bq.sql.gz\";s:10:\"db_version\";s:6:\"8.0.16\";s:8:\"site_url\";s:26:\"http://pepseeactusv3.local\";s:18:\"find_replace_pairs\";a:2:{s:11:\"replace_old\";a:1:{i:1;s:21:\"//pepseeactusv3.local\";}s:11:\"replace_new\";a:1:{i:1;s:31:\"//http://christophes.sgedu.site\";}}s:18:\"migration_state_id\";s:13:\"5e7d2aed853e2\";s:5:\"table\";s:17:\"wp_yoast_seo_meta\";s:11:\"current_row\";s:0:\"\";s:10:\"last_table\";s:1:\"1\";s:12:\"primary_keys\";s:0:\"\";s:4:\"gzip\";s:1:\"0\";}','no');
INSERT INTO `wp_options` VALUES (3131,'gc_oauth_redirect_uri','http://pepseeactusv3.local/wp-admin/options.php?graphcomment_oauth_code=true','yes');
INSERT INTO `wp_options` VALUES (3132,'gc_seo_activated','true','yes');
INSERT INTO `wp_options` VALUES (3133,'gc_api_public_key','BNeUOaigwFYyf3+OYBB9JlDCsOMJjxD+FHG4oIi+BLyBpDfTcHk=','yes');
INSERT INTO `wp_options` VALUES (3134,'gc_api_private_key','B7Vft28owTdTUWJHIl4THDqlC1GIVp5u9rOMqonwd+ulnn+l7I=','yes');
INSERT INTO `wp_options` VALUES (3135,'gc_oauth_client_key','HoJUYWPQqTjUHfN7','yes');
INSERT INTO `wp_options` VALUES (3136,'gc_oauth_client_secret','cnzvr0TmrwcsTspyKOlKM87DIuKlJtNc','yes');
INSERT INTO `wp_options` VALUES (3137,'gc_oauth_client_code','m0owmPrepLgW65hR','yes');
INSERT INTO `wp_options` VALUES (3138,'gc_oauth_client_token','4VBC9jbPHg0N3Z3YyoqnO3wy4c6QKbik0SfO7zpWL0xd9kzFy8xJkqwA32S94PUCdorBWqwnWKFF3a2rGuUBcETHCngk1JBrozmdJYJcZIEWHJzrteVPfybeaie11byW3hgxRGMnpm7RMg5awVlanIWMmcL8YdM9qA7N0TrN2jBByCKMtiuAv5fsswszX9OspIElUA5GBBYXNxOvooOg2AqxvHbYBukZ2soCiTGX5dzwx6RIch2LKUeazHVmDqDj','yes');
INSERT INTO `wp_options` VALUES (3139,'gc_sync_comments','false','yes');
INSERT INTO `wp_options` VALUES (3142,'gc_public_key','PepseeActus','yes');
INSERT INTO `wp_options` VALUES (3143,'gc_website_id','5e80f6f9bba1e11a8b7d1a2c','yes');
INSERT INTO `wp_options` VALUES (3144,'gc_activated','true','yes');
INSERT INTO `wp_options` VALUES (3145,'gc_activated_all','true','yes');
INSERT INTO `wp_options` VALUES (3157,'widget_widget-wpusb','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (3158,'widget_widget-wpusb-follow','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (3159,'wpusb_plugin_version','3.42','yes');
INSERT INTO `wp_options` VALUES (3264,'widget_youtube_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (3279,'swp_json_cache','a:3:{s:7:\"notices\";a:0:{}s:7:\"sidebar\";a:3:{i:0;s:909:\" <style> #upgrade { background-color: #30394F; } #upgrade .swp-component-cta { background: #ee464f; } .sw-admin-wrapper[swp-registrations*=\"pro\"] #upgrade { display: none; } </style> <div id=\"upgrade\" class=\"swp-component light-text\"> <div class=\"swp-component-icon\"> <span class=\"dashicons dashicons-thumbs-up\"></span> </div> <p class=\"swp-component-title\">Upgrade to Pro!</p> <p><b> + Up to 15 social networks</b> to share from!</p> <p><b> + Customize</b> how your content is shared on Pinterest, Facebook, Twitter, and more!</p> <p><b> + More style options</b> to match your site\'s design.</p> <p><b> + Click-tracking</b> so you know exactly how many clicks your share buttons are getting.</p> <p><b> + Priority support</b> for when you need help.</p> <p><b> + Much more!</b></p> <a class=\"swp-component-cta\" href=\"https://warfareplugins.com/products/social-warfare-pro/\" target=\"_blank\">UPGRADE</a> </div>\";i:1;s:4075:\" <style> #love { background-color: #71C069 } #love .swp-component-cta { background: #30394F; max-width: 200px } #love .swp-component-icon a, #love .swp-component-icon a:active, #love .swp-component-icon a:focus { text-decoration: none; color: #fff } #love .swp-component-icon>a:hover>span:before, #love .swp-component-icon>a:hover~a>span:before { content: \'\\f155\'!important } #love .swp-component-icon { unicode-bidi: bidi-override; direction: rtl } #love .swp-dialog-no-close .ui-dialog-titlebar-close { display: none } #love .swp-dialog-no-title .ui-dialog-titlebar { display: none } #support-cta { display: none } #love { font-size: 14px; line-height: 1.5 } #love .swp-component-title { margin-top: 0; margin-bottom: 20px; line-height: 1.1 } #love a, #love a:hover, #love a:focus, #love a:active { color: #fff } #love .close-modal { font-size: 18px; text-decoration: underline; cursor: pointer; } .swp-component-icon .dashicons { font-size: 22px; width: 22px; height: 22px; text-align: center } </style> <div id=\'love\' class=\'swp-component light-text text-center\'> <p class=\'swp-component-title\'>Love the Plugin?<br /> <span style=\'font-size:18px;font-weight:normal;\'>How about rating us?</span> </p> <div class=\'swp-component-icon\'><a class=\'rating-link\' target=\'_blank\' data-rating-value=\'5\' href=\'https://wordpress.org/support/plugin/social-warfare/reviews/?rate=5\'> <span class=\'dashicons dashicons-star-empty\'></span></a><a class=\'rating-link\' target=\'_blank\' data-rating-value=\'4\' href=\'https://wordpress.org/support/plugin/social-warfare/reviews/?rate=4\'> <span class=\'dashicons dashicons-star-empty\'></span></a><a class=\'rating-link\' target=\'_blank\' data-rating-value=\'3\' href=\'https://wordpress.org/support/plugin/social-warfare/reviews/?rate=3\'> <span class=\'dashicons dashicons-star-empty\'></span></a><a class=\'rating-link\' target=\'_blank\' data-rating-value=\'2\' href=\'https://wordpress.org/support/plugin/social-warfare/reviews/?rate=2\'> <span class=\'dashicons dashicons-star-empty\'></span></a><a class=\'rating-link\' target=\'_blank\' data-rating-value=\'1\' href=\'https://wordpress.org/support/plugin/social-warfare/reviews/?rate=1\'> <span class=\'dashicons dashicons-star-empty\'></span></a></div> <p>Would you mind giving us an honest review in the WordPress listings? It would mean the world to us.</p> </div> <div id=\'support-cta\'> <p>We\'re sorry you\'re not having a great experience. How can we help you fix that?</p> <p>You can email us or, even better, send us a support request so we can address your needs as quickly and effectively as possible.</p> <p><a target=\'_blank\' class=\'swp-component-cta swp-link-nojs\' href=\'https://warfareplugins.com/submit-ticket/\'>Contact Support</a></p> <p>If you still want to rate our plugin right now, you can do that by clicking here:<br /> <a href=\'#\' class=\'swp-link-nojs\' target=\'_blank\' id=\'review-link\'>leave a review</a> </p> <p><span class=\'close-modal\'>Nevermind, close this box</span></p> </div><script>\n	if (typeof jQuery !=\'function\') {\n	  console.log(\'Social Warfare requires jQuery. Please ensure that your theme does not restrict access to everyone\\\'s favorite JS libraray.\');\n	} else {\n		jQuery(document).ready(function() {\n			var originalContent = jQuery(\'#love\').html();\n			updateListeners();\n\n			function replace(el, html) {\n				el.slideToggle(300, function() {\n					el.html(html);\n					updateListeners();\n					el.slideToggle(\'slow\');\n				});\n			}\n\n			/**\n			 * Content is moved into different parent containers,\n			 * so update to fit new selectors.\n			 *\n			 */\n			function updateListeners() {\n				jQuery(\'#love .rating-link\').on(\'click\', function(e) {\n					var value = parseInt(jQuery(this).data(\'rating-value\'), 10);\n					if (isNaN(value) || value > 3) return;\n\n					e.preventDefault();\n\n					var href = jQuery(this).attr(\'href\');\n					jQuery(\'#support-cta #review-link\').attr(\'href\', href);\n\n					replace(jQuery(\'#love\'), jQuery(\'#support-cta\').html());\n				});\n\n\n				jQuery(\'.close-modal\').on(\'click\', function() {\n					replace(jQuery(\'#love\'), originalContent);\n				});\n			}\n		});\n	}\n    </script>\";i:2;s:589:\" <style> #help { background-color: #c3d3dc; } #help .swp-component-cta { background: #30394F; } </style> <div id=\"help\" class=\"swp-component dark-text text-center\"> <div class=\"swp-component-icon\"> <span class=\"dashicons dashicons-sos\"></span> </div> <p class=\"swp-component-title\">Need Help?</p> <p>You can <a href=\"https://warfareplugins.com/support/\">visit our Knowledgebase</a> to troubleshoot issues quickly.</p> <p>Opening a Support Ticket? Copy your System Status by clicking the button below.</p> <button class=\"swp-component-cta sw-system-status\">GET SYSTEM STATUS</button> </div>\";}s:9:\"timestamp\";i:1585854840;}','yes');
INSERT INTO `wp_options` VALUES (3280,'widget_swp_popular_posts_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (3281,'swp_registered_options','a:2:{s:8:\"defaults\";a:33:{s:14:\"order_of_icons\";a:5:{s:11:\"google_plus\";s:11:\"google_plus\";s:7:\"twitter\";s:7:\"twitter\";s:8:\"facebook\";s:8:\"facebook\";s:8:\"linkedin\";s:8:\"linkedin\";s:9:\"pinterest\";s:9:\"pinterest\";}s:14:\"network_shares\";b:1;s:12:\"total_shares\";b:1;s:8:\"decimals\";s:1:\"0\";s:17:\"decimal_separator\";s:6:\"period\";s:16:\"totals_alignment\";s:12:\"totals_right\";s:21:\"button_position_table\";s:1:\" \";s:15:\"Buttons Preview\";s:1:\" \";s:14:\"floating_panel\";b:0;s:14:\"float_location\";s:6:\"bottom\";s:22:\"float_background_color\";s:7:\"#ffffff\";s:18:\"float_screen_width\";s:4:\"1100\";s:10:\"transition\";s:5:\"slide\";s:20:\"float_before_content\";b:0;s:10:\"twitter_id\";s:0:\"\";s:12:\"pinterest_id\";s:0:\"\";s:22:\"facebook_publisher_url\";s:0:\"\";s:15:\"facebook_app_id\";s:0:\"\";s:16:\"gutenberg_switch\";b:1;s:12:\"frame_buster\";b:1;s:12:\"full_content\";b:0;s:13:\"location_home\";s:4:\"both\";s:27:\"location_archive_categories\";s:4:\"both\";s:13:\"location_post\";s:4:\"both\";s:19:\"float_location_post\";s:2:\"on\";s:13:\"location_page\";s:4:\"both\";s:19:\"float_location_page\";s:2:\"on\";s:15:\"location_artist\";s:4:\"both\";s:21:\"float_location_artist\";s:2:\"on\";s:14:\"location_music\";s:4:\"both\";s:20:\"float_location_music\";s:2:\"on\";s:14:\"location_album\";s:4:\"both\";s:20:\"float_location_album\";s:2:\"on\";}s:6:\"values\";a:33:{s:14:\"order_of_icons\";a:2:{s:4:\"type\";s:4:\"none\";s:6:\"values\";a:5:{s:8:\"facebook\";s:8:\"facebook\";s:8:\"linkedin\";s:8:\"linkedin\";s:3:\"mix\";s:3:\"mix\";s:9:\"pinterest\";s:9:\"pinterest\";s:7:\"twitter\";s:7:\"twitter\";}}s:14:\"network_shares\";a:2:{s:4:\"type\";s:7:\"boolean\";s:6:\"values\";a:2:{i:0;b:1;i:1;b:0;}}s:12:\"total_shares\";a:2:{s:4:\"type\";s:7:\"boolean\";s:6:\"values\";a:2:{i:0;b:1;i:1;b:0;}}s:8:\"decimals\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:3:{i:0;s:4:\"Zero\";i:1;s:3:\"One\";i:2;s:3:\"Two\";}}s:17:\"decimal_separator\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:2:{s:6:\"period\";s:6:\"Period\";s:5:\"comma\";s:5:\"Comma\";}}s:16:\"totals_alignment\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:2:{s:12:\"totals_right\";s:5:\"Right\";s:11:\"totals_left\";s:4:\"Left\";}}s:21:\"button_position_table\";a:2:{s:4:\"type\";s:4:\"none\";s:6:\"values\";a:0:{}}s:15:\"Buttons Preview\";a:2:{s:4:\"type\";s:4:\"none\";s:6:\"values\";a:0:{}}s:14:\"floating_panel\";a:2:{s:4:\"type\";s:7:\"boolean\";s:6:\"values\";a:2:{i:0;b:1;i:1;b:0;}}s:14:\"float_location\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:4:{s:3:\"top\";s:12:\"Haut de page\";s:6:\"bottom\";s:11:\"Bas de page\";s:4:\"left\";s:31:\"Sur le côté gauche de la page\";s:5:\"right\";s:29:\"On the right side of the page\";}}s:22:\"float_background_color\";a:1:{s:4:\"type\";s:4:\"text\";}s:18:\"float_screen_width\";a:1:{s:4:\"type\";s:4:\"text\";}s:10:\"transition\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:2:{s:5:\"slide\";s:12:\"Déplacement\";s:4:\"fade\";s:5:\"Fondu\";}}s:20:\"float_before_content\";a:2:{s:4:\"type\";s:7:\"boolean\";s:6:\"values\";a:2:{i:0;b:1;i:1;b:0;}}s:10:\"twitter_id\";a:1:{s:4:\"type\";s:4:\"text\";}s:12:\"pinterest_id\";a:1:{s:4:\"type\";s:4:\"text\";}s:22:\"facebook_publisher_url\";a:1:{s:4:\"type\";s:4:\"text\";}s:15:\"facebook_app_id\";a:1:{s:4:\"type\";s:4:\"text\";}s:16:\"gutenberg_switch\";a:2:{s:4:\"type\";s:7:\"boolean\";s:6:\"values\";a:2:{i:0;b:1;i:1;b:0;}}s:12:\"frame_buster\";a:2:{s:4:\"type\";s:7:\"boolean\";s:6:\"values\";a:2:{i:0;b:1;i:1;b:0;}}s:12:\"full_content\";a:2:{s:4:\"type\";s:7:\"boolean\";s:6:\"values\";a:2:{i:0;b:1;i:1;b:0;}}s:13:\"location_home\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:4:{s:5:\"above\";s:20:\"Au dessus du contenu\";s:5:\"below\";s:21:\"Au dessous du contenu\";s:4:\"both\";s:34:\"Au dessus et au dessous du contenu\";s:4:\"none\";s:25:\"Aucun / Placement manuel\";}}s:27:\"location_archive_categories\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:4:{s:5:\"above\";s:20:\"Au dessus du contenu\";s:5:\"below\";s:21:\"Au dessous du contenu\";s:4:\"both\";s:34:\"Au dessus et au dessous du contenu\";s:4:\"none\";s:25:\"Aucun / Placement manuel\";}}s:13:\"location_post\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:4:{s:5:\"above\";s:20:\"Au dessus du contenu\";s:5:\"below\";s:21:\"Au dessous du contenu\";s:4:\"both\";s:34:\"Au dessus et au dessous du contenu\";s:4:\"none\";s:25:\"Aucun / Placement manuel\";}}s:19:\"float_location_post\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:2:{s:2:\"on\";s:2:\"On\";s:3:\"off\";s:3:\"Off\";}}s:13:\"location_page\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:4:{s:5:\"above\";s:20:\"Au dessus du contenu\";s:5:\"below\";s:21:\"Au dessous du contenu\";s:4:\"both\";s:34:\"Au dessus et au dessous du contenu\";s:4:\"none\";s:25:\"Aucun / Placement manuel\";}}s:19:\"float_location_page\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:2:{s:2:\"on\";s:2:\"On\";s:3:\"off\";s:3:\"Off\";}}s:15:\"location_artist\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:4:{s:5:\"above\";s:20:\"Au dessus du contenu\";s:5:\"below\";s:21:\"Au dessous du contenu\";s:4:\"both\";s:34:\"Au dessus et au dessous du contenu\";s:4:\"none\";s:25:\"Aucun / Placement manuel\";}}s:21:\"float_location_artist\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:2:{s:2:\"on\";s:2:\"On\";s:3:\"off\";s:3:\"Off\";}}s:14:\"location_music\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:4:{s:5:\"above\";s:20:\"Au dessus du contenu\";s:5:\"below\";s:21:\"Au dessous du contenu\";s:4:\"both\";s:34:\"Au dessus et au dessous du contenu\";s:4:\"none\";s:25:\"Aucun / Placement manuel\";}}s:20:\"float_location_music\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:2:{s:2:\"on\";s:2:\"On\";s:3:\"off\";s:3:\"Off\";}}s:14:\"location_album\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:4:{s:5:\"above\";s:20:\"Au dessus du contenu\";s:5:\"below\";s:21:\"Au dessous du contenu\";s:4:\"both\";s:34:\"Au dessus et au dessous du contenu\";s:4:\"none\";s:25:\"Aucun / Placement manuel\";}}s:20:\"float_location_album\";a:2:{s:4:\"type\";s:6:\"select\";s:6:\"values\";a:2:{s:2:\"on\";s:2:\"On\";s:3:\"off\";s:3:\"Off\";}}}}','yes');
INSERT INTO `wp_options` VALUES (3298,'_transient_health-check-site-status-result','{\"good\":9,\"recommended\":9,\"critical\":2}','yes');
INSERT INTO `wp_options` VALUES (3303,'widget_followercounter','a:2:{i:2;a:19:{s:5:\"title\";s:0:\"\";s:17:\"facebook_page_url\";s:36:\"https://www.facebook.com/PepseeActus\";s:21:\"facebook_access_token\";s:253:\"EAAEZBt1PZCJTsBAKOk8YEkxEjqWlt4xG1aj0tmkH3YxCNLNeJTas6pJgmTbq22Tlgaq6fxNzIZCtbDb0fWMrvaQ3pVqiv9xhQWctc9CdM8mxmOS8NfkU02cFf75WxMSSZA8zFbbWejq7hvZBgtGCyn85qZBQ8lEFpbzTODZADT4CgW3DYDMGrZBQIIcZABPtZAopyvoRRm8UyZCwPMl4d9wLknNzK8VSSX1UM9QTNLUlCNOuZC7eIu5oC5jQ\";s:10:\"twitter_id\";s:11:\"pepseeactus\";s:8:\"gplus_id\";s:0:\"\";s:5:\"yt_id\";s:56:\"https://www.youtube.com/channel/UCrgv-BXDaZ39gdWUl_c7qHQ\";s:5:\"yt_ch\";s:24:\"UCrgv-BXDaZ39gdWUl_c7qHQ\";s:6:\"yt_key\";s:39:\"AIzaSyCz4lFnbLzDGYh3dCz7-xxX8IL8oxBMNZE\";s:7:\"yt_text\";s:9:\"Followers\";s:12:\"dribbble_url\";s:0:\"\";s:21:\"dribbble_access_token\";s:0:\"\";s:13:\"facebook_text\";s:9:\"Followers\";s:12:\"twitter_text\";s:9:\"Followers\";s:10:\"gplus_text\";s:0:\"\";s:13:\"dribbble_text\";s:0:\"\";s:12:\"consumer_key\";s:25:\"GIFnrPVigZovq40JLNz8NwZfC\";s:15:\"consumer_secret\";s:50:\"9XYwm67UwEUP6LJi878y8tHYBUXdu77cKW847VA4FhfM9WEMkr\";s:12:\"access_token\";s:50:\"131039911-L223rXXvHrLt1I4IeLrXJWIjW1Mj88sMrpRSBbjO\";s:19:\"access_token_secret\";s:45:\"fdDGlItirZCil4byj5f0AA59MprDLWTr8AkwDDPygpSk7\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (3306,'cfTwitterToken','AAAAAAAAAAAAAAAAAAAAAKMbhgAAAAAASQ8URFdsIo6U1w57uZz8N6MBlEg%3DUBEbvlrBhbx4VKQZiqEQ7BAXmWMKQ6LwDy2j6D38FVpJebVLHb','yes');
INSERT INTO `wp_options` VALUES (3411,'views_options','a:11:{s:5:\"count\";i:0;s:12:\"exclude_bots\";i:0;s:12:\"display_home\";i:0;s:14:\"display_single\";i:0;s:12:\"display_page\";i:0;s:15:\"display_archive\";i:0;s:14:\"display_search\";i:0;s:13:\"display_other\";i:0;s:8:\"use_ajax\";i:0;s:8:\"template\";s:17:\"%VIEW_COUNT% vues\";s:20:\"most_viewed_template\";s:87:\"<li><a href=\"%POST_URL%\" title=\"%POST_TITLE%\">%POST_TITLE%</a> - %VIEW_COUNT% vues</li>\";}','yes');
INSERT INTO `wp_options` VALUES (3412,'widget_views','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (3649,'_transient_sirsc-plugin-notice','1','yes');
INSERT INTO `wp_options` VALUES (3653,'yoast_migrations_free','a:1:{s:7:\"version\";s:6:\"14.8.1\";}','yes');
INSERT INTO `wp_options` VALUES (3813,'_site_transient_timeout_imagify_check_licence_1','1630363647','no');
INSERT INTO `wp_options` VALUES (3814,'_site_transient_imagify_check_licence_1','1','no');
INSERT INTO `wp_options` VALUES (3817,'_transient_timeout_wpseo_link_table_inaccessible','1630364144','no');
INSERT INTO `wp_options` VALUES (3818,'_transient_wpseo_link_table_inaccessible','0','no');
INSERT INTO `wp_options` VALUES (3819,'_transient_timeout_wpseo_meta_table_inaccessible','1630364144','no');
INSERT INTO `wp_options` VALUES (3820,'_transient_wpseo_meta_table_inaccessible','0','no');
INSERT INTO `wp_options` VALUES (3838,'disallowed_keys','','no');
INSERT INTO `wp_options` VALUES (3839,'comment_previously_approved','1','yes');
INSERT INTO `wp_options` VALUES (3840,'auto_plugin_theme_update_emails','a:0:{}','no');
INSERT INTO `wp_options` VALUES (3841,'finished_updating_comment_type','1','yes');
INSERT INTO `wp_options` VALUES (3844,'can_compress_scripts','1','no');
INSERT INTO `wp_options` VALUES (3867,'rewrite_rules','a:185:{s:19:\"sitemap_index\\.xml$\";s:19:\"index.php?sitemap=1\";s:31:\"([^/]+?)-sitemap([0-9]+)?\\.xml$\";s:51:\"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]\";s:24:\"([a-z]+)?-?sitemap\\.xsl$\";s:39:\"index.php?yoast-sitemap-xsl=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:9:\"artist/?$\";s:26:\"index.php?post_type=artist\";s:39:\"artist/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=artist&feed=$matches[1]\";s:34:\"artist/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=artist&feed=$matches[1]\";s:26:\"artist/page/([0-9]{1,})/?$\";s:44:\"index.php?post_type=artist&paged=$matches[1]\";s:8:\"music/?$\";s:25:\"index.php?post_type=music\";s:38:\"music/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=music&feed=$matches[1]\";s:33:\"music/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=music&feed=$matches[1]\";s:25:\"music/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=music&paged=$matches[1]\";s:8:\"album/?$\";s:25:\"index.php?post_type=album\";s:38:\"album/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=album&feed=$matches[1]\";s:33:\"album/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=album&feed=$matches[1]\";s:25:\"album/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=album&paged=$matches[1]\";s:45:\"(actus)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:28:\"(actus)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:10:\"(actus)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:45:\"(clips)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:28:\"(clips)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:10:\"(clips)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:14:\"category/(.+)$\";s:45:\"index.php?wpseo_category_redirect=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:34:\"artist/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"artist/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"artist/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"artist/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"artist/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"artist/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"artist/([^/]+)/embed/?$\";s:39:\"index.php?artist=$matches[1]&embed=true\";s:27:\"artist/([^/]+)/trackback/?$\";s:33:\"index.php?artist=$matches[1]&tb=1\";s:47:\"artist/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?artist=$matches[1]&feed=$matches[2]\";s:42:\"artist/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?artist=$matches[1]&feed=$matches[2]\";s:35:\"artist/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?artist=$matches[1]&paged=$matches[2]\";s:42:\"artist/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?artist=$matches[1]&cpage=$matches[2]\";s:31:\"artist/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?artist=$matches[1]&page=$matches[2]\";s:23:\"artist/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"artist/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"artist/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"artist/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"artist/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"artist/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:33:\"music/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"music/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"music/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"music/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"music/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"music/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"music/([^/]+)/embed/?$\";s:38:\"index.php?music=$matches[1]&embed=true\";s:26:\"music/([^/]+)/trackback/?$\";s:32:\"index.php?music=$matches[1]&tb=1\";s:46:\"music/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?music=$matches[1]&feed=$matches[2]\";s:41:\"music/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?music=$matches[1]&feed=$matches[2]\";s:34:\"music/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?music=$matches[1]&paged=$matches[2]\";s:41:\"music/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?music=$matches[1]&cpage=$matches[2]\";s:30:\"music/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?music=$matches[1]&page=$matches[2]\";s:22:\"music/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"music/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"music/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"music/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"music/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"music/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:33:\"album/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"album/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"album/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"album/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"album/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"album/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"album/([^/]+)/embed/?$\";s:38:\"index.php?album=$matches[1]&embed=true\";s:26:\"album/([^/]+)/trackback/?$\";s:32:\"index.php?album=$matches[1]&tb=1\";s:46:\"album/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?album=$matches[1]&feed=$matches[2]\";s:41:\"album/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?album=$matches[1]&feed=$matches[2]\";s:34:\"album/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?album=$matches[1]&paged=$matches[2]\";s:41:\"album/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?album=$matches[1]&cpage=$matches[2]\";s:30:\"album/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?album=$matches[1]&page=$matches[2]\";s:22:\"album/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"album/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"album/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"album/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"album/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"album/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"banner/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"banner/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"banner/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"banner/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"banner/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"banner/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"banner/([^/]+)/embed/?$\";s:39:\"index.php?banner=$matches[1]&embed=true\";s:27:\"banner/([^/]+)/trackback/?$\";s:33:\"index.php?banner=$matches[1]&tb=1\";s:35:\"banner/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?banner=$matches[1]&paged=$matches[2]\";s:42:\"banner/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?banner=$matches[1]&cpage=$matches[2]\";s:31:\"banner/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?banner=$matches[1]&page=$matches[2]\";s:23:\"banner/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"banner/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"banner/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"banner/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"banner/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"banner/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=53&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes');
INSERT INTO `wp_options` VALUES (4243,'_site_transient_timeout_theme_roots','1600806864','no');
INSERT INTO `wp_options` VALUES (4244,'_site_transient_theme_roots','a:5:{s:11:\"pepseeactus\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";}','no');
INSERT INTO `wp_options` VALUES (4248,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"fr_FR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.5.1.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.1-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.5.1-partial-0.zip\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:3:\"5.5\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"fr_FR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.5.1.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1600805068;s:15:\"version_checked\";s:3:\"5.5\";s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:4:\"core\";s:4:\"slug\";s:7:\"default\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 05:57:49\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/fr_FR.zip\";s:10:\"autoupdate\";b:1;}}}','no');
INSERT INTO `wp_options` VALUES (4249,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1600805068;s:7:\"checked\";a:5:{s:11:\"pepseeactus\";s:5:\"1.0.0\";s:14:\"twentynineteen\";s:3:\"1.4\";s:15:\"twentyseventeen\";s:3:\"2.2\";s:13:\"twentysixteen\";s:3:\"2.0\";s:12:\"twentytwenty\";s:3:\"1.1\";}s:8:\"response\";a:4:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.7.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:13:\"twentysixteen\";a:6:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"2.2\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.2.2.zip\";s:8:\"requires\";s:3:\"4.4\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.5.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (4250,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1600805068;s:8:\"response\";a:4:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:5:\"5.9.1\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.5.9.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.1\";s:12:\"requires_php\";s:3:\"5.6\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:44:\"graphcomment-comment-system/graphcomment.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:41:\"w.org/plugins/graphcomment-comment-system\";s:4:\"slug\";s:27:\"graphcomment-comment-system\";s:6:\"plugin\";s:44:\"graphcomment-comment-system/graphcomment.php\";s:11:\"new_version\";s:5:\"3.1.1\";s:3:\"url\";s:58:\"https://wordpress.org/plugins/graphcomment-comment-system/\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/plugin/graphcomment-comment-system.3.1.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:80:\"https://ps.w.org/graphcomment-comment-system/assets/icon-256x256.jpg?rev=1340636\";s:2:\"1x\";s:80:\"https://ps.w.org/graphcomment-comment-system/assets/icon-128x128.jpg?rev=1340639\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:83:\"https://ps.w.org/graphcomment-comment-system/assets/banner-1544x500.jpg?rev=1645594\";s:2:\"1x\";s:82:\"https://ps.w.org/graphcomment-comment-system/assets/banner-772x250.jpg?rev=1645594\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.1\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:19:\"imagify/imagify.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/imagify\";s:4:\"slug\";s:7:\"imagify\";s:6:\"plugin\";s:19:\"imagify/imagify.php\";s:11:\"new_version\";s:6:\"1.9.11\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/imagify/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/imagify.1.9.11.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:60:\"https://ps.w.org/imagify/assets/icon-256x256.png?rev=1337199\";s:2:\"1x\";s:52:\"https://ps.w.org/imagify/assets/icon.svg?rev=1337199\";s:3:\"svg\";s:52:\"https://ps.w.org/imagify/assets/icon.svg?rev=1337199\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/imagify/assets/banner-1544x500.png?rev=1839426\";s:2:\"1x\";s:62:\"https://ps.w.org/imagify/assets/banner-772x250.png?rev=1839426\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.1\";s:12:\"requires_php\";s:3:\"5.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:24:\"wordpress-seo/wp-seo.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:27:\"w.org/plugins/wordpress-seo\";s:4:\"slug\";s:13:\"wordpress-seo\";s:6:\"plugin\";s:24:\"wordpress-seo/wp-seo.php\";s:11:\"new_version\";s:4:\"14.9\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wordpress-seo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/wordpress-seo.14.9.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-256x256.png?rev=2363699\";s:2:\"1x\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=2363699\";s:3:\"svg\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=2363699\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=1843435\";s:2:\"1x\";s:68:\"https://ps.w.org/wordpress-seo/assets/banner-772x250.png?rev=1843435\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=1843435\";s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-seo/assets/banner-772x250-rtl.png?rev=1843435\";}s:6:\"tested\";s:5:\"5.5.1\";s:12:\"requires_php\";s:6:\"5.6.20\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:4:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"5.9.0\";s:7:\"updated\";s:19:\"2020-05-01 16:25:33\";s:7:\"package\";s:89:\"https://downloads.wordpress.org/translation/plugin/advanced-custom-fields/5.9.0/fr_FR.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:7:\"imagify\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:6:\"1.9.10\";s:7:\"updated\";s:19:\"2020-08-04 15:22:32\";s:7:\"package\";s:75:\"https://downloads.wordpress.org/translation/plugin/imagify/1.9.10/fr_FR.zip\";s:10:\"autoupdate\";b:1;}i:2;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:12:\"wp-postviews\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:6:\"1.76.1\";s:7:\"updated\";s:19:\"2019-10-23 03:18:59\";s:7:\"package\";s:80:\"https://downloads.wordpress.org/translation/plugin/wp-postviews/1.76.1/fr_FR.zip\";s:10:\"autoupdate\";b:1;}i:3;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:13:\"wordpress-seo\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:6:\"14.8.1\";s:7:\"updated\";s:19:\"2020-08-18 09:25:33\";s:7:\"package\";s:81:\"https://downloads.wordpress.org/translation/plugin/wordpress-seo/14.8.1/fr_FR.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:4:{s:43:\"featured-video-plus/featured-video-plus.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:33:\"w.org/plugins/featured-video-plus\";s:4:\"slug\";s:19:\"featured-video-plus\";s:6:\"plugin\";s:43:\"featured-video-plus/featured-video-plus.php\";s:11:\"new_version\";s:5:\"2.3.3\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/featured-video-plus/\";s:7:\"package\";s:68:\"https://downloads.wordpress.org/plugin/featured-video-plus.2.3.3.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:72:\"https://ps.w.org/featured-video-plus/assets/icon-256x256.png?rev=1170997\";s:2:\"1x\";s:64:\"https://ps.w.org/featured-video-plus/assets/icon.svg?rev=1170997\";s:3:\"svg\";s:64:\"https://ps.w.org/featured-video-plus/assets/icon.svg?rev=1170997\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/featured-video-plus/assets/banner-1544x500.jpg?rev=1170997\";s:2:\"1x\";s:74:\"https://ps.w.org/featured-video-plus/assets/banner-772x250.jpg?rev=1170997\";}s:11:\"banners_rtl\";a:0:{}}s:61:\"image-regenerate-select-crop/image-regenerate-select-crop.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:42:\"w.org/plugins/image-regenerate-select-crop\";s:4:\"slug\";s:28:\"image-regenerate-select-crop\";s:6:\"plugin\";s:61:\"image-regenerate-select-crop/image-regenerate-select-crop.php\";s:11:\"new_version\";s:5:\"5.4.4\";s:3:\"url\";s:59:\"https://wordpress.org/plugins/image-regenerate-select-crop/\";s:7:\"package\";s:77:\"https://downloads.wordpress.org/plugin/image-regenerate-select-crop.5.4.4.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:81:\"https://ps.w.org/image-regenerate-select-crop/assets/icon-128x128.gif?rev=2371819\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:83:\"https://ps.w.org/image-regenerate-select-crop/assets/banner-772x250.png?rev=1073288\";}s:11:\"banners_rtl\";a:0:{}}s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:35:\"w.org/plugins/regenerate-thumbnails\";s:4:\"slug\";s:21:\"regenerate-thumbnails\";s:6:\"plugin\";s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";s:11:\"new_version\";s:5:\"3.1.3\";s:3:\"url\";s:52:\"https://wordpress.org/plugins/regenerate-thumbnails/\";s:7:\"package\";s:70:\"https://downloads.wordpress.org/plugin/regenerate-thumbnails.3.1.3.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:74:\"https://ps.w.org/regenerate-thumbnails/assets/icon-128x128.png?rev=1753390\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:77:\"https://ps.w.org/regenerate-thumbnails/assets/banner-1544x500.jpg?rev=1753390\";s:2:\"1x\";s:76:\"https://ps.w.org/regenerate-thumbnails/assets/banner-772x250.jpg?rev=1753390\";}s:11:\"banners_rtl\";a:0:{}}s:29:\"wp-postviews/wp-postviews.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:26:\"w.org/plugins/wp-postviews\";s:4:\"slug\";s:12:\"wp-postviews\";s:6:\"plugin\";s:29:\"wp-postviews/wp-postviews.php\";s:11:\"new_version\";s:6:\"1.76.1\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/wp-postviews/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/wp-postviews.1.76.1.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:56:\"https://ps.w.org/wp-postviews/assets/icon.svg?rev=978002\";s:3:\"svg\";s:56:\"https://ps.w.org/wp-postviews/assets/icon.svg?rev=978002\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/wp-postviews/assets/banner-1544x500.jpg?rev=1206762\";s:2:\"1x\";s:67:\"https://ps.w.org/wp-postviews/assets/banner-772x250.jpg?rev=1206762\";}s:11:\"banners_rtl\";a:0:{}}}}','no');
INSERT INTO `wp_options` VALUES (4251,'_site_transient_timeout_php_check_472f71d2a071d463a95f84346288dc89','1601409870','no');
INSERT INTO `wp_options` VALUES (4252,'_site_transient_php_check_472f71d2a071d463a95f84346288dc89','a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no');
INSERT INTO `wp_options` VALUES (4253,'gc_notif_comments','1','yes');
INSERT INTO `wp_options` VALUES (4254,'_site_transient_timeout_available_translations','1600815875','no');
INSERT INTO `wp_options` VALUES (4255,'_site_transient_available_translations','a:122:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-07-14 06:20:07\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.2/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-28 01:53:52\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:5:\"4.7.7\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.7/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-22 18:59:07\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-12 20:34:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:6:\"4.9.15\";s:7:\"updated\";s:19:\"2019-10-29 07:54:22\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.9.15/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"5.3.3\";s:7:\"updated\";s:19:\"2020-01-22 10:57:09\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.3/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:6:\"4.8.14\";s:7:\"updated\";s:19:\"2017-10-01 12:57:10\";s:12:\"english_name\";s:20:\"Bengali (Bangladesh)\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.8.14/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-07-08 06:57:24\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.2/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:33:\"མུ་མཐུད་དུ།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-06-17 11:59:40\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.2/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-19 13:34:55\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"5.3.4\";s:7:\"updated\";s:19:\"2020-06-11 08:59:48\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.4/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 08:05:03\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-08-04 08:37:35\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.2/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsæt\";}}s:5:\"de_AT\";a:8:{s:8:\"language\";s:5:\"de_AT\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-11 15:15:37\";s:12:\"english_name\";s:16:\"German (Austria)\";s:11:\"native_name\";s:21:\"Deutsch (Österreich)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/de_AT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 06:15:21\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/5.5/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-12 07:19:06\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-12 07:19:45\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/5.5/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 06:15:02\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-25 16:35:50\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 07:31:19\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-12 23:01:02\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-03-31 22:29:33\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.2/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-18 06:40:18\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-13 18:04:27\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-13 13:34:47\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 08:22:16\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/es_ES.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 13:36:56\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/es_AR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 13:29:31\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/es_MX.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-18 07:55:25\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/es_CL.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-07-23 23:51:44\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.2/es_PE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-06-23 16:46:04\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:22:\"Español de Costa Rica\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.2/es_CR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PR\";a:8:{s:8:\"language\";s:5:\"es_PR\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-04-29 15:36:59\";s:12:\"english_name\";s:21:\"Spanish (Puerto Rico)\";s:11:\"native_name\";s:23:\"Español de Puerto Rico\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/es_PR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_UY\";a:8:{s:8:\"language\";s:5:\"es_UY\";s:7:\"version\";s:5:\"5.3.2\";s:7:\"updated\";s:19:\"2019-11-12 04:43:11\";s:12:\"english_name\";s:17:\"Spanish (Uruguay)\";s:11:\"native_name\";s:19:\"Español de Uruguay\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.2/es_UY.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:3:\"5.1\";s:7:\"updated\";s:19:\"2019-03-02 06:35:01\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.1/es_GT.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-27 23:39:16\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/es_CO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 00:04:13\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/es_VE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-12 08:38:59\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-30 17:15:08\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-31 00:06:02\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 03:52:04\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 05:57:49\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 15:01:04\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-07-25 08:39:33\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.2/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:3:\"fur\";a:8:{s:8:\"language\";s:3:\"fur\";s:7:\"version\";s:5:\"4.8.6\";s:7:\"updated\";s:19:\"2018-01-29 17:32:35\";s:12:\"english_name\";s:8:\"Friulian\";s:11:\"native_name\";s:8:\"Friulian\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.6/fur.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"fur\";i:3;s:3:\"fur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-26 22:04:40\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:5:\"4.9.8\";s:7:\"updated\";s:19:\"2018-09-14 12:33:48\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.8/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"ચાલુ રાખવું\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:5:\"4.4.2\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-29 22:21:44\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:5:\"4.9.7\";s:7:\"updated\";s:19:\"2018-06-17 09:33:44\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.7/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"जारी\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 08:38:18\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:3:\"hsb\";a:8:{s:8:\"language\";s:3:\"hsb\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-31 11:27:03\";s:12:\"english_name\";s:13:\"Upper Sorbian\";s:11:\"native_name\";s:17:\"Hornjoserbšćina\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/translation/core/5.5/hsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"hsb\";i:3;s:3:\"hsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:4:\"Dale\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-06-03 10:58:08\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.2/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-14 11:06:32\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:6:\"4.7.11\";s:7:\"updated\";s:19:\"2018-09-20 11:13:37\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.7.11/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 06:34:26\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 06:42:49\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"次へ\";}}s:5:\"jv_ID\";a:8:{s:8:\"language\";s:5:\"jv_ID\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-24 13:53:29\";s:12:\"english_name\";s:8:\"Javanese\";s:11:\"native_name\";s:9:\"Basa Jawa\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/jv_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"jv\";i:2;s:3:\"jav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Nerusaké\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"updated\";s:19:\"2020-04-30 07:54:16\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.1/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 15:15:09\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/translation/core/5.5/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"kk\";a:8:{s:8:\"language\";s:2:\"kk\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-12 08:08:32\";s:12:\"english_name\";s:6:\"Kazakh\";s:11:\"native_name\";s:19:\"Қазақ тілі\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.9.5/kk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kk\";i:2;s:3:\"kaz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Жалғастыру\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:5:\"5.0.3\";s:7:\"updated\";s:19:\"2019-01-09 07:34:10\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.0.3/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:2:\"kn\";a:8:{s:8:\"language\";s:2:\"kn\";s:7:\"version\";s:6:\"4.9.15\";s:7:\"updated\";s:19:\"2019-12-04 12:22:34\";s:12:\"english_name\";s:7:\"Kannada\";s:11:\"native_name\";s:15:\"ಕನ್ನಡ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.15/kn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kn\";i:2;s:3:\"kan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"ಮುಂದುವರಿಸು\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"5.3.4\";s:7:\"updated\";s:19:\"2020-08-22 04:31:42\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.4/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:6:\"4.9.15\";s:7:\"updated\";s:19:\"2018-12-18 14:32:44\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.9.15/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:5:\"5.2.7\";s:7:\"updated\";s:19:\"2020-07-14 08:45:32\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.7/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-07-14 08:34:14\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.2/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"5.2.3\";s:7:\"updated\";s:19:\"2019-09-08 12:57:25\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.2.3/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:43:32\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 07:29:35\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"Үргэлжлүүлэх\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:6:\"4.8.14\";s:7:\"updated\";s:19:\"2018-02-13 07:38:55\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.14/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:6:\"4.9.15\";s:7:\"updated\";s:19:\"2018-08-31 11:57:07\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.15/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.1.20\";s:7:\"updated\";s:19:\"2015-03-26 15:57:42\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.1.20/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 12:52:42\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-03-27 10:30:26\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-29 06:02:46\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 06:05:50\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-07-08 07:06:32\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/5.4.2/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:5:\"5.3.3\";s:7:\"updated\";s:19:\"2020-01-01 08:53:00\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.3/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:5:\"4.8.3\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.3/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:7:\"Punjabi\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-24 05:51:29\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.1.20\";s:7:\"updated\";s:19:\"2015-03-29 22:19:48\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.1.20/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 08:05:38\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.5/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 09:49:44\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_AO\";a:8:{s:8:\"language\";s:5:\"pt_AO\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-07-01 11:09:51\";s:12:\"english_name\";s:19:\"Portuguese (Angola)\";s:11:\"native_name\";s:20:\"Português de Angola\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.2/pt_AO.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 08:04:28\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 13:57:12\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 03:43:04\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:3:\"snd\";a:8:{s:8:\"language\";s:3:\"snd\";s:7:\"version\";s:3:\"5.3\";s:7:\"updated\";s:19:\"2019-11-12 04:37:38\";s:12:\"english_name\";s:6:\"Sindhi\";s:11:\"native_name\";s:8:\"سنڌي\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/translation/core/5.3/snd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"sd\";i:2;s:3:\"snd\";i:3;s:3:\"snd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"اڳتي هلو\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 08:11:25\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:3:\"skr\";a:8:{s:8:\"language\";s:3:\"skr\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-17 05:58:17\";s:12:\"english_name\";s:7:\"Saraiki\";s:11:\"native_name\";s:14:\"سرائیکی\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/translation/core/5.5/skr.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"skr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"جاری رکھو\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"4.9.2\";s:7:\"updated\";s:19:\"2018-01-04 13:33:13\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.2/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 11:57:13\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-12 14:55:13\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 00:07:57\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:2:\"sw\";a:8:{s:8:\"language\";s:2:\"sw\";s:7:\"version\";s:5:\"5.2.6\";s:7:\"updated\";s:19:\"2019-10-22 00:19:41\";s:12:\"english_name\";s:7:\"Swahili\";s:11:\"native_name\";s:9:\"Kiswahili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.2.6/sw.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sw\";i:2;s:3:\"swa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Endelea\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-08-22 08:23:03\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.2/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-30 02:38:08\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-08-25 21:57:22\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:5:\"4.9.5\";s:7:\"updated\";s:19:\"2018-04-12 12:31:53\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:16:\"ئۇيغۇرچە\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.9.5/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 06:44:23\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/5.5/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:5:\"5.1.6\";s:7:\"updated\";s:19:\"2020-04-09 10:48:08\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.1.6/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:6:\"5.0.10\";s:7:\"updated\";s:19:\"2019-01-23 12:32:40\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.0.10/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-07-13 09:29:34\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.2/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:3:\"5.5\";s:7:\"updated\";s:19:\"2020-09-01 06:16:45\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.5/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"5.4.2\";s:7:\"updated\";s:19:\"2020-08-03 03:32:27\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.2/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:5:\"5.3.3\";s:7:\"updated\";s:19:\"2020-03-08 12:12:22\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:16:\"香港中文版	\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.3.3/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}}','no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3024 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (2,3,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (23,16,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (24,16,'_edit_lock','1584914717:1');
INSERT INTO `wp_postmeta` VALUES (27,20,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (28,20,'_edit_lock','1584746293:1');
INSERT INTO `wp_postmeta` VALUES (29,22,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (30,22,'_edit_lock','1542059645:1');
INSERT INTO `wp_postmeta` VALUES (33,26,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (34,26,'_edit_lock','1542060790:1');
INSERT INTO `wp_postmeta` VALUES (35,28,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (36,28,'_edit_lock','1542060777:1');
INSERT INTO `wp_postmeta` VALUES (136,41,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (137,41,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (138,41,'_menu_item_object_id','20');
INSERT INTO `wp_postmeta` VALUES (139,41,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (140,41,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (141,41,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (142,41,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (143,41,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (154,43,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (155,43,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (156,43,'_menu_item_object_id','16');
INSERT INTO `wp_postmeta` VALUES (157,43,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (158,43,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (159,43,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (160,43,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (161,43,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (190,47,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (191,47,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (192,47,'_menu_item_object_id','16');
INSERT INTO `wp_postmeta` VALUES (193,47,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (194,47,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (195,47,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (196,47,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (197,47,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (217,50,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (218,50,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (219,50,'_menu_item_object_id','22');
INSERT INTO `wp_postmeta` VALUES (220,50,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (221,50,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (222,50,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (223,50,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (224,50,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (226,51,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (227,51,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (228,51,'_menu_item_object_id','20');
INSERT INTO `wp_postmeta` VALUES (229,51,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (230,51,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (231,51,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (232,51,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (233,51,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (235,52,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (236,52,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (237,52,'_menu_item_object_id','28');
INSERT INTO `wp_postmeta` VALUES (238,52,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (239,52,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (240,52,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (241,52,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (242,52,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (244,53,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (245,53,'_edit_lock','1562787779:1');
INSERT INTO `wp_postmeta` VALUES (246,55,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (247,55,'_edit_lock','1584566190:1');
INSERT INTO `wp_postmeta` VALUES (250,58,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (251,58,'_edit_lock','1542232738:1');
INSERT INTO `wp_postmeta` VALUES (252,59,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (253,59,'_edit_lock','1543353881:1');
INSERT INTO `wp_postmeta` VALUES (262,59,'event_date','20191218');
INSERT INTO `wp_postmeta` VALUES (263,59,'_event_date','field_5bec981db736e');
INSERT INTO `wp_postmeta` VALUES (264,58,'event_date','20181130');
INSERT INTO `wp_postmeta` VALUES (265,58,'_event_date','field_5bec981db736e');
INSERT INTO `wp_postmeta` VALUES (266,64,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (267,64,'_edit_lock','1542747666:1');
INSERT INTO `wp_postmeta` VALUES (268,66,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (269,66,'_edit_lock','1542746946:1');
INSERT INTO `wp_postmeta` VALUES (270,66,'event_date','20151230');
INSERT INTO `wp_postmeta` VALUES (271,66,'_event_date','field_5bec981db736e');
INSERT INTO `wp_postmeta` VALUES (272,67,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (273,67,'_edit_lock','1564154696:1');
INSERT INTO `wp_postmeta` VALUES (274,68,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (275,68,'_edit_lock','1564155728:1');
INSERT INTO `wp_postmeta` VALUES (276,69,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (277,69,'_edit_lock','1564155707:1');
INSERT INTO `wp_postmeta` VALUES (278,70,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (279,70,'_edit_lock','1588195278:1');
INSERT INTO `wp_postmeta` VALUES (280,59,'artistes_associes','a:2:{i:0;s:2:\"68\";i:1;s:2:\"69\";}');
INSERT INTO `wp_postmeta` VALUES (281,59,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (282,72,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (283,72,'_edit_lock','1585094119:1');
INSERT INTO `wp_postmeta` VALUES (284,73,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (285,73,'_edit_lock','1585094110:1');
INSERT INTO `wp_postmeta` VALUES (286,72,'artistes_associes','a:1:{i:0;s:3:\"154\";}');
INSERT INTO `wp_postmeta` VALUES (287,72,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (288,73,'artistes_associes','a:1:{i:0;s:3:\"154\";}');
INSERT INTO `wp_postmeta` VALUES (289,73,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (298,80,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (299,80,'_edit_lock','1564155686:1');
INSERT INTO `wp_postmeta` VALUES (303,82,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (304,82,'_edit_lock','1588195362:1');
INSERT INTO `wp_postmeta` VALUES (307,67,'sous_titre_page','Révélation de l\'année 2017');
INSERT INTO `wp_postmeta` VALUES (308,67,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (309,67,'image_arriere_plan','85');
INSERT INTO `wp_postmeta` VALUES (310,67,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (316,20,'sous_titre_page','The Caribbean Flavour');
INSERT INTO `wp_postmeta` VALUES (317,20,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (318,20,'image_arriere_plan','87');
INSERT INTO `wp_postmeta` VALUES (319,20,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (320,88,'sous_titre_page','The Caribbean Flavour');
INSERT INTO `wp_postmeta` VALUES (321,88,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (322,88,'image_arriere_plan','87');
INSERT INTO `wp_postmeta` VALUES (323,88,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (324,89,'sous_titre_page','The Caribbean Flavour');
INSERT INTO `wp_postmeta` VALUES (325,89,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (326,89,'image_arriere_plan','87');
INSERT INTO `wp_postmeta` VALUES (327,89,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (443,55,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (444,55,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (445,55,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (446,55,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (447,60,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (448,60,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (449,60,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (450,60,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (451,55,'_yoast_wpseo_primary_category','5');
INSERT INTO `wp_postmeta` VALUES (452,55,'_yoast_wpseo_content_score','30');
INSERT INTO `wp_postmeta` VALUES (457,118,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (458,118,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (459,118,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (460,118,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (463,120,'_edit_lock','1588194513:1');
INSERT INTO `wp_postmeta` VALUES (474,120,'_oembed_1eb2c20af50ba30670b3a146eff361ff','<iframe title=\"Admiral T Ft. Krys - Boss Lady\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/BZyQnxRX7xE?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (475,120,'_oembed_time_1eb2c20af50ba30670b3a146eff361ff','1563726686');
INSERT INTO `wp_postmeta` VALUES (476,120,'_oembed_6359a9a3b5204fbdf5df6d06ec05dee9','<iframe title=\"Admiral T Ft. Were Vana - Baimbridge Cho\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/rKgvYzardtc?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (477,120,'_oembed_time_6359a9a3b5204fbdf5df6d06ec05dee9','1563726687');
INSERT INTO `wp_postmeta` VALUES (481,120,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (484,120,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (485,120,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (486,120,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (487,120,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (488,125,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (489,125,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (490,125,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (491,125,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (492,120,'_yoast_wpseo_primary_category','5');
INSERT INTO `wp_postmeta` VALUES (493,120,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (494,126,'_edit_lock','1585179771:1');
INSERT INTO `wp_postmeta` VALUES (503,126,'_oembed_2b052513c48420d71d6bd575f483d9db','<iframe title=\"SAÏK - RED BULL [ Clip Officiel 2019 ]\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/OR1SsoxcuLg?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (504,126,'_oembed_time_2b052513c48420d71d6bd575f483d9db','1563727249');
INSERT INTO `wp_postmeta` VALUES (505,126,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (508,126,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (509,126,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (510,126,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (511,126,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (512,128,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (513,128,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (514,128,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (515,128,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (516,126,'_yoast_wpseo_primary_category','5');
INSERT INTO `wp_postmeta` VALUES (517,126,'_yoast_wpseo_content_score','90');
INSERT INTO `wp_postmeta` VALUES (522,130,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (523,130,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (524,130,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (525,130,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (526,126,'_oembed_47b347c936f22c6e3a26fd6f945176bc','<iframe title=\"SAÏK - RED BULL [ Clip Officiel 2019 ]\" width=\"840\" height=\"473\" src=\"https://www.youtube.com/embed/OR1SsoxcuLg?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (527,126,'_oembed_time_47b347c936f22c6e3a26fd6f945176bc','1563731643');
INSERT INTO `wp_postmeta` VALUES (528,120,'_oembed_ba168eb484c8b4960a4f93958fb128d0','<iframe title=\"Admiral T Ft. Krys - Boss Lady\" width=\"840\" height=\"473\" src=\"https://www.youtube.com/embed/BZyQnxRX7xE?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (529,120,'_oembed_time_ba168eb484c8b4960a4f93958fb128d0','1563731643');
INSERT INTO `wp_postmeta` VALUES (530,120,'_oembed_34849133467ceabdfd34768a47eb15cf','<iframe title=\"Admiral T Ft. Were Vana - Baimbridge Cho\" width=\"840\" height=\"473\" src=\"https://www.youtube.com/embed/rKgvYzardtc?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (531,120,'_oembed_time_34849133467ceabdfd34768a47eb15cf','1563731643');
INSERT INTO `wp_postmeta` VALUES (539,134,'_edit_lock','1584708360:1');
INSERT INTO `wp_postmeta` VALUES (542,134,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (545,134,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (546,134,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (547,134,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (548,134,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (549,135,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (550,135,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (551,135,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (552,135,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (553,134,'_oembed_c66f3677dcbd60fecbe19fd1e494d641','<iframe title=\"VaLLeY - PAPA -  [ Official Vidéo 2019 ]\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/Zs_RW-3kS_A?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (554,134,'_oembed_time_c66f3677dcbd60fecbe19fd1e494d641','1564144690');
INSERT INTO `wp_postmeta` VALUES (555,134,'_yoast_wpseo_primary_category','15');
INSERT INTO `wp_postmeta` VALUES (556,134,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (561,134,'_fvp_video','a:12:{s:5:\"valid\";b:1;s:3:\"img\";i:305;s:2:\"id\";N;s:8:\"provider\";s:7:\"youtube\";s:5:\"title\";s:41:\"VaLLeY - PAPA -  [ Official Vidéo 2019 ]\";s:6:\"author\";s:14:\"VaLLeYOfficiel\";s:11:\"description\";N;s:7:\"img_url\";s:48:\"https://i.ytimg.com/vi/Zs_RW-3kS_A/hqdefault.jpg\";s:8:\"filename\";s:41:\"VaLLeY - PAPA -  [ Official Vidéo 2019 ]\";s:4:\"full\";s:28:\"https://youtu.be/Zs_RW-3kS_A\";s:10:\"parameters\";a:0:{}s:5:\"noimg\";b:0;}');
INSERT INTO `wp_postmeta` VALUES (569,138,'_edit_lock','1588444873:1');
INSERT INTO `wp_postmeta` VALUES (574,138,'_fvp_video','a:12:{s:5:\"valid\";b:1;s:3:\"img\";i:304;s:2:\"id\";N;s:8:\"provider\";s:7:\"youtube\";s:5:\"title\";s:24:\"KEROS-N - MISS DOLIPRANE\";s:6:\"author\";s:17:\"JUTSU MEDIA GROUP\";s:11:\"description\";N;s:7:\"img_url\";s:48:\"https://i.ytimg.com/vi/AKl3PerNl34/hqdefault.jpg\";s:8:\"filename\";s:24:\"KEROS-N - MISS DOLIPRANE\";s:4:\"full\";s:43:\"https://www.youtube.com/watch?v=AKl3PerNl34\";s:10:\"parameters\";a:0:{}s:5:\"noimg\";b:0;}');
INSERT INTO `wp_postmeta` VALUES (580,138,'_oembed_ffd016391f44316e87afb7ad1f139e97','<iframe title=\"KEROS-N - MISS DOLIPRANE\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/AKl3PerNl34?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (581,138,'_oembed_time_ffd016391f44316e87afb7ad1f139e97','1564146935');
INSERT INTO `wp_postmeta` VALUES (582,138,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (585,138,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (586,138,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (587,138,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (588,138,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (589,140,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (590,140,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (591,140,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (592,140,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (593,138,'_yoast_wpseo_primary_category','15');
INSERT INTO `wp_postmeta` VALUES (594,138,'_yoast_wpseo_content_score','30');
INSERT INTO `wp_postmeta` VALUES (595,142,'_edit_lock','1584708243:1');
INSERT INTO `wp_postmeta` VALUES (606,142,'_oembed_fa265f2d8c857a0f2cdce7363cc71242','<iframe title=\"SHANNON - BEST ( OFFICIAL MUSIC VIDEO )\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/rMr1VpThH8U?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (607,142,'_oembed_time_fa265f2d8c857a0f2cdce7363cc71242','1564147155');
INSERT INTO `wp_postmeta` VALUES (608,142,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (611,142,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (612,142,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (613,142,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (614,142,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (615,144,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (616,144,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (617,144,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (618,144,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (619,142,'_yoast_wpseo_primary_category','15');
INSERT INTO `wp_postmeta` VALUES (620,142,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (631,67,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (632,80,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (633,80,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (634,80,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (635,80,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (636,80,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (637,69,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (638,69,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (639,69,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (640,69,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (641,69,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (642,68,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (643,68,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (644,68,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (645,68,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (646,68,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (653,147,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (654,147,'_edit_lock','1588366256:1');
INSERT INTO `wp_postmeta` VALUES (655,151,'_edit_lock','1585095200:1');
INSERT INTO `wp_postmeta` VALUES (656,151,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (657,151,'date_de_naissance','19880612');
INSERT INTO `wp_postmeta` VALUES (658,151,'_date_de_naissance','field_5d3c31e2d136c');
INSERT INTO `wp_postmeta` VALUES (659,151,'nom_complet','Kévin VALLERAY');
INSERT INTO `wp_postmeta` VALUES (660,151,'_nom_complet','field_5d3c328bd136d');
INSERT INTO `wp_postmeta` VALUES (661,151,'biographie','');
INSERT INTO `wp_postmeta` VALUES (662,151,'_biographie','field_5d3c32dcd136e');
INSERT INTO `wp_postmeta` VALUES (663,151,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (664,151,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (665,151,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (666,151,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (667,151,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (703,152,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (704,152,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (705,152,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (706,152,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (725,154,'_edit_lock','1588366356:1');
INSERT INTO `wp_postmeta` VALUES (733,154,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (734,154,'date_de_naissance','19900602');
INSERT INTO `wp_postmeta` VALUES (735,154,'_date_de_naissance','field_5d3c31e2d136c');
INSERT INTO `wp_postmeta` VALUES (736,154,'nom_complet','Yannick SEBASTIEN');
INSERT INTO `wp_postmeta` VALUES (737,154,'_nom_complet','field_5d3c328bd136d');
INSERT INTO `wp_postmeta` VALUES (738,154,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (739,154,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (740,154,'image_arriere_plan','353');
INSERT INTO `wp_postmeta` VALUES (741,154,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (742,154,'_yoast_wpseo_content_score','30');
INSERT INTO `wp_postmeta` VALUES (743,72,'_oembed_9468f443e50afe95276d2730560831b0','<iframe title=\"Mel Feat JmaX  - &quot; Touch Me &quot; REMIX\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/oSQO-6xvPis?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (744,72,'_oembed_time_9468f443e50afe95276d2730560831b0','1564231358');
INSERT INTO `wp_postmeta` VALUES (745,72,'_oembed_95b52abc1ceec859b9931040dc647d02','<iframe title=\"Spotify Embed: Touch Me - Remix\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/track/3GTes8tWU3OzonlsWM9yVX\"></iframe>');
INSERT INTO `wp_postmeta` VALUES (746,72,'_oembed_time_95b52abc1ceec859b9931040dc647d02','1564231358');
INSERT INTO `wp_postmeta` VALUES (747,72,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (748,72,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (749,72,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (750,72,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (751,72,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (752,158,'_edit_lock','1584520559:1');
INSERT INTO `wp_postmeta` VALUES (753,158,'_oembed_0054a65b9b34f908a011ff0cf38dc28e','<iframe title=\"Spotify Embed: JTC\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/track/2IlBgMGbkKDfu7qveyT9AB\"></iframe>');
INSERT INTO `wp_postmeta` VALUES (754,158,'_oembed_time_0054a65b9b34f908a011ff0cf38dc28e','1584520559');
INSERT INTO `wp_postmeta` VALUES (755,158,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (756,158,'artistes_associes','a:1:{i:0;s:2:\"68\";}');
INSERT INTO `wp_postmeta` VALUES (757,158,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (758,158,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (759,158,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (760,158,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (761,158,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (762,158,'_yoast_wpseo_content_score','90');
INSERT INTO `wp_postmeta` VALUES (770,161,'_edit_lock','1599176530:1');
INSERT INTO `wp_postmeta` VALUES (771,161,'_oembed_809a9eb9afd831ff946fc0b55ba08881','<iframe title=\"Spotify Embed: Praliné\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/track/6isv2O2hymNpNZJTklSwvi\"></iframe>');
INSERT INTO `wp_postmeta` VALUES (772,161,'_oembed_time_809a9eb9afd831ff946fc0b55ba08881','1584520369');
INSERT INTO `wp_postmeta` VALUES (780,161,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (781,161,'artistes_associes','a:1:{i:0;s:2:\"68\";}');
INSERT INTO `wp_postmeta` VALUES (782,161,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (783,161,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (784,161,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (785,161,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (786,161,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (787,161,'_yoast_wpseo_content_score','90');
INSERT INTO `wp_postmeta` VALUES (788,164,'_edit_lock','1584520080:1');
INSERT INTO `wp_postmeta` VALUES (796,164,'_oembed_29208f341622a97c4aa0f89ebd1f64ea','<iframe title=\"Spotify Embed: Boss lady\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/album/62BNyfTzEuMulTeegKCRG1\"></iframe>');
INSERT INTO `wp_postmeta` VALUES (797,164,'_oembed_time_29208f341622a97c4aa0f89ebd1f64ea','1584520060');
INSERT INTO `wp_postmeta` VALUES (798,164,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (799,164,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (800,164,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (801,164,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (802,164,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (803,164,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (804,164,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (805,164,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (806,167,'_edit_lock','1584519881:1');
INSERT INTO `wp_postmeta` VALUES (807,167,'_oembed_becccbb982fa4e21d2fe2aa282adc206','<iframe title=\"Spotify Embed: Baimbridge cho\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/album/4K5z5W8ZsGQxVsgMAL4D7f\"></iframe>');
INSERT INTO `wp_postmeta` VALUES (808,167,'_oembed_time_becccbb982fa4e21d2fe2aa282adc206','1584519881');
INSERT INTO `wp_postmeta` VALUES (816,167,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (817,167,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (818,167,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (819,167,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (820,167,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (821,167,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (822,167,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (823,167,'_yoast_wpseo_content_score','90');
INSERT INTO `wp_postmeta` VALUES (824,73,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (825,73,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (826,73,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (827,73,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (828,73,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (830,171,'_edit_lock','1584519655:1');
INSERT INTO `wp_postmeta` VALUES (838,171,'_oembed_d4bb8ccb5142894395e1b2e2ec496428','<iframe title=\"Spotify Embed: BEST\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/album/7uD2YX1KX3OZm1PGDy4Wc7\"></iframe>');
INSERT INTO `wp_postmeta` VALUES (839,171,'_oembed_time_d4bb8ccb5142894395e1b2e2ec496428','1584519655');
INSERT INTO `wp_postmeta` VALUES (840,171,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (841,171,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (842,171,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (843,171,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (844,171,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (845,171,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (846,171,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (847,171,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (848,154,'dpsp_networks_shares','s:113:\"s:104:\"s:96:\"s:88:\"s:80:\"s:72:\"s:64:\"s:56:\"s:48:\"a:2:{s:7:\"twitter\";s:1:\"0\";s:9:\"pinterest\";i:0;}\";\";\";\";\";\";\";\";\";');
INSERT INTO `wp_postmeta` VALUES (849,154,'dpsp_networks_shares_total','0');
INSERT INTO `wp_postmeta` VALUES (850,154,'dpsp_networks_shares_last_updated','1564237420');
INSERT INTO `wp_postmeta` VALUES (851,167,'dpsp_networks_shares','a:2:{s:7:\"twitter\";i:0;s:9:\"pinterest\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (852,167,'dpsp_networks_shares_total','0');
INSERT INTO `wp_postmeta` VALUES (853,167,'dpsp_networks_shares_last_updated','1564237543');
INSERT INTO `wp_postmeta` VALUES (854,167,'dpsp_cache_shares_twitter_2','0');
INSERT INTO `wp_postmeta` VALUES (869,73,'_oembed_10926389a9b869d1e3ea2bfdad666725','<iframe title=\"Lorenz feat Jmax - Luv Me [CLIP OFFICIEL] #LUVME\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/OTCw5e94ehg?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (870,73,'_oembed_time_10926389a9b869d1e3ea2bfdad666725','1584485835');
INSERT INTO `wp_postmeta` VALUES (889,180,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (890,180,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (891,180,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (892,180,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (955,154,'compte_verifie','1');
INSERT INTO `wp_postmeta` VALUES (956,154,'_compte_verifie','field_5e6fef2c41455');
INSERT INTO `wp_postmeta` VALUES (957,154,'twitter','https://twitter.com/JmaXBrvtmn');
INSERT INTO `wp_postmeta` VALUES (958,154,'_twitter','field_5e6fedc241452');
INSERT INTO `wp_postmeta` VALUES (959,154,'instagram','https://www.instagram.com/jmax_officiel');
INSERT INTO `wp_postmeta` VALUES (960,154,'_instagram','field_5e6fee7041453');
INSERT INTO `wp_postmeta` VALUES (961,154,'facebook','https://www.facebook.com/JmaXOfficiel');
INSERT INTO `wp_postmeta` VALUES (962,154,'_facebook','field_5e6feee241454');
INSERT INTO `wp_postmeta` VALUES (963,154,'youtube','https://www.youtube.com/channel/UC0gnV5rOkRoMRcKNlqtN9Sw');
INSERT INTO `wp_postmeta` VALUES (964,154,'_youtube','field_5e6feff541456');
INSERT INTO `wp_postmeta` VALUES (967,197,'_wp_attached_file','2019/07/57726635_2520837081279801_5716810562868871168_o.jpg');
INSERT INTO `wp_postmeta` VALUES (968,197,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1080;s:6:\"height\";i:604;s:4:\"file\";s:59:\"2019/07/57726635_2520837081279801_5716810562868871168_o.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"57726635_2520837081279801_5716810562868871168_o-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"57726635_2520837081279801_5716810562868871168_o-300x168.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:168;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"57726635_2520837081279801_5716810562868871168_o-768x430.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:430;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:60:\"57726635_2520837081279801_5716810562868871168_o-1024x573.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:573;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:59:\"57726635_2520837081279801_5716810562868871168_o-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:59:\"57726635_2520837081279801_5716810562868871168_o-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (969,197,'_wp_attachment_image_alt','jmax');
INSERT INTO `wp_postmeta` VALUES (970,154,'_thumbnail_id','197');
INSERT INTO `wp_postmeta` VALUES (971,198,'_wp_attached_file','2018/11/3614977940763_600-1.jpg');
INSERT INTO `wp_postmeta` VALUES (972,198,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:600;s:6:\"height\";i:600;s:4:\"file\";s:31:\"2018/11/3614977940763_600-1.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"3614977940763_600-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"3614977940763_600-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:31:\"3614977940763_600-1-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:31:\"3614977940763_600-1-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:31:\"3614977940763_600-1-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:31:\"3614977940763_600-1-600x350.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (973,198,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (974,198,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (975,198,'_imagify_data','a:2:{s:5:\"sizes\";a:8:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:46105;s:14:\"optimized_size\";i:27530;s:7:\"percent\";d:40.289999999999999;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:12030;s:14:\"optimized_size\";i:8146;s:7:\"percent\";d:32.289999999999999;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:34702;s:14:\"optimized_size\";i:20946;s:7:\"percent\";d:39.640000000000001;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:36824;s:14:\"optimized_size\";i:20536;s:7:\"percent\";d:44.229999999999997;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:23530;s:14:\"optimized_size\";i:15136;s:7:\"percent\";d:35.670000000000002;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7654;s:14:\"optimized_size\";i:5108;s:7:\"percent\";d:33.259999999999998;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:61932;s:14:\"optimized_size\";i:38026;s:7:\"percent\";d:38.600000000000001;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:222777;s:14:\"optimized_size\";i:135428;s:7:\"percent\";d:39.210000000000001;}}');
INSERT INTO `wp_postmeta` VALUES (976,198,'_wp_attachment_image_alt','jmax mel touch me remix');
INSERT INTO `wp_postmeta` VALUES (977,72,'_thumbnail_id','198');
INSERT INTO `wp_postmeta` VALUES (978,199,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (979,199,'_edit_lock','1584534246:1');
INSERT INTO `wp_postmeta` VALUES (980,154,'musique_associees','a:4:{i:0;s:3:\"216\";i:1;s:2:\"73\";i:2;s:2:\"72\";i:3;s:3:\"211\";}');
INSERT INTO `wp_postmeta` VALUES (981,154,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (982,201,'_wp_attached_file','2018/11/A1YXVkG409L._SS500_-1.jpg');
INSERT INTO `wp_postmeta` VALUES (983,201,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:500;s:6:\"height\";i:500;s:4:\"file\";s:33:\"2018/11/A1YXVkG409L._SS500_-1.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"A1YXVkG409L._SS500_-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:33:\"A1YXVkG409L._SS500_-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:33:\"A1YXVkG409L._SS500_-1-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:33:\"A1YXVkG409L._SS500_-1-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:33:\"A1YXVkG409L._SS500_-1-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:33:\"A1YXVkG409L._SS500_-1-500x350.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (984,201,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (985,201,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (986,201,'_imagify_data','a:2:{s:5:\"sizes\";a:8:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:57542;s:14:\"optimized_size\";i:39368;s:7:\"percent\";d:31.579999999999998;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:16482;s:14:\"optimized_size\";i:11862;s:7:\"percent\";d:28.030000000000001;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:48647;s:14:\"optimized_size\";i:31768;s:7:\"percent\";d:34.700000000000003;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:62517;s:14:\"optimized_size\";i:42380;s:7:\"percent\";d:32.210000000000001;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:31612;s:14:\"optimized_size\";i:21542;s:7:\"percent\";d:31.850000000000001;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:10449;s:14:\"optimized_size\";i:7528;s:7:\"percent\";d:27.949999999999999;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:66942;s:14:\"optimized_size\";i:50522;s:7:\"percent\";d:24.530000000000001;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:294191;s:14:\"optimized_size\";i:204970;s:7:\"percent\";d:30.329999999999998;}}');
INSERT INTO `wp_postmeta` VALUES (987,201,'_wp_attachment_image_alt','lorenz jmax luv me');
INSERT INTO `wp_postmeta` VALUES (988,73,'_thumbnail_id','201');
INSERT INTO `wp_postmeta` VALUES (989,203,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (990,203,'_edit_lock','1588367038:1');
INSERT INTO `wp_postmeta` VALUES (991,72,'spotify','https://open.spotify.com/album/1yOgQW6N8vM0T2MmUiAAAh?highlight=spotify:track:0N5u0cBQETMR3H3uH9FG9K');
INSERT INTO `wp_postmeta` VALUES (992,72,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (993,72,'download','');
INSERT INTO `wp_postmeta` VALUES (994,72,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (995,72,'deezer','https://www.deezer.com/fr/track/417246122');
INSERT INTO `wp_postmeta` VALUES (996,72,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (997,72,'youtube','https://www.youtube.com/watch?v=oSQO-6xvPis');
INSERT INTO `wp_postmeta` VALUES (998,72,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (999,72,'google_play_music','https://play.google.com/music/preview/Tjhraexh26l3cju7y5fir3sg5k4');
INSERT INTO `wp_postmeta` VALUES (1000,72,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (1001,72,'tidal','');
INSERT INTO `wp_postmeta` VALUES (1002,72,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (1003,72,'soundcloud','https://soundcloud.com/user-852930298/touch-me-remix');
INSERT INTO `wp_postmeta` VALUES (1004,72,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (1005,211,'_edit_lock','1585094100:1');
INSERT INTO `wp_postmeta` VALUES (1006,212,'_wp_attached_file','2020/03/jmax_yanii_dans_la_peau.jpg');
INSERT INTO `wp_postmeta` VALUES (1007,212,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:400;s:6:\"height\";i:400;s:4:\"file\";s:35:\"2020/03/jmax_yanii_dans_la_peau.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"jmax_yanii_dans_la_peau-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"jmax_yanii_dans_la_peau-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:35:\"jmax_yanii_dans_la_peau-380x400.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:35:\"jmax_yanii_dans_la_peau-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:35:\"jmax_yanii_dans_la_peau-400x350.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1008,212,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1009,212,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (1010,212,'_imagify_data','a:2:{s:5:\"sizes\";a:7:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:16027;s:14:\"optimized_size\";i:7278;s:7:\"percent\";d:54.590000000000003;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:6498;s:14:\"optimized_size\";i:3310;s:7:\"percent\";d:49.060000000000002;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:16718;s:14:\"optimized_size\";i:7192;s:7:\"percent\";d:56.979999999999997;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11076;s:14:\"optimized_size\";i:5084;s:7:\"percent\";d:54.100000000000001;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4379;s:14:\"optimized_size\";i:2252;s:7:\"percent\";d:48.57;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11880;s:14:\"optimized_size\";i:7110;s:7:\"percent\";d:40.149999999999999;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:66578;s:14:\"optimized_size\";i:32226;s:7:\"percent\";d:51.600000000000001;}}');
INSERT INTO `wp_postmeta` VALUES (1011,212,'_wp_attachment_image_alt','jmax yanii dans la peau');
INSERT INTO `wp_postmeta` VALUES (1012,211,'_oembed_d67da5342c438b876df6b498fd159967','<iframe title=\"Yanii Feat JmaX - Dans la Peau\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/RAJClSlSpHE?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (1013,211,'_oembed_time_d67da5342c438b876df6b498fd159967','1584517805');
INSERT INTO `wp_postmeta` VALUES (1014,211,'_wp_old_date','2020-03-18');
INSERT INTO `wp_postmeta` VALUES (1015,211,'_thumbnail_id','212');
INSERT INTO `wp_postmeta` VALUES (1016,211,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1017,211,'artistes_associes','a:1:{i:0;s:3:\"154\";}');
INSERT INTO `wp_postmeta` VALUES (1018,211,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1019,211,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1020,211,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (1021,211,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1022,211,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (1023,211,'download','');
INSERT INTO `wp_postmeta` VALUES (1024,211,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (1025,211,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (1026,211,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (1027,211,'youtube','https://www.youtube.com/watch?v=RAJClSlSpHE');
INSERT INTO `wp_postmeta` VALUES (1028,211,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (1029,211,'spotify','https://open.spotify.com/album/6vJXG1NXDy9XbTSKM1MqMv');
INSERT INTO `wp_postmeta` VALUES (1030,211,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (1031,211,'deezer','https://www.deezer.com/en/album/109875202');
INSERT INTO `wp_postmeta` VALUES (1032,211,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (1033,211,'google_play_music','https://play.google.com/music/preview/Tl7yq5kgqbtrf2cudfsff62zdkq');
INSERT INTO `wp_postmeta` VALUES (1034,211,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (1035,211,'tidal','');
INSERT INTO `wp_postmeta` VALUES (1036,211,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (1037,211,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (1038,211,'_wp_old_date','2019-09-11');
INSERT INTO `wp_postmeta` VALUES (1039,211,'apple_music','https://music.apple.com/fr/album/dans-la-peau-feat-jmax-single/1478900537');
INSERT INTO `wp_postmeta` VALUES (1040,211,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (1041,216,'_edit_lock','1588541242:1');
INSERT INTO `wp_postmeta` VALUES (1042,217,'_wp_attached_file','2020/03/jmax_darling.jpeg');
INSERT INTO `wp_postmeta` VALUES (1043,217,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:400;s:6:\"height\";i:400;s:4:\"file\";s:25:\"2020/03/jmax_darling.jpeg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"jmax_darling-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"jmax_darling-300x300.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:25:\"jmax_darling-380x400.jpeg\";s:5:\"width\";i:380;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:25:\"jmax_darling-200x200.jpeg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:25:\"jmax_darling-400x350.jpeg\";s:5:\"width\";i:400;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1044,217,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1045,217,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1046,217,'_imagify_data','a:2:{s:5:\"sizes\";a:12:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:25812;s:14:\"optimized_size\";i:20983;s:7:\"percent\";d:18.710000000000001;}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:24474;s:14:\"optimized_size\";i:11382;s:7:\"percent\";d:53.490000000000002;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:9344;s:14:\"optimized_size\";i:4918;s:7:\"percent\";d:47.369999999999997;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:25179;s:14:\"optimized_size\";i:11862;s:7:\"percent\";d:52.890000000000001;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:16393;s:14:\"optimized_size\";i:7636;s:7:\"percent\";d:53.420000000000002;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:5977;s:14:\"optimized_size\";i:3184;s:7:\"percent\";d:46.729999999999997;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:25812;s:14:\"optimized_size\";i:11424;s:7:\"percent\";d:55.740000000000002;}s:9:\"thumbnail\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:5977;s:14:\"optimized_size\";i:4747;s:7:\"percent\";d:20.579999999999998;}s:6:\"medium\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:16393;s:14:\"optimized_size\";i:12109;s:7:\"percent\";d:26.129999999999999;}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:25179;s:14:\"optimized_size\";i:18862;s:7:\"percent\";d:25.09;}s:17:\"pepseeactus-Music\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:9344;s:14:\"optimized_size\";i:7451;s:7:\"percent\";d:20.260000000000002;}s:9:\"bannière\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:24474;s:14:\"optimized_size\";i:18193;s:7:\"percent\";d:25.66;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:214358;s:14:\"optimized_size\";i:132751;s:7:\"percent\";d:38.07;}}');
INSERT INTO `wp_postmeta` VALUES (1047,217,'_wp_attachment_image_alt','jmax darling');
INSERT INTO `wp_postmeta` VALUES (1048,216,'_wp_old_date','2020-03-18');
INSERT INTO `wp_postmeta` VALUES (1049,216,'_thumbnail_id','217');
INSERT INTO `wp_postmeta` VALUES (1050,216,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1051,216,'artistes_associes','a:1:{i:0;s:3:\"154\";}');
INSERT INTO `wp_postmeta` VALUES (1052,216,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1053,216,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1054,216,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (1055,216,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1056,216,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (1057,216,'download','');
INSERT INTO `wp_postmeta` VALUES (1058,216,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (1059,216,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (1060,216,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (1061,216,'youtube','');
INSERT INTO `wp_postmeta` VALUES (1062,216,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (1063,216,'spotify','https://open.spotify.com/album/5ZNBB13oewZ9ykZ3F7L9rY?si=N8oxOkJMToCtEcHHGRDUTQ');
INSERT INTO `wp_postmeta` VALUES (1064,216,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (1065,216,'deezer','');
INSERT INTO `wp_postmeta` VALUES (1066,216,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (1067,216,'apple_music','https://music.apple.com/fr/album/darling-acoustic-single/1501740115');
INSERT INTO `wp_postmeta` VALUES (1068,216,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (1069,216,'google_play_music','https://play.google.com/store/music/album?id=Bjpxvolspjgliliu4ubl7dilq5y&tid=song-Tkfymikzca7d5ezs2llr5isumua&hl=en_US');
INSERT INTO `wp_postmeta` VALUES (1070,216,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (1071,216,'tidal','');
INSERT INTO `wp_postmeta` VALUES (1072,216,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (1073,216,'_yoast_wpseo_content_score','90');
INSERT INTO `wp_postmeta` VALUES (1074,216,'artistes','JmaX');
INSERT INTO `wp_postmeta` VALUES (1075,216,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (1076,216,'titre','Darling (Acoustic)');
INSERT INTO `wp_postmeta` VALUES (1077,216,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (1078,211,'artistes','Yanii x JmaX');
INSERT INTO `wp_postmeta` VALUES (1079,211,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (1080,211,'titre','Dans La Peau');
INSERT INTO `wp_postmeta` VALUES (1081,211,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (1082,220,'_wp_attached_file','2019/07/shannon-best.jpeg');
INSERT INTO `wp_postmeta` VALUES (1083,220,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:640;s:6:\"height\";i:640;s:4:\"file\";s:25:\"2019/07/shannon-best.jpeg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"shannon-best-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"shannon-best-300x300.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:25:\"shannon-best-380x500.jpeg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:25:\"shannon-best-400x400.jpeg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:25:\"shannon-best-200x200.jpeg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:25:\"shannon-best-640x350.jpeg\";s:5:\"width\";i:640;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1084,220,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1085,220,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (1086,220,'_imagify_data','a:2:{s:5:\"sizes\";a:8:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:60406;s:14:\"optimized_size\";i:41360;s:7:\"percent\";d:31.530000000000001;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:12466;s:14:\"optimized_size\";i:8656;s:7:\"percent\";d:30.559999999999999;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:42432;s:14:\"optimized_size\";i:28936;s:7:\"percent\";d:31.809999999999999;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:49164;s:14:\"optimized_size\";i:32138;s:7:\"percent\";d:34.630000000000003;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:25823;s:14:\"optimized_size\";i:17782;s:7:\"percent\";d:31.140000000000001;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7566;s:14:\"optimized_size\";i:5056;s:7:\"percent\";d:33.170000000000002;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:165856;s:14:\"optimized_size\";i:74092;s:7:\"percent\";d:55.329999999999998;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:363713;s:14:\"optimized_size\";i:208020;s:7:\"percent\";d:42.810000000000002;}}');
INSERT INTO `wp_postmeta` VALUES (1087,220,'_wp_attachment_image_alt','shannon best');
INSERT INTO `wp_postmeta` VALUES (1088,171,'_thumbnail_id','220');
INSERT INTO `wp_postmeta` VALUES (1089,171,'artistes','Shannon');
INSERT INTO `wp_postmeta` VALUES (1090,171,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (1091,171,'titre','Best');
INSERT INTO `wp_postmeta` VALUES (1092,171,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (1093,171,'download','');
INSERT INTO `wp_postmeta` VALUES (1094,171,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (1095,171,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (1096,171,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (1097,171,'youtube','https://www.youtube.com/watch?v=rMr1VpThH8U');
INSERT INTO `wp_postmeta` VALUES (1098,171,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (1099,171,'spotify','https://open.spotify.com/album/7uD2YX1KX3OZm1PGDy4Wc7');
INSERT INTO `wp_postmeta` VALUES (1100,171,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (1101,171,'deezer','https://www.deezer.com/en/track/716303162');
INSERT INTO `wp_postmeta` VALUES (1102,171,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (1103,171,'apple_music','https://music.apple.com/fr/album/best-single/1473675514');
INSERT INTO `wp_postmeta` VALUES (1104,171,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (1105,171,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (1106,171,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (1107,171,'tidal','');
INSERT INTO `wp_postmeta` VALUES (1108,171,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (1109,222,'_wp_attached_file','2019/07/admiral-t-baimbridge-cho-feat-were-vana.jpg');
INSERT INTO `wp_postmeta` VALUES (1110,222,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:500;s:6:\"height\";i:500;s:4:\"file\";s:51:\"2019/07/admiral-t-baimbridge-cho-feat-were-vana.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:51:\"admiral-t-baimbridge-cho-feat-were-vana-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:51:\"admiral-t-baimbridge-cho-feat-were-vana-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:51:\"admiral-t-baimbridge-cho-feat-were-vana-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:51:\"admiral-t-baimbridge-cho-feat-were-vana-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:51:\"admiral-t-baimbridge-cho-feat-were-vana-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:51:\"admiral-t-baimbridge-cho-feat-were-vana-500x350.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1111,222,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1112,222,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (1113,222,'_imagify_data','a:2:{s:5:\"sizes\";a:8:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:35179;s:14:\"optimized_size\";i:18852;s:7:\"percent\";d:46.409999999999997;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:12786;s:14:\"optimized_size\";i:8414;s:7:\"percent\";d:34.189999999999998;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:32730;s:14:\"optimized_size\";i:17870;s:7:\"percent\";d:45.399999999999999;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:38958;s:14:\"optimized_size\";i:21238;s:7:\"percent\";d:45.479999999999997;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:22721;s:14:\"optimized_size\";i:13588;s:7:\"percent\";d:40.200000000000003;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:8729;s:14:\"optimized_size\";i:5776;s:7:\"percent\";d:33.829999999999998;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:39256;s:14:\"optimized_size\";i:24940;s:7:\"percent\";d:36.469999999999999;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:190359;s:14:\"optimized_size\";i:110678;s:7:\"percent\";d:41.859999999999999;}}');
INSERT INTO `wp_postmeta` VALUES (1114,222,'_wp_attachment_image_alt','admiral t were vana baimbridge cho');
INSERT INTO `wp_postmeta` VALUES (1115,167,'_wp_old_date','2019-07-27');
INSERT INTO `wp_postmeta` VALUES (1116,167,'_thumbnail_id','222');
INSERT INTO `wp_postmeta` VALUES (1117,167,'artistes','Admiral T x Were Vana');
INSERT INTO `wp_postmeta` VALUES (1118,167,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (1119,167,'titre','Baimbridge Cho');
INSERT INTO `wp_postmeta` VALUES (1120,167,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (1121,167,'download','');
INSERT INTO `wp_postmeta` VALUES (1122,167,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (1123,167,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (1124,167,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (1125,167,'youtube','https://www.youtube.com/watch?v=rKgvYzardtc&list=PLv1ie7et_thpHYoYA6r-2sErfwc4THrUr');
INSERT INTO `wp_postmeta` VALUES (1126,167,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (1127,167,'spotify','https://open.spotify.com/album/4K5z5W8ZsGQxVsgMAL4D7f');
INSERT INTO `wp_postmeta` VALUES (1128,167,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (1129,167,'deezer','https://www.deezer.com/en/album/104350802');
INSERT INTO `wp_postmeta` VALUES (1130,167,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (1131,167,'apple_music','https://music.apple.com/fr/album/baimbridge-cho-feat-were-vana-single/1473606227');
INSERT INTO `wp_postmeta` VALUES (1132,167,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (1133,167,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (1134,167,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (1135,167,'tidal','');
INSERT INTO `wp_postmeta` VALUES (1136,167,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (1137,224,'_wp_attached_file','2019/07/admiral-t-boss-lady-feat-krys.jpg');
INSERT INTO `wp_postmeta` VALUES (1138,224,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:500;s:6:\"height\";i:500;s:4:\"file\";s:41:\"2019/07/admiral-t-boss-lady-feat-krys.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:41:\"admiral-t-boss-lady-feat-krys-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:41:\"admiral-t-boss-lady-feat-krys-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:41:\"admiral-t-boss-lady-feat-krys-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:41:\"admiral-t-boss-lady-feat-krys-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:41:\"admiral-t-boss-lady-feat-krys-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:41:\"admiral-t-boss-lady-feat-krys-500x350.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1139,224,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1140,224,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (1141,224,'_imagify_data','a:2:{s:5:\"sizes\";a:8:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:34851;s:14:\"optimized_size\";i:19580;s:7:\"percent\";d:43.82;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:12012;s:14:\"optimized_size\";i:7762;s:7:\"percent\";d:35.380000000000003;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:32655;s:14:\"optimized_size\";i:18616;s:7:\"percent\";d:42.990000000000002;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:36502;s:14:\"optimized_size\";i:19686;s:7:\"percent\";d:46.07;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:22332;s:14:\"optimized_size\";i:13468;s:7:\"percent\";d:39.689999999999998;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7915;s:14:\"optimized_size\";i:5238;s:7:\"percent\";d:33.82;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:40442;s:14:\"optimized_size\";i:27582;s:7:\"percent\";d:31.800000000000001;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:186709;s:14:\"optimized_size\";i:111932;s:7:\"percent\";d:40.049999999999997;}}');
INSERT INTO `wp_postmeta` VALUES (1142,224,'_wp_attachment_image_alt','admiral t krys boss lady');
INSERT INTO `wp_postmeta` VALUES (1143,164,'_thumbnail_id','224');
INSERT INTO `wp_postmeta` VALUES (1144,164,'artistes','Admiral T x Krys');
INSERT INTO `wp_postmeta` VALUES (1145,164,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (1146,164,'titre','Boss Lady');
INSERT INTO `wp_postmeta` VALUES (1147,164,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (1148,164,'download','');
INSERT INTO `wp_postmeta` VALUES (1149,164,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (1150,164,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (1151,164,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (1152,164,'youtube','https://www.youtube.com/watch?v=BZyQnxRX7xE');
INSERT INTO `wp_postmeta` VALUES (1153,164,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (1154,164,'spotify','https://open.spotify.com/album/5JCVRK1DSKmS6jIT0P77Ed');
INSERT INTO `wp_postmeta` VALUES (1155,164,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (1156,164,'deezer','https://www.deezer.com/en/track/715900722');
INSERT INTO `wp_postmeta` VALUES (1157,164,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (1158,164,'apple_music','https://music.apple.com/fr/album/boss-lady-feat-krys-single/1473606553');
INSERT INTO `wp_postmeta` VALUES (1159,164,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (1160,164,'google_play_music','https://play.google.com/music/preview/Tbk7txwcrscomuy7sq3vouk66bu');
INSERT INTO `wp_postmeta` VALUES (1161,164,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (1162,164,'tidal','');
INSERT INTO `wp_postmeta` VALUES (1163,164,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (1164,164,'_wp_old_date','2019-07-27');
INSERT INTO `wp_postmeta` VALUES (1165,226,'_wp_attached_file','2019/07/500x500.jpg');
INSERT INTO `wp_postmeta` VALUES (1166,226,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:500;s:6:\"height\";i:500;s:4:\"file\";s:19:\"2019/07/500x500.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"500x500-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"500x500-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:19:\"500x500-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:19:\"500x500-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:19:\"500x500-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:19:\"500x500-500x350.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1167,226,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1168,226,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (1169,226,'_imagify_data','a:2:{s:5:\"sizes\";a:8:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:22647;s:14:\"optimized_size\";i:12000;s:7:\"percent\";d:47.009999999999998;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7998;s:14:\"optimized_size\";i:4730;s:7:\"percent\";d:40.859999999999999;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:25374;s:14:\"optimized_size\";i:13122;s:7:\"percent\";d:48.289999999999999;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:26409;s:14:\"optimized_size\";i:14132;s:7:\"percent\";d:46.490000000000002;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:16458;s:14:\"optimized_size\";i:8800;s:7:\"percent\";d:46.530000000000001;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:5137;s:14:\"optimized_size\";i:2970;s:7:\"percent\";d:42.18;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:18562;s:14:\"optimized_size\";i:20908;s:7:\"percent\";d:-12.640000000000001;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:122585;s:14:\"optimized_size\";i:76662;s:7:\"percent\";d:37.460000000000001;}}');
INSERT INTO `wp_postmeta` VALUES (1170,226,'_wp_attachment_image_alt','kalash damso praliné');
INSERT INTO `wp_postmeta` VALUES (1171,161,'_thumbnail_id','226');
INSERT INTO `wp_postmeta` VALUES (1172,161,'artistes','Kalash x Damso');
INSERT INTO `wp_postmeta` VALUES (1173,161,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (1174,161,'titre','Praliné');
INSERT INTO `wp_postmeta` VALUES (1175,161,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (1176,161,'download','');
INSERT INTO `wp_postmeta` VALUES (1177,161,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (1178,161,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (1179,161,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (1180,161,'youtube','https://music.youtube.com/watch?v=odpKkxipcjk&feature=share');
INSERT INTO `wp_postmeta` VALUES (1181,161,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (1182,161,'spotify','https://open.spotify.com/album/5FpGWiehAHcwPPcm7fcBTv');
INSERT INTO `wp_postmeta` VALUES (1183,161,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (1184,161,'deezer','https://www.deezer.com/en/track/717462532');
INSERT INTO `wp_postmeta` VALUES (1185,161,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (1186,161,'apple_music','https://music.apple.com/fr/album/1473589964');
INSERT INTO `wp_postmeta` VALUES (1187,161,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (1188,161,'google_play_music','https://play.google.com/store/music/album?id=Bwtwrwn6grfa5pc2qpqwmnxyasm');
INSERT INTO `wp_postmeta` VALUES (1189,161,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (1190,161,'tidal','');
INSERT INTO `wp_postmeta` VALUES (1191,161,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (1192,228,'_wp_attached_file','2019/07/kalash-jtc-feat-damso.jpg');
INSERT INTO `wp_postmeta` VALUES (1193,228,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:600;s:6:\"height\";i:600;s:4:\"file\";s:33:\"2019/07/kalash-jtc-feat-damso.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"kalash-jtc-feat-damso-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:33:\"kalash-jtc-feat-damso-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:33:\"kalash-jtc-feat-damso-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:33:\"kalash-jtc-feat-damso-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:33:\"kalash-jtc-feat-damso-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:33:\"kalash-jtc-feat-damso-600x350.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1194,228,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1195,228,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (1196,228,'_imagify_data','a:2:{s:5:\"sizes\";a:8:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:61804;s:14:\"optimized_size\";i:43310;s:7:\"percent\";d:29.920000000000002;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:16130;s:14:\"optimized_size\";i:11836;s:7:\"percent\";d:26.620000000000001;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:50942;s:14:\"optimized_size\";i:34612;s:7:\"percent\";d:32.060000000000002;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:53440;s:14:\"optimized_size\";i:35416;s:7:\"percent\";d:33.729999999999997;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:33669;s:14:\"optimized_size\";i:23590;s:7:\"percent\";d:29.940000000000001;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:10310;s:14:\"optimized_size\";i:7522;s:7:\"percent\";d:27.039999999999999;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:76220;s:14:\"optimized_size\";i:66350;s:7:\"percent\";d:12.949999999999999;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:302515;s:14:\"optimized_size\";i:222636;s:7:\"percent\";d:26.399999999999999;}}');
INSERT INTO `wp_postmeta` VALUES (1197,228,'_wp_attachment_image_alt','kalash damso jtc');
INSERT INTO `wp_postmeta` VALUES (1198,158,'_wp_old_date','2019-07-27');
INSERT INTO `wp_postmeta` VALUES (1199,158,'_thumbnail_id','228');
INSERT INTO `wp_postmeta` VALUES (1200,158,'artistes','Kalash x Damso');
INSERT INTO `wp_postmeta` VALUES (1201,158,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (1202,158,'titre','JTC');
INSERT INTO `wp_postmeta` VALUES (1203,158,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (1204,158,'download','');
INSERT INTO `wp_postmeta` VALUES (1205,158,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (1206,158,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (1207,158,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (1208,158,'youtube','https://music.youtube.com/watch?v=WmbjXkcu9Gk&list=RDAMVMWmbjXkcu9Gk');
INSERT INTO `wp_postmeta` VALUES (1209,158,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (1210,158,'spotify','https://open.spotify.com/album/1CPeRbubF9gG3PyylJGKw9');
INSERT INTO `wp_postmeta` VALUES (1211,158,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (1212,158,'deezer','https://www.deezer.com/en/track/717462522');
INSERT INTO `wp_postmeta` VALUES (1213,158,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (1214,158,'apple_music','https://music.apple.com/fr/album/1473589941');
INSERT INTO `wp_postmeta` VALUES (1215,158,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (1216,158,'google_play_music','https://play.google.com/store/music/album/Kalash_JTC?id=Bwyeey6bxdhwut664wqjtk4byna&hl=fr');
INSERT INTO `wp_postmeta` VALUES (1217,158,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (1218,158,'tidal','');
INSERT INTO `wp_postmeta` VALUES (1219,158,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (1220,73,'artistes','Lorenz x JmaX');
INSERT INTO `wp_postmeta` VALUES (1221,73,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (1222,73,'titre','Luv Me');
INSERT INTO `wp_postmeta` VALUES (1223,73,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (1224,73,'download','');
INSERT INTO `wp_postmeta` VALUES (1225,73,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (1226,73,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (1227,73,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (1228,73,'youtube','https://www.youtube.com/watch?v=OTCw5e94ehg');
INSERT INTO `wp_postmeta` VALUES (1229,73,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (1230,73,'spotify','https://open.spotify.com/album/1Wl6q06aKnQeo3WWswQlyL?highlight=spotify:track:3UBLUs4kOdsTlpX8je6DTC');
INSERT INTO `wp_postmeta` VALUES (1231,73,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (1232,73,'deezer','https://www.deezer.com/en/album/69050442');
INSERT INTO `wp_postmeta` VALUES (1233,73,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (1234,73,'apple_music','https://music.apple.com/fr/album/luv-me-feat-jmax-single/1416793921');
INSERT INTO `wp_postmeta` VALUES (1235,73,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (1236,73,'google_play_music','https://play.google.com/music/preview/Tzz7l4yegptsqzsmovexv7prizm');
INSERT INTO `wp_postmeta` VALUES (1237,73,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (1238,73,'tidal','');
INSERT INTO `wp_postmeta` VALUES (1239,73,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (1240,72,'artistes','Mel x JmaX');
INSERT INTO `wp_postmeta` VALUES (1241,72,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (1242,72,'titre','Touch Me (Remix)');
INSERT INTO `wp_postmeta` VALUES (1243,72,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (1244,72,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (1245,72,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (1246,231,'_edit_lock','1588194743:1');
INSERT INTO `wp_postmeta` VALUES (1247,232,'_wp_attached_file','2020/03/Yanii-Feat-JmaX-Dans-la-Peau.jpeg');
INSERT INTO `wp_postmeta` VALUES (1248,232,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:41:\"2020/03/Yanii-Feat-JmaX-Dans-la-Peau.jpeg\";s:5:\"sizes\";a:9:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:41:\"Yanii-Feat-JmaX-Dans-la-Peau-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:41:\"Yanii-Feat-JmaX-Dans-la-Peau-300x169.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:41:\"Yanii-Feat-JmaX-Dans-la-Peau-768x432.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:42:\"Yanii-Feat-JmaX-Dans-la-Peau-1024x576.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:41:\"Yanii-Feat-JmaX-Dans-la-Peau-380x500.jpeg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:41:\"Yanii-Feat-JmaX-Dans-la-Peau-400x400.jpeg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:41:\"Yanii-Feat-JmaX-Dans-la-Peau-200x200.jpeg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:42:\"Yanii-Feat-JmaX-Dans-la-Peau-1280x350.jpeg\";s:5:\"width\";i:1280;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"banner\";a:4:{s:4:\"file\";s:42:\"Yanii-Feat-JmaX-Dans-la-Peau-1024x576.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1249,232,'_fvp_image_url','https://i.ytimg.com/vi/RAJClSlSpHE/hqdefault.jpg');
INSERT INTO `wp_postmeta` VALUES (1250,231,'_thumbnail_id','232');
INSERT INTO `wp_postmeta` VALUES (1251,231,'_fvp_video','a:12:{s:5:\"valid\";b:1;s:3:\"img\";i:232;s:2:\"id\";N;s:8:\"provider\";s:7:\"youtube\";s:5:\"title\";s:30:\"Yanii Feat JmaX - Dans la Peau\";s:6:\"author\";s:4:\"JmaX\";s:11:\"description\";N;s:7:\"img_url\";s:48:\"https://i.ytimg.com/vi/RAJClSlSpHE/hqdefault.jpg\";s:8:\"filename\";s:30:\"Yanii Feat JmaX - Dans la Peau\";s:4:\"full\";s:43:\"https://www.youtube.com/watch?v=RAJClSlSpHE\";s:10:\"parameters\";a:0:{}s:5:\"noimg\";b:0;}');
INSERT INTO `wp_postmeta` VALUES (1257,231,'_oembed_d67da5342c438b876df6b498fd159967','<iframe title=\"Yanii Feat JmaX - Dans la Peau\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/RAJClSlSpHE?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (1258,231,'_oembed_time_d67da5342c438b876df6b498fd159967','1584702942');
INSERT INTO `wp_postmeta` VALUES (1259,231,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1260,231,'_yoast_wpseo_content_score','90');
INSERT INTO `wp_postmeta` VALUES (1261,231,'artistes_associes','a:1:{i:0;s:3:\"154\";}');
INSERT INTO `wp_postmeta` VALUES (1262,231,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1263,231,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1264,231,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (1265,231,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1266,231,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (1267,234,'artistes_associes','a:1:{i:0;s:2:\"67\";}');
INSERT INTO `wp_postmeta` VALUES (1268,234,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1269,234,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1270,234,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (1271,234,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1272,234,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (1273,231,'_yoast_wpseo_primary_category','15');
INSERT INTO `wp_postmeta` VALUES (1276,231,'musique_associees','a:1:{i:0;s:3:\"211\";}');
INSERT INTO `wp_postmeta` VALUES (1277,231,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (1278,236,'artistes_associes','a:1:{i:0;s:2:\"67\";}');
INSERT INTO `wp_postmeta` VALUES (1279,236,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1280,236,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1281,236,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (1282,236,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1283,236,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (1284,236,'musique_associees','a:1:{i:0;s:3:\"211\";}');
INSERT INTO `wp_postmeta` VALUES (1285,236,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (1286,237,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1287,237,'_edit_lock','1584573763:1');
INSERT INTO `wp_postmeta` VALUES (1290,231,'_wp_old_date','2020-03-18');
INSERT INTO `wp_postmeta` VALUES (1291,239,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1292,239,'_edit_lock','1584534881:1');
INSERT INTO `wp_postmeta` VALUES (1293,154,'albums_associes','a:1:{i:0;s:3:\"296\";}');
INSERT INTO `wp_postmeta` VALUES (1294,154,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (1295,154,'clips_associes','a:3:{i:0;s:3:\"260\";i:1;s:3:\"265\";i:2;s:3:\"231\";}');
INSERT INTO `wp_postmeta` VALUES (1296,154,'_clips_associes','field_5e721548a0750');
INSERT INTO `wp_postmeta` VALUES (1297,241,'_wp_attached_file','2019/07/67112364_10156714299347087_6249821407371329536_n-1.jpg');
INSERT INTO `wp_postmeta` VALUES (1298,241,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:960;s:6:\"height\";i:960;s:4:\"file\";s:62:\"2019/07/67112364_10156714299347087_6249821407371329536_n-1.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:62:\"67112364_10156714299347087_6249821407371329536_n-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:62:\"67112364_10156714299347087_6249821407371329536_n-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:62:\"67112364_10156714299347087_6249821407371329536_n-1-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:62:\"67112364_10156714299347087_6249821407371329536_n-1-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:62:\"67112364_10156714299347087_6249821407371329536_n-1-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:62:\"67112364_10156714299347087_6249821407371329536_n-1-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:62:\"67112364_10156714299347087_6249821407371329536_n-1-960x350.jpg\";s:5:\"width\";i:960;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1299,241,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1300,241,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (1301,241,'_imagify_data','a:2:{s:5:\"sizes\";a:9:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:49921;s:14:\"optimized_size\";i:30216;s:7:\"percent\";d:39.469999999999999;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7473;s:14:\"optimized_size\";i:4048;s:7:\"percent\";d:45.829999999999998;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:23270;s:14:\"optimized_size\";i:12506;s:7:\"percent\";d:46.259999999999998;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:31330;s:14:\"optimized_size\";i:17594;s:7:\"percent\";d:43.840000000000003;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:78058;s:14:\"optimized_size\";i:41090;s:7:\"percent\";d:47.359999999999999;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:14175;s:14:\"optimized_size\";i:7534;s:7:\"percent\";d:46.850000000000001;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4979;s:14:\"optimized_size\";i:2650;s:7:\"percent\";d:46.780000000000001;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:198098;s:14:\"optimized_size\";i:81990;s:7:\"percent\";d:58.609999999999999;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:407304;s:14:\"optimized_size\";i:197628;s:7:\"percent\";d:51.479999999999997;}}');
INSERT INTO `wp_postmeta` VALUES (1302,241,'_wp_attachment_image_alt','admiral t caribbean monster');
INSERT INTO `wp_postmeta` VALUES (1303,242,'_wp_attached_file','2020/03/67320275_10156714299277087_4653882298289094656_n.jpg');
INSERT INTO `wp_postmeta` VALUES (1304,242,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:960;s:6:\"height\";i:960;s:4:\"file\";s:60:\"2020/03/67320275_10156714299277087_4653882298289094656_n.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:60:\"67320275_10156714299277087_4653882298289094656_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:60:\"67320275_10156714299277087_4653882298289094656_n-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:60:\"67320275_10156714299277087_4653882298289094656_n-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:60:\"67320275_10156714299277087_4653882298289094656_n-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:60:\"67320275_10156714299277087_4653882298289094656_n-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:60:\"67320275_10156714299277087_4653882298289094656_n-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:60:\"67320275_10156714299277087_4653882298289094656_n-960x350.jpg\";s:5:\"width\";i:960;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1305,242,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1306,242,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (1307,242,'_imagify_data','a:2:{s:5:\"sizes\";a:9:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:104777;s:14:\"optimized_size\";i:72666;s:7:\"percent\";d:30.649999999999999;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:18721;s:14:\"optimized_size\";i:14460;s:7:\"percent\";d:22.760000000000002;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:60172;s:14:\"optimized_size\";i:43136;s:7:\"percent\";d:28.309999999999999;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:66663;s:14:\"optimized_size\";i:45432;s:7:\"percent\";d:31.850000000000001;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:172986;s:14:\"optimized_size\";i:113570;s:7:\"percent\";d:34.350000000000001;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:37529;s:14:\"optimized_size\";i:27302;s:7:\"percent\";d:27.25;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11798;s:14:\"optimized_size\";i:8862;s:7:\"percent\";d:24.890000000000001;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:386951;s:14:\"optimized_size\";i:181602;s:7:\"percent\";d:53.07;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:859597;s:14:\"optimized_size\";i:507030;s:7:\"percent\";d:41.020000000000003;}}');
INSERT INTO `wp_postmeta` VALUES (1310,120,'_thumbnail_id','241');
INSERT INTO `wp_postmeta` VALUES (1311,120,'artistes_associes','a:1:{i:0;s:3:\"299\";}');
INSERT INTO `wp_postmeta` VALUES (1312,120,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1313,243,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1314,243,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (1315,243,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1316,243,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (1317,243,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (1318,243,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1319,244,'_wp_attached_file','2019/07/saïk_magma.jpg');
INSERT INTO `wp_postmeta` VALUES (1320,244,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:960;s:6:\"height\";i:960;s:4:\"file\";s:24:\"2019/07/saïk_magma.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"saïk_magma-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:24:\"saïk_magma-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:24:\"saïk_magma-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:24:\"saïk_magma-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:24:\"saïk_magma-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:24:\"saïk_magma-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:24:\"saïk_magma-960x350.jpg\";s:5:\"width\";i:960;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1321,244,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1322,244,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1323,244,'_imagify_data','a:2:{s:5:\"sizes\";a:16:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:200451;s:14:\"optimized_size\";i:155855;s:7:\"percent\";d:22.25;}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:57692;s:14:\"optimized_size\";i:32336;s:7:\"percent\";d:43.950000000000003;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:10392;s:14:\"optimized_size\";i:6656;s:7:\"percent\";d:35.950000000000003;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:33341;s:14:\"optimized_size\";i:20248;s:7:\"percent\";d:39.270000000000003;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:43162;s:14:\"optimized_size\";i:26192;s:7:\"percent\";d:39.32;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:98676;s:14:\"optimized_size\";i:54630;s:7:\"percent\";d:44.640000000000001;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:20515;s:14:\"optimized_size\";i:12802;s:7:\"percent\";d:37.600000000000001;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:6610;s:14:\"optimized_size\";i:4156;s:7:\"percent\";d:37.130000000000003;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:200451;s:14:\"optimized_size\";i:85750;s:7:\"percent\";d:57.219999999999999;}s:9:\"thumbnail\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:6610;s:14:\"optimized_size\";i:5308;s:7:\"percent\";d:19.699999999999999;}s:6:\"medium\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:20515;s:14:\"optimized_size\";i:16489;s:7:\"percent\";d:19.620000000000001;}s:12:\"medium_large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:98676;s:14:\"optimized_size\";i:75005;s:7:\"percent\";d:23.989999999999998;}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:43162;s:14:\"optimized_size\";i:34780;s:7:\"percent\";d:19.420000000000002;}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:33341;s:14:\"optimized_size\";i:26864;s:7:\"percent\";d:19.43;}s:17:\"pepseeactus-Music\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:10392;s:14:\"optimized_size\";i:8319;s:7:\"percent\";d:19.949999999999999;}s:9:\"bannière\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:57692;s:14:\"optimized_size\";i:43493;s:7:\"percent\";d:24.609999999999999;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:941678;s:14:\"optimized_size\";i:608883;s:7:\"percent\";d:35.340000000000003;}}');
INSERT INTO `wp_postmeta` VALUES (1324,244,'_wp_attachment_image_alt','saik magma');
INSERT INTO `wp_postmeta` VALUES (1327,126,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (1328,126,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1329,245,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1330,245,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (1331,245,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1332,245,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (1333,245,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (1334,245,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1335,126,'_thumbnail_id','244');
INSERT INTO `wp_postmeta` VALUES (1336,246,'_wp_attached_file','2018/11/Tropical-soundsystem.jpg');
INSERT INTO `wp_postmeta` VALUES (1337,246,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1000;s:6:\"height\";i:720;s:4:\"file\";s:32:\"2018/11/Tropical-soundsystem.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"Tropical-soundsystem-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"Tropical-soundsystem-300x216.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:216;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:32:\"Tropical-soundsystem-768x553.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:553;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:32:\"Tropical-soundsystem-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:32:\"Tropical-soundsystem-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:32:\"Tropical-soundsystem-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:33:\"Tropical-soundsystem-1000x350.jpg\";s:5:\"width\";i:1000;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1338,246,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1339,246,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1340,246,'_imagify_data','a:2:{s:5:\"sizes\";a:16:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:130146;s:14:\"optimized_size\";i:100259;s:7:\"percent\";d:22.960000000000001;}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:66280;s:14:\"optimized_size\";i:34540;s:7:\"percent\";d:47.890000000000001;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11983;s:14:\"optimized_size\";i:7782;s:7:\"percent\";d:35.060000000000002;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:36559;s:14:\"optimized_size\";i:21068;s:7:\"percent\";d:42.369999999999997;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:41302;s:14:\"optimized_size\";i:23254;s:7:\"percent\";d:43.700000000000003;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:82023;s:14:\"optimized_size\";i:43276;s:7:\"percent\";d:47.240000000000002;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:18363;s:14:\"optimized_size\";i:11666;s:7:\"percent\";d:36.469999999999999;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7686;s:14:\"optimized_size\";i:4914;s:7:\"percent\";d:36.07;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:130146;s:14:\"optimized_size\";i:67588;s:7:\"percent\";d:48.07;}s:9:\"thumbnail\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7686;s:14:\"optimized_size\";i:6335;s:7:\"percent\";d:17.579999999999998;}s:6:\"medium\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:18363;s:14:\"optimized_size\";i:15202;s:7:\"percent\";d:17.210000000000001;}s:12:\"medium_large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:82023;s:14:\"optimized_size\";i:63654;s:7:\"percent\";d:22.390000000000001;}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:41302;s:14:\"optimized_size\";i:34668;s:7:\"percent\";d:16.059999999999999;}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:36559;s:14:\"optimized_size\";i:30671;s:7:\"percent\";d:16.109999999999999;}s:17:\"pepseeactus-Music\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11983;s:14:\"optimized_size\";i:9847;s:7:\"percent\";d:17.829999999999998;}s:9:\"bannière\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:66280;s:14:\"optimized_size\";i:50966;s:7:\"percent\";d:23.109999999999999;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:788684;s:14:\"optimized_size\";i:525690;s:7:\"percent\";d:33.350000000000001;}}');
INSERT INTO `wp_postmeta` VALUES (1341,246,'_wp_attachment_image_alt','spice');
INSERT INTO `wp_postmeta` VALUES (1344,55,'_thumbnail_id','246');
INSERT INTO `wp_postmeta` VALUES (1345,55,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (1346,55,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1347,130,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (1348,130,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1355,248,'_wp_attached_file','2020/03/cropped-logo-blanc.png');
INSERT INTO `wp_postmeta` VALUES (1356,248,'_wp_attachment_context','site-icon');
INSERT INTO `wp_postmeta` VALUES (1357,248,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:30:\"2020/03/cropped-logo-blanc.png\";s:5:\"sizes\";a:4:{s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:30:\"cropped-logo-blanc-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:30:\"cropped-logo-blanc-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:30:\"cropped-logo-blanc-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:28:\"cropped-logo-blanc-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1358,248,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1359,248,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1360,248,'_imagify_data','a:2:{s:5:\"sizes\";a:2:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:40074;s:14:\"optimized_size\";i:14217;s:7:\"percent\";d:64.519999999999996;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:40074;s:14:\"optimized_size\";i:17766;s:7:\"percent\";d:55.670000000000002;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:80148;s:14:\"optimized_size\";i:31983;s:7:\"percent\";d:60.100000000000001;}}');
INSERT INTO `wp_postmeta` VALUES (1363,250,'_wp_attached_file','2020/03/pepseeactus_logo_picto_noir_2019.png');
INSERT INTO `wp_postmeta` VALUES (1364,250,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:100;s:6:\"height\";i:101;s:4:\"file\";s:44:\"2020/03/pepseeactus_logo_picto_noir_2019.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1365,250,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1366,250,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1367,250,'_imagify_data','a:2:{s:5:\"sizes\";a:2:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:9982;s:14:\"optimized_size\";i:5076;s:7:\"percent\";d:49.149999999999999;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:9982;s:14:\"optimized_size\";i:2202;s:7:\"percent\";d:77.939999999999998;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:19964;s:14:\"optimized_size\";i:7278;s:7:\"percent\";d:63.539999999999999;}}');
INSERT INTO `wp_postmeta` VALUES (1368,250,'_wp_attachment_image_alt','pepseeactus logo');
INSERT INTO `wp_postmeta` VALUES (1369,251,'_wp_attached_file','2020/03/cropped-pepseeactus_logo_picto_noir_2019.png');
INSERT INTO `wp_postmeta` VALUES (1370,251,'_wp_attachment_context','custom-logo');
INSERT INTO `wp_postmeta` VALUES (1371,251,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:100;s:6:\"height\";i:100;s:4:\"file\";s:52:\"2020/03/cropped-pepseeactus_logo_picto_noir_2019.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1372,251,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1373,251,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1374,251,'_imagify_data','a:2:{s:5:\"sizes\";a:2:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:3126;s:14:\"optimized_size\";i:1680;s:7:\"percent\";d:46.259999999999998;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:3126;s:14:\"optimized_size\";i:1672;s:7:\"percent\";d:46.509999999999998;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:6252;s:14:\"optimized_size\";i:3352;s:7:\"percent\";d:46.390000000000001;}}');
INSERT INTO `wp_postmeta` VALUES (1377,253,'_wp_attached_file','2020/03/cropped-pepseeactus_logo_picto_noir_2019-1.png');
INSERT INTO `wp_postmeta` VALUES (1378,253,'_wp_attachment_context','site-icon');
INSERT INTO `wp_postmeta` VALUES (1379,253,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:54:\"2020/03/cropped-pepseeactus_logo_picto_noir_2019-1.png\";s:5:\"sizes\";a:4:{s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:54:\"cropped-pepseeactus_logo_picto_noir_2019-1-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:54:\"cropped-pepseeactus_logo_picto_noir_2019-1-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:54:\"cropped-pepseeactus_logo_picto_noir_2019-1-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:52:\"cropped-pepseeactus_logo_picto_noir_2019-1-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1380,253,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1381,253,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1382,253,'_imagify_data','a:2:{s:5:\"sizes\";a:2:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:17254;s:14:\"optimized_size\";i:15464;s:7:\"percent\";d:10.369999999999999;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:17254;s:14:\"optimized_size\";i:9476;s:7:\"percent\";d:45.079999999999998;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:34508;s:14:\"optimized_size\";i:24940;s:7:\"percent\";d:27.73;}}');
INSERT INTO `wp_postmeta` VALUES (1385,255,'_wp_attached_file','2019/07/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png');
INSERT INTO `wp_postmeta` VALUES (1386,255,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:974;s:6:\"height\";i:1112;s:4:\"file\";s:57:\"2019/07/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png\";s:5:\"sizes\";a:8:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:57:\"3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:57:\"3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b-263x300.png\";s:5:\"width\";i:263;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:57:\"3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b-768x877.png\";s:5:\"width\";i:768;s:6:\"height\";i:877;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:58:\"3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b-897x1024.png\";s:5:\"width\";i:897;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:57:\"3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b-380x500.png\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:57:\"3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b-400x400.png\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:9:\"image/png\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:57:\"3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b-200x200.png\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:57:\"3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b-974x350.png\";s:5:\"width\";i:974;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1387,255,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1388,255,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1389,255,'_imagify_data','a:2:{s:5:\"sizes\";a:2:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:1344403;s:14:\"optimized_size\";i:604727;s:7:\"percent\";d:55.020000000000003;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:1344403;s:14:\"optimized_size\";i:78544;s:7:\"percent\";d:94.159999999999997;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:2688806;s:14:\"optimized_size\";i:683271;s:7:\"percent\";d:74.590000000000003;}}');
INSERT INTO `wp_postmeta` VALUES (1390,255,'_wp_attachment_image_alt','kalash');
INSERT INTO `wp_postmeta` VALUES (1391,151,'_thumbnail_id','255');
INSERT INTO `wp_postmeta` VALUES (1392,151,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1393,151,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (1394,151,'clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1395,151,'_clips_associes','field_5e721548a0750');
INSERT INTO `wp_postmeta` VALUES (1396,151,'musique_associees','a:2:{i:0;s:3:\"158\";i:1;s:3:\"161\";}');
INSERT INTO `wp_postmeta` VALUES (1397,151,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (1398,151,'compte_verifie','0');
INSERT INTO `wp_postmeta` VALUES (1399,151,'_compte_verifie','field_5e6fef2c41455');
INSERT INTO `wp_postmeta` VALUES (1400,151,'twitter','');
INSERT INTO `wp_postmeta` VALUES (1401,151,'_twitter','field_5e6fedc241452');
INSERT INTO `wp_postmeta` VALUES (1402,151,'instagram','');
INSERT INTO `wp_postmeta` VALUES (1403,151,'_instagram','field_5e6fee7041453');
INSERT INTO `wp_postmeta` VALUES (1404,151,'facebook','');
INSERT INTO `wp_postmeta` VALUES (1405,151,'_facebook','field_5e6feee241454');
INSERT INTO `wp_postmeta` VALUES (1406,151,'youtube','');
INSERT INTO `wp_postmeta` VALUES (1407,151,'_youtube','field_5e6feff541456');
INSERT INTO `wp_postmeta` VALUES (1408,256,'_wp_attached_file','2020/03/logo-perso.png');
INSERT INTO `wp_postmeta` VALUES (1409,256,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:100;s:6:\"height\";i:101;s:4:\"file\";s:22:\"2020/03/logo-perso.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1410,256,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1411,256,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1412,256,'_imagify_data','a:2:{s:5:\"sizes\";a:2:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:10447;s:14:\"optimized_size\";i:5128;s:7:\"percent\";d:50.909999999999997;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:10447;s:14:\"optimized_size\";i:2202;s:7:\"percent\";d:78.920000000000002;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:20894;s:14:\"optimized_size\";i:7330;s:7:\"percent\";d:64.920000000000002;}}');
INSERT INTO `wp_postmeta` VALUES (1413,256,'_wp_attachment_image_alt','pepseeactus logo');
INSERT INTO `wp_postmeta` VALUES (1414,257,'_wp_attached_file','2020/03/cropped-logo-perso.png');
INSERT INTO `wp_postmeta` VALUES (1415,257,'_wp_attachment_context','custom-logo');
INSERT INTO `wp_postmeta` VALUES (1416,257,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:100;s:6:\"height\";i:100;s:4:\"file\";s:30:\"2020/03/cropped-logo-perso.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1417,257,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1418,257,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1419,257,'_imagify_data','a:2:{s:5:\"sizes\";a:2:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:3780;s:14:\"optimized_size\";i:1585;s:7:\"percent\";d:58.07;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:3780;s:14:\"optimized_size\";i:1798;s:7:\"percent\";d:52.43;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:7560;s:14:\"optimized_size\";i:3383;s:7:\"percent\";d:55.25;}}');
INSERT INTO `wp_postmeta` VALUES (1424,260,'_edit_lock','1584824999:1');
INSERT INTO `wp_postmeta` VALUES (1425,261,'_wp_attached_file','2020/03/JmaX-LOVE.jpeg');
INSERT INTO `wp_postmeta` VALUES (1426,261,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:22:\"2020/03/JmaX-LOVE.jpeg\";s:5:\"sizes\";a:8:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"JmaX-LOVE-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"JmaX-LOVE-300x169.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"JmaX-LOVE-768x432.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"JmaX-LOVE-1024x576.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:22:\"JmaX-LOVE-380x500.jpeg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:22:\"JmaX-LOVE-400x400.jpeg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:22:\"JmaX-LOVE-200x200.jpeg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:23:\"JmaX-LOVE-1280x350.jpeg\";s:5:\"width\";i:1280;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1427,261,'_fvp_image_url','https://i.ytimg.com/vi/LvI9feKBlds/hqdefault.jpg');
INSERT INTO `wp_postmeta` VALUES (1428,260,'_thumbnail_id','261');
INSERT INTO `wp_postmeta` VALUES (1429,260,'_fvp_video','a:12:{s:5:\"valid\";b:1;s:3:\"img\";i:261;s:2:\"id\";N;s:8:\"provider\";s:7:\"youtube\";s:5:\"title\";s:11:\"JmaX - LOVE\";s:6:\"author\";s:4:\"JmaX\";s:11:\"description\";N;s:7:\"img_url\";s:48:\"https://i.ytimg.com/vi/LvI9feKBlds/hqdefault.jpg\";s:8:\"filename\";s:11:\"JmaX - LOVE\";s:4:\"full\";s:43:\"https://www.youtube.com/watch?v=LvI9feKBlds\";s:10:\"parameters\";a:0:{}s:5:\"noimg\";b:0;}');
INSERT INTO `wp_postmeta` VALUES (1430,261,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1431,261,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (1432,261,'_imagify_data','a:2:{s:5:\"sizes\";a:10:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:79549;s:14:\"optimized_size\";i:41252;s:7:\"percent\";d:48.140000000000001;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11628;s:14:\"optimized_size\";i:7392;s:7:\"percent\";d:36.43;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:34306;s:14:\"optimized_size\";i:19294;s:7:\"percent\";d:43.759999999999998;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:36484;s:14:\"optimized_size\";i:18624;s:7:\"percent\";d:48.950000000000003;}s:18:\"large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:102624;s:14:\"optimized_size\";i:52668;s:7:\"percent\";d:48.68;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:65370;s:14:\"optimized_size\";i:36232;s:7:\"percent\";d:44.57;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:14280;s:14:\"optimized_size\";i:9132;s:7:\"percent\";d:36.049999999999997;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7665;s:14:\"optimized_size\";i:5012;s:7:\"percent\";d:34.609999999999999;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:162504;s:14:\"optimized_size\";i:79236;s:7:\"percent\";d:51.240000000000002;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:514410;s:14:\"optimized_size\";i:268842;s:7:\"percent\";d:47.740000000000002;}}');
INSERT INTO `wp_postmeta` VALUES (1435,260,'_wp_old_date','2020-03-18');
INSERT INTO `wp_postmeta` VALUES (1436,260,'_oembed_43d2135de3485e336b175504dbc5ec94','<iframe title=\"JmaX - LOVE\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/LvI9feKBlds?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (1437,260,'_oembed_time_43d2135de3485e336b175504dbc5ec94','1584567665');
INSERT INTO `wp_postmeta` VALUES (1438,260,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1439,260,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (1440,260,'artistes_associes','a:1:{i:0;s:3:\"154\";}');
INSERT INTO `wp_postmeta` VALUES (1441,260,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1442,260,'musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1443,260,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (1444,264,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (1445,264,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1446,264,'musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1447,264,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (1448,260,'_yoast_wpseo_primary_category','15');
INSERT INTO `wp_postmeta` VALUES (1449,265,'_edit_lock','1584707945:1');
INSERT INTO `wp_postmeta` VALUES (1450,266,'_wp_attached_file','2020/03/Mel-Feat-JmaX-Touch-Me-REMIX.jpeg');
INSERT INTO `wp_postmeta` VALUES (1451,266,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:41:\"2020/03/Mel-Feat-JmaX-Touch-Me-REMIX.jpeg\";s:5:\"sizes\";a:8:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:41:\"Mel-Feat-JmaX-Touch-Me-REMIX-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:41:\"Mel-Feat-JmaX-Touch-Me-REMIX-300x169.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:41:\"Mel-Feat-JmaX-Touch-Me-REMIX-768x432.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:42:\"Mel-Feat-JmaX-Touch-Me-REMIX-1024x576.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:41:\"Mel-Feat-JmaX-Touch-Me-REMIX-380x500.jpeg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:41:\"Mel-Feat-JmaX-Touch-Me-REMIX-400x400.jpeg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:41:\"Mel-Feat-JmaX-Touch-Me-REMIX-200x200.jpeg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:42:\"Mel-Feat-JmaX-Touch-Me-REMIX-1280x350.jpeg\";s:5:\"width\";i:1280;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1452,266,'_fvp_image_url','https://i.ytimg.com/vi/oSQO-6xvPis/hqdefault.jpg');
INSERT INTO `wp_postmeta` VALUES (1453,265,'_thumbnail_id','266');
INSERT INTO `wp_postmeta` VALUES (1454,265,'_fvp_video','a:12:{s:5:\"valid\";b:1;s:3:\"img\";i:266;s:2:\"id\";N;s:8:\"provider\";s:7:\"youtube\";s:5:\"title\";s:35:\"Mel Feat JmaX  - \" Touch Me \" REMIX\";s:6:\"author\";s:4:\"JmaX\";s:11:\"description\";N;s:7:\"img_url\";s:48:\"https://i.ytimg.com/vi/oSQO-6xvPis/hqdefault.jpg\";s:8:\"filename\";s:35:\"Mel Feat JmaX  - \" Touch Me \" REMIX\";s:4:\"full\";s:43:\"https://www.youtube.com/watch?v=oSQO-6xvPis\";s:10:\"parameters\";a:0:{}s:5:\"noimg\";b:0;}');
INSERT INTO `wp_postmeta` VALUES (1455,266,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1456,266,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1457,266,'_imagify_data','a:2:{s:5:\"sizes\";a:18:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:102682;s:14:\"optimized_size\";i:63758;s:7:\"percent\";d:37.909999999999997;}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:53192;s:14:\"optimized_size\";i:27392;s:7:\"percent\";d:48.5;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11891;s:14:\"optimized_size\";i:7866;s:7:\"percent\";d:33.850000000000001;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:34663;s:14:\"optimized_size\";i:20458;s:7:\"percent\";d:40.979999999999997;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:36564;s:14:\"optimized_size\";i:20166;s:7:\"percent\";d:44.850000000000001;}s:18:\"large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:63155;s:14:\"optimized_size\";i:31700;s:7:\"percent\";d:49.810000000000002;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:41822;s:14:\"optimized_size\";i:22804;s:7:\"percent\";d:45.469999999999999;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:9972;s:14:\"optimized_size\";i:5804;s:7:\"percent\";d:41.799999999999997;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7636;s:14:\"optimized_size\";i:5044;s:7:\"percent\";d:33.939999999999998;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:102682;s:14:\"optimized_size\";i:44782;s:7:\"percent\";d:56.390000000000001;}s:9:\"thumbnail\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7636;s:14:\"optimized_size\";i:6084;s:7:\"percent\";d:20.32;}s:6:\"medium\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:9972;s:14:\"optimized_size\";i:7427;s:7:\"percent\";d:25.52;}s:12:\"medium_large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:41822;s:14:\"optimized_size\";i:29034;s:7:\"percent\";d:30.579999999999998;}s:5:\"large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:63155;s:14:\"optimized_size\";i:39862;s:7:\"percent\";d:36.880000000000003;}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:36564;s:14:\"optimized_size\";i:28113;s:7:\"percent\";d:23.109999999999999;}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:34663;s:14:\"optimized_size\";i:28633;s:7:\"percent\";d:17.399999999999999;}s:17:\"pepseeactus-Music\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11891;s:14:\"optimized_size\";i:9585;s:7:\"percent\";d:19.390000000000001;}s:9:\"bannière\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:53192;s:14:\"optimized_size\";i:34449;s:7:\"percent\";d:35.240000000000002;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:723154;s:14:\"optimized_size\";i:432961;s:7:\"percent\";d:40.130000000000003;}}');
INSERT INTO `wp_postmeta` VALUES (1460,265,'_wp_old_date','2020-03-18');
INSERT INTO `wp_postmeta` VALUES (1461,265,'_oembed_9468f443e50afe95276d2730560831b0','<iframe title=\"Mel Feat JmaX  - &quot; Touch Me &quot; REMIX\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/oSQO-6xvPis?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (1462,265,'_oembed_time_9468f443e50afe95276d2730560831b0','1584568574');
INSERT INTO `wp_postmeta` VALUES (1463,265,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1464,265,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (1465,265,'artistes_associes','a:1:{i:0;s:2:\"67\";}');
INSERT INTO `wp_postmeta` VALUES (1466,265,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1467,265,'musique_associees','a:1:{i:0;s:2:\"72\";}');
INSERT INTO `wp_postmeta` VALUES (1468,265,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (1469,268,'artistes_associes','a:1:{i:0;s:2:\"67\";}');
INSERT INTO `wp_postmeta` VALUES (1470,268,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1471,268,'musique_associees','a:1:{i:0;s:2:\"72\";}');
INSERT INTO `wp_postmeta` VALUES (1472,268,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (1473,265,'_yoast_wpseo_primary_category','15');
INSERT INTO `wp_postmeta` VALUES (1475,270,'_wp_attached_file','2020/03/jmax_pull_di_trigger.jpg');
INSERT INTO `wp_postmeta` VALUES (1476,270,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:500;s:6:\"height\";i:500;s:4:\"file\";s:32:\"2020/03/jmax_pull_di_trigger.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"jmax_pull_di_trigger-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"jmax_pull_di_trigger-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:32:\"jmax_pull_di_trigger-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:32:\"jmax_pull_di_trigger-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:32:\"jmax_pull_di_trigger-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:32:\"jmax_pull_di_trigger-500x350.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1477,270,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1478,270,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (1479,270,'_imagify_data','a:2:{s:5:\"sizes\";a:8:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:34351;s:14:\"optimized_size\";i:18620;s:7:\"percent\";d:45.789999999999999;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11761;s:14:\"optimized_size\";i:7670;s:7:\"percent\";d:34.780000000000001;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:31494;s:14:\"optimized_size\";i:17676;s:7:\"percent\";d:43.880000000000003;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:39361;s:14:\"optimized_size\";i:21988;s:7:\"percent\";d:44.140000000000001;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:21740;s:14:\"optimized_size\";i:12816;s:7:\"percent\";d:41.049999999999997;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7774;s:14:\"optimized_size\";i:5108;s:7:\"percent\";d:34.289999999999999;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:35453;s:14:\"optimized_size\";i:24378;s:7:\"percent\";d:31.239999999999998;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:181934;s:14:\"optimized_size\";i:108256;s:7:\"percent\";d:40.5;}}');
INSERT INTO `wp_postmeta` VALUES (1480,270,'_wp_attachment_image_alt','jmax pull di trigger');
INSERT INTO `wp_postmeta` VALUES (1525,285,'_edit_lock','1584571123:1');
INSERT INTO `wp_postmeta` VALUES (1526,285,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1527,296,'_edit_lock','1585497568:1');
INSERT INTO `wp_postmeta` VALUES (1531,296,'_thumbnail_id','270');
INSERT INTO `wp_postmeta` VALUES (1532,296,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1533,296,'artistes','JmaX');
INSERT INTO `wp_postmeta` VALUES (1534,296,'_artistes','field_5e729fe642a5d');
INSERT INTO `wp_postmeta` VALUES (1535,296,'titre','Pull Di Trigger');
INSERT INTO `wp_postmeta` VALUES (1536,296,'_titre','field_5e729fe642a67');
INSERT INTO `wp_postmeta` VALUES (1537,296,'download','');
INSERT INTO `wp_postmeta` VALUES (1538,296,'_download','field_5e729fe642a7e');
INSERT INTO `wp_postmeta` VALUES (1539,296,'soundcloud','https://soundcloud.com/mafio-house/sets/pull-di-trigger-compilation');
INSERT INTO `wp_postmeta` VALUES (1540,296,'_soundcloud','field_5e729fe642aa0');
INSERT INTO `wp_postmeta` VALUES (1541,296,'youtube','https://music.youtube.com/playlist?list=OLAK5uy_kspTPWa0s5fO4zYefvtbVbd2WoLE8OXdI');
INSERT INTO `wp_postmeta` VALUES (1542,296,'_youtube','field_5e729fe642aa7');
INSERT INTO `wp_postmeta` VALUES (1543,296,'spotify','https://open.spotify.com/album/4UUg5PgdHRjU3qJ7808M99');
INSERT INTO `wp_postmeta` VALUES (1544,296,'_spotify','field_5e729fe642aaf');
INSERT INTO `wp_postmeta` VALUES (1545,296,'deezer','https://www.deezer.com/fr/album/64921882');
INSERT INTO `wp_postmeta` VALUES (1546,296,'_deezer','field_5e729fe642ab6');
INSERT INTO `wp_postmeta` VALUES (1547,296,'apple_music','https://music.apple.com/fr/album/pull-di-trigger/1392941343');
INSERT INTO `wp_postmeta` VALUES (1548,296,'_apple_music','field_5e729fe642ac6');
INSERT INTO `wp_postmeta` VALUES (1549,296,'google_play_music','https://play.google.com/music/preview/Bwonkurnpwlisrz53k4eqiubpnm');
INSERT INTO `wp_postmeta` VALUES (1550,296,'_google_play_music','field_5e729fe642ad3');
INSERT INTO `wp_postmeta` VALUES (1551,296,'tidal','');
INSERT INTO `wp_postmeta` VALUES (1552,296,'_tidal','field_5e729fe642adb');
INSERT INTO `wp_postmeta` VALUES (1553,296,'artistes_associes','a:1:{i:0;s:3:\"154\";}');
INSERT INTO `wp_postmeta` VALUES (1554,296,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1555,296,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1556,296,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (1557,296,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1558,296,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (1559,296,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (1560,296,'_wp_old_date','2020-03-18');
INSERT INTO `wp_postmeta` VALUES (1561,216,'_oembed_7c94fc6139cee3cb39cfd4621fd849ab','<iframe title=\"Spotify Embed: Darling (Acoustic)\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/album/5ZNBB13oewZ9ykZ3F7L9rY?si=N8oxOkJMToCtEcHHGRDUTQ\"></iframe>');
INSERT INTO `wp_postmeta` VALUES (1562,216,'_oembed_time_7c94fc6139cee3cb39cfd4621fd849ab','1584572194');
INSERT INTO `wp_postmeta` VALUES (1563,216,'albums_associes','a:1:{i:0;s:3:\"296\";}');
INSERT INTO `wp_postmeta` VALUES (1564,216,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (1567,154,'__edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1568,154,'__edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1569,154,'__edit_last','');
INSERT INTO `wp_postmeta` VALUES (1570,154,'__edit_last','');
INSERT INTO `wp_postmeta` VALUES (1571,154,'__date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1572,154,'__nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1573,154,'__sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1574,154,'__sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1575,154,'__image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1576,154,'__image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1577,154,'__yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1578,154,'__yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1579,154,'_dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (1580,154,'_dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (1581,154,'_dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (1582,154,'_dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (1583,154,'_dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (1584,154,'_dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (1585,154,'__compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1586,154,'__compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1587,154,'__twitter','');
INSERT INTO `wp_postmeta` VALUES (1588,154,'__twitter','');
INSERT INTO `wp_postmeta` VALUES (1589,154,'__instagram','');
INSERT INTO `wp_postmeta` VALUES (1590,154,'__instagram','');
INSERT INTO `wp_postmeta` VALUES (1591,154,'__facebook','');
INSERT INTO `wp_postmeta` VALUES (1592,154,'__facebook','');
INSERT INTO `wp_postmeta` VALUES (1593,154,'__youtube','');
INSERT INTO `wp_postmeta` VALUES (1594,154,'__youtube','');
INSERT INTO `wp_postmeta` VALUES (1595,154,'__thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1596,154,'__thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1597,154,'__musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1598,154,'__musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1599,154,'__albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1600,154,'__albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1601,154,'__clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1602,154,'__clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1603,151,'__edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1604,151,'__edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1605,151,'__edit_last','');
INSERT INTO `wp_postmeta` VALUES (1606,151,'__edit_last','');
INSERT INTO `wp_postmeta` VALUES (1607,151,'__date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1608,151,'__nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1609,151,'__biographie','');
INSERT INTO `wp_postmeta` VALUES (1610,151,'__sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1611,151,'__sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1612,151,'__image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1613,151,'__image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1614,151,'__yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1615,151,'__yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1616,151,'__thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1617,151,'__thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1618,151,'__albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1619,151,'__albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1620,151,'__clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1621,151,'__clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1622,151,'__musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1623,151,'__musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1624,151,'__compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1625,151,'__compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1626,151,'__twitter','');
INSERT INTO `wp_postmeta` VALUES (1627,151,'__twitter','');
INSERT INTO `wp_postmeta` VALUES (1628,151,'__instagram','');
INSERT INTO `wp_postmeta` VALUES (1629,151,'__instagram','');
INSERT INTO `wp_postmeta` VALUES (1630,151,'__facebook','');
INSERT INTO `wp_postmeta` VALUES (1631,151,'__facebook','');
INSERT INTO `wp_postmeta` VALUES (1632,151,'__youtube','');
INSERT INTO `wp_postmeta` VALUES (1633,151,'__youtube','');
INSERT INTO `wp_postmeta` VALUES (1634,154,'___edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1635,154,'___edit_last','');
INSERT INTO `wp_postmeta` VALUES (1636,154,'___date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1637,154,'___nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1638,154,'___sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1639,154,'___image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1640,154,'___yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1641,154,'__dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (1642,154,'__dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (1643,154,'__dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (1644,154,'___compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1645,154,'___twitter','');
INSERT INTO `wp_postmeta` VALUES (1646,154,'___instagram','');
INSERT INTO `wp_postmeta` VALUES (1647,154,'___facebook','');
INSERT INTO `wp_postmeta` VALUES (1648,154,'___youtube','');
INSERT INTO `wp_postmeta` VALUES (1649,154,'___thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1650,154,'___musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1651,154,'___albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1652,154,'___clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1653,151,'___edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1654,151,'___edit_last','');
INSERT INTO `wp_postmeta` VALUES (1655,151,'___date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1656,151,'___nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1657,151,'___biographie','');
INSERT INTO `wp_postmeta` VALUES (1658,151,'___sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1659,151,'___image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1660,151,'___yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1661,151,'___thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1662,151,'___albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1663,151,'___clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1664,151,'___musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1665,151,'___compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1666,151,'___twitter','');
INSERT INTO `wp_postmeta` VALUES (1667,151,'___instagram','');
INSERT INTO `wp_postmeta` VALUES (1668,151,'___facebook','');
INSERT INTO `wp_postmeta` VALUES (1669,151,'___youtube','');
INSERT INTO `wp_postmeta` VALUES (1670,154,'____edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1671,154,'____edit_last','');
INSERT INTO `wp_postmeta` VALUES (1672,154,'____date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1673,154,'____nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1674,154,'____sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1675,154,'____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1676,154,'____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1677,154,'____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1678,154,'____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1679,154,'___dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (1680,154,'___dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (1681,154,'___dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (1682,154,'___dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (1683,154,'___dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (1684,154,'___dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (1685,154,'____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1686,154,'____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1687,154,'____twitter','');
INSERT INTO `wp_postmeta` VALUES (1688,154,'____twitter','');
INSERT INTO `wp_postmeta` VALUES (1689,154,'____instagram','');
INSERT INTO `wp_postmeta` VALUES (1690,154,'____instagram','');
INSERT INTO `wp_postmeta` VALUES (1691,154,'____facebook','');
INSERT INTO `wp_postmeta` VALUES (1692,154,'____facebook','');
INSERT INTO `wp_postmeta` VALUES (1693,154,'____youtube','');
INSERT INTO `wp_postmeta` VALUES (1694,154,'____youtube','');
INSERT INTO `wp_postmeta` VALUES (1695,154,'____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1696,154,'____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1697,154,'____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1698,154,'____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1699,154,'____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1700,154,'____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1701,154,'____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1702,154,'____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1703,151,'____edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1704,151,'____edit_last','');
INSERT INTO `wp_postmeta` VALUES (1705,151,'____edit_last','');
INSERT INTO `wp_postmeta` VALUES (1706,151,'____date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1707,151,'____date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1708,151,'____nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1709,151,'____nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1710,151,'____biographie','');
INSERT INTO `wp_postmeta` VALUES (1711,151,'____biographie','');
INSERT INTO `wp_postmeta` VALUES (1712,151,'____sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1713,151,'____sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1714,151,'____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1715,151,'____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1716,151,'____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1717,151,'____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1718,151,'____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1719,151,'____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1720,151,'____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1721,151,'____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1722,151,'____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1723,151,'____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1724,151,'____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1725,151,'____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1726,151,'____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1727,151,'____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1728,151,'____twitter','');
INSERT INTO `wp_postmeta` VALUES (1729,151,'____twitter','');
INSERT INTO `wp_postmeta` VALUES (1730,151,'____instagram','');
INSERT INTO `wp_postmeta` VALUES (1731,151,'____instagram','');
INSERT INTO `wp_postmeta` VALUES (1732,151,'____facebook','');
INSERT INTO `wp_postmeta` VALUES (1733,151,'____facebook','');
INSERT INTO `wp_postmeta` VALUES (1734,151,'____youtube','');
INSERT INTO `wp_postmeta` VALUES (1735,154,'_____edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1736,154,'_____edit_last','');
INSERT INTO `wp_postmeta` VALUES (1737,154,'_____date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1738,154,'_____nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1739,154,'_____sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1740,154,'_____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1741,154,'_____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1742,154,'____dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (1743,154,'____dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (1744,154,'____dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (1745,154,'_____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1746,154,'_____twitter','');
INSERT INTO `wp_postmeta` VALUES (1747,154,'_____instagram','');
INSERT INTO `wp_postmeta` VALUES (1748,154,'_____facebook','');
INSERT INTO `wp_postmeta` VALUES (1749,154,'_____youtube','');
INSERT INTO `wp_postmeta` VALUES (1750,154,'_____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1751,154,'_____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1752,154,'_____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1753,154,'_____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1754,151,'_____edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1755,151,'_____edit_last','');
INSERT INTO `wp_postmeta` VALUES (1756,151,'_____date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1757,151,'_____nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1758,151,'_____biographie','');
INSERT INTO `wp_postmeta` VALUES (1759,151,'_____sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1760,151,'_____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1761,151,'_____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1762,151,'_____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1763,151,'_____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1764,151,'_____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1765,151,'_____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1766,151,'_____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1767,151,'_____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1768,151,'_____twitter','');
INSERT INTO `wp_postmeta` VALUES (1769,151,'_____instagram','');
INSERT INTO `wp_postmeta` VALUES (1770,151,'_____instagram','');
INSERT INTO `wp_postmeta` VALUES (1771,151,'_____facebook','');
INSERT INTO `wp_postmeta` VALUES (1772,151,'_____facebook','');
INSERT INTO `wp_postmeta` VALUES (1773,151,'_____youtube','');
INSERT INTO `wp_postmeta` VALUES (1774,154,'______edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1775,154,'______edit_last','');
INSERT INTO `wp_postmeta` VALUES (1776,154,'______date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1777,154,'______nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1778,154,'______sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1779,154,'______image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1780,154,'______yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1781,154,'_____dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (1782,154,'_____dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (1783,154,'_____dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (1784,154,'_____dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (1785,154,'_____dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (1786,154,'______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1787,154,'______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1788,154,'______twitter','');
INSERT INTO `wp_postmeta` VALUES (1789,154,'______twitter','');
INSERT INTO `wp_postmeta` VALUES (1790,154,'______instagram','');
INSERT INTO `wp_postmeta` VALUES (1791,154,'______instagram','');
INSERT INTO `wp_postmeta` VALUES (1792,154,'______facebook','');
INSERT INTO `wp_postmeta` VALUES (1793,154,'______facebook','');
INSERT INTO `wp_postmeta` VALUES (1794,154,'______youtube','');
INSERT INTO `wp_postmeta` VALUES (1795,154,'______youtube','');
INSERT INTO `wp_postmeta` VALUES (1796,154,'______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1797,154,'______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1798,154,'______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1799,154,'______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1800,154,'______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1801,154,'______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1802,154,'______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1803,154,'______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1804,151,'______edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1805,151,'______edit_last','');
INSERT INTO `wp_postmeta` VALUES (1806,151,'______date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1807,151,'______date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1808,151,'______nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1809,151,'______nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1810,151,'______biographie','');
INSERT INTO `wp_postmeta` VALUES (1811,151,'______biographie','');
INSERT INTO `wp_postmeta` VALUES (1812,151,'______sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1813,151,'______sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1814,151,'______image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1815,151,'______image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1816,151,'______yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1817,151,'______yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1818,151,'______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1819,151,'______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1820,151,'______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1821,151,'______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1822,151,'______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1823,151,'______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1824,151,'______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1825,151,'______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1826,151,'______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1827,151,'______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1828,151,'______twitter','');
INSERT INTO `wp_postmeta` VALUES (1829,151,'______twitter','');
INSERT INTO `wp_postmeta` VALUES (1830,151,'______instagram','');
INSERT INTO `wp_postmeta` VALUES (1831,151,'______instagram','');
INSERT INTO `wp_postmeta` VALUES (1832,151,'______facebook','');
INSERT INTO `wp_postmeta` VALUES (1833,151,'______youtube','');
INSERT INTO `wp_postmeta` VALUES (1834,151,'______youtube','');
INSERT INTO `wp_postmeta` VALUES (1835,154,'_______edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1836,154,'_______edit_last','');
INSERT INTO `wp_postmeta` VALUES (1837,154,'_______date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1838,154,'_______nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1839,154,'_______sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1840,154,'_______image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1841,154,'_______yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1842,154,'______dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (1843,154,'______dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (1844,154,'______dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (1845,154,'_______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1846,154,'_______twitter','');
INSERT INTO `wp_postmeta` VALUES (1847,154,'_______instagram','');
INSERT INTO `wp_postmeta` VALUES (1848,154,'_______facebook','');
INSERT INTO `wp_postmeta` VALUES (1849,154,'_______youtube','');
INSERT INTO `wp_postmeta` VALUES (1850,154,'_______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1851,154,'_______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1852,154,'_______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1853,154,'_______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1854,151,'_______edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1855,151,'_______edit_last','');
INSERT INTO `wp_postmeta` VALUES (1856,151,'_______date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1857,151,'_______nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1858,151,'_______biographie','');
INSERT INTO `wp_postmeta` VALUES (1859,151,'_______sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1860,151,'_______image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1861,151,'_______yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1862,151,'_______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1863,151,'_______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1864,151,'_______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1865,151,'_______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1866,151,'_______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1867,151,'_______twitter','');
INSERT INTO `wp_postmeta` VALUES (1868,151,'_______instagram','');
INSERT INTO `wp_postmeta` VALUES (1869,151,'_______facebook','');
INSERT INTO `wp_postmeta` VALUES (1870,151,'_______youtube','');
INSERT INTO `wp_postmeta` VALUES (1871,154,'________edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1872,154,'________edit_last','');
INSERT INTO `wp_postmeta` VALUES (1873,154,'________date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1874,154,'________nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1875,154,'________sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1876,154,'________image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1877,154,'________yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1878,154,'_______dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (1879,154,'_______dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (1880,154,'_______dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (1881,154,'________compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1882,154,'________twitter','');
INSERT INTO `wp_postmeta` VALUES (1883,154,'________instagram','');
INSERT INTO `wp_postmeta` VALUES (1884,154,'________facebook','');
INSERT INTO `wp_postmeta` VALUES (1885,154,'________youtube','');
INSERT INTO `wp_postmeta` VALUES (1886,154,'________thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1887,154,'________musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1888,154,'________albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1889,154,'________clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1890,151,'________edit_lock','');
INSERT INTO `wp_postmeta` VALUES (1891,151,'________edit_last','');
INSERT INTO `wp_postmeta` VALUES (1892,151,'________date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (1893,151,'________nom_complet','');
INSERT INTO `wp_postmeta` VALUES (1894,151,'________biographie','');
INSERT INTO `wp_postmeta` VALUES (1895,151,'________sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1896,151,'________image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1897,151,'________yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (1898,151,'________thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (1899,151,'________albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1900,151,'________clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1901,151,'________musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1902,151,'________compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (1903,151,'________twitter','');
INSERT INTO `wp_postmeta` VALUES (1904,151,'________instagram','');
INSERT INTO `wp_postmeta` VALUES (1905,151,'________facebook','');
INSERT INTO `wp_postmeta` VALUES (1906,151,'________youtube','');
INSERT INTO `wp_postmeta` VALUES (1909,299,'_edit_lock','1600804933:1');
INSERT INTO `wp_postmeta` VALUES (1910,300,'_wp_attached_file','2020/03/admiral-t.jpg');
INSERT INTO `wp_postmeta` VALUES (1911,300,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:21:\"2020/03/admiral-t.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"admiral-t-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"admiral-t-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:21:\"admiral-t-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:21:\"admiral-t-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:4:\"file\";s:21:\"admiral-t-400x400.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"pepseeactus-Music\";a:4:{s:4:\"file\";s:21:\"admiral-t-200x200.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"bannière\";a:4:{s:4:\"file\";s:21:\"admiral-t-900x350.jpg\";s:5:\"width\";i:900;s:6:\"height\";i:350;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1912,300,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1913,300,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1914,300,'_imagify_data','a:2:{s:5:\"sizes\";a:16:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:246878;s:14:\"optimized_size\";i:52456;s:7:\"percent\";d:78.75;}s:22:\"bannière@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:29668;s:14:\"optimized_size\";i:12044;s:7:\"percent\";d:59.399999999999999;}s:30:\"pepseeactus-Music@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7261;s:14:\"optimized_size\";i:3770;s:7:\"percent\";d:48.079999999999998;}s:40:\"pepseeactus-ArtistsAssocies@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:19298;s:14:\"optimized_size\";i:8528;s:7:\"percent\";d:55.810000000000002;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:24218;s:14:\"optimized_size\";i:10516;s:7:\"percent\";d:56.579999999999998;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:33293;s:14:\"optimized_size\";i:12210;s:7:\"percent\";d:63.329999999999998;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:8429;s:14:\"optimized_size\";i:3956;s:7:\"percent\";d:53.07;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4973;s:14:\"optimized_size\";i:2546;s:7:\"percent\";d:48.799999999999997;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:246878;s:14:\"optimized_size\";i:17822;s:7:\"percent\";d:92.780000000000001;}s:9:\"thumbnail\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4973;s:14:\"optimized_size\";i:3850;s:7:\"percent\";d:22.579999999999998;}s:6:\"medium\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:8429;s:14:\"optimized_size\";i:5478;s:7:\"percent\";d:35.009999999999998;}s:12:\"medium_large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:33293;s:14:\"optimized_size\";i:18733;s:7:\"percent\";d:43.729999999999997;}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:24218;s:14:\"optimized_size\";i:15689;s:7:\"percent\";d:35.219999999999999;}s:27:\"pepseeactus-ArtistsAssocies\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:19298;s:14:\"optimized_size\";i:12370;s:7:\"percent\";d:35.899999999999999;}s:17:\"pepseeactus-Music\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7261;s:14:\"optimized_size\";i:5223;s:7:\"percent\";d:28.07;}s:9:\"bannière\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:29668;s:14:\"optimized_size\";i:16931;s:7:\"percent\";d:42.93;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:748036;s:14:\"optimized_size\";i:202122;s:7:\"percent\";d:72.980000000000004;}}');
INSERT INTO `wp_postmeta` VALUES (1915,300,'_wp_attachment_image_alt','admiral t');
INSERT INTO `wp_postmeta` VALUES (1916,299,'_thumbnail_id','300');
INSERT INTO `wp_postmeta` VALUES (1917,299,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1918,299,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (1919,299,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (1920,299,'clips_associes','');
INSERT INTO `wp_postmeta` VALUES (1921,299,'_clips_associes','field_5e721548a0750');
INSERT INTO `wp_postmeta` VALUES (1922,299,'musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1923,299,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (1924,299,'compte_verifie','0');
INSERT INTO `wp_postmeta` VALUES (1925,299,'_compte_verifie','field_5e6fef2c41455');
INSERT INTO `wp_postmeta` VALUES (1926,299,'twitter','');
INSERT INTO `wp_postmeta` VALUES (1927,299,'_twitter','field_5e6fedc241452');
INSERT INTO `wp_postmeta` VALUES (1928,299,'instagram','');
INSERT INTO `wp_postmeta` VALUES (1929,299,'_instagram','field_5e6fee7041453');
INSERT INTO `wp_postmeta` VALUES (1930,299,'facebook','');
INSERT INTO `wp_postmeta` VALUES (1931,299,'_facebook','field_5e6feee241454');
INSERT INTO `wp_postmeta` VALUES (1932,299,'youtube','');
INSERT INTO `wp_postmeta` VALUES (1933,299,'_youtube','field_5e6feff541456');
INSERT INTO `wp_postmeta` VALUES (1934,299,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (1935,299,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (1936,299,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (1937,299,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (1938,299,'_yoast_wpseo_content_score','30');
INSERT INTO `wp_postmeta` VALUES (1956,232,'_imagify_data','a:2:{s:5:\"sizes\";a:8:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:19:\"banner@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:66768;s:14:\"optimized_size\";i:34978;s:7:\"percent\";d:47.609999999999999;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:33458;s:14:\"optimized_size\";i:17104;s:7:\"percent\";d:48.880000000000003;}s:18:\"large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:73893;s:14:\"optimized_size\";i:34024;s:7:\"percent\";d:53.960000000000001;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:48307;s:14:\"optimized_size\";i:23974;s:7:\"percent\";d:50.369999999999997;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11375;s:14:\"optimized_size\";i:6392;s:7:\"percent\";d:43.810000000000002;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:5339;s:14:\"optimized_size\";i:2788;s:7:\"percent\";d:47.780000000000001;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:98280;s:14:\"optimized_size\";i:51118;s:7:\"percent\";d:47.990000000000002;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:337420;s:14:\"optimized_size\";i:170378;s:7:\"percent\";d:49.509999999999998;}}');
INSERT INTO `wp_postmeta` VALUES (1959,142,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (1960,142,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1961,142,'musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1962,142,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (1963,144,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (1964,144,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1965,144,'musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1966,144,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (1974,303,'_wp_attached_file','2019/07/SHANNON-BEST-OFFICIAL-MUSIC-VIDEO-.jpeg');
INSERT INTO `wp_postmeta` VALUES (1975,303,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:47:\"2019/07/SHANNON-BEST-OFFICIAL-MUSIC-VIDEO-.jpeg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:47:\"SHANNON-BEST-OFFICIAL-MUSIC-VIDEO--150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:47:\"SHANNON-BEST-OFFICIAL-MUSIC-VIDEO--300x169.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:47:\"SHANNON-BEST-OFFICIAL-MUSIC-VIDEO--768x432.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:48:\"SHANNON-BEST-OFFICIAL-MUSIC-VIDEO--1024x576.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:47:\"SHANNON-BEST-OFFICIAL-MUSIC-VIDEO--380x500.jpeg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1976,303,'_fvp_image_url','https://i.ytimg.com/vi/rMr1VpThH8U/hqdefault.jpg');
INSERT INTO `wp_postmeta` VALUES (1977,142,'_thumbnail_id','303');
INSERT INTO `wp_postmeta` VALUES (1978,142,'_fvp_video','a:12:{s:5:\"valid\";b:1;s:3:\"img\";i:303;s:2:\"id\";N;s:8:\"provider\";s:7:\"youtube\";s:5:\"title\";s:39:\"SHANNON - BEST ( OFFICIAL MUSIC VIDEO )\";s:6:\"author\";s:7:\"SHANNON\";s:11:\"description\";N;s:7:\"img_url\";s:48:\"https://i.ytimg.com/vi/rMr1VpThH8U/hqdefault.jpg\";s:8:\"filename\";s:39:\"SHANNON - BEST ( OFFICIAL MUSIC VIDEO )\";s:4:\"full\";s:43:\"https://www.youtube.com/watch?v=rMr1VpThH8U\";s:10:\"parameters\";a:0:{}s:5:\"noimg\";b:0;}');
INSERT INTO `wp_postmeta` VALUES (1979,303,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1980,303,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1981,303,'_imagify_data','a:2:{s:5:\"sizes\";a:12:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:101780;s:14:\"optimized_size\";i:59057;s:7:\"percent\";d:41.979999999999997;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:26982;s:14:\"optimized_size\";i:12168;s:7:\"percent\";d:54.899999999999999;}s:18:\"large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:71250;s:14:\"optimized_size\";i:31812;s:7:\"percent\";d:55.350000000000001;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:47983;s:14:\"optimized_size\";i:22352;s:7:\"percent\";d:53.420000000000002;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:12561;s:14:\"optimized_size\";i:7092;s:7:\"percent\";d:43.539999999999999;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:6422;s:14:\"optimized_size\";i:3612;s:7:\"percent\";d:43.759999999999998;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:101780;s:14:\"optimized_size\";i:42954;s:7:\"percent\";d:57.799999999999997;}s:9:\"thumbnail\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:6422;s:14:\"optimized_size\";i:5242;s:7:\"percent\";d:18.370000000000001;}s:6:\"medium\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:12561;s:14:\"optimized_size\";i:9617;s:7:\"percent\";d:23.440000000000001;}s:12:\"medium_large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:47983;s:14:\"optimized_size\";i:30361;s:7:\"percent\";d:36.729999999999997;}s:5:\"large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:71250;s:14:\"optimized_size\";i:44239;s:7:\"percent\";d:37.909999999999997;}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:26982;s:14:\"optimized_size\";i:17261;s:7:\"percent\";d:36.030000000000001;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:533956;s:14:\"optimized_size\";i:285767;s:7:\"percent\";d:46.479999999999997;}}');
INSERT INTO `wp_postmeta` VALUES (1982,303,'_wp_attachment_image_alt','shannon best');
INSERT INTO `wp_postmeta` VALUES (1985,304,'_wp_attached_file','2019/07/KEROS-N-MISS-DOLIPRANE.jpeg');
INSERT INTO `wp_postmeta` VALUES (1986,304,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:35:\"2019/07/KEROS-N-MISS-DOLIPRANE.jpeg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"KEROS-N-MISS-DOLIPRANE-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"KEROS-N-MISS-DOLIPRANE-300x169.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"KEROS-N-MISS-DOLIPRANE-768x432.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:36:\"KEROS-N-MISS-DOLIPRANE-1024x576.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:35:\"KEROS-N-MISS-DOLIPRANE-380x500.jpeg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1987,304,'_fvp_image_url','https://i.ytimg.com/vi/AKl3PerNl34/hqdefault.jpg');
INSERT INTO `wp_postmeta` VALUES (1988,138,'_thumbnail_id','304');
INSERT INTO `wp_postmeta` VALUES (1989,304,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (1990,304,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (1991,304,'_imagify_data','a:2:{s:5:\"sizes\";a:12:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:85982;s:14:\"optimized_size\";i:42285;s:7:\"percent\";d:50.82;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:21700;s:14:\"optimized_size\";i:9612;s:7:\"percent\";d:55.710000000000001;}s:18:\"large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:48651;s:14:\"optimized_size\";i:18622;s:7:\"percent\";d:61.719999999999999;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:32395;s:14:\"optimized_size\";i:13346;s:7:\"percent\";d:58.799999999999997;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:8104;s:14:\"optimized_size\";i:3438;s:7:\"percent\";d:57.579999999999998;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4824;s:14:\"optimized_size\";i:2242;s:7:\"percent\";d:53.520000000000003;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:85982;s:14:\"optimized_size\";i:29334;s:7:\"percent\";d:65.879999999999995;}s:9:\"thumbnail\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4824;s:14:\"optimized_size\";i:3649;s:7:\"percent\";d:24.359999999999999;}s:6:\"medium\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:8104;s:14:\"optimized_size\";i:5537;s:7:\"percent\";d:31.68;}s:12:\"medium_large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:32395;s:14:\"optimized_size\";i:19195;s:7:\"percent\";d:40.75;}s:5:\"large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:48651;s:14:\"optimized_size\";i:27106;s:7:\"percent\";d:44.280000000000001;}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:21700;s:14:\"optimized_size\";i:13486;s:7:\"percent\";d:37.850000000000001;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:403312;s:14:\"optimized_size\";i:187852;s:7:\"percent\";d:53.420000000000002;}}');
INSERT INTO `wp_postmeta` VALUES (1992,304,'_wp_attachment_image_alt','keros-n miss doliprane');
INSERT INTO `wp_postmeta` VALUES (1995,138,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (1996,138,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (1997,138,'musique_associees','');
INSERT INTO `wp_postmeta` VALUES (1998,138,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (1999,140,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (2000,140,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2001,140,'musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2002,140,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (2003,305,'_wp_attached_file','2019/07/VaLLeY-PAPA-Official-Vidéo-2019-.jpeg');
INSERT INTO `wp_postmeta` VALUES (2004,305,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:46:\"2019/07/VaLLeY-PAPA-Official-Vidéo-2019-.jpeg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:46:\"VaLLeY-PAPA-Official-Vidéo-2019--150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:46:\"VaLLeY-PAPA-Official-Vidéo-2019--300x169.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:46:\"VaLLeY-PAPA-Official-Vidéo-2019--768x432.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:47:\"VaLLeY-PAPA-Official-Vidéo-2019--1024x576.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:46:\"VaLLeY-PAPA-Official-Vidéo-2019--380x500.jpeg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (2005,305,'_fvp_image_url','https://i.ytimg.com/vi/Zs_RW-3kS_A/hqdefault.jpg');
INSERT INTO `wp_postmeta` VALUES (2006,134,'_thumbnail_id','305');
INSERT INTO `wp_postmeta` VALUES (2007,305,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (2008,305,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (2009,305,'_imagify_data','a:2:{s:5:\"sizes\";a:12:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:67704;s:14:\"optimized_size\";i:27854;s:7:\"percent\";d:58.859999999999999;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:17964;s:14:\"optimized_size\";i:6808;s:7:\"percent\";d:62.100000000000001;}s:18:\"large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:42347;s:14:\"optimized_size\";i:15036;s:7:\"percent\";d:64.489999999999995;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:27447;s:14:\"optimized_size\";i:10048;s:7:\"percent\";d:63.390000000000001;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7152;s:14:\"optimized_size\";i:2742;s:7:\"percent\";d:61.659999999999997;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4306;s:14:\"optimized_size\";i:1730;s:7:\"percent\";d:59.82;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:67704;s:14:\"optimized_size\";i:23092;s:7:\"percent\";d:65.890000000000001;}s:9:\"thumbnail\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4306;s:14:\"optimized_size\";i:2912;s:7:\"percent\";d:32.369999999999997;}s:6:\"medium\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:7152;s:14:\"optimized_size\";i:4509;s:7:\"percent\";d:36.950000000000003;}s:12:\"medium_large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:27447;s:14:\"optimized_size\";i:15835;s:7:\"percent\";d:42.310000000000002;}s:5:\"large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:42347;s:14:\"optimized_size\";i:20774;s:7:\"percent\";d:50.939999999999998;}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:17964;s:14:\"optimized_size\";i:10319;s:7:\"percent\";d:42.560000000000002;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:333840;s:14:\"optimized_size\";i:141659;s:7:\"percent\";d:57.57;}}');
INSERT INTO `wp_postmeta` VALUES (2010,305,'_wp_attachment_image_alt','valley papa');
INSERT INTO `wp_postmeta` VALUES (2013,134,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (2014,134,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2015,134,'musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2016,134,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (2017,135,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (2018,135,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2019,135,'musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2020,135,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (2025,306,'artistes_associes','a:1:{i:0;s:3:\"154\";}');
INSERT INTO `wp_postmeta` VALUES (2026,306,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2027,306,'musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2028,306,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (2031,307,'artistes_associes','a:1:{i:0;s:3:\"154\";}');
INSERT INTO `wp_postmeta` VALUES (2032,307,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2033,307,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2034,307,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (2035,307,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2036,307,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (2037,307,'musique_associees','a:1:{i:0;s:3:\"211\";}');
INSERT INTO `wp_postmeta` VALUES (2038,307,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (2043,309,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2044,309,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (2045,309,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2046,309,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (2047,309,'artistes_associes','a:1:{i:0;s:3:\"299\";}');
INSERT INTO `wp_postmeta` VALUES (2048,309,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2049,310,'_edit_lock','1584913833:1');
INSERT INTO `wp_postmeta` VALUES (2050,310,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (2051,211,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2052,211,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2053,73,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2054,73,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2055,72,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2056,72,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2059,313,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2060,313,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (2061,313,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2062,313,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (2063,313,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (2064,313,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2065,314,'_edit_lock','1585495830:1');
INSERT INTO `wp_postmeta` VALUES (2066,314,'__edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2067,314,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (2068,314,'__edit_last','');
INSERT INTO `wp_postmeta` VALUES (2069,314,'date_de_naissance','19900602');
INSERT INTO `wp_postmeta` VALUES (2070,314,'_date_de_naissance','field_5d3c31e2d136c');
INSERT INTO `wp_postmeta` VALUES (2071,314,'__date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2072,314,'nom_complet','Yannick SEBASTIEN');
INSERT INTO `wp_postmeta` VALUES (2073,314,'_nom_complet','field_5d3c328bd136d');
INSERT INTO `wp_postmeta` VALUES (2074,314,'__nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2075,314,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2076,314,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (2077,314,'__sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2078,314,'image_arriere_plan','197');
INSERT INTO `wp_postmeta` VALUES (2079,314,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (2080,314,'__image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2081,314,'_yoast_wpseo_content_score','60');
INSERT INTO `wp_postmeta` VALUES (2082,314,'__yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2083,314,'dpsp_networks_shares','s:113:\"s:104:\"s:96:\"s:88:\"s:80:\"s:72:\"s:64:\"s:56:\"s:48:\"a:2:{s:7:\"twitter\";s:1:\"0\";s:9:\"pinterest\";i:0;}\";\";\";\";\";\";\";\";\";');
INSERT INTO `wp_postmeta` VALUES (2084,314,'_dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2085,314,'dpsp_networks_shares_total','0');
INSERT INTO `wp_postmeta` VALUES (2086,314,'_dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2087,314,'dpsp_networks_shares_last_updated','1564237420');
INSERT INTO `wp_postmeta` VALUES (2088,314,'_dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2089,314,'compte_verifie','1');
INSERT INTO `wp_postmeta` VALUES (2090,314,'_compte_verifie','field_5e6fef2c41455');
INSERT INTO `wp_postmeta` VALUES (2091,314,'__compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2092,314,'twitter','https://twitter.com/JmaXBrvtmn');
INSERT INTO `wp_postmeta` VALUES (2093,314,'_twitter','field_5e6fedc241452');
INSERT INTO `wp_postmeta` VALUES (2094,314,'__twitter','');
INSERT INTO `wp_postmeta` VALUES (2095,314,'instagram','https://www.instagram.com/jmax_officiel');
INSERT INTO `wp_postmeta` VALUES (2096,314,'_instagram','field_5e6fee7041453');
INSERT INTO `wp_postmeta` VALUES (2097,314,'__instagram','');
INSERT INTO `wp_postmeta` VALUES (2098,314,'facebook','https://www.facebook.com/JmaXOfficiel');
INSERT INTO `wp_postmeta` VALUES (2099,314,'_facebook','field_5e6feee241454');
INSERT INTO `wp_postmeta` VALUES (2100,314,'__facebook','');
INSERT INTO `wp_postmeta` VALUES (2101,314,'youtube','https://www.youtube.com/channel/UC0gnV5rOkRoMRcKNlqtN9Sw');
INSERT INTO `wp_postmeta` VALUES (2102,314,'_youtube','field_5e6feff541456');
INSERT INTO `wp_postmeta` VALUES (2103,314,'__youtube','');
INSERT INTO `wp_postmeta` VALUES (2104,314,'_thumbnail_id','197');
INSERT INTO `wp_postmeta` VALUES (2105,314,'__thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2106,314,'musique_associees','a:4:{i:0;s:3:\"216\";i:1;s:2:\"73\";i:2;s:2:\"72\";i:3;s:3:\"211\";}');
INSERT INTO `wp_postmeta` VALUES (2107,314,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (2108,314,'__musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2109,314,'albums_associes','a:1:{i:0;s:3:\"296\";}');
INSERT INTO `wp_postmeta` VALUES (2110,314,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2111,314,'__albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2112,314,'clips_associes','a:3:{i:0;s:3:\"260\";i:1;s:3:\"265\";i:2;s:3:\"231\";}');
INSERT INTO `wp_postmeta` VALUES (2113,314,'_clips_associes','field_5e721548a0750');
INSERT INTO `wp_postmeta` VALUES (2114,314,'__clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2115,314,'___edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2116,314,'___edit_last','');
INSERT INTO `wp_postmeta` VALUES (2117,314,'___date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2118,314,'___nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2119,314,'___sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2120,314,'___image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2121,314,'___yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2122,314,'__dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2123,314,'__dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2124,314,'__dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2125,314,'___compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2126,314,'___twitter','');
INSERT INTO `wp_postmeta` VALUES (2127,314,'___instagram','');
INSERT INTO `wp_postmeta` VALUES (2128,314,'___facebook','');
INSERT INTO `wp_postmeta` VALUES (2129,314,'___youtube','');
INSERT INTO `wp_postmeta` VALUES (2130,314,'___thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2131,314,'___musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2132,314,'___albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2133,314,'___clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2134,314,'____edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2135,314,'____edit_last','');
INSERT INTO `wp_postmeta` VALUES (2136,314,'____date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2137,314,'____nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2138,314,'____sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2139,314,'____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2140,314,'____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2141,314,'___dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2142,314,'___dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2143,314,'___dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2144,314,'____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2145,314,'____twitter','');
INSERT INTO `wp_postmeta` VALUES (2146,314,'____instagram','');
INSERT INTO `wp_postmeta` VALUES (2147,314,'____facebook','');
INSERT INTO `wp_postmeta` VALUES (2148,314,'____youtube','');
INSERT INTO `wp_postmeta` VALUES (2149,314,'____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2150,314,'____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2151,314,'____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2152,314,'____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2153,314,'_____edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2154,314,'_____edit_last','');
INSERT INTO `wp_postmeta` VALUES (2155,314,'_____date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2156,314,'_____nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2157,314,'_____sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2158,314,'_____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2159,314,'_____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2160,314,'____dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2161,314,'____dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2162,314,'____dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2163,314,'_____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2164,314,'_____twitter','');
INSERT INTO `wp_postmeta` VALUES (2165,314,'_____instagram','');
INSERT INTO `wp_postmeta` VALUES (2166,314,'_____facebook','');
INSERT INTO `wp_postmeta` VALUES (2167,314,'_____youtube','');
INSERT INTO `wp_postmeta` VALUES (2168,314,'_____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2169,314,'_____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2170,314,'_____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2171,314,'_____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2172,314,'______edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2173,314,'______edit_last','');
INSERT INTO `wp_postmeta` VALUES (2174,314,'______date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2175,314,'______nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2176,314,'______sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2177,314,'______image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2178,314,'______yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2179,314,'_____dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2180,314,'_____dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2181,314,'_____dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2182,314,'______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2183,314,'______twitter','');
INSERT INTO `wp_postmeta` VALUES (2184,314,'______instagram','');
INSERT INTO `wp_postmeta` VALUES (2185,314,'______facebook','');
INSERT INTO `wp_postmeta` VALUES (2186,314,'______youtube','');
INSERT INTO `wp_postmeta` VALUES (2187,314,'______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2188,314,'______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2189,314,'______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2190,314,'______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2191,314,'_______edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2192,314,'_______edit_last','');
INSERT INTO `wp_postmeta` VALUES (2193,314,'_______date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2194,314,'_______nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2195,314,'_______sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2196,314,'_______image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2197,314,'_______yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2198,314,'______dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2199,314,'______dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2200,314,'______dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2201,314,'_______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2202,314,'_______twitter','');
INSERT INTO `wp_postmeta` VALUES (2203,314,'_______instagram','');
INSERT INTO `wp_postmeta` VALUES (2204,314,'_______facebook','');
INSERT INTO `wp_postmeta` VALUES (2205,314,'_______youtube','');
INSERT INTO `wp_postmeta` VALUES (2206,314,'_______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2207,314,'_______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2208,314,'_______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2209,314,'_______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2210,314,'________edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2211,314,'________edit_last','');
INSERT INTO `wp_postmeta` VALUES (2212,314,'________date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2213,314,'________nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2214,314,'________sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2215,314,'________image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2216,314,'________yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2217,314,'_______dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2218,314,'_______dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2219,314,'_______dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2220,314,'________compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2221,314,'________twitter','');
INSERT INTO `wp_postmeta` VALUES (2222,314,'________instagram','');
INSERT INTO `wp_postmeta` VALUES (2223,314,'________facebook','');
INSERT INTO `wp_postmeta` VALUES (2224,314,'________youtube','');
INSERT INTO `wp_postmeta` VALUES (2225,314,'________thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2226,314,'________musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2227,314,'________albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2228,314,'________clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2229,315,'_edit_lock','1585496109:1');
INSERT INTO `wp_postmeta` VALUES (2230,315,'__edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2231,315,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (2232,315,'__edit_last','');
INSERT INTO `wp_postmeta` VALUES (2233,315,'date_de_naissance','19900602');
INSERT INTO `wp_postmeta` VALUES (2234,315,'_date_de_naissance','field_5d3c31e2d136c');
INSERT INTO `wp_postmeta` VALUES (2235,315,'__date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2236,315,'nom_complet','Yannick SEBASTIEN');
INSERT INTO `wp_postmeta` VALUES (2237,315,'_nom_complet','field_5d3c328bd136d');
INSERT INTO `wp_postmeta` VALUES (2238,315,'__nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2239,315,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2240,315,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (2241,315,'__sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2242,315,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2243,315,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (2244,315,'__image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2245,315,'_yoast_wpseo_content_score','30');
INSERT INTO `wp_postmeta` VALUES (2246,315,'__yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2247,315,'dpsp_networks_shares','s:113:\"s:104:\"s:96:\"s:88:\"s:80:\"s:72:\"s:64:\"s:56:\"s:48:\"a:2:{s:7:\"twitter\";s:1:\"0\";s:9:\"pinterest\";i:0;}\";\";\";\";\";\";\";\";\";');
INSERT INTO `wp_postmeta` VALUES (2248,315,'_dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2249,315,'dpsp_networks_shares_total','0');
INSERT INTO `wp_postmeta` VALUES (2250,315,'_dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2251,315,'dpsp_networks_shares_last_updated','1564237420');
INSERT INTO `wp_postmeta` VALUES (2252,315,'_dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2253,315,'compte_verifie','1');
INSERT INTO `wp_postmeta` VALUES (2254,315,'_compte_verifie','field_5e6fef2c41455');
INSERT INTO `wp_postmeta` VALUES (2255,315,'__compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2256,315,'twitter','https://twitter.com/JmaXBrvtmn');
INSERT INTO `wp_postmeta` VALUES (2257,315,'_twitter','field_5e6fedc241452');
INSERT INTO `wp_postmeta` VALUES (2258,315,'__twitter','');
INSERT INTO `wp_postmeta` VALUES (2259,315,'instagram','https://www.instagram.com/jmax_officiel');
INSERT INTO `wp_postmeta` VALUES (2260,315,'_instagram','field_5e6fee7041453');
INSERT INTO `wp_postmeta` VALUES (2261,315,'__instagram','');
INSERT INTO `wp_postmeta` VALUES (2262,315,'facebook','https://www.facebook.com/JmaXOfficiel');
INSERT INTO `wp_postmeta` VALUES (2263,315,'_facebook','field_5e6feee241454');
INSERT INTO `wp_postmeta` VALUES (2264,315,'__facebook','');
INSERT INTO `wp_postmeta` VALUES (2265,315,'youtube','https://www.youtube.com/channel/UC0gnV5rOkRoMRcKNlqtN9Sw');
INSERT INTO `wp_postmeta` VALUES (2266,315,'_youtube','field_5e6feff541456');
INSERT INTO `wp_postmeta` VALUES (2267,315,'__youtube','');
INSERT INTO `wp_postmeta` VALUES (2268,315,'_thumbnail_id','197');
INSERT INTO `wp_postmeta` VALUES (2269,315,'__thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2270,315,'musique_associees','a:4:{i:0;s:3:\"216\";i:1;s:2:\"73\";i:2;s:2:\"72\";i:3;s:3:\"211\";}');
INSERT INTO `wp_postmeta` VALUES (2271,315,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (2272,315,'__musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2273,315,'albums_associes','a:1:{i:0;s:3:\"296\";}');
INSERT INTO `wp_postmeta` VALUES (2274,315,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2275,315,'__albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2276,315,'clips_associes','a:3:{i:0;s:3:\"260\";i:1;s:3:\"265\";i:2;s:3:\"231\";}');
INSERT INTO `wp_postmeta` VALUES (2277,315,'_clips_associes','field_5e721548a0750');
INSERT INTO `wp_postmeta` VALUES (2278,315,'__clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2279,315,'___edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2280,315,'___edit_last','');
INSERT INTO `wp_postmeta` VALUES (2281,315,'___date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2282,315,'___nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2283,315,'___sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2284,315,'___image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2285,315,'___yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2286,315,'__dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2287,315,'__dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2288,315,'__dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2289,315,'___compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2290,315,'___twitter','');
INSERT INTO `wp_postmeta` VALUES (2291,315,'___instagram','');
INSERT INTO `wp_postmeta` VALUES (2292,315,'___facebook','');
INSERT INTO `wp_postmeta` VALUES (2293,315,'___youtube','');
INSERT INTO `wp_postmeta` VALUES (2294,315,'___thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2295,315,'___musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2296,315,'___albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2297,315,'___clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2298,315,'____edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2299,315,'____edit_last','');
INSERT INTO `wp_postmeta` VALUES (2300,315,'____date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2301,315,'____nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2302,315,'____sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2303,315,'____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2304,315,'____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2305,315,'___dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2306,315,'___dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2307,315,'___dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2308,315,'____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2309,315,'____twitter','');
INSERT INTO `wp_postmeta` VALUES (2310,315,'____instagram','');
INSERT INTO `wp_postmeta` VALUES (2311,315,'____facebook','');
INSERT INTO `wp_postmeta` VALUES (2312,315,'____youtube','');
INSERT INTO `wp_postmeta` VALUES (2313,315,'____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2314,315,'____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2315,315,'____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2316,315,'____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2317,315,'_____edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2318,315,'_____edit_last','');
INSERT INTO `wp_postmeta` VALUES (2319,315,'_____date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2320,315,'_____nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2321,315,'_____sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2322,315,'_____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2323,315,'_____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2324,315,'____dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2325,315,'____dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2326,315,'____dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2327,315,'_____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2328,315,'_____twitter','');
INSERT INTO `wp_postmeta` VALUES (2329,315,'_____instagram','');
INSERT INTO `wp_postmeta` VALUES (2330,315,'_____facebook','');
INSERT INTO `wp_postmeta` VALUES (2331,315,'_____youtube','');
INSERT INTO `wp_postmeta` VALUES (2332,315,'_____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2333,315,'_____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2334,315,'_____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2335,315,'_____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2336,315,'______edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2337,315,'______edit_last','');
INSERT INTO `wp_postmeta` VALUES (2338,315,'______date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2339,315,'______nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2340,315,'______sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2341,315,'______image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2342,315,'______yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2343,315,'_____dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2344,315,'_____dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2345,315,'_____dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2346,315,'______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2347,315,'______twitter','');
INSERT INTO `wp_postmeta` VALUES (2348,315,'______instagram','');
INSERT INTO `wp_postmeta` VALUES (2349,315,'______facebook','');
INSERT INTO `wp_postmeta` VALUES (2350,315,'______youtube','');
INSERT INTO `wp_postmeta` VALUES (2351,315,'______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2352,315,'______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2353,315,'______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2354,315,'______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2355,315,'_______edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2356,315,'_______edit_last','');
INSERT INTO `wp_postmeta` VALUES (2357,315,'_______date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2358,315,'_______nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2359,315,'_______sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2360,315,'_______image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2361,315,'_______yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2362,315,'______dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2363,315,'______dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2364,315,'______dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2365,315,'_______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2366,315,'_______twitter','');
INSERT INTO `wp_postmeta` VALUES (2367,315,'_______instagram','');
INSERT INTO `wp_postmeta` VALUES (2368,315,'_______facebook','');
INSERT INTO `wp_postmeta` VALUES (2369,315,'_______youtube','');
INSERT INTO `wp_postmeta` VALUES (2370,315,'_______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2371,315,'_______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2372,315,'_______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2373,315,'_______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2374,315,'________edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2375,315,'________edit_last','');
INSERT INTO `wp_postmeta` VALUES (2376,315,'________date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2377,315,'________nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2378,315,'________sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2379,315,'________image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2380,315,'________yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2381,315,'_______dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2382,315,'_______dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2383,315,'_______dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2384,315,'________compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2385,315,'________twitter','');
INSERT INTO `wp_postmeta` VALUES (2386,315,'________instagram','');
INSERT INTO `wp_postmeta` VALUES (2387,315,'________facebook','');
INSERT INTO `wp_postmeta` VALUES (2388,315,'________youtube','');
INSERT INTO `wp_postmeta` VALUES (2389,315,'________thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2390,315,'________musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2391,315,'________albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2392,315,'________clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2399,319,'_edit_lock','1587998250:1');
INSERT INTO `wp_postmeta` VALUES (2400,320,'_wp_attached_file','2020/04/00-thug_mix_scary_mix-2004-ng.jpg');
INSERT INTO `wp_postmeta` VALUES (2401,320,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:100;s:6:\"height\";i:101;s:4:\"file\";s:41:\"2020/04/00-thug_mix_scary_mix-2004-ng.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1099515384\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (2402,320,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (2403,320,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (2404,320,'_imagify_data','a:2:{s:5:\"sizes\";a:2:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11490;s:14:\"optimized_size\";i:5050;s:7:\"percent\";d:56.049999999999997;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:11490;s:14:\"optimized_size\";i:3524;s:7:\"percent\";d:69.329999999999998;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:22980;s:14:\"optimized_size\";i:8574;s:7:\"percent\";d:62.689999999999998;}}');
INSERT INTO `wp_postmeta` VALUES (2405,319,'_thumbnail_id','320');
INSERT INTO `wp_postmeta` VALUES (2406,319,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (2407,319,'_yoast_wpseo_content_score','30');
INSERT INTO `wp_postmeta` VALUES (2408,319,'artistes','Scary Mix');
INSERT INTO `wp_postmeta` VALUES (2409,319,'_artistes','field_5e729fe642a5d');
INSERT INTO `wp_postmeta` VALUES (2410,319,'titre','Thug Mix');
INSERT INTO `wp_postmeta` VALUES (2411,319,'_titre','field_5e729fe642a67');
INSERT INTO `wp_postmeta` VALUES (2412,319,'download','https://pepseeactus.download/s/dJGQRDZyEFYzN2a');
INSERT INTO `wp_postmeta` VALUES (2413,319,'_download','field_5e729fe642a7e');
INSERT INTO `wp_postmeta` VALUES (2414,319,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (2415,319,'_soundcloud','field_5e729fe642aa0');
INSERT INTO `wp_postmeta` VALUES (2416,319,'youtube','');
INSERT INTO `wp_postmeta` VALUES (2417,319,'_youtube','field_5e729fe642aa7');
INSERT INTO `wp_postmeta` VALUES (2418,319,'spotify','');
INSERT INTO `wp_postmeta` VALUES (2419,319,'_spotify','field_5e729fe642aaf');
INSERT INTO `wp_postmeta` VALUES (2420,319,'deezer','');
INSERT INTO `wp_postmeta` VALUES (2421,319,'_deezer','field_5e729fe642ab6');
INSERT INTO `wp_postmeta` VALUES (2422,319,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (2423,319,'_apple_music','field_5e729fe642ac6');
INSERT INTO `wp_postmeta` VALUES (2424,319,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (2425,319,'_google_play_music','field_5e729fe642ad3');
INSERT INTO `wp_postmeta` VALUES (2426,319,'tidal','');
INSERT INTO `wp_postmeta` VALUES (2427,319,'_tidal','field_5e729fe642adb');
INSERT INTO `wp_postmeta` VALUES (2428,319,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (2429,319,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2430,319,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2431,319,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (2432,322,'artistes','Scary Mix');
INSERT INTO `wp_postmeta` VALUES (2433,322,'_artistes','field_5e729fe642a5d');
INSERT INTO `wp_postmeta` VALUES (2434,322,'titre','Thug Mix');
INSERT INTO `wp_postmeta` VALUES (2435,322,'_titre','field_5e729fe642a67');
INSERT INTO `wp_postmeta` VALUES (2436,322,'download','https://pepseeactus.download/s/dJGQRDZyEFYzN2a');
INSERT INTO `wp_postmeta` VALUES (2437,322,'_download','field_5e729fe642a7e');
INSERT INTO `wp_postmeta` VALUES (2438,322,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (2439,322,'_soundcloud','field_5e729fe642aa0');
INSERT INTO `wp_postmeta` VALUES (2440,322,'youtube','');
INSERT INTO `wp_postmeta` VALUES (2441,322,'_youtube','field_5e729fe642aa7');
INSERT INTO `wp_postmeta` VALUES (2442,322,'spotify','');
INSERT INTO `wp_postmeta` VALUES (2443,322,'_spotify','field_5e729fe642aaf');
INSERT INTO `wp_postmeta` VALUES (2444,322,'deezer','');
INSERT INTO `wp_postmeta` VALUES (2445,322,'_deezer','field_5e729fe642ab6');
INSERT INTO `wp_postmeta` VALUES (2446,322,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (2447,322,'_apple_music','field_5e729fe642ac6');
INSERT INTO `wp_postmeta` VALUES (2448,322,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (2449,322,'_google_play_music','field_5e729fe642ad3');
INSERT INTO `wp_postmeta` VALUES (2450,322,'tidal','');
INSERT INTO `wp_postmeta` VALUES (2451,322,'_tidal','field_5e729fe642adb');
INSERT INTO `wp_postmeta` VALUES (2452,322,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (2453,322,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2454,322,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2455,322,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (2456,323,'_edit_lock','1588368759:1');
INSERT INTO `wp_postmeta` VALUES (2457,323,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (2458,323,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2459,323,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2460,323,'artistes_associes','a:1:{i:0;s:3:\"299\";}');
INSERT INTO `wp_postmeta` VALUES (2461,323,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2462,323,'artistes','Admiral T');
INSERT INTO `wp_postmeta` VALUES (2463,323,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (2464,323,'titre','Rapide');
INSERT INTO `wp_postmeta` VALUES (2465,323,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (2466,323,'download','http://google.com');
INSERT INTO `wp_postmeta` VALUES (2467,323,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (2468,323,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (2469,323,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (2470,323,'youtube','');
INSERT INTO `wp_postmeta` VALUES (2471,323,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (2472,323,'spotify','');
INSERT INTO `wp_postmeta` VALUES (2473,323,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (2474,323,'deezer','');
INSERT INTO `wp_postmeta` VALUES (2475,323,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (2476,323,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (2477,323,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (2478,323,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (2479,323,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (2480,323,'tidal','');
INSERT INTO `wp_postmeta` VALUES (2481,323,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (2482,325,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2483,325,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2484,325,'artistes_associes','a:1:{i:0;s:3:\"299\";}');
INSERT INTO `wp_postmeta` VALUES (2485,325,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2486,325,'artistes','');
INSERT INTO `wp_postmeta` VALUES (2487,325,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (2488,325,'titre','');
INSERT INTO `wp_postmeta` VALUES (2489,325,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (2490,325,'download','');
INSERT INTO `wp_postmeta` VALUES (2491,325,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (2492,325,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (2493,325,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (2494,325,'youtube','');
INSERT INTO `wp_postmeta` VALUES (2495,325,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (2496,325,'spotify','');
INSERT INTO `wp_postmeta` VALUES (2497,325,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (2498,325,'deezer','');
INSERT INTO `wp_postmeta` VALUES (2499,325,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (2500,325,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (2501,325,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (2502,325,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (2503,325,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (2504,325,'tidal','');
INSERT INTO `wp_postmeta` VALUES (2505,325,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (2506,326,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2507,326,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2508,326,'artistes_associes','a:1:{i:0;s:3:\"299\";}');
INSERT INTO `wp_postmeta` VALUES (2509,326,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2510,326,'artistes','');
INSERT INTO `wp_postmeta` VALUES (2511,326,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (2512,326,'titre','');
INSERT INTO `wp_postmeta` VALUES (2513,326,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (2514,326,'download','');
INSERT INTO `wp_postmeta` VALUES (2515,326,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (2516,326,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (2517,326,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (2518,326,'youtube','');
INSERT INTO `wp_postmeta` VALUES (2519,326,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (2520,326,'spotify','');
INSERT INTO `wp_postmeta` VALUES (2521,326,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (2522,326,'deezer','');
INSERT INTO `wp_postmeta` VALUES (2523,326,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (2524,326,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (2525,326,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (2526,326,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (2527,326,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (2528,326,'tidal','');
INSERT INTO `wp_postmeta` VALUES (2529,326,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (2530,327,'_wp_attached_file','1997/04/81fMwakZw4L._SS500_.jpg');
INSERT INTO `wp_postmeta` VALUES (2531,327,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:500;s:6:\"height\";i:500;s:4:\"file\";s:31:\"1997/04/81fMwakZw4L._SS500_.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"81fMwakZw4L._SS500_-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"81fMwakZw4L._SS500_-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:31:\"81fMwakZw4L._SS500_-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (2532,327,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (2533,327,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (2534,327,'_imagify_data','a:2:{s:5:\"sizes\";a:5:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:47973;s:14:\"optimized_size\";i:28630;s:7:\"percent\";d:40.32;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:25777;s:14:\"optimized_size\";i:16052;s:7:\"percent\";d:37.729999999999997;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:8730;s:14:\"optimized_size\";i:5764;s:7:\"percent\";d:33.969999999999999;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:47692;s:14:\"optimized_size\";i:33970;s:7:\"percent\";d:28.77;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:130172;s:14:\"optimized_size\";i:84416;s:7:\"percent\";d:35.149999999999999;}}');
INSERT INTO `wp_postmeta` VALUES (2535,323,'_thumbnail_id','327');
INSERT INTO `wp_postmeta` VALUES (2536,323,'_yoast_wpseo_content_score','30');
INSERT INTO `wp_postmeta` VALUES (2537,328,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2538,328,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2539,328,'artistes_associes','a:1:{i:0;s:3:\"299\";}');
INSERT INTO `wp_postmeta` VALUES (2540,328,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2541,328,'artistes','');
INSERT INTO `wp_postmeta` VALUES (2542,328,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (2543,328,'titre','');
INSERT INTO `wp_postmeta` VALUES (2544,328,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (2545,328,'download','');
INSERT INTO `wp_postmeta` VALUES (2546,328,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (2547,328,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (2548,328,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (2549,328,'youtube','');
INSERT INTO `wp_postmeta` VALUES (2550,328,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (2551,328,'spotify','');
INSERT INTO `wp_postmeta` VALUES (2552,328,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (2553,328,'deezer','');
INSERT INTO `wp_postmeta` VALUES (2554,328,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (2555,328,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (2556,328,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (2557,328,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (2558,328,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (2559,328,'tidal','');
INSERT INTO `wp_postmeta` VALUES (2560,328,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (2561,329,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2562,329,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2563,329,'artistes_associes','a:1:{i:0;s:3:\"299\";}');
INSERT INTO `wp_postmeta` VALUES (2564,329,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2565,329,'artistes','Admiral T');
INSERT INTO `wp_postmeta` VALUES (2566,329,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (2567,329,'titre','Rapide');
INSERT INTO `wp_postmeta` VALUES (2568,329,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (2569,329,'download','');
INSERT INTO `wp_postmeta` VALUES (2570,329,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (2571,329,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (2572,329,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (2573,329,'youtube','');
INSERT INTO `wp_postmeta` VALUES (2574,329,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (2575,329,'spotify','');
INSERT INTO `wp_postmeta` VALUES (2576,329,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (2577,329,'deezer','');
INSERT INTO `wp_postmeta` VALUES (2578,329,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (2579,329,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (2580,329,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (2581,329,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (2582,329,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (2583,329,'tidal','');
INSERT INTO `wp_postmeta` VALUES (2584,329,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (2585,53,'views','600');
INSERT INTO `wp_postmeta` VALUES (2586,120,'views','16');
INSERT INTO `wp_postmeta` VALUES (2587,323,'views','2');
INSERT INTO `wp_postmeta` VALUES (2588,299,'views','6');
INSERT INTO `wp_postmeta` VALUES (2589,154,'views','42');
INSERT INTO `wp_postmeta` VALUES (2590,216,'views','16');
INSERT INTO `wp_postmeta` VALUES (2591,330,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (2592,330,'_edit_lock','1588226568:1');
INSERT INTO `wp_postmeta` VALUES (2593,338,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (2594,338,'_edit_lock','1599601995:1');
INSERT INTO `wp_postmeta` VALUES (2600,340,'_wp_attached_file','2020/04/kevni_top_boy_cd_cover.jpg');
INSERT INTO `wp_postmeta` VALUES (2601,340,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:960;s:6:\"height\";i:960;s:4:\"file\";s:34:\"2020/04/kevni_top_boy_cd_cover.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:34:\"kevni_top_boy_cd_cover-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:34:\"kevni_top_boy_cd_cover-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:34:\"kevni_top_boy_cd_cover-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:34:\"kevni_top_boy_cd_cover-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"banner\";a:4:{s:4:\"file\";s:34:\"kevni_top_boy_cd_cover-960x720.jpg\";s:5:\"width\";i:960;s:6:\"height\";i:720;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (2602,340,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (2603,340,'_imagify_status','already_optimized');
INSERT INTO `wp_postmeta` VALUES (2604,340,'_imagify_data','a:2:{s:5:\"sizes\";a:7:{s:4:\"full\";a:2:{s:7:\"success\";b:0;s:5:\"error\";s:77:\"WELL DONE. This image is already compressed, no further compression required.\";}s:19:\"banner@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:97644;s:14:\"optimized_size\";i:49752;s:7:\"percent\";d:49.049999999999997;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:32170;s:14:\"optimized_size\";i:17192;s:7:\"percent\";d:46.560000000000002;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:77853;s:14:\"optimized_size\";i:37120;s:7:\"percent\";d:52.32;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:18590;s:14:\"optimized_size\";i:10798;s:7:\"percent\";d:41.920000000000002;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:6448;s:14:\"optimized_size\";i:3960;s:7:\"percent\";d:38.590000000000003;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:105251;s:14:\"optimized_size\";i:55418;s:7:\"percent\";d:47.350000000000001;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:337956;s:14:\"optimized_size\";i:174240;s:7:\"percent\";d:48.439999999999998;}}');
INSERT INTO `wp_postmeta` VALUES (2605,338,'_thumbnail_id','340');
INSERT INTO `wp_postmeta` VALUES (2606,338,'_yoast_wpseo_content_score','90');
INSERT INTO `wp_postmeta` VALUES (2607,338,'image_banner','');
INSERT INTO `wp_postmeta` VALUES (2608,338,'_image_banner','field_5ea9ee8c03a3e');
INSERT INTO `wp_postmeta` VALUES (2609,338,'link','https://soundcloud.com/stream');
INSERT INTO `wp_postmeta` VALUES (2610,338,'_link','field_5ea9ef0a03a3f');
INSERT INTO `wp_postmeta` VALUES (2611,338,'artiste','Kevni');
INSERT INTO `wp_postmeta` VALUES (2612,338,'_artiste','field_5ea9f0fbe925c');
INSERT INTO `wp_postmeta` VALUES (2613,338,'album','Top Boy');
INSERT INTO `wp_postmeta` VALUES (2614,338,'_album','field_5ea9f113e925d');
INSERT INTO `wp_postmeta` VALUES (2615,341,'image_banner','339');
INSERT INTO `wp_postmeta` VALUES (2616,341,'_image_banner','field_5ea9ee8c03a3e');
INSERT INTO `wp_postmeta` VALUES (2617,341,'link','https://soundcloud.com/stream');
INSERT INTO `wp_postmeta` VALUES (2618,341,'_link','field_5ea9ef0a03a3f');
INSERT INTO `wp_postmeta` VALUES (2619,341,'artiste','Kevni');
INSERT INTO `wp_postmeta` VALUES (2620,341,'_artiste','field_5ea9f0fbe925c');
INSERT INTO `wp_postmeta` VALUES (2621,341,'album','Top Boy');
INSERT INTO `wp_postmeta` VALUES (2622,341,'_album','field_5ea9f113e925d');
INSERT INTO `wp_postmeta` VALUES (2623,338,'views','2');
INSERT INTO `wp_postmeta` VALUES (2637,344,'image_banner','343');
INSERT INTO `wp_postmeta` VALUES (2638,344,'_image_banner','field_5ea9ee8c03a3e');
INSERT INTO `wp_postmeta` VALUES (2639,344,'link','https://soundcloud.com/stream');
INSERT INTO `wp_postmeta` VALUES (2640,344,'_link','field_5ea9ef0a03a3f');
INSERT INTO `wp_postmeta` VALUES (2641,344,'artiste','Kevni');
INSERT INTO `wp_postmeta` VALUES (2642,344,'_artiste','field_5ea9f0fbe925c');
INSERT INTO `wp_postmeta` VALUES (2643,344,'album','Top Boy');
INSERT INTO `wp_postmeta` VALUES (2644,344,'_album','field_5ea9f113e925d');
INSERT INTO `wp_postmeta` VALUES (2645,345,'_wp_attached_file','2020/04/banner_kevni_top_boy.jpg');
INSERT INTO `wp_postmeta` VALUES (2646,345,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:2048;s:6:\"height\";i:617;s:4:\"file\";s:32:\"2020/04/banner_kevni_top_boy.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"banner_kevni_top_boy-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"banner_kevni_top_boy-300x90.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:90;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:32:\"banner_kevni_top_boy-768x231.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:231;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:33:\"banner_kevni_top_boy-1024x309.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:309;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:32:\"banner_kevni_top_boy-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"banner\";a:4:{s:4:\"file\";s:33:\"banner_kevni_top_boy-1280x617.jpg\";s:5:\"width\";i:1280;s:6:\"height\";i:617;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (2647,345,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (2648,345,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (2649,345,'_imagify_data','a:2:{s:5:\"sizes\";a:14:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:53673;s:14:\"optimized_size\";i:21557;s:7:\"percent\";d:59.840000000000003;}s:19:\"banner@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:45689;s:14:\"optimized_size\";i:20236;s:7:\"percent\";d:55.710000000000001;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:24983;s:14:\"optimized_size\";i:11848;s:7:\"percent\";d:52.579999999999998;}s:18:\"large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:25641;s:14:\"optimized_size\";i:9614;s:7:\"percent\";d:62.509999999999998;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:16213;s:14:\"optimized_size\";i:6416;s:7:\"percent\";d:60.43;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4468;s:14:\"optimized_size\";i:1950;s:7:\"percent\";d:56.359999999999999;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:5489;s:14:\"optimized_size\";i:3070;s:7:\"percent\";d:44.07;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:53673;s:14:\"optimized_size\";i:23290;s:7:\"percent\";d:56.609999999999999;}s:9:\"thumbnail\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:5489;s:14:\"optimized_size\";i:4203;s:7:\"percent\";d:23.43;}s:6:\"medium\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4468;s:14:\"optimized_size\";i:3127;s:7:\"percent\";d:30.010000000000002;}s:12:\"medium_large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:16213;s:14:\"optimized_size\";i:8970;s:7:\"percent\";d:44.670000000000002;}s:5:\"large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:25641;s:14:\"optimized_size\";i:12765;s:7:\"percent\";d:50.219999999999999;}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:24983;s:14:\"optimized_size\";i:15935;s:7:\"percent\";d:36.219999999999999;}s:6:\"banner\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:45689;s:14:\"optimized_size\";i:19337;s:7:\"percent\";d:57.68;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:352312;s:14:\"optimized_size\";i:162318;s:7:\"percent\";d:53.93;}}');
INSERT INTO `wp_postmeta` VALUES (2650,346,'image_banner','345');
INSERT INTO `wp_postmeta` VALUES (2651,346,'_image_banner','field_5ea9ee8c03a3e');
INSERT INTO `wp_postmeta` VALUES (2652,346,'link','https://soundcloud.com/stream');
INSERT INTO `wp_postmeta` VALUES (2653,346,'_link','field_5ea9ef0a03a3f');
INSERT INTO `wp_postmeta` VALUES (2654,346,'artiste','Kevni');
INSERT INTO `wp_postmeta` VALUES (2655,346,'_artiste','field_5ea9f0fbe925c');
INSERT INTO `wp_postmeta` VALUES (2656,346,'album','Top Boy');
INSERT INTO `wp_postmeta` VALUES (2657,346,'_album','field_5ea9f113e925d');
INSERT INTO `wp_postmeta` VALUES (2658,348,'image_banner','345');
INSERT INTO `wp_postmeta` VALUES (2659,348,'_image_banner','field_5ea9ee8c03a3e');
INSERT INTO `wp_postmeta` VALUES (2660,348,'link','https://soundcloud.com/stream');
INSERT INTO `wp_postmeta` VALUES (2661,348,'_link','field_5ea9ef0a03a3f');
INSERT INTO `wp_postmeta` VALUES (2662,348,'artiste','Kevni');
INSERT INTO `wp_postmeta` VALUES (2663,348,'_artiste','field_5ea9f0fbe925c');
INSERT INTO `wp_postmeta` VALUES (2664,348,'album','Top Boy');
INSERT INTO `wp_postmeta` VALUES (2665,348,'_album','field_5ea9f113e925d');
INSERT INTO `wp_postmeta` VALUES (2666,338,'iframe','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/x8BYjOoc8ck\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (2667,338,'_iframe','field_5eaa641666926');
INSERT INTO `wp_postmeta` VALUES (2668,350,'image_banner','345');
INSERT INTO `wp_postmeta` VALUES (2669,350,'_image_banner','field_5ea9ee8c03a3e');
INSERT INTO `wp_postmeta` VALUES (2670,350,'link','https://soundcloud.com/stream');
INSERT INTO `wp_postmeta` VALUES (2671,350,'_link','field_5ea9ef0a03a3f');
INSERT INTO `wp_postmeta` VALUES (2672,350,'artiste','Kevni');
INSERT INTO `wp_postmeta` VALUES (2673,350,'_artiste','field_5ea9f0fbe925c');
INSERT INTO `wp_postmeta` VALUES (2674,350,'album','Top Boy');
INSERT INTO `wp_postmeta` VALUES (2675,350,'_album','field_5ea9f113e925d');
INSERT INTO `wp_postmeta` VALUES (2676,350,'iframe','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/x8BYjOoc8ck\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (2677,350,'_iframe','field_5eaa641666926');
INSERT INTO `wp_postmeta` VALUES (2678,338,'youtube_id','x8BYjOoc8ck');
INSERT INTO `wp_postmeta` VALUES (2679,338,'_youtube_id','field_5eaa641666926');
INSERT INTO `wp_postmeta` VALUES (2680,351,'image_banner','345');
INSERT INTO `wp_postmeta` VALUES (2681,351,'_image_banner','field_5ea9ee8c03a3e');
INSERT INTO `wp_postmeta` VALUES (2682,351,'link','https://soundcloud.com/stream');
INSERT INTO `wp_postmeta` VALUES (2683,351,'_link','field_5ea9ef0a03a3f');
INSERT INTO `wp_postmeta` VALUES (2684,351,'artiste','Kevni');
INSERT INTO `wp_postmeta` VALUES (2685,351,'_artiste','field_5ea9f0fbe925c');
INSERT INTO `wp_postmeta` VALUES (2686,351,'album','Top Boy');
INSERT INTO `wp_postmeta` VALUES (2687,351,'_album','field_5ea9f113e925d');
INSERT INTO `wp_postmeta` VALUES (2688,351,'iframe','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/x8BYjOoc8ck\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (2689,351,'_iframe','field_5eaa641666926');
INSERT INTO `wp_postmeta` VALUES (2690,351,'youtube_id','x8BYjOoc8ck');
INSERT INTO `wp_postmeta` VALUES (2691,351,'_youtube_id','field_5eaa641666926');
INSERT INTO `wp_postmeta` VALUES (2692,352,'image_banner','');
INSERT INTO `wp_postmeta` VALUES (2693,352,'_image_banner','field_5ea9ee8c03a3e');
INSERT INTO `wp_postmeta` VALUES (2694,352,'link','https://soundcloud.com/stream');
INSERT INTO `wp_postmeta` VALUES (2695,352,'_link','field_5ea9ef0a03a3f');
INSERT INTO `wp_postmeta` VALUES (2696,352,'artiste','Kevni');
INSERT INTO `wp_postmeta` VALUES (2697,352,'_artiste','field_5ea9f0fbe925c');
INSERT INTO `wp_postmeta` VALUES (2698,352,'album','Top Boy');
INSERT INTO `wp_postmeta` VALUES (2699,352,'_album','field_5ea9f113e925d');
INSERT INTO `wp_postmeta` VALUES (2700,352,'iframe','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/x8BYjOoc8ck\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (2701,352,'_iframe','field_5eaa641666926');
INSERT INTO `wp_postmeta` VALUES (2702,352,'youtube_id','x8BYjOoc8ck');
INSERT INTO `wp_postmeta` VALUES (2703,352,'_youtube_id','field_5eaa641666926');
INSERT INTO `wp_postmeta` VALUES (2704,126,'views','12');
INSERT INTO `wp_postmeta` VALUES (2705,296,'views','12');
INSERT INTO `wp_postmeta` VALUES (2706,353,'_wp_attached_file','2019/07/jmax_banner.jpg');
INSERT INTO `wp_postmeta` VALUES (2707,353,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1900;s:6:\"height\";i:700;s:4:\"file\";s:23:\"2019/07/jmax_banner.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"jmax_banner-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"jmax_banner-300x111.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:111;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"jmax_banner-768x283.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:283;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:24:\"jmax_banner-1024x377.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:377;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:4:\"file\";s:23:\"jmax_banner-380x500.jpg\";s:5:\"width\";i:380;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"banner\";a:4:{s:4:\"file\";s:24:\"jmax_banner-1280x700.jpg\";s:5:\"width\";i:1280;s:6:\"height\";i:700;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (2708,353,'_imagify_optimization_level','1');
INSERT INTO `wp_postmeta` VALUES (2709,353,'_imagify_status','success');
INSERT INTO `wp_postmeta` VALUES (2710,353,'_imagify_data','a:2:{s:5:\"sizes\";a:14:{s:4:\"full\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:73550;s:14:\"optimized_size\";i:31057;s:7:\"percent\";d:57.770000000000003;}s:19:\"banner@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:60275;s:14:\"optimized_size\";i:24080;s:7:\"percent\";d:60.049999999999997;}s:37:\"pepseeactus-ArtistsFront@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:19979;s:14:\"optimized_size\";i:8932;s:7:\"percent\";d:55.289999999999999;}s:18:\"large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:28239;s:14:\"optimized_size\";i:11016;s:7:\"percent\";d:60.990000000000002;}s:25:\"medium_large@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:18498;s:14:\"optimized_size\";i:7390;s:7:\"percent\";d:60.049999999999997;}s:19:\"medium@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4579;s:14:\"optimized_size\";i:2012;s:7:\"percent\";d:56.060000000000002;}s:22:\"thumbnail@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4403;s:14:\"optimized_size\";i:2170;s:7:\"percent\";d:50.719999999999999;}s:17:\"full@imagify-webp\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:17416;s:14:\"optimized_size\";i:9752;s:7:\"percent\";d:44.009999999999998;}s:9:\"thumbnail\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4403;s:14:\"optimized_size\";i:3275;s:7:\"percent\";d:25.620000000000001;}s:6:\"medium\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:4579;s:14:\"optimized_size\";i:3015;s:7:\"percent\";d:34.159999999999997;}s:12:\"medium_large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:18498;s:14:\"optimized_size\";i:10343;s:7:\"percent\";d:44.090000000000003;}s:5:\"large\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:28239;s:14:\"optimized_size\";i:14687;s:7:\"percent\";d:47.990000000000002;}s:24:\"pepseeactus-ArtistsFront\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:19979;s:14:\"optimized_size\";i:12288;s:7:\"percent\";d:38.5;}s:6:\"banner\";a:4:{s:7:\"success\";b:1;s:13:\"original_size\";i:60275;s:14:\"optimized_size\";i:31897;s:7:\"percent\";d:47.079999999999998;}}s:5:\"stats\";a:3:{s:13:\"original_size\";i:362912;s:14:\"optimized_size\";i:171914;s:7:\"percent\";d:52.630000000000003;}}');
INSERT INTO `wp_postmeta` VALUES (2711,353,'_wp_attachment_image_alt','jmax banner');
INSERT INTO `wp_postmeta` VALUES (2712,354,'_edit_lock','1588274217:1');
INSERT INTO `wp_postmeta` VALUES (2713,354,'__edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2714,354,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (2715,354,'__edit_last','');
INSERT INTO `wp_postmeta` VALUES (2716,354,'date_de_naissance','19900602');
INSERT INTO `wp_postmeta` VALUES (2717,354,'_date_de_naissance','field_5d3c31e2d136c');
INSERT INTO `wp_postmeta` VALUES (2718,354,'__date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2719,354,'nom_complet','Yannick SEBASTIEN');
INSERT INTO `wp_postmeta` VALUES (2720,354,'_nom_complet','field_5d3c328bd136d');
INSERT INTO `wp_postmeta` VALUES (2721,354,'__nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2722,354,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2723,354,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (2724,354,'__sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2725,354,'image_arriere_plan','353');
INSERT INTO `wp_postmeta` VALUES (2726,354,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (2727,354,'__image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2728,354,'_yoast_wpseo_content_score','30');
INSERT INTO `wp_postmeta` VALUES (2729,354,'__yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2730,354,'dpsp_networks_shares','s:113:\"s:104:\"s:96:\"s:88:\"s:80:\"s:72:\"s:64:\"s:56:\"s:48:\"a:2:{s:7:\"twitter\";s:1:\"0\";s:9:\"pinterest\";i:0;}\";\";\";\";\";\";\";\";\";');
INSERT INTO `wp_postmeta` VALUES (2731,354,'_dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2732,354,'dpsp_networks_shares_total','0');
INSERT INTO `wp_postmeta` VALUES (2733,354,'_dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2734,354,'dpsp_networks_shares_last_updated','1564237420');
INSERT INTO `wp_postmeta` VALUES (2735,354,'_dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2736,354,'compte_verifie','1');
INSERT INTO `wp_postmeta` VALUES (2737,354,'_compte_verifie','field_5e6fef2c41455');
INSERT INTO `wp_postmeta` VALUES (2738,354,'__compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2739,354,'twitter','https://twitter.com/JmaXBrvtmn');
INSERT INTO `wp_postmeta` VALUES (2740,354,'_twitter','field_5e6fedc241452');
INSERT INTO `wp_postmeta` VALUES (2741,354,'__twitter','');
INSERT INTO `wp_postmeta` VALUES (2742,354,'instagram','https://www.instagram.com/jmax_officiel');
INSERT INTO `wp_postmeta` VALUES (2743,354,'_instagram','field_5e6fee7041453');
INSERT INTO `wp_postmeta` VALUES (2744,354,'__instagram','');
INSERT INTO `wp_postmeta` VALUES (2745,354,'facebook','https://www.facebook.com/JmaXOfficiel');
INSERT INTO `wp_postmeta` VALUES (2746,354,'_facebook','field_5e6feee241454');
INSERT INTO `wp_postmeta` VALUES (2747,354,'__facebook','');
INSERT INTO `wp_postmeta` VALUES (2748,354,'youtube','https://www.youtube.com/channel/UC0gnV5rOkRoMRcKNlqtN9Sw');
INSERT INTO `wp_postmeta` VALUES (2749,354,'_youtube','field_5e6feff541456');
INSERT INTO `wp_postmeta` VALUES (2750,354,'__youtube','');
INSERT INTO `wp_postmeta` VALUES (2751,354,'_thumbnail_id','197');
INSERT INTO `wp_postmeta` VALUES (2752,354,'__thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2753,354,'musique_associees','a:4:{i:0;s:3:\"216\";i:1;s:2:\"73\";i:2;s:2:\"72\";i:3;s:3:\"211\";}');
INSERT INTO `wp_postmeta` VALUES (2754,354,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (2755,354,'__musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2756,354,'albums_associes','a:1:{i:0;s:3:\"296\";}');
INSERT INTO `wp_postmeta` VALUES (2757,354,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2758,354,'__albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2759,354,'clips_associes','a:3:{i:0;s:3:\"260\";i:1;s:3:\"265\";i:2;s:3:\"231\";}');
INSERT INTO `wp_postmeta` VALUES (2760,354,'_clips_associes','field_5e721548a0750');
INSERT INTO `wp_postmeta` VALUES (2761,354,'__clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2762,354,'___edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2763,354,'___edit_last','');
INSERT INTO `wp_postmeta` VALUES (2764,354,'___date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2765,354,'___nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2766,354,'___sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2767,354,'___image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2768,354,'___yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2769,354,'__dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2770,354,'__dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2771,354,'__dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2772,354,'___compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2773,354,'___twitter','');
INSERT INTO `wp_postmeta` VALUES (2774,354,'___instagram','');
INSERT INTO `wp_postmeta` VALUES (2775,354,'___facebook','');
INSERT INTO `wp_postmeta` VALUES (2776,354,'___youtube','');
INSERT INTO `wp_postmeta` VALUES (2777,354,'___thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2778,354,'___musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2779,354,'___albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2780,354,'___clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2781,354,'____edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2782,354,'____edit_last','');
INSERT INTO `wp_postmeta` VALUES (2783,354,'____date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2784,354,'____nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2785,354,'____sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2786,354,'____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2787,354,'____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2788,354,'___dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2789,354,'___dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2790,354,'___dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2791,354,'____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2792,354,'____twitter','');
INSERT INTO `wp_postmeta` VALUES (2793,354,'____instagram','');
INSERT INTO `wp_postmeta` VALUES (2794,354,'____facebook','');
INSERT INTO `wp_postmeta` VALUES (2795,354,'____youtube','');
INSERT INTO `wp_postmeta` VALUES (2796,354,'____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2797,354,'____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2798,354,'____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2799,354,'____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2800,354,'_____edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2801,354,'_____edit_last','');
INSERT INTO `wp_postmeta` VALUES (2802,354,'_____date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2803,354,'_____nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2804,354,'_____sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2805,354,'_____image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2806,354,'_____yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2807,354,'____dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2808,354,'____dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2809,354,'____dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2810,354,'_____compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2811,354,'_____twitter','');
INSERT INTO `wp_postmeta` VALUES (2812,354,'_____instagram','');
INSERT INTO `wp_postmeta` VALUES (2813,354,'_____facebook','');
INSERT INTO `wp_postmeta` VALUES (2814,354,'_____youtube','');
INSERT INTO `wp_postmeta` VALUES (2815,354,'_____thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2816,354,'_____musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2817,354,'_____albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2818,354,'_____clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2819,354,'______edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2820,354,'______edit_last','');
INSERT INTO `wp_postmeta` VALUES (2821,354,'______date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2822,354,'______nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2823,354,'______sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2824,354,'______image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2825,354,'______yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2826,354,'_____dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2827,354,'_____dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2828,354,'_____dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2829,354,'______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2830,354,'______twitter','');
INSERT INTO `wp_postmeta` VALUES (2831,354,'______instagram','');
INSERT INTO `wp_postmeta` VALUES (2832,354,'______facebook','');
INSERT INTO `wp_postmeta` VALUES (2833,354,'______youtube','');
INSERT INTO `wp_postmeta` VALUES (2834,354,'______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2835,354,'______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2836,354,'______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2837,354,'______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2838,354,'_______edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2839,354,'_______edit_last','');
INSERT INTO `wp_postmeta` VALUES (2840,354,'_______date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2841,354,'_______nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2842,354,'_______sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2843,354,'_______image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2844,354,'_______yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2845,354,'______dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2846,354,'______dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2847,354,'______dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2848,354,'_______compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2849,354,'_______twitter','');
INSERT INTO `wp_postmeta` VALUES (2850,354,'_______instagram','');
INSERT INTO `wp_postmeta` VALUES (2851,354,'_______facebook','');
INSERT INTO `wp_postmeta` VALUES (2852,354,'_______youtube','');
INSERT INTO `wp_postmeta` VALUES (2853,354,'_______thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2854,354,'_______musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2855,354,'_______albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2856,354,'_______clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2857,354,'________edit_lock','');
INSERT INTO `wp_postmeta` VALUES (2858,354,'________edit_last','');
INSERT INTO `wp_postmeta` VALUES (2859,354,'________date_de_naissance','');
INSERT INTO `wp_postmeta` VALUES (2860,354,'________nom_complet','');
INSERT INTO `wp_postmeta` VALUES (2861,354,'________sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2862,354,'________image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2863,354,'________yoast_wpseo_content_score','');
INSERT INTO `wp_postmeta` VALUES (2864,354,'_______dpsp_networks_shares','');
INSERT INTO `wp_postmeta` VALUES (2865,354,'_______dpsp_networks_shares_total','');
INSERT INTO `wp_postmeta` VALUES (2866,354,'_______dpsp_networks_shares_last_updated','');
INSERT INTO `wp_postmeta` VALUES (2867,354,'________compte_verifie','');
INSERT INTO `wp_postmeta` VALUES (2868,354,'________twitter','');
INSERT INTO `wp_postmeta` VALUES (2869,354,'________instagram','');
INSERT INTO `wp_postmeta` VALUES (2870,354,'________facebook','');
INSERT INTO `wp_postmeta` VALUES (2871,354,'________youtube','');
INSERT INTO `wp_postmeta` VALUES (2872,354,'________thumbnail_id','');
INSERT INTO `wp_postmeta` VALUES (2873,354,'________musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2874,354,'________albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2875,354,'________clips_associes','');
INSERT INTO `wp_postmeta` VALUES (2876,20,'views','35');
INSERT INTO `wp_postmeta` VALUES (2877,260,'views','2');
INSERT INTO `wp_postmeta` VALUES (2878,355,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2879,355,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2880,355,'artistes_associes','a:1:{i:0;s:3:\"299\";}');
INSERT INTO `wp_postmeta` VALUES (2881,355,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2882,355,'artistes','Admiral T');
INSERT INTO `wp_postmeta` VALUES (2883,355,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (2884,355,'titre','Rapide');
INSERT INTO `wp_postmeta` VALUES (2885,355,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (2886,355,'download','http://google.com');
INSERT INTO `wp_postmeta` VALUES (2887,355,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (2888,355,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (2889,355,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (2890,355,'youtube','');
INSERT INTO `wp_postmeta` VALUES (2891,355,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (2892,355,'spotify','');
INSERT INTO `wp_postmeta` VALUES (2893,355,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (2894,355,'deezer','');
INSERT INTO `wp_postmeta` VALUES (2895,355,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (2896,355,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (2897,355,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (2898,355,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (2899,355,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (2900,355,'tidal','');
INSERT INTO `wp_postmeta` VALUES (2901,355,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (2902,231,'views','1');
INSERT INTO `wp_postmeta` VALUES (2903,138,'views','18');
INSERT INTO `wp_postmeta` VALUES (2907,356,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2908,356,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (2909,356,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2910,356,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (2911,356,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (2912,356,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2913,356,'musique_associees','');
INSERT INTO `wp_postmeta` VALUES (2914,356,'_musique_associees','field_5e714f604c0ba');
INSERT INTO `wp_postmeta` VALUES (2915,358,'artistes_associes','a:1:{i:0;s:3:\"154\";}');
INSERT INTO `wp_postmeta` VALUES (2916,358,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2917,358,'sous_titre_page','');
INSERT INTO `wp_postmeta` VALUES (2918,358,'_sous_titre_page','field_5bff0fe446537');
INSERT INTO `wp_postmeta` VALUES (2919,358,'image_arriere_plan','');
INSERT INTO `wp_postmeta` VALUES (2920,358,'_image_arriere_plan','field_5bff101c46538');
INSERT INTO `wp_postmeta` VALUES (2921,358,'download','');
INSERT INTO `wp_postmeta` VALUES (2922,358,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (2923,358,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (2924,358,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (2925,358,'youtube','');
INSERT INTO `wp_postmeta` VALUES (2926,358,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (2927,358,'spotify','https://open.spotify.com/album/5ZNBB13oewZ9ykZ3F7L9rY?si=N8oxOkJMToCtEcHHGRDUTQ');
INSERT INTO `wp_postmeta` VALUES (2928,358,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (2929,358,'deezer','');
INSERT INTO `wp_postmeta` VALUES (2930,358,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (2931,358,'apple_music','https://music.apple.com/fr/album/darling-acoustic-single/1501740115');
INSERT INTO `wp_postmeta` VALUES (2932,358,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (2933,358,'google_play_music','https://play.google.com/store/music/album?id=Bjpxvolspjgliliu4ubl7dilq5y&tid=song-Tkfymikzca7d5ezs2llr5isumua&hl=en_US');
INSERT INTO `wp_postmeta` VALUES (2934,358,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (2935,358,'tidal','');
INSERT INTO `wp_postmeta` VALUES (2936,358,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (2937,358,'artistes','JmaX');
INSERT INTO `wp_postmeta` VALUES (2938,358,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (2939,358,'titre','Darling (Acoustic)');
INSERT INTO `wp_postmeta` VALUES (2940,358,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (2941,358,'albums_associes','a:1:{i:0;s:3:\"296\";}');
INSERT INTO `wp_postmeta` VALUES (2942,358,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2943,359,'_edit_lock','1589803693:1');
INSERT INTO `wp_postmeta` VALUES (2944,359,'_thumbnail_id','255');
INSERT INTO `wp_postmeta` VALUES (2945,359,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (2946,359,'_yoast_wpseo_content_score','30');
INSERT INTO `wp_postmeta` VALUES (2947,359,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2948,359,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2949,359,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (2950,359,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2951,359,'artistes','artist');
INSERT INTO `wp_postmeta` VALUES (2952,359,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (2953,359,'titre','nouveau');
INSERT INTO `wp_postmeta` VALUES (2954,359,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (2955,359,'download','http://google.com');
INSERT INTO `wp_postmeta` VALUES (2956,359,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (2957,359,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (2958,359,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (2959,359,'youtube','');
INSERT INTO `wp_postmeta` VALUES (2960,359,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (2961,359,'spotify','');
INSERT INTO `wp_postmeta` VALUES (2962,359,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (2963,359,'deezer','');
INSERT INTO `wp_postmeta` VALUES (2964,359,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (2965,359,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (2966,359,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (2967,359,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (2968,359,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (2969,359,'tidal','');
INSERT INTO `wp_postmeta` VALUES (2970,359,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (2971,361,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2972,361,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2973,361,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (2974,361,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (2975,361,'artistes','artist');
INSERT INTO `wp_postmeta` VALUES (2976,361,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (2977,361,'titre','nouveau');
INSERT INTO `wp_postmeta` VALUES (2978,361,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (2979,361,'download','http://google.com');
INSERT INTO `wp_postmeta` VALUES (2980,361,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (2981,361,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (2982,361,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (2983,361,'youtube','');
INSERT INTO `wp_postmeta` VALUES (2984,361,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (2985,361,'spotify','');
INSERT INTO `wp_postmeta` VALUES (2986,361,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (2987,361,'deezer','');
INSERT INTO `wp_postmeta` VALUES (2988,361,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (2989,361,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (2990,361,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (2991,361,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (2992,361,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (2993,361,'tidal','');
INSERT INTO `wp_postmeta` VALUES (2994,361,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (2995,359,'_wp_old_date','2020-05-18');
INSERT INTO `wp_postmeta` VALUES (2996,362,'albums_associes','');
INSERT INTO `wp_postmeta` VALUES (2997,362,'_albums_associes','field_5e72139b2d39f');
INSERT INTO `wp_postmeta` VALUES (2998,362,'artistes_associes','');
INSERT INTO `wp_postmeta` VALUES (2999,362,'_artistes_associes','field_5bf480ddf5096');
INSERT INTO `wp_postmeta` VALUES (3000,362,'artistes','artist');
INSERT INTO `wp_postmeta` VALUES (3001,362,'_artistes','field_5e71d5d69fafa');
INSERT INTO `wp_postmeta` VALUES (3002,362,'titre','nouveau');
INSERT INTO `wp_postmeta` VALUES (3003,362,'_titre','field_5e71d5ef9fafb');
INSERT INTO `wp_postmeta` VALUES (3004,362,'download','http://google.com');
INSERT INTO `wp_postmeta` VALUES (3005,362,'_download','field_5e715909fb5b2');
INSERT INTO `wp_postmeta` VALUES (3006,362,'soundcloud','');
INSERT INTO `wp_postmeta` VALUES (3007,362,'_soundcloud','field_5e715b083ff9c');
INSERT INTO `wp_postmeta` VALUES (3008,362,'youtube','');
INSERT INTO `wp_postmeta` VALUES (3009,362,'_youtube','field_5e7159c665204');
INSERT INTO `wp_postmeta` VALUES (3010,362,'spotify','');
INSERT INTO `wp_postmeta` VALUES (3011,362,'_spotify','field_5e7158e6fb5b1');
INSERT INTO `wp_postmeta` VALUES (3012,362,'deezer','');
INSERT INTO `wp_postmeta` VALUES (3013,362,'_deezer','field_5e7159b465203');
INSERT INTO `wp_postmeta` VALUES (3014,362,'apple_music','');
INSERT INTO `wp_postmeta` VALUES (3015,362,'_apple_music','field_5e71d18714e84');
INSERT INTO `wp_postmeta` VALUES (3016,362,'google_play_music','');
INSERT INTO `wp_postmeta` VALUES (3017,362,'_google_play_music','field_5e715a0665205');
INSERT INTO `wp_postmeta` VALUES (3018,362,'tidal','');
INSERT INTO `wp_postmeta` VALUES (3019,362,'_tidal','field_5e715a1665206');
INSERT INTO `wp_postmeta` VALUES (3020,359,'views','1');
INSERT INTO `wp_postmeta` VALUES (3021,161,'views','3');
INSERT INTO `wp_postmeta` VALUES (3022,22,'views','2');
INSERT INTO `wp_postmeta` VALUES (3023,28,'views','2');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (3,1,'2018-11-07 22:39:15','2018-11-07 22:39:15','<h2>Who we are</h2><p>Our website address is: http://pepseeactusv3.local.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>','Privacy Policy','','draft','closed','open','','privacy-policy','','','2018-11-07 22:39:15','2018-11-07 22:39:15','',0,'http://pepseeactusv3.local/?page_id=3',0,'page','',0);
INSERT INTO `wp_posts` VALUES (16,1,'2018-11-12 21:47:56','2018-11-12 21:47:56','L\'actualité musicale du milieu Reggae Dancehall aux Antilles.','Actus','','publish','closed','closed','','actus','','','2018-11-12 21:47:56','2018-11-12 21:47:56','',0,'http://pepseeactusv3.local/?page_id=16',0,'page','',0);
INSERT INTO `wp_posts` VALUES (17,1,'2018-11-12 21:47:56','2018-11-12 21:47:56','L\'actualité musicale du milieu Reggae Dancehall aux Antilles.','Actus','','inherit','closed','closed','','16-revision-v1','','','2018-11-12 21:47:56','2018-11-12 21:47:56','',16,'http://pepseeactusv3.local/16-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (20,1,'2018-11-12 21:50:09','2018-11-12 21:50:09','L\'histoire de PepseeActus.','À Propos','','publish','closed','closed','','a-propos','','','2018-11-28 22:26:08','2018-11-28 22:26:08','',0,'http://pepseeactusv3.local/?page_id=20',0,'page','',0);
INSERT INTO `wp_posts` VALUES (21,1,'2018-11-12 21:50:09','2018-11-12 21:50:09','L\'histoire de PepseeActus.','À Propos','','inherit','closed','closed','','20-revision-v1','','','2018-11-12 21:50:09','2018-11-12 21:50:09','',20,'http://pepseeactusv3.local/20-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (22,1,'2018-11-12 21:51:59','2018-11-12 21:51:59','<u>Booskap (Editeur)</u>\r\nBOOSKA-P.COM S.A.R.L.\r\n18 rue de Saisset\r\n92120 Montrouge\r\nFrance\r\nNuméro du registre du commerce et des sociétés: RCS 50034117700029\r\nNuméro d\'identification T.V.A. : FR50500341177\r\nCapital social : 3000€\r\nDirecteur de Publication : Ba Amadou\r\n<u>Tel :</u> 06.11.30.35.46 (appel gratuit ou payant)\r\n\r\n<u>OVH (Hébergeur)</u>\r\nSAS au capital de 10 059 500 €\r\nRCS Lille Métropole 424 761 419 00045\r\nCode APE 6202A\r\nN° TVA : FR 22 424 761 419\r\nSiège social : 2 rue Kellermann - 59100 Roubaix - France.','Mentions Légales','','publish','closed','closed','','mentions-legales','','','2018-11-12 21:51:59','2018-11-12 21:51:59','',0,'http://pepseeactusv3.local/?page_id=22',0,'page','',0);
INSERT INTO `wp_posts` VALUES (23,1,'2018-11-12 21:51:59','2018-11-12 21:51:59','<u>Booskap (Editeur)</u>\r\nBOOSKA-P.COM S.A.R.L.\r\n18 rue de Saisset\r\n92120 Montrouge\r\nFrance\r\nNuméro du registre du commerce et des sociétés: RCS 50034117700029\r\nNuméro d\'identification T.V.A. : FR50500341177\r\nCapital social : 3000€\r\nDirecteur de Publication : Ba Amadou\r\n<u>Tel :</u> 06.11.30.35.46 (appel gratuit ou payant)\r\n\r\n<u>OVH (Hébergeur)</u>\r\nSAS au capital de 10 059 500 €\r\nRCS Lille Métropole 424 761 419 00045\r\nCode APE 6202A\r\nN° TVA : FR 22 424 761 419\r\nSiège social : 2 rue Kellermann - 59100 Roubaix - France.','Mentions Légales','','inherit','closed','closed','','22-revision-v1','','','2018-11-12 21:51:59','2018-11-12 21:51:59','',22,'http://pepseeactusv3.local/22-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (26,1,'2018-11-12 22:14:37','2018-11-12 22:14:37','Le but de PepseeActus','Notre But','','publish','closed','closed','','notre-but','','','2018-11-12 22:15:33','2018-11-12 22:15:33','',20,'http://pepseeactusv3.local/?page_id=26',0,'page','',0);
INSERT INTO `wp_posts` VALUES (27,1,'2018-11-12 22:14:37','2018-11-12 22:14:37','Le but de PepseeActus','Notre But','','inherit','closed','closed','','26-revision-v1','','','2018-11-12 22:14:37','2018-11-12 22:14:37','',26,'http://pepseeactusv3.local/26-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (28,1,'2018-11-12 22:14:59','2018-11-12 22:14:59','Nous contacter','Contact','','publish','closed','closed','','contact','','','2018-11-12 22:15:20','2018-11-12 22:15:20','',20,'http://pepseeactusv3.local/?page_id=28',0,'page','',0);
INSERT INTO `wp_posts` VALUES (29,1,'2018-11-12 22:14:59','2018-11-12 22:14:59','Nous contacter','Contact','','inherit','closed','closed','','28-revision-v1','','','2018-11-12 22:14:59','2018-11-12 22:14:59','',28,'http://pepseeactusv3.local/28-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (41,1,'2018-11-13 21:53:45','2018-11-13 21:53:45',' ','','','publish','closed','closed','','41','','','2019-07-14 21:05:08','2019-07-14 19:05:08','',0,'http://pepseeactusv3.local/?p=41',4,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (43,1,'2018-11-13 21:53:45','2018-11-13 21:53:45',' ','','','publish','closed','closed','','43','','','2019-07-14 21:05:08','2019-07-14 19:05:08','',0,'http://pepseeactusv3.local/?p=43',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (47,1,'2018-11-13 21:58:12','2018-11-13 21:58:12',' ','','','publish','closed','closed','','47','','','2018-11-13 22:02:02','2018-11-13 22:02:02','',0,'http://pepseeactusv3.local/?p=47',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (50,1,'2018-11-13 21:58:48','2018-11-13 21:58:48',' ','','','publish','closed','closed','','50','','','2018-11-13 22:02:11','2018-11-13 22:02:11','',0,'http://pepseeactusv3.local/?p=50',1,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (51,1,'2018-11-13 21:58:48','2018-11-13 21:58:48',' ','','','publish','closed','closed','','51','','','2018-11-13 22:02:11','2018-11-13 22:02:11','',0,'http://pepseeactusv3.local/?p=51',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (52,1,'2018-11-13 21:58:48','2018-11-13 21:58:48',' ','','','publish','closed','closed','','52','','','2018-11-13 22:02:11','2018-11-13 22:02:11','',20,'http://pepseeactusv3.local/?p=52',3,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (53,1,'2018-11-13 22:11:58','2018-11-13 22:11:58','','Home','','publish','closed','closed','','home','','','2018-11-13 22:11:58','2018-11-13 22:11:58','',0,'http://pepseeactusv3.local/?page_id=53',0,'page','',0);
INSERT INTO `wp_posts` VALUES (54,1,'2018-11-13 22:11:58','2018-11-13 22:11:58','','Home','','inherit','closed','closed','','53-revision-v1','','','2018-11-13 22:11:58','2018-11-13 22:11:58','',53,'http://pepseeactusv3.local/53-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (55,1,'2018-11-13 23:24:54','2018-11-13 23:24:54','<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus, laudantium eaque placeat modi unde, quasi voluptatibus deserunt soluta saepe possimus accusantium eveniet repudiandae animi ab est voluptate, distinctio necessitatibus delectus.</p>\n<!-- /wp:paragraph -->','Le Dancehall est mort','','publish','open','open','','le-dancehall-est-mort','','','2020-03-18 22:13:57','2020-03-18 21:13:57','',0,'http://pepseeactusv3.local/?p=55',0,'post','',0);
INSERT INTO `wp_posts` VALUES (56,1,'2018-11-13 23:24:54','2018-11-13 23:24:54','','Le Dancehall est mort','','inherit','closed','closed','','55-revision-v1','','','2018-11-13 23:24:54','2018-11-13 23:24:54','',55,'http://pepseeactusv3.local/55-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (58,1,'2018-11-14 20:42:03','2018-11-14 20:42:03','Concert d\'Admiral','Concert Admiral T','','publish','closed','closed','','concert-admiral-t','','','2018-11-14 21:59:08','2018-11-14 21:59:08','',0,'http://pepseeactusv3.local/?post_type=event&#038;p=58',0,'event','',0);
INSERT INTO `wp_posts` VALUES (59,1,'2018-11-14 20:42:21','2018-11-14 20:42:21','concert Kalash','Concert Kalash','','publish','closed','closed','','concert-kalash','','','2018-11-20 21:55:44','2018-11-20 21:55:44','',0,'http://pepseeactusv3.local/?post_type=event&#038;p=59',0,'event','',0);
INSERT INTO `wp_posts` VALUES (60,1,'2018-11-14 21:22:02','2018-11-14 21:22:02','','Le Dancehall est mort','Hé oui je l\'avais prédit bande d\'enculé','inherit','closed','closed','','55-revision-v1','','','2018-11-14 21:22:02','2018-11-14 21:22:02','',55,'http://pepseeactusv3.local/55-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (64,1,'2018-11-20 20:43:43','2018-11-20 20:43:43','','Événement Passés','','publish','closed','closed','','evenement-passes','','','2018-11-20 20:43:43','2018-11-20 20:43:43','',0,'http://pepseeactusv3.local/?page_id=64',0,'page','',0);
INSERT INTO `wp_posts` VALUES (65,1,'2018-11-20 20:43:43','2018-11-20 20:43:43','','Événement Passés','','inherit','closed','closed','','64-revision-v1','','','2018-11-20 20:43:43','2018-11-20 20:43:43','',64,'http://pepseeactusv3.local/64-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (66,1,'2018-11-20 20:51:26','2018-11-20 20:51:26','Lorem ipsum','New Year 2016','','publish','closed','closed','','new-year-2016','','','2018-11-20 20:51:26','2018-11-20 20:51:26','',0,'http://pepseeactusv3.local/?post_type=event&#038;p=66',0,'event','',0);
INSERT INTO `wp_posts` VALUES (67,0,'2018-11-20 21:25:45','2018-11-20 21:25:45','<div>\n<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat assumenda quas porro non ipsa repellat ex consectetur quia, atque et eveniet unde magnam! Similique veritatis facilis, libero nisi nulla voluptatum?</div>\n<div></div>\n</div>','JmaX','Le loveur','publish','closed','closed','','jmax','','','2019-07-26 17:24:55','2019-07-26 15:24:55','',0,'http://pepseeactusv3.local/?post_type=artiste&#038;p=67',0,'artiste','',0);
INSERT INTO `wp_posts` VALUES (68,0,'2018-11-20 21:25:57','2018-11-20 21:25:57','<div>\n<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat assumenda quas porro non ipsa repellat ex consectetur quia, atque et eveniet unde magnam! Similique veritatis facilis, libero nisi nulla voluptatum?</div>\n<div></div>\n</div>','Kalash','L\'ambitieux','publish','closed','closed','','kalash','','','2019-07-26 17:42:07','2019-07-26 15:42:07','',0,'http://pepseeactusv3.local/?post_type=artiste&#038;p=68',0,'artiste','',0);
INSERT INTO `wp_posts` VALUES (69,0,'2018-11-20 21:26:41','2018-11-20 21:26:41','<div>\n<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat assumenda quas porro non ipsa repellat ex consectetur quia, atque et eveniet unde magnam! Similique veritatis facilis, libero nisi nulla voluptatum?</div>\n<div></div>\n</div>','Lieutenant','From the ghetto','publish','closed','closed','','lieutenant','','','2019-07-26 17:41:46','2019-07-26 15:41:46','',0,'http://pepseeactusv3.local/?post_type=artiste&#038;p=69',0,'artiste','',0);
INSERT INTO `wp_posts` VALUES (70,1,'2018-11-20 21:49:53','2018-11-20 21:49:53','a:7:{s:8:\"location\";a:3:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:5:\"album\";}}i:1;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:5:\"music\";}}i:2;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"post\";}}}s:8:\"position\";s:15:\"acf_after_title\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','Artiste Associé','artiste-associe','publish','closed','closed','','group_5bf480b89eb42','','','2020-04-29 23:23:36','2020-04-29 21:23:36','',0,'http://pepseeactusv3.local/?post_type=acf-field-group&#038;p=70',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (71,1,'2018-11-20 21:49:53','2018-11-20 21:49:53','a:12:{s:4:\"type\";s:12:\"relationship\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:6:\"artist\";}s:8:\"taxonomy\";s:0:\"\";s:7:\"filters\";a:1:{i:0;s:6:\"search\";}s:8:\"elements\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";}','Artiste(s) Associé(s)','artistes_associes','publish','closed','closed','','field_5bf480ddf5096','','','2020-03-19 22:53:17','2020-03-19 21:53:17','',70,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=71',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (72,1,'2018-11-21 20:44:00','2018-11-21 20:44:00','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=oSQO-6xvPis\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=oSQO-6xvPis\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:core-embed/spotify {\"url\":\"https://open.spotify.com/track/3GTes8tWU3OzonlsWM9yVX\",\"type\":\"rich\",\"providerNameSlug\":\"spotify\",\"className\":\"wp-embed-aspect-9-16 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-spotify wp-block-embed is-type-rich is-provider-spotify wp-embed-aspect-9-16 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://open.spotify.com/track/3GTes8tWU3OzonlsWM9yVX\n</div></figure>\n<!-- /wp:core-embed/spotify -->','Mel x JmaX - Touch Me (Remix)','','publish','closed','closed','','jmax-touch-me','','','2020-03-25 00:55:18','2020-03-24 23:55:18','',0,'http://pepseeactusv3.local/?post_type=music&#038;p=72',0,'music','',0);
INSERT INTO `wp_posts` VALUES (73,1,'2018-11-21 20:44:27','2018-11-21 20:44:27','<div>\n<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta voluptatum tempore pariatur neque in magni veritatis accusamus praesentium? Officiis nesciunt nam optio blanditiis consequatur facere eum deserunt at porro facilis.</div>\n<div>&nbsp;</div>\n</div>\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=OTCw5e94ehg\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=OTCw5e94ehg\n</div></figure>\n<!-- /wp:core-embed/youtube -->','Lorenz x JmaX - Luv Me','','publish','closed','closed','','lorenz-x-jmax-luv-me','','','2020-03-25 00:55:09','2020-03-24 23:55:09','',0,'http://pepseeactusv3.local/?post_type=music&#038;p=73',0,'music','',0);
INSERT INTO `wp_posts` VALUES (80,0,'2018-11-28 21:28:12','2018-11-28 21:28:12','<div>\n<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat assumenda quas porro non ipsa repellat ex consectetur quia, atque et eveniet unde magnam! Similique veritatis facilis, libero nisi nulla voluptatum?</div>\n<div></div>\n</div>','Lorenz','Le beau gosse','publish','closed','closed','','lorenz','','','2019-07-26 17:41:26','2019-07-26 15:41:26','',0,'http://pepseeactusv3.local/?post_type=artiste&#038;p=80',0,'artiste','',0);
INSERT INTO `wp_posts` VALUES (82,1,'2018-11-28 22:03:15','2018-11-28 22:03:15','a:7:{s:8:\"location\";a:2:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"artist\";}}i:1;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:5:\"album\";}}}s:8:\"position\";s:15:\"acf_after_title\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','Bannière','banniere','publish','closed','closed','','group_5bff0faf6b1c5','','','2020-03-20 13:01:11','2020-03-20 12:01:11','',0,'http://pepseeactusv3.local/?post_type=acf-field-group&#038;p=82',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (84,1,'2018-11-28 22:03:15','2018-11-28 22:03:15','a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','image arrière plan','image_arriere_plan','publish','closed','closed','','field_5bff101c46538','','','2020-03-20 12:35:58','2020-03-20 11:35:58','',82,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=84',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (88,1,'2018-11-28 22:25:47','2018-11-28 22:25:47','L\'histoire de PepseeActus.','À Propos','','inherit','closed','closed','','20-revision-v1','','','2018-11-28 22:25:47','2018-11-28 22:25:47','',20,'http://pepseeactusv3.local/20-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (89,1,'2018-11-28 22:26:08','2018-11-28 22:26:08','L\'histoire de PepseeActus.','À Propos','','inherit','closed','closed','','20-revision-v1','','','2018-11-28 22:26:08','2018-11-28 22:26:08','',20,'http://pepseeactusv3.local/20-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (94,1,'2019-07-10 19:45:20','2019-07-10 19:45:20','','Home','','inherit','closed','closed','','53-autosave-v1','','','2019-07-10 19:45:20','2019-07-10 19:45:20','',53,'http://pepseeactusv3.local/53-autosave-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (96,1,'2019-07-14 17:49:28','2019-07-14 17:49:28','','Blog','','publish','closed','closed','','blog','','','2019-07-14 17:49:28','2019-07-14 17:49:28','',0,'http://pepseeactusv3.local/blog/',0,'page','',0);
INSERT INTO `wp_posts` VALUES (118,1,'2019-07-17 22:11:21','2019-07-17 20:11:21','<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus, laudantium eaque placeat modi unde, quasi voluptatibus deserunt soluta saepe possimus accusantium eveniet repudiandae animi ab est voluptate, distinctio necessitatibus delectus.</p>\n<!-- /wp:paragraph -->','Le Dancehall est mort','Hé oui je l\'avais prédit bande d\'enculé','inherit','closed','closed','','55-revision-v1','','','2019-07-17 22:11:21','2019-07-17 20:11:21','',55,'http://pepseeactusv3.local/55-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (120,1,'2019-07-21 18:35:01','2019-07-21 16:35:01','<!-- wp:paragraph -->\n<p>Admiral T annonce deux albums pour la rentrée 2019/2020. Avec deux clips \"<em>Boss Lady</em>\" feat <strong>Krys</strong> et \"<em>Baimbridge</em> Cho\" feat <strong>Were Vana</strong>. Les albums seront disponible qu\'en version digitale.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Caribbean Monster</h2>\n<!-- /wp:heading -->\n\n<!-- wp:image {\"id\":241,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/67112364_10156714299347087_6249821407371329536_n-1.jpg\" alt=\"admiral t caribbean monster\" class=\"wp-image-241\"/><figcaption>Admiral T - Caribbean Monster</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Un album pure Dancehall avec en 1er single \"<em>Boss Lady</em>\" avec <strong>Krys</strong>, un featuring que tous les amateurs de Dancehall attendait avec impatience.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=BZyQnxRX7xE\\u0026feature=youtu.be\\u0026fbclid=IwAR1w-9nT6v3aUr_IKOQ099Zj08G4NhEie5Bew-sJ7sRGIw6HQ1zRkxjeSTA\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=BZyQnxRX7xE&amp;feature=youtu.be&amp;fbclid=IwAR1w-9nT6v3aUr_IKOQ099Zj08G4NhEie5Bew-sJ7sRGIw6HQ1zRkxjeSTA\n</div><figcaption>Admiral T x Krys - Boss Lady</figcaption></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:heading -->\n<h2>Mozaïka</h2>\n<!-- /wp:heading -->\n\n<!-- wp:image {\"id\":242,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2020/03/67320275_10156714299277087_4653882298289094656_n.jpg\" alt=\"\" class=\"wp-image-242\"/><figcaption>Admiral T - Mozaïka</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Un album plutôt traditionnel tourné vers la culture du Ka. Son premier single \"<em>Baimbridge cho</em>\" avec <strong>Were Vana</strong> reprend le grand classique du maître Ka Guadeloupéen <strong>Guy Conquet</strong>&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=rKgvYzardtc\\u0026feature=youtu.be\\u0026fbclid=IwAR2775csKwp02hnUbIrMKGm19qLLDiOI9lr6VYPA8Q5t1RNkZgTpp7PpCpk\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=rKgvYzardtc&amp;feature=youtu.be&amp;fbclid=IwAR2775csKwp02hnUbIrMKGm19qLLDiOI9lr6VYPA8Q5t1RNkZgTpp7PpCpk\n</div><figcaption>Admiral T x Were Vana - Baimbridge Cho</figcaption></figure>\n<!-- /wp:core-embed/youtube -->','Admiral T annonce deux albums pour Septembre','','publish','open','open','','admiral-t-annonce-deux-albums-pour-septembre','','','2020-03-22 19:26:51','2020-03-22 18:26:51','',0,'http://pepseeactusv3.local/?p=120',0,'post','',0);
INSERT INTO `wp_posts` VALUES (123,1,'2019-07-21 18:31:26','2019-07-21 16:31:26','<iframe title=\"Admiral T Ft. Krys - Boss Lady\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/BZyQnxRX7xE?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','','','publish','closed','closed','','1eb2c20af50ba30670b3a146eff361ff','','','2019-07-21 18:31:26','2019-07-21 16:31:26','',0,'http://pepseeactusv3.local/1eb2c20af50ba30670b3a146eff361ff/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (124,1,'2019-07-21 18:31:26','2019-07-21 16:31:26','<iframe title=\"Admiral T Ft. Were Vana - Baimbridge Cho\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/rKgvYzardtc?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','','','publish','closed','closed','','6359a9a3b5204fbdf5df6d06ec05dee9','','','2019-07-21 18:31:26','2019-07-21 16:31:26','',0,'http://pepseeactusv3.local/6359a9a3b5204fbdf5df6d06ec05dee9/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (125,1,'2019-07-21 18:35:01','2019-07-21 16:35:01','<!-- wp:paragraph -->\n<p>Admiral T annonce deux albums pour la rentrée 2019/2020. Avec deux clips \"<em>Boss Lady</em>\" feat <strong>Krys</strong> et \"<em>Baimbridge</em> Cho\" feat <strong>Were Vana</strong>. Les albums seront disponible qu\'en version digitale.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Caribbean Monster</h2>\n<!-- /wp:heading -->\n\n<!-- wp:image {\"id\":121} -->\n<figure class=\"wp-block-image\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/67112364_10156714299347087_6249821407371329536_n.jpg\" alt=\"\" class=\"wp-image-121\"/><figcaption>Caribbean Monster</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Un album pure Dancehall avec en 1er single \"<em>Boss Lady</em>\" avec <strong>Krys</strong>, un featuring que tous les amateurs de Dancehall attendait avec impatience.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=BZyQnxRX7xE\\u0026feature=youtu.be\\u0026fbclid=IwAR1w-9nT6v3aUr_IKOQ099Zj08G4NhEie5Bew-sJ7sRGIw6HQ1zRkxjeSTA\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=BZyQnxRX7xE&amp;feature=youtu.be&amp;fbclid=IwAR1w-9nT6v3aUr_IKOQ099Zj08G4NhEie5Bew-sJ7sRGIw6HQ1zRkxjeSTA\n</div><figcaption>Admiral T x Krys - Boss Lady</figcaption></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:heading -->\n<h2>Mozaïka</h2>\n<!-- /wp:heading -->\n\n<!-- wp:image {\"id\":122} -->\n<figure class=\"wp-block-image\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/67320275_10156714299277087_4653882298289094656_n.jpg\" alt=\"\" class=\"wp-image-122\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Un album plutôt traditionnel tourné vers la culture du Ka. Son premier single \"<em>Baimbridge cho</em>\" avec <strong>Were Vana</strong> reprend le grand classique du maître Ka Guadeloupéen <strong>Guy Conquet</strong> </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=rKgvYzardtc\\u0026feature=youtu.be\\u0026fbclid=IwAR2775csKwp02hnUbIrMKGm19qLLDiOI9lr6VYPA8Q5t1RNkZgTpp7PpCpk\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=rKgvYzardtc&amp;feature=youtu.be&amp;fbclid=IwAR2775csKwp02hnUbIrMKGm19qLLDiOI9lr6VYPA8Q5t1RNkZgTpp7PpCpk\n</div><figcaption>Admiral T x Were Vana - Baimbridge Cho</figcaption></figure>\n<!-- /wp:core-embed/youtube -->','Admiral T annonce deux albums pour Septembre','','inherit','closed','closed','','120-revision-v1','','','2019-07-21 18:35:01','2019-07-21 16:35:01','',120,'http://pepseeactusv3.local/120-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (126,1,'2019-07-21 18:40:49','2019-07-21 16:40:49','<!-- wp:paragraph -->\n<p><strong>Saïk</strong> a enfin dévoilé le jour de la sortie de son album <em>Magma</em> ainsi qu\'une nouvelle pochette. En effet, cela faisait presque deux ans que les fans de <strong>Saïk</strong> attendaient cet album qu\'il teasait sur ses réseaux.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":244,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/saïk_magma.jpg\" alt=\"saik magma\" class=\"wp-image-244\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Nous avons enfin la date de sortie, ce sera pour le 30 Aout 2019.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=OR1SsoxcuLg\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=OR1SsoxcuLg\n</div><figcaption>Saïk - Red Bull</figcaption></figure>\n<!-- /wp:core-embed/youtube -->','La date de sortie de Magma enfin révélée!','','publish','open','open','','la-date-de-sortie-de-magma-enfin-revelee','','','2020-03-26 00:00:39','2020-03-25 23:00:39','',0,'http://pepseeactusv3.local/?p=126',0,'post','',0);
INSERT INTO `wp_posts` VALUES (128,1,'2019-07-21 18:40:49','2019-07-21 16:40:49','<!-- wp:paragraph -->\n<p>Saïk a enfin dévoilé le jour de la sortie de son album Magma ainsi qu\'une nouvelle pochette. En effet, cela faisait presque deux ans que les fans de Saïk attendaient cet album qu\'il teasait sur ses réseaux.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":127} -->\n<figure class=\"wp-block-image\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/saïk_magma.jpg\" alt=\"\" class=\"wp-image-127\"/><figcaption>Saïk - Magma</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Nous avons enfin la date de sortie, ce sera pour le 30 Aout 2019.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=OR1SsoxcuLg\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=OR1SsoxcuLg\n</div><figcaption>Saïk - Red Bull</figcaption></figure>\n<!-- /wp:core-embed/youtube -->','La date de sortie de Magma enfin révélée!','','inherit','closed','closed','','126-revision-v1','','','2019-07-21 18:40:49','2019-07-21 16:40:49','',126,'http://pepseeactusv3.local/126-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (129,1,'2019-07-21 18:40:49','2019-07-21 16:40:49','<iframe title=\"SAÏK - RED BULL [ Clip Officiel 2019 ]\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/OR1SsoxcuLg?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','','','publish','closed','closed','','2b052513c48420d71d6bd575f483d9db','','','2019-07-21 18:40:49','2019-07-21 16:40:49','',0,'http://pepseeactusv3.local/2b052513c48420d71d6bd575f483d9db/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (130,1,'2019-07-21 19:16:15','2019-07-21 17:16:15','<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus, laudantium eaque placeat modi unde, quasi voluptatibus deserunt soluta saepe possimus accusantium eveniet repudiandae animi ab est voluptate, distinctio necessitatibus delectus.</p>\n<!-- /wp:paragraph -->','Le Dancehall est mort','','inherit','closed','closed','','55-revision-v1','','','2019-07-21 19:16:15','2019-07-21 17:16:15','',55,'http://pepseeactusv3.local/55-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (134,1,'2019-07-26 14:38:08','2019-07-26 12:38:08','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=Zs_RW-3kS_A\\u0026fbclid=IwAR1-Zhkxa_De7E43m6FErDcBtq2Z35YYs1TL5atxrrfm2Jv2DyIyuSsxltk\\u0026app=desktop\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=Zs_RW-3kS_A&amp;fbclid=IwAR1-Zhkxa_De7E43m6FErDcBtq2Z35YYs1TL5atxrrfm2Jv2DyIyuSsxltk&amp;app=desktop\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p>Valley revient avec un nouveau single \"Papa\". On le retrouve avec les locks coupées, pour rappel, il avait disparu depuis sa conversion.</p>\n<!-- /wp:paragraph -->','Valley - Papa','','publish','open','open','','valley-papa','','','2020-03-20 13:46:00','2020-03-20 12:46:00','',0,'http://pepseeactusv3.local/?p=134',0,'post','',0);
INSERT INTO `wp_posts` VALUES (135,1,'2019-07-26 14:38:08','2019-07-26 12:38:08','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=Zs_RW-3kS_A\\u0026fbclid=IwAR1-Zhkxa_De7E43m6FErDcBtq2Z35YYs1TL5atxrrfm2Jv2DyIyuSsxltk\\u0026app=desktop\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=Zs_RW-3kS_A&amp;fbclid=IwAR1-Zhkxa_De7E43m6FErDcBtq2Z35YYs1TL5atxrrfm2Jv2DyIyuSsxltk&amp;app=desktop\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p>Valley revient avec un nouveau single \"Papa\". On le retrouve avec les locks coupées, pour rappel, il avait disparu depuis sa conversion.</p>\n<!-- /wp:paragraph -->','Valley - Papa','','inherit','closed','closed','','134-revision-v1','','','2019-07-26 14:38:08','2019-07-26 12:38:08','',134,'http://pepseeactusv3.local/134-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (137,1,'2019-07-26 14:47:29','2019-07-26 12:47:29','<iframe title=\"VaLLeY - PAPA -  [ Official Vidéo 2019 ]\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/Zs_RW-3kS_A?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','','','publish','closed','closed','','c66f3677dcbd60fecbe19fd1e494d641','','','2019-07-26 14:47:29','2019-07-26 12:47:29','',0,'http://pepseeactusv3.local/c66f3677dcbd60fecbe19fd1e494d641/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (138,1,'2019-07-26 15:15:34','2019-07-26 13:15:34','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=AKl3PerNl34\\u0026t=0s\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=AKl3PerNl34&amp;t=0s\n</div></figure>\n<!-- /wp:core-embed/youtube -->','Keros-n - Miss Doliprane','','publish','open','open','','keros-n-miss-doliprane','','','2020-05-02 20:30:12','2020-05-02 18:30:12','',0,'http://pepseeactusv3.local/?p=138',0,'post','',0);
INSERT INTO `wp_posts` VALUES (140,1,'2019-07-26 15:15:34','2019-07-26 13:15:34','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=AKl3PerNl34\\u0026t=0s\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=AKl3PerNl34&amp;t=0s\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p>Le dernier <strong>Keros-n</strong> \"<em>Miss Doliprane</em>\" sur une instru sucrée de Dan Evens. Un titre efficace pour cette été 2019.</p>\n<!-- /wp:paragraph -->','Keros-n - Miss Doliprane','','inherit','closed','closed','','138-revision-v1','','','2019-07-26 15:15:34','2019-07-26 13:15:34','',138,'http://pepseeactusv3.local/138-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (141,1,'2019-07-26 15:15:35','2019-07-26 13:15:35','<iframe title=\"KEROS-N - MISS DOLIPRANE\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/AKl3PerNl34?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','','','publish','closed','closed','','ffd016391f44316e87afb7ad1f139e97','','','2019-07-26 15:15:35','2019-07-26 13:15:35','',0,'http://pepseeactusv3.local/ffd016391f44316e87afb7ad1f139e97/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (142,1,'2019-07-26 15:19:14','2019-07-26 13:19:14','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=rMr1VpThH8U\\u0026t=0s\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=rMr1VpThH8U&amp;t=0s\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p>Toujours efficace, <strong>Shannon</strong> revient avec un nouveau clip \"<em>Best</em>\" accompagnée d\'un guest <strong>Sorrow</strong></p>\n<!-- /wp:paragraph -->','Shannon - Best','','publish','open','open','','shannon-best','','','2020-03-20 13:44:02','2020-03-20 12:44:02','',0,'http://pepseeactusv3.local/?p=142',0,'post','',0);
INSERT INTO `wp_posts` VALUES (144,1,'2019-07-26 15:19:14','2019-07-26 13:19:14','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=rMr1VpThH8U\\u0026t=0s\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=rMr1VpThH8U&amp;t=0s\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p>Toujours efficace, <strong>Shannon</strong> revient avec un nouveau clip \"<em>Best</em>\" accompagnée d\'un guest <strong>Sorrow</strong></p>\n<!-- /wp:paragraph -->','Shannon - Best','','inherit','closed','closed','','142-revision-v1','','','2019-07-26 15:19:14','2019-07-26 13:19:14','',142,'http://pepseeactusv3.local/142-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (145,1,'2019-07-26 15:19:15','2019-07-26 13:19:15','<iframe title=\"SHANNON - BEST ( OFFICIAL MUSIC VIDEO )\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/rMr1VpThH8U?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','','','publish','closed','closed','','fa265f2d8c857a0f2cdce7363cc71242','','','2019-07-26 15:19:15','2019-07-26 13:19:15','',0,'http://pepseeactusv3.local/fa265f2d8c857a0f2cdce7363cc71242/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (147,1,'2019-07-27 13:18:58','2019-07-27 11:18:58','a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"artist\";}}}s:8:\"position\";s:15:\"acf_after_title\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','Artistes','artistes','publish','closed','closed','','group_5d3c31cecfdbe','','','2020-03-25 01:13:47','2020-03-25 00:13:47','',0,'http://pepseeactusv3.local/?post_type=acf-field-group&#038;p=147',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (151,1,'2019-07-27 13:23:57','2019-07-27 11:23:57','<!-- wp:paragraph -->\n<p><strong>Kalash</strong> débute dans le milieu underground en 2003, apparaissant dans plusieurs compilations de&nbsp;dancehall. Influencé par les chanteurs (<strong>Bounty Killer</strong>, <strong>Admiral T</strong>...) de son époque et le folklore martiniquais, il se lance très jeune dans la musique. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Grâce à ses premières compositions telles que \"<em>Pran Pié</em>\" ou encore \"<em>Mama</em>\", il se fait de plus en plus connaître et apprécier par le public caribéen. Le&nbsp;29 mars 2010, sort son premier album éponyme sur le label Chabine Prod. En 2011, <strong>Kalash</strong> remporte le&nbsp;prix SACEM&nbsp;martiniquais de la catégorie Reggae Dancehall pour sa chanson&nbsp;\"<em>Pran Pié</em>\". En juin 2013, il sort son deuxième album&nbsp;<em>2 #Classi</em>c.</p>\n<!-- /wp:paragraph -->','Kalash','L\'ambitieux','publish','closed','closed','','kalash','','','2020-03-25 01:11:16','2020-03-25 00:11:16','',0,'http://pepseeactusv3.local/?post_type=artist&#038;p=151',0,'artist','',0);
INSERT INTO `wp_posts` VALUES (152,1,'2019-07-27 14:18:15','2019-07-27 12:18:15','<!-- wp:paragraph -->\n<p>Admiral T annonce deux albums pour la rentrée 2019/2020. Avec deux clips \"<em>Boss Lady</em>\" feat <strong>Krys</strong> et \"<em>Baimbridge</em> Cho\" feat <strong>Were Vana</strong>. Les albums seront disponible qu\'en version digitale.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Caribbean Monster</h2>\n<!-- /wp:heading -->\n\n<!-- wp:image {\"id\":121} -->\n<figure class=\"wp-block-image\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/67112364_10156714299347087_6249821407371329536_n.jpg\" alt=\"\" class=\"wp-image-121\"/><figcaption>Caribbean Monster</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Un album pure Dancehall avec en 1er single \"<em>Boss Lady</em>\" avec <strong>Krys</strong>, un featuring que tous les amateurs de Dancehall attendait avec impatience.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=BZyQnxRX7xE\\u0026feature=youtu.be\\u0026fbclid=IwAR1w-9nT6v3aUr_IKOQ099Zj08G4NhEie5Bew-sJ7sRGIw6HQ1zRkxjeSTA\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=BZyQnxRX7xE&amp;feature=youtu.be&amp;fbclid=IwAR1w-9nT6v3aUr_IKOQ099Zj08G4NhEie5Bew-sJ7sRGIw6HQ1zRkxjeSTA\n</div><figcaption>Admiral T x Krys - Boss Lady</figcaption></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:heading -->\n<h2>Mozaïka</h2>\n<!-- /wp:heading -->\n\n<!-- wp:image {\"id\":122} -->\n<figure class=\"wp-block-image\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/67320275_10156714299277087_4653882298289094656_n.jpg\" alt=\"\" class=\"wp-image-122\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Un album plutôt traditionnel tourné vers la culture du Ka. Son premier single \"<em>Baimbridge cho</em>\" avec <strong>Were Vana</strong> reprend le grand classique du maître Ka Guadeloupéen <strong>Guy Conquet</strong>&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=rKgvYzardtc\\u0026feature=youtu.be\\u0026fbclid=IwAR2775csKwp02hnUbIrMKGm19qLLDiOI9lr6VYPA8Q5t1RNkZgTpp7PpCpk\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=rKgvYzardtc&amp;feature=youtu.be&amp;fbclid=IwAR2775csKwp02hnUbIrMKGm19qLLDiOI9lr6VYPA8Q5t1RNkZgTpp7PpCpk\n</div><figcaption>Admiral T x Were Vana - Baimbridge Cho</figcaption></figure>\n<!-- /wp:core-embed/youtube -->','Admiral T annonce deux albums pour Septembre','','inherit','closed','closed','','120-revision-v1','','','2019-07-27 14:18:15','2019-07-27 12:18:15','',120,'http://pepseeactusv3.local/120-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (154,1,'2019-07-27 14:37:09','2019-07-27 12:37:09','<!-- wp:paragraph -->\n<p><strong>JmaX</strong> est né dans les Yvelines d\'une mère&nbsp;martiniquaise&nbsp;et d\'un père&nbsp;guadeloupéen. Ses parents reviennent aux&nbsp;Antilles&nbsp;en&nbsp;Martinique&nbsp;après sa naissance. Neveu de <strong>Kolo Barst</strong> mais surtout satisfait de ses origines, il découvre l\'univers du&nbsp;Reggae-Dancehall&nbsp;grâce à son grand frère <strong>DJ Pepsee</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mais c\'est à partir de 16 ans qu\'il se met à écrire ses premiers lyrics et fait des freestyles tous les week-end avec ses amis <strong>SlaX</strong> et <strong>Rochman</strong> d\'où ils fondent le groupe&nbsp;<em>Liberty Crew</em>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>C\'est en&nbsp;2011&nbsp;qu\'il se fait connaître avec son single&nbsp;\"<em>Djooky Dem</em>\"&nbsp;sur le EDF Riddim de <strong>DJ V-Trine</strong> ainsi que le single&nbsp;<em>Beau Parleur</em>&nbsp;sur le SME Riddim de <strong>Donshorty</strong>. En juin&nbsp;2012, il sort sa première mixtape&nbsp;<em>Xplosion</em>&nbsp;qui cartonne en Martinique avec des sons tels que&nbsp;\"<em>Djooky Dem</em>\",&nbsp;\"<em>I Salé</em>\"&nbsp;et&nbsp;\"<em>Beau parleur</em>\". Par la suite, il fera la couverture du premier numéro du magazine Raggadaggazine. En&nbsp;2013, il revient avec le single&nbsp;\"<em>Pren\'y Cool</em>\". En&nbsp;2014, il sort son célèbre titre&nbsp;\"<em>Fanatique Girl</em>\"&nbsp;produit par <strong>Radix Corporation</strong> et dont le clip est réalisé par <strong>G-Islands</strong>. Son single&nbsp;\"<em>Fanatique Girl</em>\"&nbsp;devient son premier gros succès que le label Chabine Prod a décidé de faire un remix zouk, le&nbsp;\"<em>Fanatique Zouk Remix</em>\"&nbsp;édité sur la compilation&nbsp;<em>Les Tubes du Zouk 2014</em>. Aujourd\'hui, ce titre a dépassé les 1,1 million de vues sur&nbsp;YouTube. Ensuite, il fait un feat avec <strong>MrSM</strong> et <strong>JT</strong>, deux chanteurs du label <strong>TruchaGang</strong>, sur le single&nbsp;\"<em>6H30</em>\". On le découvre aussi en freestyle avec <strong>MrSM</strong> dans les studios de <strong>Rise Up Sound</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2015, il sort les sons&nbsp;\"<em>Pretty Gyal</em>\",&nbsp;\"<em>Es Nou Pa Té Two Jenn</em>\",&nbsp;\"<em>Ladjé Kow</em>\",&nbsp;\"<em>An Pa Tou Sèl</em>\"&nbsp;et&nbsp;\"<em>Je t\'assure</em>\".</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2016, il sort sa seconde mixtape,&nbsp;<em>Reloaded</em>, dans laquelle on trouve le tube&nbsp;\"<em>Laisse-moi t\'aimer</em>\"&nbsp;en featuring avec <strong>Stacy</strong>. Ensuite, il sort le gros tube&nbsp;\"<em>Kay La</em>\"&nbsp;puis un son doux,&nbsp;\"<em>Différents Styles</em>\". En&nbsp;2017, il sort les titres&nbsp;\"<em>Milli</em>\",&nbsp;\"<em>Thug épi Gangstè</em>\",&nbsp;\"<em>Atirans</em>\",&nbsp;\"<em>Big Ben</em>\"&nbsp;et&nbsp;\"<em>Maman</em>\".</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2018, il sort le clip de son single&nbsp;\"<em>Dépi sé Mizik</em>\". Il est invité par la chanteuse de Zouk&nbsp;<strong>Nesly</strong>&nbsp;sur son tube&nbsp;\"<em>Baby Doll</em>\". Après, il sort son album&nbsp;<em>Pull Di Trigger</em>&nbsp;dans lequel on trouve des sons comme&nbsp;\"<em>Wine up</em>\",&nbsp;\"<em>Passé en lè</em>\",&nbsp;\"<em>Fi dem</em>\",&nbsp;\"<em>Hustle</em>\"&nbsp;et j\'en passe.</p>\n<!-- /wp:paragraph -->','JmaX','','publish','closed','closed','','jmax','','','2020-04-30 21:17:10','2020-04-30 19:17:10','',0,'http://pepseeactusv3.local/?post_type=artist&#038;p=154',0,'artist','',0);
INSERT INTO `wp_posts` VALUES (156,1,'2019-07-27 14:42:37','2019-07-27 12:42:37','<iframe title=\"Mel Feat JmaX  - &quot; Touch Me &quot; REMIX\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/oSQO-6xvPis?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','','','publish','closed','closed','','9468f443e50afe95276d2730560831b0','','','2019-07-27 14:42:37','2019-07-27 12:42:37','',0,'http://pepseeactusv3.local/9468f443e50afe95276d2730560831b0/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (157,1,'2019-07-27 14:42:38','2019-07-27 12:42:38','<iframe title=\"Spotify Embed: Touch Me - Remix\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/track/3GTes8tWU3OzonlsWM9yVX\"></iframe>','','','publish','closed','closed','','95b52abc1ceec859b9931040dc647d02','','','2019-07-27 14:42:38','2019-07-27 12:42:38','',0,'http://pepseeactusv3.local/95b52abc1ceec859b9931040dc647d02/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (158,1,'2019-07-26 14:47:00','2019-07-26 12:47:00','<!-- wp:core-embed/spotify {\"url\":\"https://open.spotify.com/track/2IlBgMGbkKDfu7qveyT9AB\",\"type\":\"rich\",\"providerNameSlug\":\"spotify\",\"className\":\"wp-embed-aspect-9-16 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-spotify wp-block-embed is-type-rich is-provider-spotify wp-embed-aspect-9-16 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://open.spotify.com/track/2IlBgMGbkKDfu7qveyT9AB\n</div></figure>\n<!-- /wp:core-embed/spotify -->\n\n<!-- wp:paragraph -->\n<p>C\'est le double tap, <strong>Kalash</strong> et <strong>Damso</strong> lâche 2 titres le même jour avec un clip medley.</p>\n<!-- /wp:paragraph -->','Kalash x Damso - JTC','','publish','closed','closed','','kalash-x-damso-jtc','','','2020-03-18 09:35:58','2020-03-18 08:35:58','',0,'http://pepseeactusv3.local/?post_type=music&#038;p=158',0,'music','',0);
INSERT INTO `wp_posts` VALUES (159,1,'2019-07-27 14:45:46','2019-07-27 12:45:46','<iframe title=\"Spotify Embed: JTC\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/track/2IlBgMGbkKDfu7qveyT9AB\"></iframe>','','','publish','closed','closed','','0054a65b9b34f908a011ff0cf38dc28e','','','2019-07-27 14:45:46','2019-07-27 12:45:46','',0,'http://pepseeactusv3.local/0054a65b9b34f908a011ff0cf38dc28e/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (161,1,'2019-07-27 15:10:08','2019-07-27 13:10:08','<!-- wp:core-embed/spotify {\"url\":\"https://open.spotify.com/track/6isv2O2hymNpNZJTklSwvi\",\"type\":\"rich\",\"providerNameSlug\":\"spotify\",\"className\":\"wp-embed-aspect-9-16 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-spotify wp-block-embed is-type-rich is-provider-spotify wp-embed-aspect-9-16 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://open.spotify.com/track/6isv2O2hymNpNZJTklSwvi\n</div></figure>\n<!-- /wp:core-embed/spotify -->\n\n<!-- wp:paragraph -->\n<p>C’est le double tap,&nbsp;<strong>Kalash</strong>&nbsp;et&nbsp;<strong>Damso</strong>&nbsp;lâche 2 titres le même jour avec un clip medley.</p>\n<!-- /wp:paragraph -->','Kalash x Damso - Praliné','','publish','closed','closed','','kalash-x-damso-praline','','','2020-03-18 09:32:48','2020-03-18 08:32:48','',0,'http://pepseeactusv3.local/?post_type=music&#038;p=161',0,'music','',0);
INSERT INTO `wp_posts` VALUES (162,1,'2019-07-27 15:08:39','2019-07-27 13:08:39','<iframe title=\"Spotify Embed: Praliné\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/track/6isv2O2hymNpNZJTklSwvi\"></iframe>','','','publish','closed','closed','','809a9eb9afd831ff946fc0b55ba08881','','','2019-07-27 15:08:39','2019-07-27 13:08:39','',0,'http://pepseeactusv3.local/809a9eb9afd831ff946fc0b55ba08881/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (164,1,'2019-07-19 15:18:00','2019-07-19 13:18:00','<!-- wp:core-embed/spotify {\"url\":\"https://open.spotify.com/album/62BNyfTzEuMulTeegKCRG1\",\"type\":\"rich\",\"providerNameSlug\":\"spotify\",\"className\":\"wp-embed-aspect-9-16 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-spotify wp-block-embed is-type-rich is-provider-spotify wp-embed-aspect-9-16 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://open.spotify.com/album/62BNyfTzEuMulTeegKCRG1\n</div></figure>\n<!-- /wp:core-embed/spotify -->\n\n<!-- wp:paragraph -->\n<p>\"<em>Boss Lady</em>\" est le premier extrait du futur album d\'<strong>Admiral T</strong> <strong>Caribbean</strong> <strong>Monster</strong> qui sortira en Septembre 2019. Un featuring avec <strong>Krys</strong> que toute la communauté Dancehall attendait avec impatience.</p>\n<!-- /wp:paragraph -->','Admiral T x Krys - Boss Lady','','publish','closed','closed','','admiral-t-x-krys-boss-lady','','','2020-03-18 09:27:59','2020-03-18 08:27:59','',0,'http://pepseeactusv3.local/?post_type=music&#038;p=164',0,'music','',0);
INSERT INTO `wp_posts` VALUES (166,1,'2019-07-27 15:18:54','2019-07-27 13:18:54','<iframe title=\"Spotify Embed: Boss lady\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/album/62BNyfTzEuMulTeegKCRG1\"></iframe>','','','publish','closed','closed','','29208f341622a97c4aa0f89ebd1f64ea','','','2019-07-27 15:18:54','2019-07-27 13:18:54','',0,'http://pepseeactusv3.local/29208f341622a97c4aa0f89ebd1f64ea/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (167,1,'2019-07-19 15:24:00','2019-07-19 13:24:00','<!-- wp:core-embed/spotify {\"url\":\"https://open.spotify.com/album/4K5z5W8ZsGQxVsgMAL4D7f\",\"type\":\"rich\",\"providerNameSlug\":\"spotify\",\"className\":\"wp-embed-aspect-9-16 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-spotify wp-block-embed is-type-rich is-provider-spotify wp-embed-aspect-9-16 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://open.spotify.com/album/4K5z5W8ZsGQxVsgMAL4D7f\n</div></figure>\n<!-- /wp:core-embed/spotify -->\n\n<!-- wp:paragraph -->\n<p>«&nbsp;<em>Baimbridge Cho</em>&nbsp;» est le premier extrait du futur album d’<strong>Admiral T Mozaïka</strong>&nbsp;qui sortira en Septembre 2019. Un featuring avec&nbsp;<strong>Were Vana</strong> qui reprend le grand classique du maître Ka Guadeloupéen <strong>Guy Conquet</strong>&nbsp;.</p>\n<!-- /wp:paragraph -->','Admiral T x Were Vana - Baimbridge Cho','Baimbridge Cho','publish','closed','closed','','admiral-t-x-were-vana-baimbridge-cho','','','2020-03-18 09:24:40','2020-03-18 08:24:40','',0,'http://pepseeactusv3.local/?post_type=music&#038;p=167',0,'music','',0);
INSERT INTO `wp_posts` VALUES (168,1,'2019-07-27 15:23:13','2019-07-27 13:23:13','<iframe title=\"Spotify Embed: Baimbridge cho\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/album/4K5z5W8ZsGQxVsgMAL4D7f\"></iframe>','','','publish','closed','closed','','becccbb982fa4e21d2fe2aa282adc206','','','2019-07-27 15:23:13','2019-07-27 13:23:13','',0,'http://pepseeactusv3.local/becccbb982fa4e21d2fe2aa282adc206/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (171,1,'2019-07-27 15:39:29','2019-07-27 13:39:29','<!-- wp:core-embed/spotify {\"url\":\"https://open.spotify.com/album/7uD2YX1KX3OZm1PGDy4Wc7\",\"type\":\"rich\",\"providerNameSlug\":\"spotify\",\"className\":\"wp-embed-aspect-9-16 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-spotify wp-block-embed is-type-rich is-provider-spotify wp-embed-aspect-9-16 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://open.spotify.com/album/7uD2YX1KX3OZm1PGDy4Wc7\n</div></figure>\n<!-- /wp:core-embed/spotify -->\n\n<!-- wp:paragraph -->\n<p><strong>Shannon</strong> revient en mode shatta avec \"<em>Best</em>\".</p>\n<!-- /wp:paragraph -->','Shannon - Best','','publish','closed','closed','','shannon','','','2020-03-18 09:20:54','2020-03-18 08:20:54','',0,'http://pepseeactusv3.local/?post_type=music&#038;p=171',0,'music','',0);
INSERT INTO `wp_posts` VALUES (173,1,'2019-07-27 15:39:30','2019-07-27 13:39:30','<iframe title=\"Spotify Embed: BEST\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/album/7uD2YX1KX3OZm1PGDy4Wc7\"></iframe>','','','publish','closed','closed','','d4bb8ccb5142894395e1b2e2ec496428','','','2019-07-27 15:39:30','2019-07-27 13:39:30','',0,'http://pepseeactusv3.local/d4bb8ccb5142894395e1b2e2ec496428/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (177,1,'2020-03-15 11:38:58','2020-03-15 10:38:58','<iframe title=\"Lorenz feat Jmax - Luv Me [CLIP OFFICIEL] #LUVME\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/OTCw5e94ehg?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','','','publish','closed','closed','','10926389a9b869d1e3ea2bfdad666725','','','2020-03-15 11:38:58','2020-03-15 10:38:58','',0,'http://pepseeactusv3.local/10926389a9b869d1e3ea2bfdad666725/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (180,1,'2020-03-15 11:44:07','2020-03-15 10:44:07','<!-- wp:paragraph -->\n<p>Saïk a enfin dévoilé le jour de la sortie de son album Magma ainsi qu\'une nouvelle pochette. En effet, cela faisait presque deux ans que les fans de Saïk attendaient cet album qu\'il teasait sur ses réseaux.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":179,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/A10ujRYk3dL._SL1500_-1024x1024.jpg\" alt=\"saik magma\" class=\"wp-image-179\"/><figcaption>Saïk - Magma</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Nous avons enfin la date de sortie, ce sera pour le 30 Aout 2019.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=OR1SsoxcuLg\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=OR1SsoxcuLg\n</div><figcaption>Saïk - Red Bull</figcaption></figure>\n<!-- /wp:core-embed/youtube -->','La date de sortie de Magma enfin révélée!','','inherit','closed','closed','','126-revision-v1','','','2020-03-15 11:44:07','2020-03-15 10:44:07','',126,'http://pepseeactusv3.local/126-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (190,1,'2020-03-16 22:31:11','2020-03-16 21:31:11','a:10:{s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:1;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"message\";s:26:\"Ce compte est-il officiel?\";s:13:\"default_value\";i:1;s:2:\"ui\";i:0;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Compte vérifié','compte_verifie','publish','closed','closed','','field_5e6fef2c41455','','','2020-03-17 22:08:09','2020-03-17 21:08:09','',147,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=190',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (191,1,'2020-03-16 22:31:11','2020-03-16 21:31:11','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:31:\"https://twitter.com/PepseeActus\";}','Twitter','twitter','publish','closed','closed','','field_5e6fedc241452','','','2020-03-18 23:07:31','2020-03-18 22:07:31','',147,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=191',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (192,1,'2020-03-16 22:31:11','2020-03-16 21:31:11','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:38:\"https://www.instagram.com/pepseeactus/\";}','Instagram','instagram','publish','closed','closed','','field_5e6fee7041453','','','2020-03-18 23:07:31','2020-03-18 22:07:31','',147,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=192',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (193,1,'2020-03-16 22:31:11','2020-03-16 21:31:11','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:37:\"https://www.facebook.com/PepseeActus/\";}','Facebook','facebook','publish','closed','closed','','field_5e6feee241454','','','2020-03-18 23:07:31','2020-03-18 22:07:31','',147,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=193',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (194,1,'2020-03-16 22:31:11','2020-03-16 21:31:11','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Youtube','youtube','publish','closed','closed','','field_5e6feff541456','','','2020-03-18 23:07:31','2020-03-18 22:07:31','',147,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=194',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (197,1,'2020-03-17 21:15:00','2020-03-17 20:15:00','','jmax','','inherit','open','closed','','57726635_2520837081279801_5716810562868871168_o','','','2020-03-17 21:15:14','2020-03-17 20:15:14','',154,'http://pepseeactusv3.local/wp-content/uploads/2019/07/57726635_2520837081279801_5716810562868871168_o.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (198,1,'2020-03-17 23:24:41','2020-03-17 22:24:41','','jmax mel touch me remix','','inherit','open','closed','','3614977940763_600','','','2020-03-17 23:24:57','2020-03-17 22:24:57','',72,'http://pepseeactusv3.local/wp-content/uploads/2018/11/3614977940763_600-1.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (199,1,'2020-03-17 23:30:44','2020-03-17 22:30:44','a:7:{s:8:\"location\";a:2:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"artist\";}}i:1;a:2:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"post\";}i:1;a:3:{s:5:\"param\";s:13:\"post_category\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:14:\"category:clips\";}}}s:8:\"position\";s:15:\"acf_after_title\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','Musique Associé','musique-associe','publish','closed','closed','','group_5e714f3f3575f','','','2020-03-18 13:26:22','2020-03-18 12:26:22','',0,'http://pepseeactusv3.local/?post_type=acf-field-group&#038;p=199',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (200,1,'2020-03-17 23:30:44','2020-03-17 22:30:44','a:12:{s:4:\"type\";s:12:\"relationship\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:5:\"music\";}s:8:\"taxonomy\";s:0:\"\";s:7:\"filters\";a:3:{i:0;s:6:\"search\";i:1;s:9:\"post_type\";i:2;s:8:\"taxonomy\";}s:8:\"elements\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";}','Musique associée(s)','musique_associees','publish','closed','closed','','field_5e714f604c0ba','','','2020-03-17 23:30:44','2020-03-17 22:30:44','',199,'http://pepseeactusv3.local/?post_type=acf-field&p=200',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (201,1,'2020-03-17 23:55:13','2020-03-17 22:55:13','','lorenz jmax luv me','','inherit','open','closed','','a1yxvkg409l-_ss500_','','','2020-03-17 23:55:33','2020-03-17 22:55:33','',73,'http://pepseeactusv3.local/wp-content/uploads/2018/11/A1YXVkG409L._SS500_-1.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (203,1,'2020-03-18 00:11:23','2020-03-17 23:11:23','a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:5:\"music\";}}}s:8:\"position\";s:15:\"acf_after_title\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','Musique','musique','publish','closed','closed','','group_5e7158dd8069a','','','2020-03-18 09:15:55','2020-03-18 08:15:55','',0,'http://pepseeactusv3.local/?post_type=acf-field-group&#038;p=203',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (204,1,'2020-03-18 00:11:23','2020-03-17 23:11:23','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Spotify','spotify','publish','closed','closed','','field_5e7158e6fb5b1','','','2020-03-18 09:04:24','2020-03-18 08:04:24','',203,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=204',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (205,1,'2020-03-18 00:11:23','2020-03-17 23:11:23','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Download','download','publish','closed','closed','','field_5e715909fb5b2','','','2020-03-18 09:04:24','2020-03-18 08:04:24','',203,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=205',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (206,1,'2020-03-18 00:15:47','2020-03-17 23:15:47','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Deezer','deezer','publish','closed','closed','','field_5e7159b465203','','','2020-03-18 09:04:24','2020-03-18 08:04:24','',203,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=206',6,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (207,1,'2020-03-18 00:15:47','2020-03-17 23:15:47','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Youtube','youtube','publish','closed','closed','','field_5e7159c665204','','','2020-03-18 09:04:24','2020-03-18 08:04:24','',203,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=207',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (208,1,'2020-03-18 00:15:47','2020-03-17 23:15:47','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Google Play Music','google_play_music','publish','closed','closed','','field_5e715a0665205','','','2020-03-18 09:04:24','2020-03-18 08:04:24','',203,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=208',8,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (209,1,'2020-03-18 00:15:47','2020-03-17 23:15:47','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Tidal','tidal','publish','closed','closed','','field_5e715a1665206','','','2020-03-18 09:04:24','2020-03-18 08:04:24','',203,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=209',9,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (210,1,'2020-03-18 00:20:08','2020-03-17 23:20:08','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Soundcloud','soundcloud','publish','closed','closed','','field_5e715b083ff9c','','','2020-03-18 09:04:24','2020-03-18 08:04:24','',203,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=210',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (211,1,'2019-08-31 08:39:00','2019-08-31 06:39:00','<!-- wp:paragraph -->\n<p><strong>Yanii </strong>une jeune artiste de Saint Martin s\'offre luxe de démarrer sa carrière avec <strong>JmaX </strong>à ses côtés sur le titre \"<em>Dans La Peau</em>\". Un titre qui est déjà en rotation partout avec un très beau clip.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=RAJClSlSpHE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=RAJClSlSpHE\n</div></figure>\n<!-- /wp:core-embed/youtube -->','Yanii x JmaX - Dans La Peau','','publish','closed','closed','','yanii-x-jmax','','','2020-03-25 00:54:59','2020-03-24 23:54:59','',0,'http://pepseeactusv3.local/?post_type=music&#038;p=211',0,'music','',0);
INSERT INTO `wp_posts` VALUES (212,1,'2020-03-18 08:41:01','2020-03-18 07:41:01','','jmax_yanii_dans_la_peau','','inherit','open','closed','','jmax_yanii_dans_la_peau','','','2020-03-18 08:41:14','2020-03-18 07:41:14','',211,'http://pepseeactusv3.local/wp-content/uploads/2020/03/jmax_yanii_dans_la_peau.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (213,1,'2020-03-18 08:45:06','2020-03-18 07:45:06','<iframe title=\"Yanii Feat JmaX - Dans la Peau\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/RAJClSlSpHE?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','','','publish','closed','closed','','d67da5342c438b876df6b498fd159967','','','2020-03-18 08:45:06','2020-03-18 07:45:06','',0,'http://pepseeactusv3.local/d67da5342c438b876df6b498fd159967/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (214,1,'2020-03-18 08:47:56','2020-03-18 07:47:56','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Apple Music','apple_music','publish','closed','closed','','field_5e71d18714e84','','','2020-03-18 09:04:24','2020-03-18 08:04:24','',203,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=214',7,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (216,1,'2020-03-17 08:52:00','2020-03-17 07:52:00','<!-- wp:paragraph -->\n<p><strong>JmaX</strong> revient avec un nouveau titre acoustic \"<em>Darling</em>\"</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<iframe allow=\"autoplay *; encrypted-media *;\" frameborder=\"0\" height=\"400\" style=\"width:100%;overflow:hidden;background:transparent;\" sandbox=\"allow-forms allow-popups allow-same-origin allow-scripts allow-storage-access-by-user-activation allow-top-navigation-by-user-activation\" src=\"https://embed.music.apple.com/fr/album/darling-acoustic-single/1501740115\"></iframe>\n<!-- /wp:html -->','JmaX - Darling','','publish','closed','closed','','jmax','','','2020-05-03 22:12:07','2020-05-03 20:12:07','',0,'http://pepseeactusv3.local/?post_type=music&#038;p=216',0,'music','',0);
INSERT INTO `wp_posts` VALUES (217,1,'2020-03-18 08:54:19','2020-03-18 07:54:19','','jmax_darling','','inherit','open','closed','','jmax_darling','','','2020-03-18 08:54:30','2020-03-18 07:54:30','',216,'http://pepseeactusv3.local/wp-content/uploads/2020/03/jmax_darling.jpeg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (218,1,'2020-03-18 09:04:24','2020-03-18 08:04:24','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Artiste(s)','artistes','publish','closed','closed','','field_5e71d5d69fafa','','','2020-03-18 09:04:24','2020-03-18 08:04:24','',203,'http://pepseeactusv3.local/?post_type=acf-field&p=218',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (219,1,'2020-03-18 09:04:24','2020-03-18 08:04:24','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Titre','titre','publish','closed','closed','','field_5e71d5ef9fafb','','','2020-03-18 09:04:24','2020-03-18 08:04:24','',203,'http://pepseeactusv3.local/?post_type=acf-field&p=219',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (220,1,'2020-03-18 09:17:36','2020-03-18 08:17:36','','shannon-best','','inherit','open','closed','','shannon-best-2','','','2020-03-18 09:17:46','2020-03-18 08:17:46','',171,'http://pepseeactusv3.local/wp-content/uploads/2019/07/shannon-best.jpeg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (222,1,'2020-03-18 09:21:36','2020-03-18 08:21:36','','admiral-t-baimbridge-cho-feat-were-vana','','inherit','open','closed','','admiral-t-baimbridge-cho-feat-were-vana','','','2020-03-18 09:21:52','2020-03-18 08:21:52','',167,'http://pepseeactusv3.local/wp-content/uploads/2019/07/admiral-t-baimbridge-cho-feat-were-vana.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (224,1,'2020-03-18 09:25:12','2020-03-18 08:25:12','','admiral-t-boss-lady-feat-krys','','inherit','open','closed','','admiral-t-boss-lady-feat-krys','','','2020-03-18 09:25:28','2020-03-18 08:25:28','',164,'http://pepseeactusv3.local/wp-content/uploads/2019/07/admiral-t-boss-lady-feat-krys.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (226,1,'2020-03-18 09:28:15','2020-03-18 08:28:15','','kalash damso praliné','','inherit','open','closed','','500x500','','','2020-03-18 09:28:31','2020-03-18 08:28:31','',161,'http://pepseeactusv3.local/wp-content/uploads/2019/07/500x500.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (228,1,'2020-03-18 09:33:54','2020-03-18 08:33:54','','kalash-jtc-feat-damso','','inherit','open','closed','','kalash-jtc-feat-damso','','','2020-03-18 09:34:05','2020-03-18 08:34:05','',158,'http://pepseeactusv3.local/wp-content/uploads/2019/07/kalash-jtc-feat-damso.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (231,1,'2019-09-11 13:19:00','2019-09-11 11:19:00','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=RAJClSlSpHE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=RAJClSlSpHE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Yanii</strong> une jeune artiste de Saint-Martin débute sa carrière au côté de <strong>JmaX </strong>avec \"<em>Dans La Peau</em>\"</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>Auteurs: Yanii &amp; JmaX</li><li>Compositeurs : Oswald &amp; Dizzell Bueno</li><li>Réalisation : The Creators x Great Music Films</li><li>Mix : Dizzell Bueno (Great Music Studio)</li><li>Master : Mickael Johan (eMax Mastering)</li><li>Label: North island Records</li><li>Producteur : Cardo Red Eye Crew</li><li>Assistant Réal : Larry Desbonne</li><li>Maquilleuse: Sarolia Ada</li><li>Danceurs: Lincoln Arrindell &amp; Chelsea Henderson&nbsp;Special </li></ul>\n<!-- /wp:list -->','Yanii x JmaX - Dans La Peau','','publish','open','open','','yanii-x-jmax-dans-la-peau','','','2020-03-21 22:16:07','2020-03-21 21:16:07','',0,'http://pepseeactusv3.local/?p=231',0,'post','',0);
INSERT INTO `wp_posts` VALUES (232,1,'2020-03-18 13:15:07','2020-03-18 12:15:07','','Yanii-Feat-JmaX-Dans-la-Peau','','inherit','open','closed','','yanii-feat-jmax-dans-la-peau','','','2020-03-18 13:15:07','2020-03-18 12:15:07','',231,'http://pepseeactusv3.local/wp-content/uploads/2020/03/Yanii-Feat-JmaX-Dans-la-Peau.jpeg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (233,1,'2020-03-18 13:19:04','2020-03-18 12:19:04','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=RAJClSlSpHE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=RAJClSlSpHE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Yanii</strong> une jeune artiste de Saint-Martin débute sa carrière au côté de <strong>JmaX </strong>avec \"<em>Dans La Peau</em>\"</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>Auteurs: Yanii &amp; JmaX</li><li>Compositeurs : Oswald &amp; Dizzell Bueno</li><li>Réalisation : The Creators x Great Music Films</li><li>Mix : Dizzell Bueno (Great Music Studio)</li><li>Master : Mickael Johan (eMax Mastering)</li><li>Label: North island Records</li><li>Producteur : Cardo Red Eye Crew</li><li>Assistant Réal : Larry Desbonne</li><li>Maquilleuse: Sarolia Ada</li><li>Danceurs: Lincoln Arrindell &amp; Chelsea Henderson Special </li></ul>\n<!-- /wp:list -->','Yanii x JmaX - Dans La Peau','','inherit','closed','closed','','231-revision-v1','','','2020-03-18 13:19:04','2020-03-18 12:19:04','',231,'http://pepseeactusv3.local/231-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (234,1,'2020-03-18 13:19:05','2020-03-18 12:19:05','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=RAJClSlSpHE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=RAJClSlSpHE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Yanii</strong> une jeune artiste de Saint-Martin débute sa carrière au côté de <strong>JmaX </strong>avec \"<em>Dans La Peau</em>\"</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>Auteurs: Yanii &amp; JmaX</li><li>Compositeurs : Oswald &amp; Dizzell Bueno</li><li>Réalisation : The Creators x Great Music Films</li><li>Mix : Dizzell Bueno (Great Music Studio)</li><li>Master : Mickael Johan (eMax Mastering)</li><li>Label: North island Records</li><li>Producteur : Cardo Red Eye Crew</li><li>Assistant Réal : Larry Desbonne</li><li>Maquilleuse: Sarolia Ada</li><li>Danceurs: Lincoln Arrindell &amp; Chelsea Henderson Special </li></ul>\n<!-- /wp:list -->','Yanii x JmaX - Dans La Peau','','inherit','closed','closed','','231-revision-v1','','','2020-03-18 13:19:05','2020-03-18 12:19:05','',231,'http://pepseeactusv3.local/231-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (235,1,'2020-03-18 13:21:07','2020-03-18 12:21:07','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=RAJClSlSpHE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=RAJClSlSpHE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Yanii</strong> une jeune artiste de Saint-Martin débute sa carrière au côté de <strong>JmaX </strong>avec \"<em>Dans La Peau</em>\"</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>Auteurs: Yanii &amp; JmaX</li><li>Compositeurs : Oswald &amp; Dizzell Bueno</li><li>Réalisation : The Creators x Great Music Films</li><li>Mix : Dizzell Bueno (Great Music Studio)</li><li>Master : Mickael Johan (eMax Mastering)</li><li>Label: North island Records</li><li>Producteur : Cardo Red Eye Crew</li><li>Assistant Réal : Larry Desbonne</li><li>Maquilleuse: Sarolia Ada</li><li>Danceurs: Lincoln Arrindell &amp; Chelsea Henderson&nbsp;Special </li></ul>\n<!-- /wp:list -->','Yanii x JmaX - Dans La Peau','','inherit','closed','closed','','231-revision-v1','','','2020-03-18 13:21:07','2020-03-18 12:21:07','',231,'http://pepseeactusv3.local/231-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (236,1,'2020-03-18 13:21:07','2020-03-18 12:21:07','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=RAJClSlSpHE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=RAJClSlSpHE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Yanii</strong> une jeune artiste de Saint-Martin débute sa carrière au côté de <strong>JmaX </strong>avec \"<em>Dans La Peau</em>\"</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>Auteurs: Yanii &amp; JmaX</li><li>Compositeurs : Oswald &amp; Dizzell Bueno</li><li>Réalisation : The Creators x Great Music Films</li><li>Mix : Dizzell Bueno (Great Music Studio)</li><li>Master : Mickael Johan (eMax Mastering)</li><li>Label: North island Records</li><li>Producteur : Cardo Red Eye Crew</li><li>Assistant Réal : Larry Desbonne</li><li>Maquilleuse: Sarolia Ada</li><li>Danceurs: Lincoln Arrindell &amp; Chelsea Henderson&nbsp;Special </li></ul>\n<!-- /wp:list -->','Yanii x JmaX - Dans La Peau','','inherit','closed','closed','','231-revision-v1','','','2020-03-18 13:21:07','2020-03-18 12:21:07','',231,'http://pepseeactusv3.local/231-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (237,1,'2020-03-18 13:28:18','2020-03-18 12:28:18','a:7:{s:8:\"location\";a:2:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:5:\"music\";}}i:1;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"artist\";}}}s:8:\"position\";s:15:\"acf_after_title\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','Album Associé','album-associe','publish','closed','closed','','group_5e72137704ece','','','2020-03-18 13:28:18','2020-03-18 12:28:18','',0,'http://pepseeactusv3.local/?post_type=acf-field-group&#038;p=237',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (238,1,'2020-03-18 13:28:18','2020-03-18 12:28:18','a:12:{s:4:\"type\";s:12:\"relationship\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:5:\"album\";}s:8:\"taxonomy\";s:0:\"\";s:7:\"filters\";a:3:{i:0;s:6:\"search\";i:1;s:9:\"post_type\";i:2;s:8:\"taxonomy\";}s:8:\"elements\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";}','Album(s) Associé(s)','albums_associes','publish','closed','closed','','field_5e72139b2d39f','','','2020-03-18 13:28:18','2020-03-18 12:28:18','',237,'http://pepseeactusv3.local/?post_type=acf-field&p=238',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (239,1,'2020-03-18 13:34:59','2020-03-18 12:34:59','a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"artist\";}}}s:8:\"position\";s:15:\"acf_after_title\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','Clip Associé','clip-associe','publish','closed','closed','','group_5e72153b9400d','','','2020-03-18 13:34:59','2020-03-18 12:34:59','',0,'http://pepseeactusv3.local/?post_type=acf-field-group&#038;p=239',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (240,1,'2020-03-18 13:34:59','2020-03-18 12:34:59','a:12:{s:4:\"type\";s:12:\"relationship\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:4:\"post\";}s:8:\"taxonomy\";a:1:{i:0;s:14:\"category:clips\";}s:7:\"filters\";a:3:{i:0;s:6:\"search\";i:1;s:9:\"post_type\";i:2;s:8:\"taxonomy\";}s:8:\"elements\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";}','Clip(s) Associé(s)','clips_associes','publish','closed','closed','','field_5e721548a0750','','','2020-03-18 13:34:59','2020-03-18 12:34:59','',239,'http://pepseeactusv3.local/?post_type=acf-field&p=240',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (241,1,'2020-03-18 22:09:05','2020-03-18 21:09:05','','admiral t caribbean monster','','inherit','open','closed','','67112364_10156714299347087_6249821407371329536_n','','','2020-03-18 22:09:24','2020-03-18 21:09:24','',120,'http://pepseeactusv3.local/wp-content/uploads/2019/07/67112364_10156714299347087_6249821407371329536_n-1.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (242,1,'2020-03-18 22:10:09','2020-03-18 21:10:09','','67320275_10156714299277087_4653882298289094656_n','','inherit','open','closed','','67320275_10156714299277087_4653882298289094656_n','','','2020-03-18 22:10:09','2020-03-18 21:10:09','',120,'http://pepseeactusv3.local/wp-content/uploads/2020/03/67320275_10156714299277087_4653882298289094656_n.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (243,1,'2020-03-18 22:10:37','2020-03-18 21:10:37','<!-- wp:paragraph -->\n<p>Admiral T annonce deux albums pour la rentrée 2019/2020. Avec deux clips \"<em>Boss Lady</em>\" feat <strong>Krys</strong> et \"<em>Baimbridge</em> Cho\" feat <strong>Were Vana</strong>. Les albums seront disponible qu\'en version digitale.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Caribbean Monster</h2>\n<!-- /wp:heading -->\n\n<!-- wp:image {\"id\":241,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/67112364_10156714299347087_6249821407371329536_n-1.jpg\" alt=\"admiral t caribbean monster\" class=\"wp-image-241\"/><figcaption>Admiral T - Caribbean Monster</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Un album pure Dancehall avec en 1er single \"<em>Boss Lady</em>\" avec <strong>Krys</strong>, un featuring que tous les amateurs de Dancehall attendait avec impatience.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=BZyQnxRX7xE\\u0026feature=youtu.be\\u0026fbclid=IwAR1w-9nT6v3aUr_IKOQ099Zj08G4NhEie5Bew-sJ7sRGIw6HQ1zRkxjeSTA\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=BZyQnxRX7xE&amp;feature=youtu.be&amp;fbclid=IwAR1w-9nT6v3aUr_IKOQ099Zj08G4NhEie5Bew-sJ7sRGIw6HQ1zRkxjeSTA\n</div><figcaption>Admiral T x Krys - Boss Lady</figcaption></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:heading -->\n<h2>Mozaïka</h2>\n<!-- /wp:heading -->\n\n<!-- wp:image {\"id\":242,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2020/03/67320275_10156714299277087_4653882298289094656_n.jpg\" alt=\"\" class=\"wp-image-242\"/><figcaption>Admiral T - Mozaïka</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Un album plutôt traditionnel tourné vers la culture du Ka. Son premier single \"<em>Baimbridge cho</em>\" avec <strong>Were Vana</strong> reprend le grand classique du maître Ka Guadeloupéen <strong>Guy Conquet</strong>&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=rKgvYzardtc\\u0026feature=youtu.be\\u0026fbclid=IwAR2775csKwp02hnUbIrMKGm19qLLDiOI9lr6VYPA8Q5t1RNkZgTpp7PpCpk\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=rKgvYzardtc&amp;feature=youtu.be&amp;fbclid=IwAR2775csKwp02hnUbIrMKGm19qLLDiOI9lr6VYPA8Q5t1RNkZgTpp7PpCpk\n</div><figcaption>Admiral T x Were Vana - Baimbridge Cho</figcaption></figure>\n<!-- /wp:core-embed/youtube -->','Admiral T annonce deux albums pour Septembre','','inherit','closed','closed','','120-revision-v1','','','2020-03-18 22:10:37','2020-03-18 21:10:37','',120,'http://pepseeactusv3.local/120-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (244,1,'2020-03-18 22:11:37','2020-03-18 21:11:37','','saïk_magma','','inherit','open','closed','','sai%cc%88k_magma','','','2020-03-18 22:11:45','2020-03-18 21:11:45','',126,'http://pepseeactusv3.local/wp-content/uploads/2019/07/saïk_magma.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (245,1,'2020-03-18 22:11:47','2020-03-18 21:11:47','<!-- wp:paragraph -->\n<p>Saïk a enfin dévoilé le jour de la sortie de son album Magma ainsi qu\'une nouvelle pochette. En effet, cela faisait presque deux ans que les fans de Saïk attendaient cet album qu\'il teasait sur ses réseaux.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":244,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/saïk_magma.jpg\" alt=\"saik magma\" class=\"wp-image-244\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Nous avons enfin la date de sortie, ce sera pour le 30 Aout 2019.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=OR1SsoxcuLg\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=OR1SsoxcuLg\n</div><figcaption>Saïk - Red Bull</figcaption></figure>\n<!-- /wp:core-embed/youtube -->','La date de sortie de Magma enfin révélée!','','inherit','closed','closed','','126-revision-v1','','','2020-03-18 22:11:47','2020-03-18 21:11:47','',126,'http://pepseeactusv3.local/126-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (246,1,'2020-03-18 22:13:41','2020-03-18 21:13:41','','spice','','inherit','open','closed','','tropical-soundsystem','','','2020-03-18 22:13:52','2020-03-18 21:13:52','',55,'http://pepseeactusv3.local/wp-content/uploads/2018/11/Tropical-soundsystem.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (248,1,'2020-03-18 22:18:13','2020-03-18 21:18:13','http://pepseeactusv3.local/wp-content/uploads/2020/03/cropped-logo-blanc.png','cropped-logo-blanc.png','','inherit','open','closed','','cropped-logo-blanc-png','','','2020-03-18 22:18:13','2020-03-18 21:18:13','',0,'http://pepseeactusv3.local/wp-content/uploads/2020/03/cropped-logo-blanc.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (250,1,'2020-03-18 22:19:44','2020-03-18 21:19:44','','pepseeactus_logo_picto_noir_2019','','inherit','open','closed','','pepseeactus_logo_picto_noir_2019','','','2020-03-18 22:19:59','2020-03-18 21:19:59','',0,'http://pepseeactusv3.local/wp-content/uploads/2020/03/pepseeactus_logo_picto_noir_2019.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (251,1,'2020-03-18 22:20:01','2020-03-18 21:20:01','http://pepseeactusv3.local/wp-content/uploads/2020/03/cropped-pepseeactus_logo_picto_noir_2019.png','cropped-pepseeactus_logo_picto_noir_2019.png','','inherit','open','closed','','cropped-pepseeactus_logo_picto_noir_2019-png','','','2020-03-18 22:20:01','2020-03-18 21:20:01','',0,'http://pepseeactusv3.local/wp-content/uploads/2020/03/cropped-pepseeactus_logo_picto_noir_2019.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (253,1,'2020-03-18 22:20:52','2020-03-18 21:20:52','http://pepseeactusv3.local/wp-content/uploads/2020/03/cropped-pepseeactus_logo_picto_noir_2019-1.png','cropped-pepseeactus_logo_picto_noir_2019-1.png','','inherit','open','closed','','cropped-pepseeactus_logo_picto_noir_2019-1-png','','','2020-03-18 22:20:52','2020-03-18 21:20:52','',0,'http://pepseeactusv3.local/wp-content/uploads/2020/03/cropped-pepseeactus_logo_picto_noir_2019-1.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (255,1,'2020-03-18 22:22:25','2020-03-18 21:22:25','','kalash','','inherit','open','closed','','3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b','','','2020-03-18 22:22:40','2020-03-18 21:22:40','',151,'http://pepseeactusv3.local/wp-content/uploads/2019/07/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (256,1,'2020-03-18 22:31:23','2020-03-18 21:31:23','','pepseeactus logo','','inherit','open','closed','','logo-perso','','','2020-03-18 22:31:40','2020-03-18 21:31:40','',0,'http://pepseeactusv3.local/wp-content/uploads/2020/03/logo-perso.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (257,1,'2020-03-18 22:31:41','2020-03-18 21:31:41','http://pepseeactusv3.local/wp-content/uploads/2020/03/cropped-logo-perso.png','cropped-logo-perso.png','','inherit','open','closed','','cropped-logo-perso-png','','','2020-03-18 22:31:41','2020-03-18 21:31:41','',0,'http://pepseeactusv3.local/wp-content/uploads/2020/03/cropped-logo-perso.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (260,1,'2018-11-30 22:38:00','2018-11-30 21:38:00','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=LvI9feKBlds\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=LvI9feKBlds\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:list -->\n<ul><li>Auteur : JmaX</li><li>Compositeurs : Mafio House , Alvin Brown</li><li>Réalisation : Jean-Francky GUERRIER (｡Nine Seven Pictures｡)</li><li>Mix : Dj GIL</li><li>Master : Mickael JOHAN</li><li>Production : Turn On AGENCY / PMC &amp; NIRVANA Music </li></ul>\n<!-- /wp:list -->','JmaX - Love','','publish','open','open','','jmax-love','','','2020-03-21 22:07:35','2020-03-21 21:07:35','',0,'http://pepseeactusv3.local/?p=260',0,'post','',0);
INSERT INTO `wp_posts` VALUES (261,1,'2020-03-18 22:39:10','2020-03-18 21:39:10','','JmaX-LOVE','','inherit','open','closed','','jmax-love','','','2020-03-18 22:39:10','2020-03-18 21:39:10','',260,'http://pepseeactusv3.local/wp-content/uploads/2020/03/JmaX-LOVE.jpeg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (262,1,'2020-03-18 22:41:04','2020-03-18 21:41:04','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=LvI9feKBlds\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=LvI9feKBlds\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:list -->\n<ul><li>Auteur : JmaX</li><li>Compositeurs : Mafio House , Alvin Brown</li><li>Réalisation : Jean-Francky GUERRIER (｡Nine Seven Pictures｡)</li><li>Mix : Dj GIL</li><li>Master : Mickael JOHAN</li><li>Production : Turn On AGENCY / PMC &amp; NIRVANA Music </li></ul>\n<!-- /wp:list -->','JmaX - Love','','inherit','closed','closed','','260-revision-v1','','','2020-03-18 22:41:04','2020-03-18 21:41:04','',260,'http://pepseeactusv3.local/260-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (263,1,'2020-03-18 22:41:05','2020-03-18 21:41:05','<iframe title=\"JmaX - LOVE\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/LvI9feKBlds?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','','','publish','closed','closed','','43d2135de3485e336b175504dbc5ec94','','','2020-03-18 22:41:05','2020-03-18 21:41:05','',0,'http://pepseeactusv3.local/43d2135de3485e336b175504dbc5ec94/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (264,1,'2020-03-18 22:41:06','2020-03-18 21:41:06','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=LvI9feKBlds\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=LvI9feKBlds\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:list -->\n<ul><li>Auteur : JmaX</li><li>Compositeurs : Mafio House , Alvin Brown</li><li>Réalisation : Jean-Francky GUERRIER (｡Nine Seven Pictures｡)</li><li>Mix : Dj GIL</li><li>Master : Mickael JOHAN</li><li>Production : Turn On AGENCY / PMC &amp; NIRVANA Music </li></ul>\n<!-- /wp:list -->','JmaX - Love','','inherit','closed','closed','','260-revision-v1','','','2020-03-18 22:41:06','2020-03-18 21:41:06','',260,'http://pepseeactusv3.local/260-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (265,1,'2017-09-13 22:54:00','2017-09-13 20:54:00','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=oSQO-6xvPis\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=oSQO-6xvPis\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:list -->\n<ul><li>Auteur : Mel &amp; JmaX</li><li>Compositeur : Kevin &amp; Cédric BERKELEY </li><li>Mix/Master : Dreamtracks</li><li>Production : GMusik / Dreamtracks </li><li>Réalisation : PlayStudio</li></ul>\n<!-- /wp:list -->','Mel x JmaX - Touch Me','','publish','open','open','','mel-x-jmax-touch-me','','','2020-03-18 22:56:16','2020-03-18 21:56:16','',0,'http://pepseeactusv3.local/?p=265',0,'post','',0);
INSERT INTO `wp_posts` VALUES (266,1,'2020-03-18 22:54:44','2020-03-18 21:54:44','','Mel-Feat-JmaX-Touch-Me-REMIX','','inherit','open','closed','','mel-feat-jmax-touch-me-remix','','','2020-03-18 22:54:44','2020-03-18 21:54:44','',265,'http://pepseeactusv3.local/wp-content/uploads/2020/03/Mel-Feat-JmaX-Touch-Me-REMIX.jpeg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (267,1,'2020-03-18 22:56:14','2020-03-18 21:56:14','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=oSQO-6xvPis\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=oSQO-6xvPis\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:list -->\n<ul><li>Auteur : Mel &amp; JmaX</li><li>Compositeur : Kevin &amp; Cédric BERKELEY </li><li>Mix/Master : Dreamtracks</li><li>Production : GMusik / Dreamtracks </li><li>Réalisation : PlayStudio</li></ul>\n<!-- /wp:list -->','Mel x JmaX - Touch Me','','inherit','closed','closed','','265-revision-v1','','','2020-03-18 22:56:14','2020-03-18 21:56:14','',265,'http://pepseeactusv3.local/265-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (268,1,'2020-03-18 22:56:16','2020-03-18 21:56:16','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=oSQO-6xvPis\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=oSQO-6xvPis\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:list -->\n<ul><li>Auteur : Mel &amp; JmaX</li><li>Compositeur : Kevin &amp; Cédric BERKELEY </li><li>Mix/Master : Dreamtracks</li><li>Production : GMusik / Dreamtracks </li><li>Réalisation : PlayStudio</li></ul>\n<!-- /wp:list -->','Mel x JmaX - Touch Me','','inherit','closed','closed','','265-revision-v1','','','2020-03-18 22:56:16','2020-03-18 21:56:16','',265,'http://pepseeactusv3.local/265-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (270,1,'2020-03-18 23:09:37','2020-03-18 22:09:37','','jmax_pull_di_trigger','','inherit','open','closed','','jmax_pull_di_trigger','','','2020-03-18 23:09:46','2020-03-18 22:09:46','',0,'http://pepseeactusv3.local/wp-content/uploads/2020/03/jmax_pull_di_trigger.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (271,1,'2020-03-18 23:18:56','2020-03-18 22:18:56','<iframe title=\"PULL DI TRIGGER Dj Patchy ( Shendou Gang ) by JMAX\" width=\"640\" height=\"400\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?visual=true&url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F457994664&show_artwork=true&maxwidth=640&maxheight=960&dnt=1\"></iframe>','','','publish','closed','closed','','6d3e98d6cdf5e329659c836ff2557fb6','','','2020-03-18 23:18:56','2020-03-18 22:18:56','',0,'http://pepseeactusv3.local/6d3e98d6cdf5e329659c836ff2557fb6/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (285,1,'2020-03-18 23:25:42','2020-03-18 22:25:42','a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:5:\"album\";}}}s:8:\"position\";s:15:\"acf_after_title\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','Album','album','publish','closed','closed','','group_5e729fe63d06a','','','2020-03-18 23:26:16','2020-03-18 22:26:16','',0,'http://pepseeactusv3.local/?p=285',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (286,1,'2020-03-18 23:25:42','2020-03-18 22:25:42','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Artiste(s)','artistes','publish','closed','closed','','field_5e729fe642a5d','','','2020-03-18 23:25:42','2020-03-18 22:25:42','',285,'http://pepseeactusv3.local/?post_type=acf-field&p=286',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (287,1,'2020-03-18 23:25:42','2020-03-18 22:25:42','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Titre','titre','publish','closed','closed','','field_5e729fe642a67','','','2020-03-18 23:25:42','2020-03-18 22:25:42','',285,'http://pepseeactusv3.local/?post_type=acf-field&p=287',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (288,1,'2020-03-18 23:25:42','2020-03-18 22:25:42','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Download','download','publish','closed','closed','','field_5e729fe642a7e','','','2020-03-18 23:25:42','2020-03-18 22:25:42','',285,'http://pepseeactusv3.local/?post_type=acf-field&p=288',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (289,1,'2020-03-18 23:25:42','2020-03-18 22:25:42','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Soundcloud','soundcloud','publish','closed','closed','','field_5e729fe642aa0','','','2020-03-18 23:25:42','2020-03-18 22:25:42','',285,'http://pepseeactusv3.local/?post_type=acf-field&p=289',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (290,1,'2020-03-18 23:25:42','2020-03-18 22:25:42','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Youtube','youtube','publish','closed','closed','','field_5e729fe642aa7','','','2020-03-18 23:25:42','2020-03-18 22:25:42','',285,'http://pepseeactusv3.local/?post_type=acf-field&p=290',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (291,1,'2020-03-18 23:25:42','2020-03-18 22:25:42','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Spotify','spotify','publish','closed','closed','','field_5e729fe642aaf','','','2020-03-18 23:25:42','2020-03-18 22:25:42','',285,'http://pepseeactusv3.local/?post_type=acf-field&p=291',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (292,1,'2020-03-18 23:25:42','2020-03-18 22:25:42','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Deezer','deezer','publish','closed','closed','','field_5e729fe642ab6','','','2020-03-18 23:25:42','2020-03-18 22:25:42','',285,'http://pepseeactusv3.local/?post_type=acf-field&p=292',6,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (293,1,'2020-03-18 23:25:42','2020-03-18 22:25:42','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Apple Music','apple_music','publish','closed','closed','','field_5e729fe642ac6','','','2020-03-18 23:25:42','2020-03-18 22:25:42','',285,'http://pepseeactusv3.local/?post_type=acf-field&p=293',7,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (294,1,'2020-03-18 23:25:42','2020-03-18 22:25:42','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Google Play Music','google_play_music','publish','closed','closed','','field_5e729fe642ad3','','','2020-03-18 23:25:42','2020-03-18 22:25:42','',285,'http://pepseeactusv3.local/?post_type=acf-field&p=294',8,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (295,1,'2020-03-18 23:25:42','2020-03-18 22:25:42','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','Tidal','tidal','publish','closed','closed','','field_5e729fe642adb','','','2020-03-18 23:25:42','2020-03-18 22:25:42','',285,'http://pepseeactusv3.local/?post_type=acf-field&p=295',9,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (296,1,'2018-06-13 23:32:00','2018-06-13 21:32:00','<!-- wp:paragraph -->\n<p>Sur ce projet, <strong>JmaX</strong> nous prouve qu\'il a plusieurs cordes à son arc. <em>Pull Di Trigger</em> est un album 100% Dancehall, bien loin de ses succès habituel en slow Dancehall et Zouk.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" allow=\"autoplay\" src=\"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/457994664&amp;color=%23ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;show_teaser=true\"></iframe></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol><li><strong>Hustle</strong> Mafio House</li><li><strong>Bumboclaat</strong> DJ Dav</li><li><strong>Ayen Pa Ka Brennen</strong> Mafio House</li><li><strong>La Vérité</strong> Dav Beatz</li><li><strong>Dem Try</strong> Mafio House</li><li><strong>Fi Dem</strong> Mafio House</li><li><strong>Top Di Top</strong> Blaiz Fayah x Wallas</li><li><strong>Siddung</strong> D-Myan</li><li><strong>Passé En Lè</strong> DJ Skunk</li><li><strong>TJM</strong> Gyzmo</li><li><strong>Wine Up</strong> DJ Gil</li><li><strong>Assiz</strong> DJ Redfish</li></ol>\n<!-- /wp:list -->','JmaX - Pull Di Trigger','','publish','closed','closed','','jmax-pull-di-trigger','','','2020-03-25 00:41:54','2020-03-24 23:41:54','',0,'http://pepseeactusv3.local/?post_type=album&#038;p=296',0,'album','',0);
INSERT INTO `wp_posts` VALUES (297,1,'2020-03-18 23:56:34','2020-03-18 22:56:34','<iframe title=\"Spotify Embed: Darling (Acoustic)\" width=\"300\" height=\"380\" allowtransparency=\"true\" frameborder=\"0\" allow=\"encrypted-media\" src=\"https://open.spotify.com/embed/album/5ZNBB13oewZ9ykZ3F7L9rY?si=N8oxOkJMToCtEcHHGRDUTQ\"></iframe>','','','publish','closed','closed','','7c94fc6139cee3cb39cfd4621fd849ab','','','2020-03-18 23:56:34','2020-03-18 22:56:34','',0,'http://pepseeactusv3.local/7c94fc6139cee3cb39cfd4621fd849ab/',0,'oembed_cache','',0);
INSERT INTO `wp_posts` VALUES (299,1,'2020-03-19 22:51:35','2020-03-19 21:51:35','','Admiral T','','publish','closed','closed','','admiral-t','','','2020-03-22 19:29:37','2020-03-22 18:29:37','',0,'http://pepseeactusv3.local/?post_type=artist&#038;p=299',0,'artist','',0);
INSERT INTO `wp_posts` VALUES (300,1,'2020-03-19 22:51:20','2020-03-19 21:51:20','','admiral t','','inherit','open','closed','','admiral-t','','','2020-03-19 22:51:27','2020-03-19 21:51:27','',299,'http://pepseeactusv3.local/wp-content/uploads/2020/03/admiral-t.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (303,1,'2020-03-20 13:43:27','2020-03-20 12:43:27','','shannon best','','inherit','open','closed','','shannon-best-official-music-video','','','2020-03-20 13:44:00','2020-03-20 12:44:00','',142,'http://pepseeactusv3.local/wp-content/uploads/2019/07/SHANNON-BEST-OFFICIAL-MUSIC-VIDEO-.jpeg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (304,1,'2020-03-20 13:44:16','2020-03-20 12:44:16','','keros-n miss doliprane','','inherit','open','closed','','keros-n-miss-doliprane-2','','','2020-03-20 13:44:45','2020-03-20 12:44:45','',138,'http://pepseeactusv3.local/wp-content/uploads/2019/07/KEROS-N-MISS-DOLIPRANE.jpeg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (305,1,'2020-03-20 13:45:31','2020-03-20 12:45:31','','valley papa','','inherit','open','closed','','valley-papa-official-video-2019','','','2020-03-20 13:45:57','2020-03-20 12:45:57','',134,'http://pepseeactusv3.local/wp-content/uploads/2019/07/VaLLeY-PAPA-Official-Vidéo-2019-.jpeg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (306,1,'2020-03-21 22:07:35','2020-03-21 21:07:35','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=LvI9feKBlds\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=LvI9feKBlds\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:list -->\n<ul><li>Auteur : JmaX</li><li>Compositeurs : Mafio House , Alvin Brown</li><li>Réalisation : Jean-Francky GUERRIER (｡Nine Seven Pictures｡)</li><li>Mix : Dj GIL</li><li>Master : Mickael JOHAN</li><li>Production : Turn On AGENCY / PMC &amp; NIRVANA Music </li></ul>\n<!-- /wp:list -->','JmaX - Love','','inherit','closed','closed','','260-revision-v1','','','2020-03-21 22:07:35','2020-03-21 21:07:35','',260,'http://pepseeactusv3.local/260-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (307,1,'2020-03-21 22:16:07','2020-03-21 21:16:07','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=RAJClSlSpHE\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=RAJClSlSpHE\n</div></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:paragraph -->\n<p><strong>Yanii</strong> une jeune artiste de Saint-Martin débute sa carrière au côté de <strong>JmaX </strong>avec \"<em>Dans La Peau</em>\"</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>Auteurs: Yanii &amp; JmaX</li><li>Compositeurs : Oswald &amp; Dizzell Bueno</li><li>Réalisation : The Creators x Great Music Films</li><li>Mix : Dizzell Bueno (Great Music Studio)</li><li>Master : Mickael Johan (eMax Mastering)</li><li>Label: North island Records</li><li>Producteur : Cardo Red Eye Crew</li><li>Assistant Réal : Larry Desbonne</li><li>Maquilleuse: Sarolia Ada</li><li>Danceurs: Lincoln Arrindell &amp; Chelsea Henderson&nbsp;Special </li></ul>\n<!-- /wp:list -->','Yanii x JmaX - Dans La Peau','','inherit','closed','closed','','231-revision-v1','','','2020-03-21 22:16:07','2020-03-21 21:16:07','',231,'http://pepseeactusv3.local/231-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (309,1,'2020-03-22 19:26:51','2020-03-22 18:26:51','<!-- wp:paragraph -->\n<p>Admiral T annonce deux albums pour la rentrée 2019/2020. Avec deux clips \"<em>Boss Lady</em>\" feat <strong>Krys</strong> et \"<em>Baimbridge</em> Cho\" feat <strong>Were Vana</strong>. Les albums seront disponible qu\'en version digitale.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Caribbean Monster</h2>\n<!-- /wp:heading -->\n\n<!-- wp:image {\"id\":241,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/67112364_10156714299347087_6249821407371329536_n-1.jpg\" alt=\"admiral t caribbean monster\" class=\"wp-image-241\"/><figcaption>Admiral T - Caribbean Monster</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Un album pure Dancehall avec en 1er single \"<em>Boss Lady</em>\" avec <strong>Krys</strong>, un featuring que tous les amateurs de Dancehall attendait avec impatience.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=BZyQnxRX7xE\\u0026feature=youtu.be\\u0026fbclid=IwAR1w-9nT6v3aUr_IKOQ099Zj08G4NhEie5Bew-sJ7sRGIw6HQ1zRkxjeSTA\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=BZyQnxRX7xE&amp;feature=youtu.be&amp;fbclid=IwAR1w-9nT6v3aUr_IKOQ099Zj08G4NhEie5Bew-sJ7sRGIw6HQ1zRkxjeSTA\n</div><figcaption>Admiral T x Krys - Boss Lady</figcaption></figure>\n<!-- /wp:core-embed/youtube -->\n\n<!-- wp:heading -->\n<h2>Mozaïka</h2>\n<!-- /wp:heading -->\n\n<!-- wp:image {\"id\":242,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2020/03/67320275_10156714299277087_4653882298289094656_n.jpg\" alt=\"\" class=\"wp-image-242\"/><figcaption>Admiral T - Mozaïka</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Un album plutôt traditionnel tourné vers la culture du Ka. Son premier single \"<em>Baimbridge cho</em>\" avec <strong>Were Vana</strong> reprend le grand classique du maître Ka Guadeloupéen <strong>Guy Conquet</strong>&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=rKgvYzardtc\\u0026feature=youtu.be\\u0026fbclid=IwAR2775csKwp02hnUbIrMKGm19qLLDiOI9lr6VYPA8Q5t1RNkZgTpp7PpCpk\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=rKgvYzardtc&amp;feature=youtu.be&amp;fbclid=IwAR2775csKwp02hnUbIrMKGm19qLLDiOI9lr6VYPA8Q5t1RNkZgTpp7PpCpk\n</div><figcaption>Admiral T x Were Vana - Baimbridge Cho</figcaption></figure>\n<!-- /wp:core-embed/youtube -->','Admiral T annonce deux albums pour Septembre','','inherit','closed','closed','','120-revision-v1','','','2020-03-22 19:26:51','2020-03-22 18:26:51','',120,'http://pepseeactusv3.local/120-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (310,1,'2020-03-22 22:50:32','2020-03-22 21:50:32','','Clips','','publish','closed','closed','','clips','','','2020-03-22 22:50:33','2020-03-22 21:50:33','',0,'http://pepseeactusv3.local/?page_id=310',0,'page','',0);
INSERT INTO `wp_posts` VALUES (311,1,'2020-03-22 22:50:32','2020-03-22 21:50:32','','Clips','','inherit','closed','closed','','310-revision-v1','','','2020-03-22 22:50:32','2020-03-22 21:50:32','',310,'http://pepseeactusv3.local/310-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (313,1,'2020-03-26 00:00:38','2020-03-25 23:00:38','<!-- wp:paragraph -->\n<p><strong>Saïk</strong> a enfin dévoilé le jour de la sortie de son album <em>Magma</em> ainsi qu\'une nouvelle pochette. En effet, cela faisait presque deux ans que les fans de <strong>Saïk</strong> attendaient cet album qu\'il teasait sur ses réseaux.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":244,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://pepseeactusv3.local/wp-content/uploads/2019/07/saïk_magma.jpg\" alt=\"saik magma\" class=\"wp-image-244\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Nous avons enfin la date de sortie, ce sera pour le 30 Aout 2019.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=OR1SsoxcuLg\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=OR1SsoxcuLg\n</div><figcaption>Saïk - Red Bull</figcaption></figure>\n<!-- /wp:core-embed/youtube -->','La date de sortie de Magma enfin révélée!','','inherit','closed','closed','','126-revision-v1','','','2020-03-26 00:00:38','2020-03-25 23:00:38','',126,'http://pepseeactusv3.local/126-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (314,1,'2020-03-29 17:30:47','2020-03-29 15:30:47','<!-- wp:paragraph -->\n<p><strong>JmaX</strong> est né dans les Yvelines d\'une mère&nbsp;martiniquaise&nbsp;et d\'un père&nbsp;guadeloupéen. Ses parents reviennent aux&nbsp;Antilles&nbsp;en&nbsp;Martinique&nbsp;après sa naissance. Neveu de <strong>Kolo Barst</strong> mais surtout satisfait de ses origines, il découvre l\'univers du&nbsp;Reggae-Dancehall&nbsp;grâce à son grand frère <strong>DJ Pepsee</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mais c\'est à partir de 16 ans qu\'il se met à écrire ses premiers lyrics et fait des freestyles tous les week-end avec ses amis <strong>SlaX</strong> et <strong>Rochman</strong> d\'où ils fondent le groupe&nbsp;<em>Liberty Crew</em>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>C\'est en&nbsp;2011&nbsp;qu\'il se fait connaître avec son single&nbsp;\"<em>Djooky Dem</em>\"&nbsp;sur le EDF Riddim de <strong>DJ V-Trine</strong> ainsi que le single&nbsp;<em>Beau Parleur</em>&nbsp;sur le SME Riddim de <strong>Donshorty</strong>. En juin&nbsp;2012, il sort sa première mixtape&nbsp;<em>Xplosion</em>&nbsp;qui cartonne en Martinique avec des sons tels que&nbsp;\"<em>Djooky Dem</em>\",&nbsp;\"<em>I Salé</em>\"&nbsp;et&nbsp;\"<em>Beau parleur</em>\". Par la suite, il fera la couverture du premier numéro du magazine Raggadaggazine. En&nbsp;2013, il revient avec le single&nbsp;\"<em>Pren\'y Cool</em>\". En&nbsp;2014, il sort son célèbre titre&nbsp;\"<em>Fanatique Girl</em>\"&nbsp;produit par <strong>Radix Corporation</strong> et dont le clip est réalisé par <strong>G-Islands</strong>. Son single&nbsp;\"<em>Fanatique Girl</em>\"&nbsp;devient son premier gros succès que le label Chabine Prod a décidé de faire un remix zouk, le&nbsp;\"<em>Fanatique Zouk Remix</em>\"&nbsp;édité sur la compilation&nbsp;<em>Les Tubes du Zouk 2014</em>. Aujourd\'hui, ce titre a dépassé les 1,1 million de vues sur&nbsp;YouTube. Ensuite, il fait un feat avec <strong>MrSM</strong> et <strong>JT</strong>, deux chanteurs du label <strong>TruchaGang</strong>, sur le single&nbsp;\"<em>6H30</em>\". On le découvre aussi en freestyle avec <strong>MrSM</strong> dans les studios de <strong>Rise Up Sound</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2015, il sort les sons&nbsp;\"<em>Pretty Gyal</em>\",&nbsp;\"<em>Es Nou Pa Té Two Jenn</em>\",&nbsp;\"<em>Ladjé Kow</em>\",&nbsp;\"<em>An Pa Tou Sèl</em>\"&nbsp;et&nbsp;\"<em>Je t\'assure</em>\".</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2016, il sort sa seconde mixtape,&nbsp;<em>Reloaded</em>, dans laquelle on trouve le tube&nbsp;\"<em>Laisse-moi t\'aimer</em>\"&nbsp;en featuring avec <strong>Stacy</strong>. Ensuite, il sort le gros tube&nbsp;\"<em>Kay La</em>\"&nbsp;puis un son doux,&nbsp;\"<em>Différents Styles</em>\". En&nbsp;2017, il sort les titres&nbsp;\"<em>Milli</em>\",&nbsp;\"<em>Thug épi Gangstè</em>\",&nbsp;\"<em>Atirans</em>\",&nbsp;\"<em>Big Ben</em>\"&nbsp;et&nbsp;\"<em>Maman</em>\".</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2018, il sort le clip de son single&nbsp;\"<em>Dépi sé Mizik</em>\". Il est invité par la chanteuse de Zouk&nbsp;<strong>Nesly</strong>&nbsp;sur son tube&nbsp;\"<em>Baby Doll</em>\". Après, il sort son album&nbsp;<em>Pull Di Trigger</em>&nbsp;dans lequel on trouve des sons comme&nbsp;\"<em>Wine up</em>\",&nbsp;\"<em>Passé en lè</em>\",&nbsp;\"<em>Fi dem</em>\",&nbsp;\"<em>Hustle</em>\"&nbsp;et j\'en passe.</p>\n<!-- /wp:paragraph -->','JmaX','','inherit','closed','closed','','154-revision-v1','','','2020-03-29 17:30:47','2020-03-29 15:30:47','',154,'http://pepseeactusv3.local/154-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (315,1,'2020-03-29 17:35:42','2020-03-29 15:35:42','<!-- wp:paragraph -->\n<p><strong>JmaX</strong> est né dans les Yvelines d\'une mère&nbsp;martiniquaise&nbsp;et d\'un père&nbsp;guadeloupéen. Ses parents reviennent aux&nbsp;Antilles&nbsp;en&nbsp;Martinique&nbsp;après sa naissance. Neveu de <strong>Kolo Barst</strong> mais surtout satisfait de ses origines, il découvre l\'univers du&nbsp;Reggae-Dancehall&nbsp;grâce à son grand frère <strong>DJ Pepsee</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mais c\'est à partir de 16 ans qu\'il se met à écrire ses premiers lyrics et fait des freestyles tous les week-end avec ses amis <strong>SlaX</strong> et <strong>Rochman</strong> d\'où ils fondent le groupe&nbsp;<em>Liberty Crew</em>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>C\'est en&nbsp;2011&nbsp;qu\'il se fait connaître avec son single&nbsp;\"<em>Djooky Dem</em>\"&nbsp;sur le EDF Riddim de <strong>DJ V-Trine</strong> ainsi que le single&nbsp;<em>Beau Parleur</em>&nbsp;sur le SME Riddim de <strong>Donshorty</strong>. En juin&nbsp;2012, il sort sa première mixtape&nbsp;<em>Xplosion</em>&nbsp;qui cartonne en Martinique avec des sons tels que&nbsp;\"<em>Djooky Dem</em>\",&nbsp;\"<em>I Salé</em>\"&nbsp;et&nbsp;\"<em>Beau parleur</em>\". Par la suite, il fera la couverture du premier numéro du magazine Raggadaggazine. En&nbsp;2013, il revient avec le single&nbsp;\"<em>Pren\'y Cool</em>\". En&nbsp;2014, il sort son célèbre titre&nbsp;\"<em>Fanatique Girl</em>\"&nbsp;produit par <strong>Radix Corporation</strong> et dont le clip est réalisé par <strong>G-Islands</strong>. Son single&nbsp;\"<em>Fanatique Girl</em>\"&nbsp;devient son premier gros succès que le label Chabine Prod a décidé de faire un remix zouk, le&nbsp;\"<em>Fanatique Zouk Remix</em>\"&nbsp;édité sur la compilation&nbsp;<em>Les Tubes du Zouk 2014</em>. Aujourd\'hui, ce titre a dépassé les 1,1 million de vues sur&nbsp;YouTube. Ensuite, il fait un feat avec <strong>MrSM</strong> et <strong>JT</strong>, deux chanteurs du label <strong>TruchaGang</strong>, sur le single&nbsp;\"<em>6H30</em>\". On le découvre aussi en freestyle avec <strong>MrSM</strong> dans les studios de <strong>Rise Up Sound</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2015, il sort les sons&nbsp;\"<em>Pretty Gyal</em>\",&nbsp;\"<em>Es Nou Pa Té Two Jenn</em>\",&nbsp;\"<em>Ladjé Kow</em>\",&nbsp;\"<em>An Pa Tou Sèl</em>\"&nbsp;et&nbsp;\"<em>Je t\'assure</em>\".</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2016, il sort sa seconde mixtape,&nbsp;<em>Reloaded</em>, dans laquelle on trouve le tube&nbsp;\"<em>Laisse-moi t\'aimer</em>\"&nbsp;en featuring avec <strong>Stacy</strong>. Ensuite, il sort le gros tube&nbsp;\"<em>Kay La</em>\"&nbsp;puis un son doux,&nbsp;\"<em>Différents Styles</em>\". En&nbsp;2017, il sort les titres&nbsp;\"<em>Milli</em>\",&nbsp;\"<em>Thug épi Gangstè</em>\",&nbsp;\"<em>Atirans</em>\",&nbsp;\"<em>Big Ben</em>\"&nbsp;et&nbsp;\"<em>Maman</em>\".</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2018, il sort le clip de son single&nbsp;\"<em>Dépi sé Mizik</em>\". Il est invité par la chanteuse de Zouk&nbsp;<strong>Nesly</strong>&nbsp;sur son tube&nbsp;\"<em>Baby Doll</em>\". Après, il sort son album&nbsp;<em>Pull Di Trigger</em>&nbsp;dans lequel on trouve des sons comme&nbsp;\"<em>Wine up</em>\",&nbsp;\"<em>Passé en lè</em>\",&nbsp;\"<em>Fi dem</em>\",&nbsp;\"<em>Hustle</em>\"&nbsp;et j\'en passe.</p>\n<!-- /wp:paragraph -->','JmaX','','inherit','closed','closed','','154-revision-v1','','','2020-03-29 17:35:42','2020-03-29 15:35:42','',154,'http://pepseeactusv3.local/154-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (319,1,'2020-04-27 16:39:31','2020-04-27 14:39:31','','Scary Mix - Thug Mix','','publish','open','closed','','scary-mix-thug-mix','','','2020-04-27 16:39:32','2020-04-27 14:39:32','',0,'http://pepseeactusv3.local/?post_type=album&#038;p=319',0,'album','',0);
INSERT INTO `wp_posts` VALUES (320,1,'2020-04-27 16:39:24','2020-04-27 14:39:24','','00-thug_mix_(scary_mix)-2004-ng','','inherit','open','closed','','00-thug_mix_scary_mix-2004-ng','','','2020-04-27 16:39:24','2020-04-27 14:39:24','',319,'http://pepseeactusv3.local/wp-content/uploads/2020/04/00-thug_mix_scary_mix-2004-ng.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (321,1,'2020-04-27 16:39:31','2020-04-27 14:39:31','','Scary Mix - Thug Mix','','inherit','closed','closed','','319-revision-v1','','','2020-04-27 16:39:31','2020-04-27 14:39:31','',319,'http://pepseeactusv3.local/319-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (322,1,'2020-04-27 16:39:32','2020-04-27 14:39:32','','Scary Mix - Thug Mix','','inherit','closed','closed','','319-revision-v1','','','2020-04-27 16:39:32','2020-04-27 14:39:32','',319,'http://pepseeactusv3.local/319-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (323,1,'1997-04-27 16:39:00','1997-04-27 14:39:00','','Admiral T - Rapide','','publish','open','closed','','admiral-t-rapide','','','2020-05-01 22:35:25','2020-05-01 20:35:25','',0,'http://pepseeactusv3.local/?post_type=music&#038;p=323',0,'music','',0);
INSERT INTO `wp_posts` VALUES (324,1,'2020-04-27 16:40:45','2020-04-27 14:40:45','','Admiral T - Rapide','','inherit','closed','closed','','323-revision-v1','','','2020-04-27 16:40:45','2020-04-27 14:40:45','',323,'http://pepseeactusv3.local/323-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (325,1,'2020-04-27 16:40:45','2020-04-27 14:40:45','','Admiral T - Rapide','','inherit','closed','closed','','323-revision-v1','','','2020-04-27 16:40:45','2020-04-27 14:40:45','',323,'http://pepseeactusv3.local/323-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (326,1,'2020-04-27 16:40:57','2020-04-27 14:40:57','','Admiral T - Rapide','','inherit','closed','closed','','323-revision-v1','','','2020-04-27 16:40:57','2020-04-27 14:40:57','',323,'http://pepseeactusv3.local/323-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (327,1,'2020-04-27 16:42:00','2020-04-27 14:42:00','','81fMwakZw4L._SS500_','','inherit','open','closed','','81fmwakzw4l-_ss500_','','','2020-04-27 16:42:00','2020-04-27 14:42:00','',323,'http://pepseeactusv3.local/wp-content/uploads/1997/04/81fMwakZw4L._SS500_.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (328,1,'2020-04-27 16:42:07','2020-04-27 14:42:07','','Admiral T - Rapide','','inherit','closed','closed','','323-revision-v1','','','2020-04-27 16:42:07','2020-04-27 14:42:07','',323,'http://pepseeactusv3.local/323-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (329,1,'2020-04-27 16:43:48','2020-04-27 14:43:48','','Admiral T - Rapide','','inherit','closed','closed','','323-revision-v1','','','2020-04-27 16:43:48','2020-04-27 14:43:48','',323,'http://pepseeactusv3.local/323-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (330,1,'2020-04-29 23:20:38','2020-04-29 21:20:38','a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"banner\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";a:7:{i:0;s:9:\"permalink\";i:1;s:7:\"excerpt\";i:2;s:10:\"discussion\";i:3;s:8:\"comments\";i:4;s:10:\"categories\";i:5;s:4:\"tags\";i:6;s:15:\"send-trackbacks\";}s:11:\"description\";s:0:\"\";}','Banner','banner','publish','closed','closed','','group_5ea9eda022a1c','','','2020-04-30 07:44:05','2020-04-30 05:44:05','',0,'http://pepseeactusv3.local/?post_type=acf-field-group&#038;p=330',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (331,1,'2020-04-29 23:20:38','2020-04-29 21:20:38','a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:6:\"banner\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','image banner','image_banner','publish','closed','closed','','field_5ea9ee8c03a3e','','','2020-04-30 07:38:22','2020-04-30 05:38:22','',330,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=331',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (332,1,'2020-04-29 23:20:38','2020-04-29 21:20:38','a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:64:\"Mettre le lien vers la publication (album ou single par exemple)\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}','link','link','publish','closed','closed','','field_5ea9ef0a03a3f','','','2020-04-29 23:20:38','2020-04-29 21:20:38','',330,'http://pepseeactusv3.local/?post_type=acf-field&p=332',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (336,1,'2020-04-29 23:27:06','2020-04-29 21:27:06','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Artiste','artiste','publish','closed','closed','','field_5ea9f0fbe925c','','','2020-04-29 23:27:06','2020-04-29 21:27:06','',330,'http://pepseeactusv3.local/?post_type=acf-field&p=336',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (337,1,'2020-04-29 23:27:06','2020-04-29 21:27:06','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Album','album','publish','closed','closed','','field_5ea9f113e925d','','','2020-04-29 23:27:06','2020-04-29 21:27:06','',330,'http://pepseeactusv3.local/?post_type=acf-field&p=337',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (338,1,'2020-04-29 23:29:54','2020-04-29 21:29:54','Le nouvel album de <strong>Kevni</strong> \"<em>Top Boy</em>\" dans les bacs à partir du 27 Avril','Kevni - Top Boy','','publish','closed','closed','','kevni-top-boy','','','2020-09-08 23:53:15','2020-09-08 21:53:15','',0,'http://pepseeactusv3.local/?post_type=banner&#038;p=338',0,'banner','',0);
INSERT INTO `wp_posts` VALUES (340,1,'2020-04-29 23:29:18','2020-04-29 21:29:18','','kevni_top_boy_cd_cover','','inherit','open','closed','','kevni_top_boy_cd_cover','','','2020-04-29 23:29:18','2020-04-29 21:29:18','',338,'http://pepseeactusv3.local/wp-content/uploads/2020/04/kevni_top_boy_cd_cover.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (341,1,'2020-04-29 23:29:54','2020-04-29 21:29:54','Le nouvel album de Kevni \"Top Boy\" dans les bacs à partir du 27 Avril','Kevni - Top Boy','','inherit','closed','closed','','338-revision-v1','','','2020-04-29 23:29:54','2020-04-29 21:29:54','',338,'http://pepseeactusv3.local/338-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (344,1,'2020-04-29 23:59:55','2020-04-29 21:59:55','Le nouvel album de Kevni \"Top Boy\" dans les bacs à partir du 27 Avril','Kevni - Top Boy','','inherit','closed','closed','','338-revision-v1','','','2020-04-29 23:59:55','2020-04-29 21:59:55','',338,'http://pepseeactusv3.local/338-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (345,1,'2020-04-30 00:03:36','2020-04-29 22:03:36','','banner_kevni_top_boy','','inherit','open','closed','','banner_kevni_top_boy','','','2020-04-30 00:03:36','2020-04-29 22:03:36','',338,'http://pepseeactusv3.local/wp-content/uploads/2020/04/banner_kevni_top_boy.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (346,1,'2020-04-30 00:03:42','2020-04-29 22:03:42','Le nouvel album de Kevni \"Top Boy\" dans les bacs à partir du 27 Avril','Kevni - Top Boy','','inherit','closed','closed','','338-revision-v1','','','2020-04-30 00:03:42','2020-04-29 22:03:42','',338,'http://pepseeactusv3.local/338-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (347,1,'2020-04-30 07:28:40','2020-04-30 05:28:40','Le nouvel album de <strong>Kevni</strong> \"<em>Top Boy</em>\" dans les bacs à partir du 27 Avril','Kevni - Top Boy','','inherit','closed','closed','','338-revision-v1','','','2020-04-30 07:28:40','2020-04-30 05:28:40','',338,'http://pepseeactusv3.local/338-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (348,1,'2020-04-30 07:28:42','2020-04-30 05:28:42','Le nouvel album de <strong>Kevni</strong> \"<em>Top Boy</em>\" dans les bacs à partir du 27 Avril','Kevni - Top Boy','','inherit','closed','closed','','338-revision-v1','','','2020-04-30 07:28:42','2020-04-30 05:28:42','',338,'http://pepseeactusv3.local/338-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (349,1,'2020-04-30 07:38:22','2020-04-30 05:38:22','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:11:\"x8BYjOoc8ck\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Youtube ID','youtube_id','publish','closed','closed','','field_5eaa641666926','','','2020-04-30 07:44:05','2020-04-30 05:44:05','',330,'http://pepseeactusv3.local/?post_type=acf-field&#038;p=349',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (350,1,'2020-04-30 07:39:09','2020-04-30 05:39:09','Le nouvel album de <strong>Kevni</strong> \"<em>Top Boy</em>\" dans les bacs à partir du 27 Avril','Kevni - Top Boy','','inherit','closed','closed','','338-revision-v1','','','2020-04-30 07:39:09','2020-04-30 05:39:09','',338,'http://pepseeactusv3.local/338-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (351,1,'2020-04-30 07:45:09','2020-04-30 05:45:09','Le nouvel album de <strong>Kevni</strong> \"<em>Top Boy</em>\" dans les bacs à partir du 27 Avril','Kevni - Top Boy','','inherit','closed','closed','','338-revision-v1','','','2020-04-30 07:45:09','2020-04-30 05:45:09','',338,'http://pepseeactusv3.local/338-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (352,1,'2020-04-30 08:05:25','2020-04-30 06:05:25','Le nouvel album de <strong>Kevni</strong> \"<em>Top Boy</em>\" dans les bacs à partir du 27 Avril','Kevni - Top Boy','','inherit','closed','closed','','338-revision-v1','','','2020-04-30 08:05:25','2020-04-30 06:05:25','',338,'http://pepseeactusv3.local/338-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (353,1,'2020-04-30 21:16:55','2020-04-30 19:16:55','','jmax_banner','','inherit','open','closed','','jmax_banner','','','2020-04-30 21:17:07','2020-04-30 19:17:07','',154,'http://pepseeactusv3.local/wp-content/uploads/2019/07/jmax_banner.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (354,1,'2020-04-30 21:17:10','2020-04-30 19:17:10','<!-- wp:paragraph -->\n<p><strong>JmaX</strong> est né dans les Yvelines d\'une mère&nbsp;martiniquaise&nbsp;et d\'un père&nbsp;guadeloupéen. Ses parents reviennent aux&nbsp;Antilles&nbsp;en&nbsp;Martinique&nbsp;après sa naissance. Neveu de <strong>Kolo Barst</strong> mais surtout satisfait de ses origines, il découvre l\'univers du&nbsp;Reggae-Dancehall&nbsp;grâce à son grand frère <strong>DJ Pepsee</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Mais c\'est à partir de 16 ans qu\'il se met à écrire ses premiers lyrics et fait des freestyles tous les week-end avec ses amis <strong>SlaX</strong> et <strong>Rochman</strong> d\'où ils fondent le groupe&nbsp;<em>Liberty Crew</em>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>C\'est en&nbsp;2011&nbsp;qu\'il se fait connaître avec son single&nbsp;\"<em>Djooky Dem</em>\"&nbsp;sur le EDF Riddim de <strong>DJ V-Trine</strong> ainsi que le single&nbsp;<em>Beau Parleur</em>&nbsp;sur le SME Riddim de <strong>Donshorty</strong>. En juin&nbsp;2012, il sort sa première mixtape&nbsp;<em>Xplosion</em>&nbsp;qui cartonne en Martinique avec des sons tels que&nbsp;\"<em>Djooky Dem</em>\",&nbsp;\"<em>I Salé</em>\"&nbsp;et&nbsp;\"<em>Beau parleur</em>\". Par la suite, il fera la couverture du premier numéro du magazine Raggadaggazine. En&nbsp;2013, il revient avec le single&nbsp;\"<em>Pren\'y Cool</em>\". En&nbsp;2014, il sort son célèbre titre&nbsp;\"<em>Fanatique Girl</em>\"&nbsp;produit par <strong>Radix Corporation</strong> et dont le clip est réalisé par <strong>G-Islands</strong>. Son single&nbsp;\"<em>Fanatique Girl</em>\"&nbsp;devient son premier gros succès que le label Chabine Prod a décidé de faire un remix zouk, le&nbsp;\"<em>Fanatique Zouk Remix</em>\"&nbsp;édité sur la compilation&nbsp;<em>Les Tubes du Zouk 2014</em>. Aujourd\'hui, ce titre a dépassé les 1,1 million de vues sur&nbsp;YouTube. Ensuite, il fait un feat avec <strong>MrSM</strong> et <strong>JT</strong>, deux chanteurs du label <strong>TruchaGang</strong>, sur le single&nbsp;\"<em>6H30</em>\". On le découvre aussi en freestyle avec <strong>MrSM</strong> dans les studios de <strong>Rise Up Sound</strong>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2015, il sort les sons&nbsp;\"<em>Pretty Gyal</em>\",&nbsp;\"<em>Es Nou Pa Té Two Jenn</em>\",&nbsp;\"<em>Ladjé Kow</em>\",&nbsp;\"<em>An Pa Tou Sèl</em>\"&nbsp;et&nbsp;\"<em>Je t\'assure</em>\".</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2016, il sort sa seconde mixtape,&nbsp;<em>Reloaded</em>, dans laquelle on trouve le tube&nbsp;\"<em>Laisse-moi t\'aimer</em>\"&nbsp;en featuring avec <strong>Stacy</strong>. Ensuite, il sort le gros tube&nbsp;\"<em>Kay La</em>\"&nbsp;puis un son doux,&nbsp;\"<em>Différents Styles</em>\". En&nbsp;2017, il sort les titres&nbsp;\"<em>Milli</em>\",&nbsp;\"<em>Thug épi Gangstè</em>\",&nbsp;\"<em>Atirans</em>\",&nbsp;\"<em>Big Ben</em>\"&nbsp;et&nbsp;\"<em>Maman</em>\".</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En&nbsp;2018, il sort le clip de son single&nbsp;\"<em>Dépi sé Mizik</em>\". Il est invité par la chanteuse de Zouk&nbsp;<strong>Nesly</strong>&nbsp;sur son tube&nbsp;\"<em>Baby Doll</em>\". Après, il sort son album&nbsp;<em>Pull Di Trigger</em>&nbsp;dans lequel on trouve des sons comme&nbsp;\"<em>Wine up</em>\",&nbsp;\"<em>Passé en lè</em>\",&nbsp;\"<em>Fi dem</em>\",&nbsp;\"<em>Hustle</em>\"&nbsp;et j\'en passe.</p>\n<!-- /wp:paragraph -->','JmaX','','inherit','closed','closed','','154-revision-v1','','','2020-04-30 21:17:10','2020-04-30 19:17:10','',154,'http://pepseeactusv3.local/154-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (355,1,'2020-05-01 22:35:25','2020-05-01 20:35:25','','Admiral T - Rapide','','inherit','closed','closed','','323-revision-v1','','','2020-05-01 22:35:25','2020-05-01 20:35:25','',323,'http://pepseeactusv3.local/323-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (356,1,'2020-05-02 20:30:11','2020-05-02 18:30:11','<!-- wp:core-embed/youtube {\"url\":\"https://www.youtube.com/watch?v=AKl3PerNl34\\u0026t=0s\",\"type\":\"video\",\"providerNameSlug\":\"youtube\",\"className\":\"wp-embed-aspect-16-9 wp-has-aspect-ratio\"} -->\n<figure class=\"wp-block-embed-youtube wp-block-embed is-type-video is-provider-youtube wp-embed-aspect-16-9 wp-has-aspect-ratio\"><div class=\"wp-block-embed__wrapper\">\nhttps://www.youtube.com/watch?v=AKl3PerNl34&amp;t=0s\n</div></figure>\n<!-- /wp:core-embed/youtube -->','Keros-n - Miss Doliprane','','inherit','closed','closed','','138-revision-v1','','','2020-05-02 20:30:11','2020-05-02 18:30:11','',138,'http://pepseeactusv3.local/138-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (357,1,'2020-05-03 22:12:07','2020-05-03 20:12:07','<!-- wp:paragraph -->\n<p><strong>JmaX</strong> revient avec un nouveau titre acoustic \"<em>Darling</em>\"</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<iframe allow=\"autoplay *; encrypted-media *;\" frameborder=\"0\" height=\"400\" style=\"width:100%;overflow:hidden;background:transparent;\" sandbox=\"allow-forms allow-popups allow-same-origin allow-scripts allow-storage-access-by-user-activation allow-top-navigation-by-user-activation\" src=\"https://embed.music.apple.com/fr/album/darling-acoustic-single/1501740115\"></iframe>\n<!-- /wp:html -->','JmaX - Darling','','inherit','closed','closed','','216-revision-v1','','','2020-05-03 22:12:07','2020-05-03 20:12:07','',216,'http://pepseeactusv3.local/216-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (358,1,'2020-05-03 22:12:07','2020-05-03 20:12:07','<!-- wp:paragraph -->\n<p><strong>JmaX</strong> revient avec un nouveau titre acoustic \"<em>Darling</em>\"</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<iframe allow=\"autoplay *; encrypted-media *;\" frameborder=\"0\" height=\"400\" style=\"width:100%;overflow:hidden;background:transparent;\" sandbox=\"allow-forms allow-popups allow-same-origin allow-scripts allow-storage-access-by-user-activation allow-top-navigation-by-user-activation\" src=\"https://embed.music.apple.com/fr/album/darling-acoustic-single/1501740115\"></iframe>\n<!-- /wp:html -->','JmaX - Darling','','inherit','closed','closed','','216-revision-v1','','','2020-05-03 22:12:07','2020-05-03 20:12:07','',216,'http://pepseeactusv3.local/216-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (359,1,'2020-05-07 13:44:00','2020-05-07 11:44:00','','nouveau son','','publish','open','closed','','nouveau-son','','','2020-05-18 13:59:23','2020-05-18 11:59:23','',0,'http://pepseeactusv3.local/?post_type=music&#038;p=359',0,'music','',0);
INSERT INTO `wp_posts` VALUES (360,1,'2020-05-18 13:44:20','2020-05-18 11:44:20','','nouveau son','','inherit','closed','closed','','359-revision-v1','','','2020-05-18 13:44:20','2020-05-18 11:44:20','',359,'http://pepseeactusv3.local/359-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (361,1,'2020-05-18 13:44:21','2020-05-18 11:44:21','','nouveau son','','inherit','closed','closed','','359-revision-v1','','','2020-05-18 13:44:21','2020-05-18 11:44:21','',359,'http://pepseeactusv3.local/359-revision-v1/',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (362,1,'2020-05-18 13:59:23','2020-05-18 11:59:23','','nouveau son','','inherit','closed','closed','','359-revision-v1','','','2020-05-18 13:59:23','2020-05-18 11:59:23','',359,'http://pepseeactusv3.local/359-revision-v1/',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (41,2,0);
INSERT INTO `wp_term_relationships` VALUES (43,2,0);
INSERT INTO `wp_term_relationships` VALUES (47,3,0);
INSERT INTO `wp_term_relationships` VALUES (50,4,0);
INSERT INTO `wp_term_relationships` VALUES (51,4,0);
INSERT INTO `wp_term_relationships` VALUES (52,4,0);
INSERT INTO `wp_term_relationships` VALUES (55,5,0);
INSERT INTO `wp_term_relationships` VALUES (120,5,0);
INSERT INTO `wp_term_relationships` VALUES (120,6,0);
INSERT INTO `wp_term_relationships` VALUES (120,7,0);
INSERT INTO `wp_term_relationships` VALUES (120,8,0);
INSERT INTO `wp_term_relationships` VALUES (120,9,0);
INSERT INTO `wp_term_relationships` VALUES (120,10,0);
INSERT INTO `wp_term_relationships` VALUES (120,11,0);
INSERT INTO `wp_term_relationships` VALUES (120,12,0);
INSERT INTO `wp_term_relationships` VALUES (126,5,0);
INSERT INTO `wp_term_relationships` VALUES (126,13,0);
INSERT INTO `wp_term_relationships` VALUES (126,14,0);
INSERT INTO `wp_term_relationships` VALUES (134,15,0);
INSERT INTO `wp_term_relationships` VALUES (134,16,0);
INSERT INTO `wp_term_relationships` VALUES (134,17,0);
INSERT INTO `wp_term_relationships` VALUES (134,18,0);
INSERT INTO `wp_term_relationships` VALUES (138,15,0);
INSERT INTO `wp_term_relationships` VALUES (138,18,0);
INSERT INTO `wp_term_relationships` VALUES (138,19,0);
INSERT INTO `wp_term_relationships` VALUES (138,20,0);
INSERT INTO `wp_term_relationships` VALUES (142,15,0);
INSERT INTO `wp_term_relationships` VALUES (142,18,0);
INSERT INTO `wp_term_relationships` VALUES (142,21,0);
INSERT INTO `wp_term_relationships` VALUES (142,22,0);
INSERT INTO `wp_term_relationships` VALUES (142,23,0);
INSERT INTO `wp_term_relationships` VALUES (231,15,0);
INSERT INTO `wp_term_relationships` VALUES (231,18,0);
INSERT INTO `wp_term_relationships` VALUES (260,15,0);
INSERT INTO `wp_term_relationships` VALUES (260,18,0);
INSERT INTO `wp_term_relationships` VALUES (265,15,0);
INSERT INTO `wp_term_relationships` VALUES (279,5,0);
INSERT INTO `wp_term_relationships` VALUES (285,5,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (2,2,'nav_menu','',0,2);
INSERT INTO `wp_term_taxonomy` VALUES (3,3,'nav_menu','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (4,4,'nav_menu','',0,3);
INSERT INTO `wp_term_taxonomy` VALUES (5,5,'category','Dancehall is my everything',0,3);
INSERT INTO `wp_term_taxonomy` VALUES (6,6,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (7,7,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (8,8,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (9,9,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (10,10,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (11,11,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (12,12,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (13,13,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (14,14,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (15,15,'category','',0,6);
INSERT INTO `wp_term_taxonomy` VALUES (16,16,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (17,17,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (18,18,'post_format','',0,5);
INSERT INTO `wp_term_taxonomy` VALUES (19,19,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (20,20,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (21,21,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (22,22,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (23,23,'post_tag','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (31,31,'post_tag','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (32,32,'post_tag','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (33,33,'post_tag','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (34,34,'post_tag','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (35,35,'post_tag','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (36,36,'post_tag','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (37,37,'post_tag','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (38,38,'post_tag','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (39,39,'post_tag','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (40,40,'post_tag','',0,0);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (2,'Main Menu','main-menu',0);
INSERT INTO `wp_terms` VALUES (3,'Footer Menu 1','footer-menu-1',0);
INSERT INTO `wp_terms` VALUES (4,'Footer Menu 2','footer-menu-2',0);
INSERT INTO `wp_terms` VALUES (5,'Actus','actus',0);
INSERT INTO `wp_terms` VALUES (6,'Admiral T','admiral-t',0);
INSERT INTO `wp_terms` VALUES (7,'Krys','krys',0);
INSERT INTO `wp_terms` VALUES (8,'Were Vana','were-vana',0);
INSERT INTO `wp_terms` VALUES (9,'Caribbean Monster','caribbean-monster',0);
INSERT INTO `wp_terms` VALUES (10,'Mozaïka','mozaika',0);
INSERT INTO `wp_terms` VALUES (11,'Baimbridge Cho','baimbridge-cho',0);
INSERT INTO `wp_terms` VALUES (12,'Boss Lady','boss-lady',0);
INSERT INTO `wp_terms` VALUES (13,'Saïk','saik',0);
INSERT INTO `wp_terms` VALUES (14,'Magma','magma',0);
INSERT INTO `wp_terms` VALUES (15,'Clips','clips',0);
INSERT INTO `wp_terms` VALUES (16,'Valley','valley',0);
INSERT INTO `wp_terms` VALUES (17,'papa','papa',0);
INSERT INTO `wp_terms` VALUES (18,'post-format-video','post-format-video',0);
INSERT INTO `wp_terms` VALUES (19,'Keros-n','keros-n',0);
INSERT INTO `wp_terms` VALUES (20,'Miss Doliprane','miss-doliprane',0);
INSERT INTO `wp_terms` VALUES (21,'Shannon','shannon',0);
INSERT INTO `wp_terms` VALUES (22,'Best','best',0);
INSERT INTO `wp_terms` VALUES (23,'Sorrow','sorrow',0);
INSERT INTO `wp_terms` VALUES (31,'jmax','jmax',0);
INSERT INTO `wp_terms` VALUES (32,'pull di trigger','pull-di-trigger',0);
INSERT INTO `wp_terms` VALUES (33,'mafio house','mafio-house',0);
INSERT INTO `wp_terms` VALUES (34,'dj dav','dj-dav',0);
INSERT INTO `wp_terms` VALUES (35,'dj skunk','dj-skunk',0);
INSERT INTO `wp_terms` VALUES (36,'dj gil','dj-gil',0);
INSERT INTO `wp_terms` VALUES (37,'dj redfish','dj-redfish',0);
INSERT INTO `wp_terms` VALUES (38,'Yanii','yanii',0);
INSERT INTO `wp_terms` VALUES (39,'jma','jma',0);
INSERT INTO `wp_terms` VALUES (40,'dans la peau','dans-la-peau',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','Le Peps');
INSERT INTO `wp_usermeta` VALUES (2,1,'first_name','');
INSERT INTO `wp_usermeta` VALUES (3,1,'last_name','');
INSERT INTO `wp_usermeta` VALUES (4,1,'description','Un chic type');
INSERT INTO `wp_usermeta` VALUES (5,1,'rich_editing','true');
INSERT INTO `wp_usermeta` VALUES (6,1,'syntax_highlighting','true');
INSERT INTO `wp_usermeta` VALUES (7,1,'comment_shortcuts','false');
INSERT INTO `wp_usermeta` VALUES (8,1,'admin_color','fresh');
INSERT INTO `wp_usermeta` VALUES (9,1,'use_ssl','0');
INSERT INTO `wp_usermeta` VALUES (10,1,'show_admin_bar_front','true');
INSERT INTO `wp_usermeta` VALUES (11,1,'locale','');
INSERT INTO `wp_usermeta` VALUES (12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `wp_usermeta` VALUES (13,1,'wp_user_level','10');
INSERT INTO `wp_usermeta` VALUES (14,1,'dismissed_wp_pointers','wp496_privacy,theme_editor_notice,custom_admin_pointers13_1_new_items,plugin_editor_notice,fvp-post-box');
INSERT INTO `wp_usermeta` VALUES (15,1,'show_welcome_panel','1');
INSERT INTO `wp_usermeta` VALUES (17,1,'wp_dashboard_quick_press_last_post_id','363');
INSERT INTO `wp_usermeta` VALUES (18,1,'community-events-location','a:1:{s:2:\"ip\";s:12:\"192.168.95.0\";}');
INSERT INTO `wp_usermeta` VALUES (19,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}');
INSERT INTO `wp_usermeta` VALUES (20,1,'metaboxhidden_nav-menus','a:1:{i:0;s:12:\"add-post_tag\";}');
INSERT INTO `wp_usermeta` VALUES (21,1,'nav_menu_recently_edited','2');
INSERT INTO `wp_usermeta` VALUES (22,1,'closedpostboxes_post','a:2:{i:0;s:23:\"acf-group_5e714f3f3575f\";i:1;s:10:\"wpseo_meta\";}');
INSERT INTO `wp_usermeta` VALUES (23,1,'metaboxhidden_post','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (24,1,'wp_user-settings','libraryContent=browse');
INSERT INTO `wp_usermeta` VALUES (25,1,'wp_user-settings-time','1542836120');
INSERT INTO `wp_usermeta` VALUES (26,1,'wp_r_tru_u_x','a:2:{s:2:\"id\";s:0:\"\";s:7:\"expires\";i:86400;}');
INSERT INTO `wp_usermeta` VALUES (29,1,'_yoast_wpseo_profile_updated','1563303976');
INSERT INTO `wp_usermeta` VALUES (31,1,'jetpack_tracks_anon_id','jetpack:UoLW63IQ0ve7q5BfML3zVb66');
INSERT INTO `wp_usermeta` VALUES (32,1,'closedpostboxes_artist','a:1:{i:0;s:23:\"featured-video-plus-box\";}');
INSERT INTO `wp_usermeta` VALUES (33,1,'metaboxhidden_artist','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (34,1,'closedpostboxes_music','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (35,1,'metaboxhidden_music','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (36,1,'dpsp_admin_notice_first_activation','1');
INSERT INTO `wp_usermeta` VALUES (38,1,'meta-box-order_artist','a:4:{s:6:\"normal\";s:58:\"wpseo_meta,acf-group_5d3c31cecfdbe,acf-group_5bff0faf6b1c5\";s:15:\"acf_after_title\";s:0:\"\";s:8:\"advanced\";s:0:\"\";s:4:\"side\";s:23:\"featured-video-plus-box\";}');
INSERT INTO `wp_usermeta` VALUES (39,1,'wp_media_library_mode','list');
INSERT INTO `wp_usermeta` VALUES (52,1,'session_tokens','a:1:{s:64:\"31c09b939639cad1a3936de1d68ab99532652148cfe9eca4cc007b63610990a0\";a:4:{s:10:\"expiration\";i:1600977870;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1600805070;}}');
INSERT INTO `wp_usermeta` VALUES (53,1,'closedpostboxes_banner','a:2:{i:0;s:23:\"featured-video-plus-box\";i:1;s:10:\"wpseo_meta\";}');
INSERT INTO `wp_usermeta` VALUES (54,1,'metaboxhidden_banner','a:1:{i:0;s:7:\"slugdiv\";}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'le_peps','$P$BW7w/jQZ2S5u0uNwhTyReusjkHMJ/B/','le_peps','christophe.sbastien@gmail.com','','2018-11-07 22:39:15','1584262658:$P$Bis/5AkfeUN1UWIH7c2wECKQefUQ97/',0,'Le Peps');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_yoast_indexable`
--

DROP TABLE IF EXISTS `wp_yoast_indexable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_yoast_indexable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permalink` longtext COLLATE utf8mb4_unicode_520_ci,
  `permalink_hash` varchar(40) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `object_id` int(11) unsigned DEFAULT NULL,
  `object_type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_sub_type` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  `post_parent` int(11) unsigned DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_520_ci,
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `breadcrumb_title` text COLLATE utf8mb4_unicode_520_ci,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_protected` tinyint(1) DEFAULT '0',
  `has_public_posts` tinyint(1) DEFAULT NULL,
  `number_of_pages` int(11) unsigned DEFAULT NULL,
  `canonical` longtext COLLATE utf8mb4_unicode_520_ci,
  `primary_focus_keyword` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `primary_focus_keyword_score` int(3) DEFAULT NULL,
  `readability_score` int(3) DEFAULT NULL,
  `is_cornerstone` tinyint(1) DEFAULT '0',
  `is_robots_noindex` tinyint(1) DEFAULT '0',
  `is_robots_nofollow` tinyint(1) DEFAULT '0',
  `is_robots_noarchive` tinyint(1) DEFAULT '0',
  `is_robots_noimageindex` tinyint(1) DEFAULT '0',
  `is_robots_nosnippet` tinyint(1) DEFAULT '0',
  `twitter_title` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_image` longtext COLLATE utf8mb4_unicode_520_ci,
  `twitter_description` longtext COLLATE utf8mb4_unicode_520_ci,
  `twitter_image_id` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `twitter_image_source` text COLLATE utf8mb4_unicode_520_ci,
  `open_graph_title` text COLLATE utf8mb4_unicode_520_ci,
  `open_graph_description` longtext COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image` longtext COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image_id` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `open_graph_image_source` text COLLATE utf8mb4_unicode_520_ci,
  `open_graph_image_meta` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `link_count` int(11) DEFAULT NULL,
  `incoming_link_count` int(11) DEFAULT NULL,
  `prominent_words_version` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `blog_id` bigint(20) NOT NULL DEFAULT '1',
  `language` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `region` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schema_page_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schema_article_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `has_ancestors` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `object_type_and_sub_type` (`object_type`,`object_sub_type`),
  KEY `object_id_and_type` (`object_id`,`object_type`),
  KEY `permalink_hash_and_object_type` (`permalink_hash`,`object_type`),
  KEY `subpages` (`post_parent`,`object_type`,`post_status`,`object_id`),
  KEY `prominent_words` (`prominent_words_version`,`object_type`,`object_sub_type`,`post_status`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_yoast_indexable`
--

LOCK TABLES `wp_yoast_indexable` WRITE;
/*!40000 ALTER TABLE `wp_yoast_indexable` DISABLE KEYS */;
INSERT INTO `wp_yoast_indexable` VALUES (1,'http://pepseeactusv3.local/author/le_peps/','42:f42087b85d39888ec07f2be5fecbdf49',1,'user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,'https://1.gravatar.com/avatar/10fd4f2103c7de2adaaabd0325e07c78?s=500&d=mm&r=g',NULL,NULL,'gravatar-image',NULL,NULL,'https://1.gravatar.com/avatar/10fd4f2103c7de2adaaabd0325e07c78?s=500&d=mm&r=g',NULL,'gravatar-image',NULL,NULL,NULL,NULL,'2020-05-01 20:11:33','2020-09-10 19:35:48',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (2,'http://pepseeactusv3.local/','27:ef9481e42d786fd0ff08752e3ba93474',53,'post','page',1,0,NULL,NULL,'Home','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-01 20:11:33','2020-05-01 18:11:33',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (3,'http://pepseeactusv3.local/music/','33:26f83f306f418b5e866f68bfb65fb148',NULL,'post-type-archive','music',NULL,NULL,'%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%','','Musique',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-01 20:12:08','2020-05-01 18:12:08',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (4,'http://pepseeactusv3.local/music/admiral-t-rapide/','50:020df6fbd9413e6e8d138956f9d0e49f',323,'post','music',1,0,NULL,NULL,'Admiral T &#8211; Rapide','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,30,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/1997/04/81fMwakZw4L._SS500_.jpg',NULL,'327','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/1997/04/81fMwakZw4L._SS500_.jpg','327','featured-image','{\"width\":500,\"height\":500,\"url\":\"http:\\/\\/pepseeactusv3.local\\/wp-content\\/uploads\\/1997\\/04\\/81fMwakZw4L._SS500_.jpg\",\"path\":\"\\/Users\\/PepseeActus\\/Local Sites\\/pepseeactusv3\\/app\\/public\\/wp-content\\/uploads\\/1997\\/04\\/81fMwakZw4L._SS500_.jpg\",\"size\":\"full\",\"id\":327,\"alt\":\"\",\"pixels\":250000,\"type\":\"image\\/jpeg\"}',0,0,NULL,'2020-05-01 20:34:29','2020-05-01 18:35:25',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (5,'http://pepseeactusv3.local/blog/','32:8135f22a5896d90d02c77960e3d82282',96,'post','page',1,0,NULL,NULL,'Blog','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-01 20:34:39','2020-05-01 18:34:39',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (6,'http://pepseeactusv3.local/artist/','34:20477328fcad6b67199e62e4da32d910',NULL,'post-type-archive','artist',NULL,NULL,'%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%','','Artistes',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-01 20:34:39','2020-05-01 18:34:39',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (7,'http://pepseeactusv3.local/album/','33:f7290707def3aadc74cafbf61ebe00b0',NULL,'post-type-archive','album',NULL,NULL,'%%pt_plural%% Archive %%page%% %%sep%% %%sitename%%','','Album',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-01 20:34:39','2020-05-01 18:34:39',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (8,NULL,'70:97ee1202fa66cdfd1354d6ffc88bdd7b',327,'post','attachment',1,323,NULL,NULL,'81fMwakZw4L._SS500_','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/1997/04/81fMwakZw4L._SS500_.jpg',NULL,'327','attachment-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/1997/04/81fMwakZw4L._SS500_.jpg','327','attachment-image','{\"width\":500,\"height\":500,\"url\":\"http:\\/\\/pepseeactusv3.local\\/wp-content\\/uploads\\/1997\\/04\\/81fMwakZw4L._SS500_.jpg\",\"path\":\"\\/Users\\/PepseeActus\\/Local Sites\\/pepseeactusv3\\/app\\/public\\/wp-content\\/uploads\\/1997\\/04\\/81fMwakZw4L._SS500_.jpg\",\"size\":\"full\",\"id\":327,\"alt\":\"\",\"pixels\":250000,\"type\":\"image\\/jpeg\"}',NULL,NULL,NULL,'2020-05-01 20:34:45','2020-08-30 22:57:27',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (9,'',NULL,NULL,'post-type-archive','attachment',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-01 20:34:45','2020-05-01 18:34:45',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (10,'http://pepseeactusv3.local/actus/','33:5931aa8922340c3266bfec9a56cabd39',5,'term','category',NULL,NULL,NULL,NULL,'Actus',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-01 22:12:02','2020-05-01 20:12:02',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (11,'http://pepseeactusv3.local/clips/','33:8270182a8d8ede55a85efef3257a8282',15,'term','category',NULL,NULL,NULL,NULL,'Clips',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-01 22:20:58','2020-05-01 20:20:58',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (12,NULL,NULL,NULL,'date-archive',NULL,NULL,NULL,'%%date%% %%page%% %%sep%% %%sitename%%','','Archives for',NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-05-02 10:13:58','2020-08-30 20:56:27',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (13,'http://pepseeactusv3.local/yanii-x-jmax-dans-la-peau/','53:5ee325d5f143e85026aa57bf1aa97fd1',231,'post','post',1,0,NULL,NULL,'Yanii x JmaX &#8211; Dans La Peau','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,90,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/Yanii-Feat-JmaX-Dans-la-Peau.jpeg',NULL,'232','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/Yanii-Feat-JmaX-Dans-la-Peau.jpeg','232','featured-image','{\"width\":1280,\"height\":720,\"url\":\"http:\\/\\/pepseeactusv3.local\\/wp-content\\/uploads\\/2020\\/03\\/Yanii-Feat-JmaX-Dans-la-Peau.jpeg\",\"path\":\"\\/Users\\/PepseeActus\\/Local Sites\\/pepseeactusv3\\/app\\/public\\/wp-content\\/uploads\\/2020\\/03\\/Yanii-Feat-JmaX-Dans-la-Peau.jpeg\",\"size\":\"full\",\"id\":232,\"alt\":\"\",\"pixels\":921600,\"type\":\"image\\/jpeg\"}',0,0,NULL,'2020-05-02 16:32:52','2020-05-02 14:32:52',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (14,'http://pepseeactusv3.local/keros-n-miss-doliprane/','50:517fb56e99a9034dd24db581adf432d7',138,'post','post',1,0,NULL,NULL,'Keros-n &#8211; Miss Doliprane','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,30,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/KEROS-N-MISS-DOLIPRANE.jpeg',NULL,'304','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/KEROS-N-MISS-DOLIPRANE.jpeg','304','featured-image','{\"width\":1280,\"height\":720,\"url\":\"http:\\/\\/pepseeactusv3.local\\/wp-content\\/uploads\\/2019\\/07\\/KEROS-N-MISS-DOLIPRANE.jpeg\",\"path\":\"\\/Users\\/PepseeActus\\/Local Sites\\/pepseeactusv3\\/app\\/public\\/wp-content\\/uploads\\/2019\\/07\\/KEROS-N-MISS-DOLIPRANE.jpeg\",\"size\":\"full\",\"id\":304,\"alt\":\"keros-n miss doliprane\",\"pixels\":921600,\"type\":\"image\\/jpeg\"}',0,0,NULL,'2020-05-02 18:14:21','2020-05-02 16:30:13',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (15,NULL,'75:1e86be3718013a761c8d837008a251d4',304,'post','attachment',1,138,NULL,NULL,'keros-n miss doliprane','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/KEROS-N-MISS-DOLIPRANE.jpeg',NULL,'304','attachment-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/KEROS-N-MISS-DOLIPRANE.jpeg','304','attachment-image','{\"width\":1280,\"height\":720,\"url\":\"http:\\/\\/pepseeactusv3.local\\/wp-content\\/uploads\\/2019\\/07\\/KEROS-N-MISS-DOLIPRANE.jpeg\",\"path\":\"\\/Users\\/PepseeActus\\/Local Sites\\/pepseeactusv3\\/app\\/public\\/wp-content\\/uploads\\/2019\\/07\\/KEROS-N-MISS-DOLIPRANE.jpeg\",\"size\":\"full\",\"id\":304,\"alt\":\"keros-n miss doliprane\",\"pixels\":921600,\"type\":\"image\\/jpeg\"}',NULL,NULL,NULL,'2020-05-02 18:14:58','2020-08-30 22:57:27',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (16,'http://pepseeactusv3.local/music/jmax/','38:593621e013c6a13cc066608e95fb9eb0',216,'post','music',1,0,NULL,NULL,'JmaX &#8211; Darling','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,90,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/jmax_darling.jpeg',NULL,'217','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/jmax_darling.jpeg','217','featured-image','{\"width\":400,\"height\":400,\"url\":\"http:\\/\\/pepseeactusv3.local\\/wp-content\\/uploads\\/2020\\/03\\/jmax_darling.jpeg\",\"path\":\"\\/Users\\/PepseeActus\\/Local Sites\\/pepseeactusv3\\/app\\/public\\/wp-content\\/uploads\\/2020\\/03\\/jmax_darling.jpeg\",\"size\":\"full\",\"id\":217,\"alt\":\"jmax darling\",\"pixels\":160000,\"type\":\"image\\/jpeg\"}',0,0,NULL,'2020-05-03 19:32:25','2020-05-03 18:12:08',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (17,'http://pepseeactusv3.local/artist/jmax/','39:4a8c563b9d1fb6d24aa490c8315dca94',154,'post','artist',1,0,NULL,NULL,'JmaX','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,30,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/57726635_2520837081279801_5716810562868871168_o.jpg',NULL,'197','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/57726635_2520837081279801_5716810562868871168_o.jpg','197','featured-image','{\"width\":1080,\"height\":604,\"url\":\"http:\\/\\/pepseeactusv3.local\\/wp-content\\/uploads\\/2019\\/07\\/57726635_2520837081279801_5716810562868871168_o.jpg\",\"path\":\"\\/Users\\/PepseeActus\\/Local Sites\\/pepseeactusv3\\/app\\/public\\/wp-content\\/uploads\\/2019\\/07\\/57726635_2520837081279801_5716810562868871168_o.jpg\",\"size\":\"full\",\"id\":197,\"alt\":\"jmax\",\"pixels\":652320,\"type\":\"image\\/jpeg\"}',0,0,NULL,'2020-05-03 19:32:39','2020-05-03 17:32:39',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (18,NULL,'51:874a819cd33e105715b7b3a556d7bdc8',217,'post','attachment',1,216,NULL,NULL,'jmax_darling','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/jmax_darling.jpeg',NULL,'217','attachment-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/jmax_darling.jpeg','217','attachment-image','{\"width\":400,\"height\":400,\"url\":\"http:\\/\\/pepseeactusv3.local\\/wp-content\\/uploads\\/2020\\/03\\/jmax_darling.jpeg\",\"path\":\"\\/Users\\/PepseeActus\\/Local Sites\\/pepseeactusv3\\/app\\/public\\/wp-content\\/uploads\\/2020\\/03\\/jmax_darling.jpeg\",\"size\":\"full\",\"id\":217,\"alt\":\"jmax darling\",\"pixels\":160000,\"type\":\"image\\/jpeg\"}',NULL,NULL,NULL,'2020-05-03 20:11:55','2020-08-30 22:57:27',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (19,'http://pepseeactusv3.local/music/nouveau-son/','45:fea7b861450f650da7b7c0b6ffa1598e',359,'post','music',1,0,NULL,NULL,'nouveau son','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,30,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png',NULL,'255','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png','255','featured-image','{\"width\":974,\"height\":1112,\"url\":\"http:\\/\\/pepseeactusv3.local\\/wp-content\\/uploads\\/2019\\/07\\/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png\",\"path\":\"\\/Users\\/PepseeActus\\/Local Sites\\/pepseeactusv3\\/app\\/public\\/wp-content\\/uploads\\/2019\\/07\\/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png\",\"size\":\"full\",\"id\":255,\"alt\":\"kalash\",\"pixels\":1083088,\"type\":\"image\\/png\"}',0,0,NULL,'2020-05-18 11:43:16','2020-05-18 09:59:23',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (20,'http://pepseeactusv3.local/artist/kalash/','41:1c6f88a52c7316c7b511524eee031ae3',151,'post','artist',1,0,NULL,NULL,'Kalash','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,60,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png',NULL,'255','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png','255','featured-image','{\"width\":974,\"height\":1112,\"url\":\"http:\\/\\/pepseeactusv3.local\\/wp-content\\/uploads\\/2019\\/07\\/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png\",\"path\":\"\\/Users\\/PepseeActus\\/Local Sites\\/pepseeactusv3\\/app\\/public\\/wp-content\\/uploads\\/2019\\/07\\/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png\",\"size\":\"full\",\"id\":255,\"alt\":\"kalash\",\"pixels\":1083088,\"type\":\"image\\/png\"}',0,0,NULL,'2020-05-18 11:44:13','2020-05-18 09:44:13',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (21,NULL,'87:ab8196b531bbc89ffb615b2d8aaf7f7c',255,'post','attachment',1,151,NULL,NULL,'kalash','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png',NULL,'255','attachment-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png','255','attachment-image','{\"width\":974,\"height\":1112,\"url\":\"http:\\/\\/pepseeactusv3.local\\/wp-content\\/uploads\\/2019\\/07\\/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png\",\"path\":\"\\/Users\\/PepseeActus\\/Local Sites\\/pepseeactusv3\\/app\\/public\\/wp-content\\/uploads\\/2019\\/07\\/3504_61e6e43be38a478c3f7c88af2e1dc3a77287454b.png\",\"size\":\"full\",\"id\":255,\"alt\":\"kalash\",\"pixels\":1083088,\"type\":\"image\\/png\"}',NULL,NULL,NULL,'2020-05-18 11:44:13','2020-08-30 22:57:27',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (23,'http://pepseeactusv3.local/a-propos/','36:f25f95884e8bbeeb58114752254bbaa4',20,'post','page',1,0,NULL,NULL,'À Propos','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-31 21:30:51','2020-08-31 19:30:51',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (24,'http://pepseeactusv3.local/admiral-t-annonce-deux-albums-pour-septembre/','72:a4689a4bb3afaaeb846c9df3221f61ff',120,'post','post',1,0,NULL,NULL,'Admiral T annonce deux albums pour Septembre','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,60,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/67112364_10156714299347087_6249821407371329536_n-1.jpg',NULL,'241','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/67112364_10156714299347087_6249821407371329536_n-1.jpg','241','featured-image','{\"width\":960,\"height\":960,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2019/07/67112364_10156714299347087_6249821407371329536_n-1.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2019/07/67112364_10156714299347087_6249821407371329536_n-1.jpg\",\"size\":\"full\",\"id\":241,\"alt\":\"admiral t caribbean monster\",\"pixels\":921600,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-01 18:07:46','2020-09-01 16:07:46',1,NULL,NULL,NULL,NULL,1);
INSERT INTO `wp_yoast_indexable` VALUES (25,'http://pepseeactusv3.local/music/yanii-x-jmax/','46:c530571698fcbde932fd0d2511a5869e',211,'post','music',1,0,NULL,NULL,'Yanii x JmaX &#8211; Dans La Peau','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,60,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/jmax_yanii_dans_la_peau.jpg',NULL,'212','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/jmax_yanii_dans_la_peau.jpg','212','featured-image','{\"width\":400,\"height\":400,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2020/03/jmax_yanii_dans_la_peau.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2020/03/jmax_yanii_dans_la_peau.jpg\",\"size\":\"full\",\"id\":212,\"alt\":\"jmax yanii dans la peau\",\"pixels\":160000,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-03 21:16:06','2020-09-03 19:16:06',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (26,'http://pepseeactusv3.local/music/shannon/','41:9e2eb623fb8e21fa5605d46d4bbd73b1',171,'post','music',1,0,NULL,NULL,'Shannon &#8211; Best','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,60,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/shannon-best.jpeg',NULL,'220','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/shannon-best.jpeg','220','featured-image','{\"width\":640,\"height\":640,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2019/07/shannon-best.jpeg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2019/07/shannon-best.jpeg\",\"size\":\"full\",\"id\":220,\"alt\":\"shannon best\",\"pixels\":409600,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-03 21:16:06','2020-09-03 19:16:06',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (27,'http://pepseeactusv3.local/music/kalash-x-damso-praline/','56:8c6da217b45a41b5e70f57ceb64dc98d',161,'post','music',1,0,NULL,NULL,'Kalash x Damso &#8211; Praliné','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,90,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/500x500.jpg',NULL,'226','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/500x500.jpg','226','featured-image','{\"width\":500,\"height\":500,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2019/07/500x500.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2019/07/500x500.jpg\",\"size\":\"full\",\"id\":226,\"alt\":\"kalash damso pralin\\u00e9\",\"pixels\":250000,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-03 21:16:06','2020-09-03 19:16:06',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (28,'http://pepseeactusv3.local/music/kalash-x-damso-jtc/','52:62eb14a51ec305bef858edf6328798c2',158,'post','music',1,0,NULL,NULL,'Kalash x Damso &#8211; JTC','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,90,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/kalash-jtc-feat-damso.jpg',NULL,'228','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/kalash-jtc-feat-damso.jpg','228','featured-image','{\"width\":600,\"height\":600,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2019/07/kalash-jtc-feat-damso.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2019/07/kalash-jtc-feat-damso.jpg\",\"size\":\"full\",\"id\":228,\"alt\":\"kalash damso jtc\",\"pixels\":360000,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-03 21:16:06','2020-09-03 19:16:06',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (29,'http://pepseeactusv3.local/music/admiral-t-x-were-vana-baimbridge-cho/','70:1487f2124c98e8f0e46c026ce90596b3',167,'post','music',1,0,NULL,NULL,'Admiral T x Were Vana &#8211; Baimbridge Cho','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,90,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/admiral-t-baimbridge-cho-feat-were-vana.jpg',NULL,'222','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/admiral-t-baimbridge-cho-feat-were-vana.jpg','222','featured-image','{\"width\":500,\"height\":500,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2019/07/admiral-t-baimbridge-cho-feat-were-vana.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2019/07/admiral-t-baimbridge-cho-feat-were-vana.jpg\",\"size\":\"full\",\"id\":222,\"alt\":\"admiral t were vana baimbridge cho\",\"pixels\":250000,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-03 21:16:06','2020-09-03 19:16:06',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (30,'http://pepseeactusv3.local/music/admiral-t-x-krys-boss-lady/','60:fa333cb36f8f3d6edac1689c5959f0df',164,'post','music',1,0,NULL,NULL,'Admiral T x Krys &#8211; Boss Lady','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,60,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/admiral-t-boss-lady-feat-krys.jpg',NULL,'224','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/admiral-t-boss-lady-feat-krys.jpg','224','featured-image','{\"width\":500,\"height\":500,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2019/07/admiral-t-boss-lady-feat-krys.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2019/07/admiral-t-boss-lady-feat-krys.jpg\",\"size\":\"full\",\"id\":224,\"alt\":\"admiral t krys boss lady\",\"pixels\":250000,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-03 21:16:06','2020-09-03 19:16:06',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (31,'http://pepseeactusv3.local/music/lorenz-x-jmax-luv-me/','54:cf2b0de4844ebe58c1bccb547a32768f',73,'post','music',1,0,NULL,NULL,'Lorenz x JmaX &#8211; Luv Me','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,60,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2018/11/A1YXVkG409L._SS500_-1.jpg',NULL,'201','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2018/11/A1YXVkG409L._SS500_-1.jpg','201','featured-image','{\"width\":500,\"height\":500,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2018/11/A1YXVkG409L._SS500_-1.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2018/11/A1YXVkG409L._SS500_-1.jpg\",\"size\":\"full\",\"id\":201,\"alt\":\"lorenz jmax luv me\",\"pixels\":250000,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-03 21:16:06','2020-09-03 19:16:06',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (32,'http://pepseeactusv3.local/music/jmax-touch-me/','47:f62dc3260806db5b6f73dec79cc10bbc',72,'post','music',1,0,NULL,NULL,'Mel x JmaX &#8211; Touch Me (Remix)','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,60,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2018/11/3614977940763_600-1.jpg',NULL,'198','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2018/11/3614977940763_600-1.jpg','198','featured-image','{\"width\":600,\"height\":600,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2018/11/3614977940763_600-1.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2018/11/3614977940763_600-1.jpg\",\"size\":\"full\",\"id\":198,\"alt\":\"jmax mel touch me remix\",\"pixels\":360000,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-03 21:16:06','2020-09-03 19:16:06',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (33,'http://pepseeactusv3.local/wp-content/uploads/2019/07/500x500.jpg','65:2e5067bb48434e1287a0ac69a84090f4',226,'post','attachment',1,161,NULL,NULL,'kalash damso praliné','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/500x500.jpg',NULL,'226','attachment-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/500x500.jpg','226','attachment-image','{\"width\":500,\"height\":500,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2019/07/500x500.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2019/07/500x500.jpg\",\"size\":\"full\",\"id\":226,\"alt\":\"kalash damso pralin\\u00e9\",\"pixels\":250000,\"type\":\"image/jpeg\"}',NULL,NULL,NULL,'2020-09-03 23:42:46','2020-09-03 21:42:46',1,NULL,NULL,NULL,NULL,1);
INSERT INTO `wp_yoast_indexable` VALUES (34,'http://pepseeactusv3.local/la-date-de-sortie-de-magma-enfin-revelee/','68:8bc38f55b23c3eb137caa8a4b1a49fda',126,'post','post',1,0,NULL,NULL,'La date de sortie de Magma enfin révélée!','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,90,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/saïk_magma.jpg',NULL,'244','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2019/07/saïk_magma.jpg','244','featured-image','{\"width\":960,\"height\":960,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2019/07/sai\\u0308k_magma.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2019/07/sai\\u0308k_magma.jpg\",\"size\":\"full\",\"id\":244,\"alt\":\"saik magma\",\"pixels\":921600,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-08 20:28:08','2020-09-08 18:28:08',1,NULL,NULL,NULL,NULL,1);
INSERT INTO `wp_yoast_indexable` VALUES (35,'http://pepseeactusv3.local/mentions-legales/','44:f7fbe496d594321324cf3c662085b71b',22,'post','page',1,0,NULL,NULL,'Mentions Légales','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-08 21:19:37','2020-09-08 19:19:37',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (36,NULL,NULL,NULL,'system-page','404',NULL,NULL,'Page not found %%sep%% %%sitename%%',NULL,'Error 404: La page n\'existe pas',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-08 21:19:45','2020-09-08 19:19:45',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (37,'http://pepseeactusv3.local/a-propos/contact/','44:3ce5c25c28c15313aa0ba4e2876543fc',28,'post','page',1,20,NULL,NULL,'Contact','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-08 21:19:50','2020-09-08 19:19:50',1,NULL,NULL,NULL,NULL,1);
INSERT INTO `wp_yoast_indexable` VALUES (38,'http://pepseeactusv3.local/banner/kevni-top-boy/','48:9057e46ee9df20649b26acc3f8434d4d',338,'post','banner',1,0,NULL,NULL,'Kevni &#8211; Top Boy','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,90,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/04/kevni_top_boy_cd_cover.jpg',NULL,'340','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/04/kevni_top_boy_cd_cover.jpg','340','featured-image','{\"width\":960,\"height\":960,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2020/04/kevni_top_boy_cd_cover.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2020/04/kevni_top_boy_cd_cover.jpg\",\"size\":\"full\",\"id\":340,\"alt\":\"\",\"pixels\":921600,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-08 21:49:37','2020-09-08 19:53:15',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (39,'http://pepseeactusv3.local/wp-content/uploads/2020/04/kevni_top_boy_cd_cover.jpg','80:ae8a930886aec593bba71935f9ba6bec',340,'post','attachment',1,338,NULL,NULL,'kevni_top_boy_cd_cover','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/04/kevni_top_boy_cd_cover.jpg',NULL,'340','attachment-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/04/kevni_top_boy_cd_cover.jpg','340','attachment-image','{\"width\":960,\"height\":960,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2020/04/kevni_top_boy_cd_cover.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2020/04/kevni_top_boy_cd_cover.jpg\",\"size\":\"full\",\"id\":340,\"alt\":\"\",\"pixels\":921600,\"type\":\"image/jpeg\"}',NULL,NULL,NULL,'2020-09-08 21:49:45','2020-09-08 21:53:15',1,NULL,NULL,NULL,NULL,1);
INSERT INTO `wp_yoast_indexable` VALUES (40,'http://pepseeactusv3.local/artist/admiral-t/','44:41e022cc1fe7fbce766d89172e146a84',299,'post','artist',1,0,NULL,NULL,'Admiral T','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,30,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/admiral-t.jpg',NULL,'300','featured-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/admiral-t.jpg','300','featured-image','{\"width\":900,\"height\":600,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2020/03/admiral-t.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2020/03/admiral-t.jpg\",\"size\":\"full\",\"id\":300,\"alt\":\"admiral t\",\"pixels\":540000,\"type\":\"image/jpeg\"}',0,0,NULL,'2020-09-08 22:19:57','2020-09-08 20:19:57',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (41,'http://pepseeactusv3.local/a-propos/notre-but/','46:ea82be3b3b398d8cede33e4dd9fc4393',26,'post','page',1,20,NULL,NULL,'Notre But','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-10 21:16:24','2020-09-10 19:16:24',1,NULL,NULL,NULL,NULL,1);
INSERT INTO `wp_yoast_indexable` VALUES (42,'http://pepseeactusv3.local/actus/','33:5931aa8922340c3266bfec9a56cabd39',16,'post','page',1,0,NULL,NULL,'Actus','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-10 21:16:24','2020-09-10 19:16:24',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (43,'http://pepseeactusv3.local/clips/','33:8270182a8d8ede55a85efef3257a8282',310,'post','page',1,0,NULL,NULL,'Clips','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,'2020-09-10 21:16:24','2020-09-10 19:16:24',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (44,'http://pepseeactusv3.local/evenement-passes/','44:28df185fa5ccc8f80a54383877fd8cc5',64,'post','page',1,0,NULL,NULL,'Événement Passés','publish',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-10 21:16:24','2020-09-10 19:16:24',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (45,'http://pepseeactusv3.local/?page_id=3','37:533f29cc4277ace359a070d9f2546aa0',3,'post','page',1,0,NULL,NULL,'Privacy Policy','draft',0,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-10 21:16:24','2020-09-10 19:16:24',1,NULL,NULL,NULL,NULL,0);
INSERT INTO `wp_yoast_indexable` VALUES (46,'http://pepseeactusv3.local/wp-content/uploads/2020/03/admiral-t.jpg','67:03a119e9b64551adb16e8d6df8a5970d',300,'post','attachment',1,299,NULL,NULL,'admiral t','inherit',NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/admiral-t.jpg',NULL,'300','attachment-image',NULL,NULL,'http://pepseeactusv3.local/wp-content/uploads/2020/03/admiral-t.jpg','300','attachment-image','{\"width\":900,\"height\":600,\"url\":\"http://pepseeactusv3.local/wp-content/uploads/2020/03/admiral-t.jpg\",\"path\":\"/Users/PepseeActus/Local Sites/pepseeactusv3/app/public/wp-content/uploads/2020/03/admiral-t.jpg\",\"size\":\"full\",\"id\":300,\"alt\":\"admiral t\",\"pixels\":540000,\"type\":\"image/jpeg\"}',NULL,NULL,NULL,'2020-09-10 21:35:48','2020-09-10 19:35:48',1,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `wp_yoast_indexable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_yoast_indexable_hierarchy`
--

DROP TABLE IF EXISTS `wp_yoast_indexable_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_yoast_indexable_hierarchy` (
  `indexable_id` int(11) unsigned NOT NULL,
  `ancestor_id` int(11) unsigned NOT NULL,
  `depth` int(11) unsigned DEFAULT NULL,
  `blog_id` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`indexable_id`,`ancestor_id`),
  KEY `indexable_id` (`indexable_id`),
  KEY `ancestor_id` (`ancestor_id`),
  KEY `depth` (`depth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_yoast_indexable_hierarchy`
--

LOCK TABLES `wp_yoast_indexable_hierarchy` WRITE;
/*!40000 ALTER TABLE `wp_yoast_indexable_hierarchy` DISABLE KEYS */;
INSERT INTO `wp_yoast_indexable_hierarchy` VALUES (14,11,1,1);
INSERT INTO `wp_yoast_indexable_hierarchy` VALUES (34,10,1,1);
INSERT INTO `wp_yoast_indexable_hierarchy` VALUES (37,23,1,1);
INSERT INTO `wp_yoast_indexable_hierarchy` VALUES (46,40,1,1);
/*!40000 ALTER TABLE `wp_yoast_indexable_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_yoast_migrations`
--

DROP TABLE IF EXISTS `wp_yoast_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_yoast_migrations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wp_yoast_migrations_version` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_yoast_migrations`
--

LOCK TABLES `wp_yoast_migrations` WRITE;
/*!40000 ALTER TABLE `wp_yoast_migrations` DISABLE KEYS */;
INSERT INTO `wp_yoast_migrations` VALUES (1,'20171228151840');
INSERT INTO `wp_yoast_migrations` VALUES (2,'20171228151841');
INSERT INTO `wp_yoast_migrations` VALUES (3,'20190529075038');
INSERT INTO `wp_yoast_migrations` VALUES (4,'20191011111109');
INSERT INTO `wp_yoast_migrations` VALUES (5,'20200408101900');
INSERT INTO `wp_yoast_migrations` VALUES (6,'20200420073606');
INSERT INTO `wp_yoast_migrations` VALUES (7,'20200428123747');
INSERT INTO `wp_yoast_migrations` VALUES (8,'20200428194858');
INSERT INTO `wp_yoast_migrations` VALUES (9,'20200429105310');
INSERT INTO `wp_yoast_migrations` VALUES (10,'20200430075614');
INSERT INTO `wp_yoast_migrations` VALUES (11,'20200430150130');
INSERT INTO `wp_yoast_migrations` VALUES (12,'20200507054848');
INSERT INTO `wp_yoast_migrations` VALUES (13,'20200513133401');
INSERT INTO `wp_yoast_migrations` VALUES (14,'20200609154515');
INSERT INTO `wp_yoast_migrations` VALUES (15,'20200616130143');
INSERT INTO `wp_yoast_migrations` VALUES (16,'20200702141921');
INSERT INTO `wp_yoast_migrations` VALUES (17,'20200728095334');
/*!40000 ALTER TABLE `wp_yoast_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_yoast_primary_term`
--

DROP TABLE IF EXISTS `wp_yoast_primary_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_yoast_primary_term` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned NOT NULL,
  `term_id` int(11) unsigned NOT NULL,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `blog_id` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `post_taxonomy` (`post_id`,`taxonomy`),
  KEY `post_term` (`post_id`,`term_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_yoast_primary_term`
--

LOCK TABLES `wp_yoast_primary_term` WRITE;
/*!40000 ALTER TABLE `wp_yoast_primary_term` DISABLE KEYS */;
INSERT INTO `wp_yoast_primary_term` VALUES (1,231,15,'category','2020-05-02 16:32:52','2020-05-02 14:32:52',1);
INSERT INTO `wp_yoast_primary_term` VALUES (2,138,15,'category','2020-05-02 18:14:21','2020-05-02 16:30:13',1);
INSERT INTO `wp_yoast_primary_term` VALUES (3,120,5,'category','2020-09-01 18:07:46','2020-09-01 16:07:46',1);
INSERT INTO `wp_yoast_primary_term` VALUES (4,126,5,'category','2020-09-08 20:28:08','2020-09-08 18:28:08',1);
/*!40000 ALTER TABLE `wp_yoast_primary_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_yoast_seo_links`
--

DROP TABLE IF EXISTS `wp_yoast_seo_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_yoast_seo_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `target_post_id` bigint(20) unsigned NOT NULL,
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_direction` (`post_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_yoast_seo_links`
--

LOCK TABLES `wp_yoast_seo_links` WRITE;
/*!40000 ALTER TABLE `wp_yoast_seo_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_yoast_seo_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_yoast_seo_meta`
--

DROP TABLE IF EXISTS `wp_yoast_seo_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_yoast_seo_meta` (
  `object_id` bigint(20) unsigned NOT NULL,
  `internal_link_count` int(10) unsigned DEFAULT NULL,
  `incoming_link_count` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_yoast_seo_meta`
--

LOCK TABLES `wp_yoast_seo_meta` WRITE;
/*!40000 ALTER TABLE `wp_yoast_seo_meta` DISABLE KEYS */;
INSERT INTO `wp_yoast_seo_meta` VALUES (1,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (5,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (6,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (7,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (8,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (12,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (13,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (14,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (15,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (24,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (25,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (30,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (31,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (32,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (33,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (34,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (35,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (36,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (37,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (39,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (40,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (44,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (45,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (48,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (49,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (55,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (61,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (62,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (67,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (68,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (69,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (72,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (73,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (77,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (80,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (81,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (83,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (85,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (86,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (87,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (93,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (95,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (97,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (98,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (99,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (100,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (101,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (102,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (103,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (104,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (105,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (106,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (107,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (108,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (109,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (110,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (111,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (112,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (113,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (114,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (115,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (116,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (117,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (119,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (120,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (121,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (122,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (126,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (127,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (131,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (132,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (133,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (134,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (136,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (138,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (139,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (142,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (143,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (146,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (148,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (149,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (150,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (151,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (153,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (154,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (155,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (158,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (160,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (161,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (163,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (164,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (165,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (167,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (169,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (170,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (171,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (172,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (174,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (175,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (176,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (178,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (179,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (181,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (182,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (183,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (184,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (185,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (186,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (187,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (188,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (189,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (195,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (202,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (211,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (215,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (216,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (221,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (223,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (225,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (227,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (229,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (230,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (231,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (247,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (249,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (252,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (254,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (258,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (259,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (260,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (265,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (269,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (272,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (273,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (274,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (275,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (276,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (277,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (278,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (279,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (280,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (281,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (282,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (283,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (284,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (285,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (296,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (298,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (299,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (301,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (302,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (308,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (310,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (312,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (316,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (317,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (318,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (319,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (323,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (333,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (334,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (335,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (338,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (339,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (342,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (343,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (359,0,0);
INSERT INTO `wp_yoast_seo_meta` VALUES (363,0,0);
/*!40000 ALTER TABLE `wp_yoast_seo_meta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-24 15:53:24
