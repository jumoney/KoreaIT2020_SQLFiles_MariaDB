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

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 matzip.c_code_m 구조 내보내기
CREATE TABLE IF NOT EXISTS `c_code_m` (
  `i_m` int(10) unsigned NOT NULL,
  `desc` varchar(30) DEFAULT '',
  `cd_nm` varchar(20) DEFAULT '',
  PRIMARY KEY (`i_m`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

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

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 matzip.t_restaurant_menu 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_restaurant_menu` (
  `i_rest` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `menu_pic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`i_rest`,`seq`),
  CONSTRAINT `t_restaurant_menu_ibfk_1` FOREIGN KEY (`i_rest`) REFERENCES `t_restaurant` (`i_rest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

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

-- 내보낼 데이터가 선택되어 있지 않습니다.

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

-- 내보낼 데이터가 선택되어 있지 않습니다.

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

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
