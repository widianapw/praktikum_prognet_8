/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 10.1.35-MariaDB : Database - db_praktikum_prognet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_praktikum_prognet` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_praktikum_prognet`;

/*Table structure for table `admin_notifications` */

DROP TABLE IF EXISTS `admin_notifications`;

CREATE TABLE `admin_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `admin_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_notifications` */

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sellers_email_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admins` */

insert  into `admins`(`id`,`username`,`password`,`name`,`profile_image`,`phone`,`remember_token`,`created_at`,`updated_at`) values 
(1,'widiana','$2y$10$li48DCZf9/b9RHcs6uhLV.XaTxOki6ZL5KuozyPEkSvxj2g9wnbnC','widi','widi','082146456432',NULL,'2019-03-12 19:19:58','2019-03-12 19:19:58');

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('checkedout','notyet','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `carts` */

insert  into `carts`(`id`,`user_id`,`product_id`,`qty`,`created_at`,`updated_at`,`status`,`session_id`,`deleted_at`) values 
(16,NULL,17,1,'2019-04-21 18:20:08','2019-04-21 18:20:08','','mn9A1KO102GEfk06kNjJDZT1BfBIFOw9M97c88pP',NULL),
(17,NULL,16,1,'2019-04-22 07:26:29','2019-04-22 07:26:29','','vpKhc1ePMyupTmMjOlR2tC6qEvuJPbJs7Eu9YzKU',NULL),
(18,NULL,25,1,'2019-04-22 17:11:52','2019-04-22 17:11:52','','d7rFLodMsGermbFCeBx9O8qtxAS1ytlEiWlQ3dTU',NULL),
(19,NULL,17,1,'2019-04-24 11:45:10','2019-04-24 11:45:10','','mrJCKhsmpJOKcI1tBy0L52Q5HDna4ZSITDYh7jwd',NULL),
(20,NULL,18,1,'2019-04-24 14:19:04','2019-04-24 16:46:27','','WyWq8cqrzMy4gMIf8AUWiQfg6A3a016w6741XrRE','2019-04-24 16:46:27'),
(21,NULL,30,2,'2019-04-24 14:33:29','2019-04-24 14:33:29','','WyWq8cqrzMy4gMIf8AUWiQfg6A3a016w6741XrRE',NULL),
(22,NULL,16,2,'2019-04-24 17:00:03','2019-04-24 17:00:03','','WyWq8cqrzMy4gMIf8AUWiQfg6A3a016w6741XrRE',NULL);

/*Table structure for table `couriers` */

DROP TABLE IF EXISTS `couriers`;

CREATE TABLE `couriers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `couriers` */

insert  into `couriers`(`id`,`courier`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'juliarta','2019-03-24 20:48:50','2019-04-13 20:59:03','2019-04-13 20:59:03'),
(2,'widi','2019-04-13 14:58:40','2019-04-13 14:58:40',NULL);

/*Table structure for table `discounts` */

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned DEFAULT NULL,
  `percentage` int(3) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `discounts` */

insert  into `discounts`(`id`,`id_product`,`percentage`,`start`,`end`,`created_at`,`updated_at`) values 
(1,26,2,'2019-04-21','2019-04-28','2019-04-22 17:08:29','2019-04-22 17:08:29'),
(2,27,2,'2019-04-21','2019-04-28','2019-04-22 17:09:24','2019-04-22 17:09:24');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_02_15_123603_create_admins_table',1),
(4,'2019_02_15_123744_create_sellers_table',1),
(5,'2019_02_15_125445_create_products_table',1),
(6,'2019_02_15_130341_create_product_images_table',1),
(7,'2019_02_15_131114_create_transactions_table',1),
(8,'2019_02_15_131132_create_transaction_details_table',1),
(9,'2019_02_15_132352_create_product_categories_table',1),
(10,'2019_02_15_132701_create_carts_table',1),
(11,'2019_02_15_134220_create_wishlists_table',1),
(12,'2019_02_16_044815_create_rates_table',1),
(13,'2019_02_16_045411_create_product_reviews_table',1),
(14,'2019_02_16_062504_create_qna_products_table',1),
(15,'2019_02_16_063238_create_shopping_voucers_table',1),
(16,'2019_02_16_064643_create_couriers_table',1),
(17,'2019_02_16_102028_create_notifications_table',1),
(18,'2019_02_16_103007_create_seller_notifications_table',1),
(19,'2019_02_16_103024_create_user_notifications_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `product_categories` */

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_categories` */

insert  into `product_categories`(`id`,`parent_id`,`category_name`,`created_at`,`updated_at`,`deleted_at`) values 
(1,0,'fashion pria','2019-03-22 15:14:46','2019-03-23 21:10:14',NULL),
(2,0,'fashion wanita',NULL,'2019-04-08 14:54:34',NULL),
(3,1,'baju pria','2019-04-19 07:28:36',NULL,NULL),
(4,2,'baju wanita','2019-04-19 15:17:39','2019-04-19 15:17:39',NULL),
(7,2,'1111','2019-04-19 15:30:16','2019-04-19 15:30:16',NULL),
(8,1,'celana','2019-04-22 17:03:57','2019-04-22 17:03:57',NULL);

/*Table structure for table `product_category_details` */

DROP TABLE IF EXISTS `product_category_details`;

CREATE TABLE `product_category_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_category_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_category_details_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `product_category_details` */

insert  into `product_category_details`(`id`,`product_id`,`category_id`,`created_at`,`updated_at`) values 
(17,16,1,'2019-04-19 12:55:26','2019-04-19 12:55:26'),
(18,17,1,'2019-04-19 13:15:06','2019-04-19 13:15:06'),
(19,18,1,'2019-04-19 16:54:53','2019-04-19 16:54:53'),
(20,18,3,'2019-04-19 16:54:53','2019-04-19 16:54:53'),
(28,25,1,'2019-04-20 21:30:32','2019-04-20 21:30:32'),
(29,27,1,'2019-04-22 17:09:24','2019-04-22 17:09:24'),
(30,27,2,'2019-04-22 17:09:24','2019-04-22 17:09:24'),
(31,27,3,'2019-04-22 17:09:24','2019-04-22 17:09:24'),
(32,28,1,'2019-04-24 12:07:16','2019-04-24 12:07:16'),
(33,28,3,'2019-04-24 12:07:16','2019-04-24 12:07:16'),
(34,29,1,'2019-04-24 12:46:32','2019-04-24 12:46:32'),
(35,29,2,'2019-04-24 12:46:32','2019-04-24 12:46:32'),
(36,30,1,'2019-04-24 12:48:35','2019-04-24 12:48:35'),
(37,30,3,'2019-04-24 12:48:35','2019-04-24 12:48:35'),
(38,30,2,'2019-04-24 12:48:35','2019-04-24 12:48:35'),
(39,30,4,'2019-04-24 12:48:35','2019-04-24 12:48:35');

/*Table structure for table `product_images` */

DROP TABLE IF EXISTS `product_images`;

CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_images` */

insert  into `product_images`(`id`,`product_id`,`image_name`,`created_at`,`updated_at`) values 
(15,16,'Kaos D copy.jpg','2019-04-19 12:55:28','2019-04-19 12:55:28'),
(16,17,'logobaru1.png','2019-04-19 13:15:09','2019-04-19 13:15:09'),
(17,18,'1544065493-cloths.png','2019-04-19 16:54:54','2019-04-19 16:54:54'),
(24,25,'aas.png','2019-04-20 21:30:32','2019-04-20 21:30:32'),
(25,25,'coming soon copy.JPG','2019-04-20 21:30:33','2019-04-20 21:30:33'),
(26,26,'b64795abd3cce097c6710e310d2ed4e6.png','2019-04-22 17:08:29','2019-04-22 17:08:29'),
(27,26,'db jaringan.png','2019-04-22 17:08:29','2019-04-22 17:08:29'),
(28,27,'download.png','2019-04-22 17:09:25','2019-04-22 17:09:25'),
(29,27,'facebook-f-letter-logo-logotype-256.png','2019-04-22 17:09:26','2019-04-22 17:09:26'),
(30,28,'night tee.jpg','2019-04-24 12:07:16','2019-04-24 12:07:16'),
(31,29,'paradise_blk.png','2019-04-24 12:46:33','2019-04-24 12:46:33'),
(32,30,'paradise.png','2019-04-24 12:48:36','2019-04-24 12:48:36');

/*Table structure for table `product_reviews` */

DROP TABLE IF EXISTS `product_reviews`;

CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `rate` int(1) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `rate_id` (`rate`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `product_reviews_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_reviews` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_rate` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`product_name`,`price`,`description`,`product_rate`,`created_at`,`updated_at`,`stock`,`deleted_at`) values 
(16,'Paradise Tee',99000,'1',NULL,'2019-04-19 12:55:26','2019-04-19 12:55:26',3,NULL),
(17,'soft',100000,'qw',NULL,'2019-04-19 13:15:06','2019-04-20 20:23:27',10,NULL),
(18,'widi',12,'asa',NULL,'2019-04-19 16:54:53','2019-04-19 16:54:53',1,NULL),
(25,'bop',123,'1',NULL,'2019-04-20 21:30:32','2019-04-20 21:30:32',1,NULL),
(26,'baju abu',100000,'baju baru',NULL,'2019-04-22 17:08:28','2019-04-22 17:08:28',10,NULL),
(27,'widiana',1000000,'10001',NULL,'2019-04-22 17:09:24','2019-04-22 17:09:50',11,'2019-04-22 17:09:50'),
(28,'night tee',160000,'ready',NULL,'2019-04-24 12:07:15','2019-04-24 12:07:15',12,NULL),
(29,'kain',1000000,'s',NULL,'2019-04-24 12:46:32','2019-04-24 12:46:32',19,NULL),
(30,'uta',100000,'1',NULL,'2019-04-24 12:48:35','2019-04-24 12:48:35',11,NULL);

/*Table structure for table `response` */

DROP TABLE IF EXISTS `response`;

CREATE TABLE `response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `response_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`),
  CONSTRAINT `response_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `response` */

/*Table structure for table `transaction_details` */

DROP TABLE IF EXISTS `transaction_details`;

CREATE TABLE `transaction_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` int(3) DEFAULT NULL,
  `selling_price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_transaction` (`transaction_id`),
  KEY `id_product` (`product_id`),
  CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transaction_details` */

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timeout` datetime NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regency` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(12,2) NOT NULL,
  `shipping_cost` double(12,2) NOT NULL,
  `sub_total` double(12,2) NOT NULL,
  `user_id` int(20) unsigned NOT NULL,
  `courier_id` int(10) unsigned NOT NULL,
  `proof_of_payment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('unverified','verified','delivered','success','expired') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courier_id` (`courier_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transactions` */

/*Table structure for table `user_notifications` */

DROP TABLE IF EXISTS `user_notifications`;

CREATE TABLE `user_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(11) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `user_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_notifications` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(3,'widiana','widianaputraw@gmail.com','NULL','NULL',NULL,'$2y$10$nlciOyj.CmRE6e4Yb9wO/usKmUqFarnoGDA/JRVLjRJ3CwemwKcLW',NULL,'2019-03-12 14:28:40','2019-03-12 14:28:40'),
(4,'widiana','wod@gmail.com','NULL','NULL',NULL,'$2y$10$JG7dQKPwyfKbWVm/awSnIud5mr4HZFV.5ZZ2m.7FqfSJ4nQs.yDRS',NULL,'2019-04-08 15:06:31','2019-04-08 15:06:31'),
(9,'widiana','widianaputraa1@gmail.com','NULL','NULL','2019-04-22 14:25:30','$2y$10$WeBoi6qHcIPWrCOnuKsqNOtStCbWfcbbWSjyyrPTNqhAfhM2cw0YG',NULL,'2019-04-22 14:24:31','2019-04-22 14:25:30'),
(10,'widiana','widianaputraa@gmail.com','NULL','NULL','2019-04-22 16:56:44','$2y$10$wjZXK3qpf0PBieye.r90a.gqtQcNDxxOGbtZ1y..hdi0qPv/VTVFq',NULL,'2019-04-22 16:34:59','2019-04-22 16:56:44'),
(11,'widiana','widianaputra77@gmail.com','NULL','NULL','2019-04-23 07:56:25','$2y$10$wrhTZCVVxsiNcjiklFk0B.ArMtNH3Zz0dI4bkPA/zEtoLcSC/iZau',NULL,'2019-04-23 07:56:13','2019-04-23 07:56:25');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
