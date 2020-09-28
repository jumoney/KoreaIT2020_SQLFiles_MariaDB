-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.5-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- matzip 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `matzip` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `matzip`;

-- 테이블 matzip.c_code_d 구조 내보내기
CREATE TABLE IF NOT EXISTS `c_code_d` (
  `i_m` int(10) unsigned NOT NULL,
  `cd` int(10) unsigned NOT NULL,
  `val` varchar(15) NOT NULL,
  PRIMARY KEY (`i_m`,`cd`),
  CONSTRAINT `c_code_d_ibfk_1` FOREIGN KEY (`i_m`) REFERENCES `c_code_m` (`i_m`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 matzip.c_code_d:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `c_code_d` DISABLE KEYS */;
INSERT INTO `c_code_d` (`i_m`, `cd`, `val`) VALUES
	(1, 1, '분식\r\n'),
	(1, 2, '한식'),
	(1, 3, '야식'),
	(1, 4, '중식'),
	(1, 5, '양식'),
	(1, 6, '일식'),
	(1, 7, '카페/디저트'),
	(1, 8, '패스트푸드'),
	(1, 9, '아시안');
/*!40000 ALTER TABLE `c_code_d` ENABLE KEYS */;

-- 테이블 matzip.c_code_m 구조 내보내기
CREATE TABLE IF NOT EXISTS `c_code_m` (
  `i_m` int(10) unsigned NOT NULL,
  `desc` varchar(30) DEFAULT '',
  `cd_nm` varchar(20) DEFAULT '',
  PRIMARY KEY (`i_m`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 matzip.c_code_m:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `c_code_m` DISABLE KEYS */;
INSERT INTO `c_code_m` (`i_m`, `desc`, `cd_nm`) VALUES
	(1, '음식점카테고리', 'cd_restaurant');
/*!40000 ALTER TABLE `c_code_m` ENABLE KEYS */;

-- 테이블 matzip.t_restaurant 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_restaurant` (
  `i_rest` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nm` varchar(20) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `lat` double unsigned NOT NULL,
  `lng` double unsigned NOT NULL,
  `cd_category` int(10) unsigned NOT NULL,
  `i_user` int(10) unsigned NOT NULL COMMENT '등록자',
  `r_dt` datetime DEFAULT current_timestamp(),
  `m_dt` datetime DEFAULT current_timestamp(),
  `hits` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`i_rest`),
  KEY `i_user` (`i_user`),
  CONSTRAINT `t_restaurant_ibfk_1` FOREIGN KEY (`i_user`) REFERENCES `t_user` (`i_user`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 matzip.t_restaurant:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_restaurant` DISABLE KEYS */;
INSERT INTO `t_restaurant` (`i_rest`, `nm`, `addr`, `lat`, `lng`, `cd_category`, `i_user`, `r_dt`, `m_dt`, `hits`) VALUES
	(17, '우리나라밥', '대구 중구 달구벌대로 2109-4', 35.8657352420951, 128.594361856668, 2, 3, '2020-09-23 09:28:25', '2020-09-23 09:28:25', 0),
	(18, '석촌 토종돼지국밥', '대구 중구 달구벌대로 2125-12', 35.8656778674599, 128.596022107666, 2, 3, '2020-09-23 09:29:07', '2020-09-23 09:29:07', 1),
	(19, '한솥도시락 대구YMCA점 ', '대구 중구 중앙대로 375 1층', 35.8666458191459, 128.593161960781, 1, 4, '2020-09-23 09:31:32', '2020-09-23 09:31:32', 1),
	(21, '미진분식', '대구광역시 중구 동성로 6-1', 35.8674392585742, 128.594304217952, 1, 5, '2020-09-23 15:53:51', '2020-09-23 15:53:51', 1);
/*!40000 ALTER TABLE `t_restaurant` ENABLE KEYS */;

-- 테이블 matzip.t_restaurant_menu 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_restaurant_menu` (
  `i_rest` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `menu_pic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`i_rest`,`seq`),
  CONSTRAINT `t_restaurant_menu_ibfk_1` FOREIGN KEY (`i_rest`) REFERENCES `t_restaurant` (`i_rest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 matzip.t_restaurant_menu:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_restaurant_menu` DISABLE KEYS */;
INSERT INTO `t_restaurant_menu` (`i_rest`, `seq`, `menu_pic`) VALUES
	(18, 2, '52217a6e-8057-42f1-8336-6db62c6008ac.jpg'),
	(18, 3, 'f6ad737a-d45c-4080-8a15-f76313906ab2.jpg'),
	(18, 4, '1d0875f2-901b-4d38-8e09-bacd66c5a178.jpg'),
	(18, 5, '71fccf77-f0df-45fe-8413-16229e3d91e9.jpg'),
	(18, 6, '2cce4c92-2d19-4c9b-8a1a-268e0adeda0c.jpg');
/*!40000 ALTER TABLE `t_restaurant_menu` ENABLE KEYS */;

-- 테이블 matzip.t_restaurant_recommend_menu 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_restaurant_recommend_menu` (
  `i_rest` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `menu_nm` varchar(20) NOT NULL,
  `menu_price` int(10) unsigned NOT NULL,
  `menu_pic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`i_rest`,`seq`),
  CONSTRAINT `t_restaurant_recommend_menu_ibfk_1` FOREIGN KEY (`i_rest`) REFERENCES `t_restaurant` (`i_rest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 matzip.t_restaurant_recommend_menu:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_restaurant_recommend_menu` DISABLE KEYS */;
INSERT INTO `t_restaurant_recommend_menu` (`i_rest`, `seq`, `menu_nm`, `menu_price`, `menu_pic`) VALUES
	(18, 1, '순대국밥', 7500, 'dd9676dc-31da-4e7c-871c-f9f0c08c850f.jpg');
/*!40000 ALTER TABLE `t_restaurant_recommend_menu` ENABLE KEYS */;

-- 테이블 matzip.t_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_user` (
  `i_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `user_pw` varchar(70) NOT NULL,
  `salt` varchar(30) NOT NULL,
  `nm` varchar(5) NOT NULL,
  `profile_img` varchar(50) DEFAULT NULL,
  `r_dt` datetime DEFAULT current_timestamp(),
  `m_dt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`i_user`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 matzip.t_user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`i_user`, `user_id`, `user_pw`, `salt`, `nm`, `profile_img`, `r_dt`, `m_dt`) VALUES
	(3, 'jumoney15', '$2a$10$tVAKQrm2UGBd3uLCzUYa5u/ghK2HJnowbndTsXoUzP79AYZBsKmNi', '$2a$10$tVAKQrm2UGBd3uLCzUYa5u', '사공수기', NULL, '2020-09-23 09:26:24', '2020-09-23 09:26:24'),
	(4, 'jumoney16', '$2a$10$XipWeI67GTSJm34AEaKhdu8TwbgU78aoqxyFPl6cT7GGLY4qCzAUa', '$2a$10$XipWeI67GTSJm34AEaKhdu', '사공수기2', NULL, '2020-09-23 09:29:35', '2020-09-23 09:29:35'),
	(5, 'test11', '$2a$10$T2rG/.PK7e.M471FhQBuheVeN4N/OHKAy5I2I1Pj01E5e2fuMMtb6', '$2a$10$T2rG/.PK7e.M471FhQBuhe', '테스트', NULL, '2020-09-23 15:52:16', '2020-09-23 15:52:16');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

-- 테이블 matzip.t_user_favorite 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_user_favorite` (
  `i_rest` int(10) unsigned NOT NULL,
  `i_user` int(10) unsigned NOT NULL,
  `r_dt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`i_rest`,`i_user`),
  KEY `i_user` (`i_user`),
  CONSTRAINT `t_user_favorite_ibfk_1` FOREIGN KEY (`i_rest`) REFERENCES `t_restaurant` (`i_rest`),
  CONSTRAINT `t_user_favorite_ibfk_2` FOREIGN KEY (`i_user`) REFERENCES `t_user` (`i_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 matzip.t_user_favorite:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_user_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_favorite` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
