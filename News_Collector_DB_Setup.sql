CREATE DATABASE `news_collector_db`;

CREATE TABLE `news_collector_db`.`websites` (
  `website_id` int unsigned NOT NULL AUTO_INCREMENT,
  `website_name` varchar(64) NOT NULL,
  `website_link` varchar(2083) NOT NULL,
  PRIMARY KEY (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

CREATE TABLE `news_collector_db`.`rss_feeds` (
  `feed_id` int unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int unsigned NOT NULL,
  `feed_name` varchar(64) NOT NULL,
  `feed_link` varchar(2083) NOT NULL,
  PRIMARY KEY (`feed_id`),
  KEY `fk__rss_feeds__websites__website_id` (`website_id`),
  CONSTRAINT `fk__rss_feeds__websites__website_id` FOREIGN KEY (`website_id`) REFERENCES `websites` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

CREATE TABLE `news_collector_db`.`news` (
  `news_id` int unsigned NOT NULL AUTO_INCREMENT,
  `feed_id` int unsigned NOT NULL,
  `news_title` varchar(256) NOT NULL,
  `news_link` varchar(2083) NOT NULL,
  `news_description` varchar(3072) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `fk__news__rss_feeds__feed_id` (`feed_id`),
  CONSTRAINT `fk__news__rss_feeds__feed_id` FOREIGN KEY (`feed_id`) REFERENCES `rss_feeds` (`feed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10059 DEFAULT CHARSET=utf8;

CREATE TABLE `news_collector_db`.`users` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_authkey` varchar(24) NOT NULL,
  `last_activity_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_authkey` (`user_authkey`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
