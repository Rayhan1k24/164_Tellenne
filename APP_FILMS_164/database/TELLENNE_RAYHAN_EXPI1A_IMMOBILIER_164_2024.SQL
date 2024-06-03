-- OM 2021.02.17
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: tellenne_rayhan_expi1a_immobilier_164_2024

-- Destruction de la BD si elle existe.
-- Pour être certain d'avoir la dernière version des données

DROP DATABASE IF EXISTS tellenne_rayhan_expi1a_immobilier_164_2024;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS tellenne_rayhan_expi1a_immobilier_164_2024;

-- Utilisation de cette base de donnée

USE tellenne_rayhan_expi1a_immobilier_164_2024;
-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage de la structure de la base pour tellenne_rayhan_expi1a_immobilier
DROP DATABASE IF EXISTS `tellenne_rayhan_expi1a_immobilier_164_2024`;
CREATE DATABASE IF NOT EXISTS `tellenne_rayhan_expi1a_immobilier_164_2024` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tellenne_rayhan_expi1a_immobilier_164_2024`;

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier.t_agents
CREATE TABLE IF NOT EXISTS `t_agents` (
  `ID_agents` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prenom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `date_agents` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_agents`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_agents : ~5 rows (environ)
INSERT INTO `t_agents` (`ID_agents`, `nom`, `prenom`, `email`, `telephone`, `date_agents`) VALUES
    (1, 'Dupont', 'Jean', 'jean.dupont@example.com', '+33 6 12 34 56 78', '2024-04-25 13:20:27'),
    (2, 'Smith', 'Emily', 'emily.smith@example.com', '+1 555-123-4567', '2024-04-25 13:20:28'),
    (3, 'Garcia', 'Carlos', 'carlos.garcia@example.com', '+34 612 34 56 78', '2024-04-25 13:20:29'),
    (4, 'Müller', 'Anna', 'anna.muller@example.com', '+49 30 1234567', '2024-04-25 13:20:30'),
    (5, 'Kim', 'Min-Ji', 'minji.kim@example.com', '+82 10-1234-5678', '2024-04-25 13:20:31');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier.t_clients
DROP TABLE IF EXISTS `t_clients`;
CREATE TABLE IF NOT EXISTS `t_clients` (
  `ID_clients` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prenom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `date_clients` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_clients`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_clients : ~5 rows (environ)
INSERT INTO `t_clients` (`ID_clients`, `nom`, `prenom`, `email`, `telephone`, `date_clients`) VALUES
    (1, 'Dubois', 'François', 'francois.dubois@example.com', '+33 6 98 76 54 32', '2024-04-25 13:23:16'),
    (2, 'Johnson', 'Michael', 'michael.johnson@example.com', '+1 555-987-6543', '2024-04-25 13:23:17'),
    (3, 'Martinez', 'Maria', 'maria.martinez@example.com', '+34 645 98 76 54', '2024-04-25 13:23:18'),
    (4, 'Schmidt', 'Klaus', 'klaus.schmidt@example.com', '+49 176 98765432', '2024-04-25 13:23:19'),
    (5, 'Lee', 'Ji-Hyun', 'jihyun.lee@example.com', '+82 10-9876-5432', '2024-04-25 13:23:20');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier.t_mails
DROP TABLE IF EXISTS `t_mails`;
CREATE TABLE IF NOT EXISTS `t_mails` (
  `ID_mails` int NOT NULL AUTO_INCREMENT,
  `mails_priver` varchar(255) DEFAULT NULL,
  `mails_professionelle` varchar(255) DEFAULT NULL,
  `date_mails` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_mails`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_mails : ~5 rows (environ)
INSERT INTO `t_mails` (`ID_mails`, `mails_priver`, `mails_professionelle`, `date_mails`) VALUES
    (1, 'francois.dubois@gmail.com', 'jean.dupont@companyname.com', '2024-04-25 13:24:20'),
    (2, 'michael.johnson@yahoo.com', 'emily.smith@corporationinc.com', '2024-04-25 13:24:21'),
    (3, 'maria.martinez@hotmail.com', 'carlos.garica@consultingfirm.org', '2024-04-25 13:24:22'),
    (4, 'klaus.schmidt@outlook.com', 'anna.muller@lawfirmname.net', '2024-04-25 13:24:23'),
    (5, 'jihyun.lee@icloud.com', 'min-ji.kim@techstartup.biz', '2024-04-25 13:24:26');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier.t_genre
DROP TABLE IF EXISTS `t_genre`;
CREATE TABLE IF NOT EXISTS `t_genre` (
  `ID_genre` int NOT NULL AUTO_INCREMENT,
  `genre` varchar(20) DEFAULT NULL,
  `date_genre` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_genre : ~5 rows (environ)
INSERT INTO `t_genre` (`ID_genre`, `genre`, `date_genre`) VALUES
    (1, 'Maison', '2024-04-25 13:25:05'),
    (2, 'Appartement', '2024-04-25 13:25:06'),
    (3, 'Villa', '2024-04-25 13:25:07'),
    (4, 'Studio', '2024-04-25 13:25:08'),
    (5, 'Chalet', '2024-04-25 13:25:09');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier.t_film
DROP TABLE IF EXISTS `t_film`;
CREATE TABLE IF NOT EXISTS `t_film` (
  `ID_film` int NOT NULL AUTO_INCREMENT,
  `nom_film` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `date_film` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_film`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_film : ~5 rows (environ)
INSERT INTO `t_film` (`ID_film`, `nom_film`, `email`, `telephone`, `date_film`) VALUES
    (1, 'Dubois','francois.dubois@example.com', '+33 6 98 76 54 32', '2024-04-25 13:26:01'),
    (2, 'Johnson','michael.johnson@example.com', '+1 555-987-6543', '2024-04-25 13:26:04'),
    (3, 'Martinez','maria.martinez@example.com', '+34 645 98 76 54', '2024-04-25 13:26:05'),
    (4, 'Schmidt','klaus.schmidt@example.com', '+49 176 98765432', '2024-04-25 13:26:06'),
    (5, 'Lee','jihyun.lee@example.com', '+82 10-9876-5432', '2024-04-25 13:26:07');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier.t_genre_film
DROP TABLE IF EXISTS `t_genre_film`;
CREATE TABLE IF NOT EXISTS `t_genre_film` (
  `ID_genre_film` int NOT NULL AUTO_INCREMENT,
  `fk_genre_film` int DEFAULT NULL,
  `fk_film_genre` int DEFAULT NULL,
  `date_genre_film` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_genre_film`),
  KEY `FK_t_genre_t_film` (`fk_genre_film`),
  KEY `FK_t_film_t_genre` (`fk_film_genre`),
  CONSTRAINT `FK_t_genre_t_film` FOREIGN KEY (`fk_genre_film`) REFERENCES `t_genre` (`ID_genre`),
  CONSTRAINT `FK_t_film_t_genre` FOREIGN KEY (`fk_film_genre`) REFERENCES `t_film` (`ID_film`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insertion des données dans la table t_genre_film
INSERT INTO `t_genre_film` (`ID_genre_film`, `fk_genre_film`, `fk_film_genre`, `date_genre_film`) VALUES
    (1, 2, 2, '2024-04-25 11:27:24'),
    (2, 4, 4, '2024-04-25 11:27:24'),
    (3, 1, 1, '2024-04-25 11:27:25'),
    (4, 5, 5, '2024-04-25 11:27:25'),
    (5, 3, 3, '2024-04-25 11:27:26');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;