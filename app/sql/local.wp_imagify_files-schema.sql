/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE `wp_imagify_files` (
  `file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `file_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `path` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `hash` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `modified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `width` smallint(2) unsigned NOT NULL DEFAULT '0',
  `height` smallint(2) unsigned NOT NULL DEFAULT '0',
  `original_size` int(4) unsigned NOT NULL DEFAULT '0',
  `optimized_size` int(4) unsigned DEFAULT NULL,
  `percent` smallint(2) unsigned DEFAULT NULL,
  `optimization_level` tinyint(1) unsigned DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `error` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `path` (`path`),
  KEY `folder_id` (`folder_id`),
  KEY `optimization_level` (`optimization_level`),
  KEY `status` (`status`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
