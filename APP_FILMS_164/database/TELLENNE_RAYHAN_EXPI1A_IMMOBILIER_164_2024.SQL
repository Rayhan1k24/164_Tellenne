-- OM 2021.02.17
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: TELLENNE_RAYHAN_EXPI1A_IMMOBILIER

-- Destruction de la BD si elle existe.
-- Pour être certain d'avoir la dernière version des données

DROP DATABASE IF EXISTS TELLENNE_RAYHAN_EXPI1A_IMMOBILIER;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS TELLENNE_RAYHAN_EXPI1A_IMMOBILIER;

-- Utilisation de cette base de donnée

USE TELLENNE_RAYHAN_EXPI1A_IMMOBILIER;
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
DROP DATABASE IF EXISTS `tellenne_rayhan_expi1a_immobilier`;
CREATE DATABASE IF NOT EXISTS `tellenne_rayhan_expi1a_immobilier` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tellenne_rayhan_expi1a_immobilier`;

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_adresses
DROP TABLE IF EXISTS `t_adresses`;
CREATE TABLE IF NOT EXISTS `t_adresses` (
  `ID_adresses` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) NOT NULL DEFAULT '',
  `ville` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `code_postal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pays` varchar(100) DEFAULT NULL,
  `date_adresses` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_adresses`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_adresses : ~5 rows (environ)
INSERT INTO `t_adresses` (`ID_adresses`, `adresse`, `ville`, `code_postal`, `pays`) VALUES
	(1, '123 Avenue des Fleurs', 'Paris', '75001', 'France'),
	(2, '456 Main Street\r\n', 'New York', '10001', 'États-Unis'),
	(3, '789 Park Avenue', 'Londres', 'W1A 1AA', 'Royaume-Uni'),
	(4, '101 Rue du Commerce', 'Berlin', '10115', 'Allemagne'),
	(5, '555 Calle Principal', 'Madrid', '28001', 'Espagne');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_adresses_types_proprietes
DROP TABLE IF EXISTS `t_adresses_types_proprietes`;
CREATE TABLE IF NOT EXISTS `t_adresses_types_proprietes` (
  `ID_adresses_types_proprietes` int NOT NULL AUTO_INCREMENT,
  `fk_adresses_types_proprietes` int DEFAULT NULL,
  `fk_types_proprietes_adresses` int DEFAULT NULL,
  `date_types_proprietes_adresses` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_adresses_types_proprietes`),
  KEY `FK_t_adresses_types_proprietes_t_adresses` (`fk_adresses_types_proprietes`),
  KEY `FK_t_adresses_types_proprietes_t_types_proprietes` (`fk_types_proprietes_adresses`),
  CONSTRAINT `FK_t_adresses_types_proprietes_t_adresses` FOREIGN KEY (`fk_adresses_types_proprietes`) REFERENCES `t_adresses` (`ID_adresses`),
  CONSTRAINT `FK_t_adresses_types_proprietes_t_types_proprietes` FOREIGN KEY (`fk_types_proprietes_adresses`) REFERENCES `t_types_proprietes` (`ID_types_proprietes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_adresses_types_proprietes : ~5 rows (environ)
INSERT INTO `t_adresses_types_proprietes` (`ID_adresses_types_proprietes`, `fk_adresses_types_proprietes`, `fk_types_proprietes_adresses`, `date_types_proprietes_adresses`) VALUES
	(1, 1, 2, '2024-04-25 13:04:01'),
	(2, 4, 5, '2024-04-25 13:04:01'),
	(3, 2, 1, '2024-04-25 13:04:01'),
	(4, 5, 4, '2024-04-25 13:04:02'),
	(5, 3, 3, '2024-04-25 13:04:02');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_adresse_agences_immobilieres
DROP TABLE IF EXISTS `t_adresse_agences_immobilieres`;
CREATE TABLE IF NOT EXISTS `t_adresse_agences_immobilieres` (
  `ID_adresse_agences_immobilier` int NOT NULL AUTO_INCREMENT,
  `fk_adresses_agences_immobilieres` int DEFAULT NULL,
  `fk_agences_immobilieres_adresses` int DEFAULT NULL,
  `date_agences_immobilieres_adresses` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_adresse_agences_immobilier`),
  KEY `FK_t_adresse_agences_immobilieres_t_adresses` (`fk_adresses_agences_immobilieres`),
  KEY `FK_t_adresse_agences_immobilieres_t_agences_immobilieres` (`fk_agences_immobilieres_adresses`),
  CONSTRAINT `FK_t_adresse_agences_immobilieres_t_adresses` FOREIGN KEY (`fk_adresses_agences_immobilieres`) REFERENCES `t_adresses` (`ID_adresses`),
  CONSTRAINT `FK_t_adresse_agences_immobilieres_t_agences_immobilieres` FOREIGN KEY (`fk_agences_immobilieres_adresses`) REFERENCES `t_agences_immobilieres` (`ID_agences_immobilieres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_adresse_agences_immobilieres : ~5 rows (environ)
INSERT INTO `t_adresse_agences_immobilieres` (`ID_adresse_agences_immobilier`, `fk_adresses_agences_immobilieres`, `fk_agences_immobilieres_adresses`, `date_agences_immobilieres_adresses`) VALUES
	(1, 4, 4, '2024-04-25 11:31:14'),
	(2, 1, 2, '2024-04-25 11:31:14'),
	(3, 2, 1, '2024-04-25 11:31:15'),
	(4, 5, 3, '2024-04-25 11:31:15'),
	(5, 3, 5, '2024-04-25 11:31:16');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_adresse_agents
DROP TABLE IF EXISTS `t_adresse_agents`;
CREATE TABLE IF NOT EXISTS `t_adresse_agents` (
  `ID_adresses_agents` int NOT NULL AUTO_INCREMENT,
  `fk_adresses_agents` int DEFAULT NULL,
  `fk_agents_adresses` int DEFAULT NULL,
  `date_agents_adresses` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_adresses_agents`) USING BTREE,
  KEY `FK_t_adresse_agents_t_adresses` (`fk_adresses_agents`),
  KEY `FK_t_adresse_agents_t_agents` (`fk_agents_adresses`),
  CONSTRAINT `FK_t_adresse_agents_t_adresses` FOREIGN KEY (`fk_adresses_agents`) REFERENCES `t_adresses` (`ID_adresses`),
  CONSTRAINT `FK_t_adresse_agents_t_agents` FOREIGN KEY (`fk_agents_adresses`) REFERENCES `t_agents` (`ID_agents`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_adresse_agents : ~5 rows (environ)
INSERT INTO `t_adresse_agents` (`ID_adresses_agents`, `fk_adresses_agents`, `fk_agents_adresses`, `date_agents_adresses`) VALUES
	(1, 4, 1, '2024-04-24 18:15:03'),
	(2, 1, 3, '2024-04-24 18:15:03'),
	(3, 2, 5, '2024-04-24 18:15:04'),
	(4, 5, 4, '2024-04-24 18:15:04'),
	(5, 3, 2, '2024-04-24 18:15:05');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_adresse_clients
DROP TABLE IF EXISTS `t_adresse_clients`;
CREATE TABLE IF NOT EXISTS `t_adresse_clients` (
  `ID_adresse_clients` int NOT NULL AUTO_INCREMENT,
  `fk_adresses_clients` int DEFAULT NULL,
  `fk_clients_adresses` int DEFAULT NULL,
  `date_clients_adresses` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_adresse_clients`),
  KEY `FK_t_adresse_clients_t_adresses` (`fk_adresses_clients`),
  KEY `FK_t_adresse_clients_t_clients` (`fk_clients_adresses`),
  CONSTRAINT `FK_t_adresse_clients_t_adresses` FOREIGN KEY (`fk_adresses_clients`) REFERENCES `t_adresses` (`ID_adresses`),
  CONSTRAINT `FK_t_adresse_clients_t_clients` FOREIGN KEY (`fk_clients_adresses`) REFERENCES `t_clients` (`ID_clients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_adresse_clients : ~5 rows (environ)
INSERT INTO `t_adresse_clients` (`ID_adresse_clients`, `fk_adresses_clients`, `fk_clients_adresses`, `date_clients_adresses`) VALUES
	(1, 4, 2, '2024-04-24 18:15:35'),
	(2, 1, 4, '2024-04-24 18:15:36'),
	(3, 2, 1, '2024-04-24 18:15:36'),
	(4, 5, 5, '2024-04-24 18:15:37'),
	(5, 3, 3, '2024-04-24 18:15:37');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_adresse_proprietes
DROP TABLE IF EXISTS `t_adresse_proprietes`;
CREATE TABLE IF NOT EXISTS `t_adresse_proprietes` (
  `ID_adresse_proprietes` int NOT NULL AUTO_INCREMENT,
  `fk_adresses_proprietes` int DEFAULT NULL,
  `fk_proprietes_adresses` int DEFAULT NULL,
  `date_proprietes_adresses` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_adresse_proprietes`),
  KEY `FK_t_adresse_proprietes_t_adresses` (`fk_adresses_proprietes`),
  KEY `FK_t_adresse_proprietes_t_proprietes` (`fk_proprietes_adresses`),
  CONSTRAINT `FK_t_adresse_proprietes_t_adresses` FOREIGN KEY (`fk_adresses_proprietes`) REFERENCES `t_adresses` (`ID_adresses`),
  CONSTRAINT `FK_t_adresse_proprietes_t_proprietes` FOREIGN KEY (`fk_proprietes_adresses`) REFERENCES `t_proprietes` (`ID_propriete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_adresse_proprietes : ~5 rows (environ)
INSERT INTO `t_adresse_proprietes` (`ID_adresse_proprietes`, `fk_adresses_proprietes`, `fk_proprietes_adresses`, `date_proprietes_adresses`) VALUES
	(1, 4, 4, '2024-04-25 12:53:49'),
	(2, 1, 1, '2024-04-25 12:53:49'),
	(3, 2, 5, '2024-04-25 12:53:49'),
	(4, 4, 2, '2024-04-25 12:53:50'),
	(5, 3, 3, '2024-04-25 12:53:50');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_agences_immobilieres
DROP TABLE IF EXISTS `t_agences_immobilieres`;
CREATE TABLE IF NOT EXISTS `t_agences_immobilieres` (
  `ID_agences_immobilieres` int NOT NULL AUTO_INCREMENT,
  `nom_agence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `code_postal` varchar(20) DEFAULT NULL,
  `pays` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site_web` varchar(255) DEFAULT NULL,
  `date_agences_immobilieres` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_agences_immobilieres`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_agences_immobilieres : ~5 rows (environ)
INSERT INTO `t_agences_immobilieres` (`ID_agences_immobilieres`, `nom_agence`, `adresse`, `ville`, `code_postal`, `pays`, `telephone`, `email`, `site_web`) VALUES
	(1, 'Immo Prestige', '123 Avenue des Roses', 'Paris', '75001', 'France', '+33 1 23 45 67 89', 'contact@immoprestige.com', 'www.immoprestige.com'),
	(2, 'Dream Homes', '456 Main Street', 'New York', ' 10001', ' États-Unis', '+1 212-555-1234', 'info@dreamhomes.com', 'www.dreamhomes.com'),
	(3, 'Prime Properties', '789 Park Avenue', ' Londres', 'W1A 1AA', 'Royaume-Uni', '+44 20 1234 5678', 'sales@primeproperties.co.uk', ' www.primeproperties.co.uk'),
	(4, 'City Living Realty', '101 Rue du Commerce', 'Berlin', '10115', ' Allemagne', '+49 30 1234567', 'info@citylivingrealty.de', 'www.citylivingrealty.de'),
	(5, 'Soluciones Inmobiliarias', '555 Calle Principal', 'Madrid', '28001', 'Espagne', '+34 91 234 5678', 'contacto@solucionesinmobiliarias.es', 'www.solucionesinmobiliarias.es');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_agences_immobilieres_mails
DROP TABLE IF EXISTS `t_agences_immobilieres_mails`;
CREATE TABLE IF NOT EXISTS `t_agences_immobilieres_mails` (
  `ID_agences_immobiliers_mail` int NOT NULL AUTO_INCREMENT,
  `fk_agences_immobilieres_mails` int DEFAULT NULL,
  `fk_mails_agences_immobilieres` int DEFAULT NULL,
  `date_mails_agences_immobilieres` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_agences_immobiliers_mail`),
  KEY `FK_t_agences_immobilieres_t_mails` (`fk_agences_immobilieres_mails`),
  KEY `FK_t_mails_t_agences_immobilieres` (`fk_mails_agences_immobilieres`),
  CONSTRAINT `FK_t_agences_immobilieres_t_mails` FOREIGN KEY (`fk_agences_immobilieres_mails`) REFERENCES `t_agences_immobilieres` (`ID_agences_immobilieres`),
  CONSTRAINT `FK_t_mails_t_agences_immobilieres` FOREIGN KEY (`fk_mails_agences_immobilieres`) REFERENCES `t_mails` (`ID_mails`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_agences_immobilieres_mails : ~5 rows (environ)
INSERT INTO `t_agences_immobilieres_mails` (`ID_agences_immobiliers_mail`, `fk_agences_immobilieres_mails`, `fk_mails_agences_immobilieres`, `date_mails_agences_immobilieres`) VALUES
	(1, 4, 4, '2024-04-25 11:32:40'),
	(2, 2, 3, '2024-04-25 11:32:40'),
	(3, 1, 2, '2024-04-25 11:32:41'),
	(4, 3, 5, '2024-04-25 11:32:41'),
	(5, 5, 1, '2024-04-25 11:32:42');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_agences_immobilieres_numeros
DROP TABLE IF EXISTS `t_agences_immobilieres_numeros`;
CREATE TABLE IF NOT EXISTS `t_agences_immobilieres_numeros` (
  `ID_agences_immobiliers_numero` int NOT NULL AUTO_INCREMENT,
  `fk_agences_immobilieres_numeros` int DEFAULT NULL,
  `fk_numeros_agences_immobilieres` int DEFAULT NULL,
  `date_numeros_agences_immobilieres` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_agences_immobiliers_numero`),
  KEY `FK_t_agences_immobilieres_t_numeros` (`fk_agences_immobilieres_numeros`),
  KEY `FK_t_numeros_t_agences_immobilieres` (`fk_numeros_agences_immobilieres`),
  CONSTRAINT `FK_t_agences_immobilieres_t_numeros` FOREIGN KEY (`fk_agences_immobilieres_numeros`) REFERENCES `t_agences_immobilieres` (`ID_agences_immobilieres`),
  CONSTRAINT `FK_t_numeros_t_agences_immobilieres` FOREIGN KEY (`fk_numeros_agences_immobilieres`) REFERENCES `t_numeros` (`ID_numeros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_agences_immobilieres_numeros : ~5 rows (environ)
INSERT INTO `t_agences_immobilieres_numeros` (`ID_agences_immobiliers_numero`, `fk_agences_immobilieres_numeros`, `fk_numeros_agences_immobilieres`, `date_numeros_agences_immobilieres`) VALUES
	(1, 4, 1, '2024-04-25 13:05:13'),
	(2, 2, 4, '2024-04-25 13:05:13'),
	(3, 1, 3, '2024-04-25 13:05:14'),
	(4, 3, 5, '2024-04-25 13:05:14'),
	(5, 5, 2, '2024-04-25 13:05:15');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_agences_immobilieres_proprietes
DROP TABLE IF EXISTS `t_agences_immobilieres_proprietes`;
CREATE TABLE IF NOT EXISTS `t_agences_immobilieres_proprietes` (
  `ID_agences_immobilieres_proprietes` int NOT NULL AUTO_INCREMENT,
  `fk_agences_immobilieres_proprietes` int DEFAULT NULL,
  `fk_proprietes_agences_immoobilieres` int DEFAULT NULL,
  `date_proprietes_agences_immobilieres` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_agences_immobilieres_proprietes`) USING BTREE,
  KEY `FK_t_agences_immobilieres_t_proprietes` (`fk_agences_immobilieres_proprietes`),
  KEY `FK_t_proprietes_t_agences_immobilieres` (`fk_proprietes_agences_immoobilieres`),
  CONSTRAINT `FK_t_agences_immobilieres_t_proprietes` FOREIGN KEY (`fk_agences_immobilieres_proprietes`) REFERENCES `t_agences_immobilieres` (`ID_agences_immobilieres`),
  CONSTRAINT `FK_t_proprietes_t_agences_immobilieres` FOREIGN KEY (`fk_proprietes_agences_immoobilieres`) REFERENCES `t_proprietes` (`ID_propriete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_agences_immobilieres_proprietes : ~5 rows (environ)
INSERT INTO `t_agences_immobilieres_proprietes` (`ID_agences_immobilieres_proprietes`, `fk_agences_immobilieres_proprietes`, `fk_proprietes_agences_immoobilieres`, `date_proprietes_agences_immobilieres`) VALUES
	(1, 4, 4, '2024-04-25 13:05:51'),
	(2, 2, 1, '2024-04-25 13:05:51'),
	(3, 1, 5, '2024-04-25 13:05:52'),
	(4, 3, 2, '2024-04-25 13:05:52'),
	(5, 5, 3, '2024-04-25 13:05:53');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_agents
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
INSERT INTO `t_agents` (`ID_agents`, `nom`, `prenom`, `email`, `telephone`) VALUES
	(1, 'Dupont', 'Jean', 'jean.dupont@example.com', '+33 6 12 34 56 78'),
	(2, 'Smith', 'Emily', 'emily.smith@example.com', '+1 555-123-4567'),
	(3, 'Garcia', 'Carlos', ' carlos.garcia@example.com', '+34 612 34 56 78'),
	(4, 'Müller', 'Anna', 'anna.muller@example.com', ' +49 30 1234567'),
	(5, 'Kim', 'Min-Ji', 'minji.kim@example.com', '+82 10-1234-5678');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_agents_mails
DROP TABLE IF EXISTS `t_agents_mails`;
CREATE TABLE IF NOT EXISTS `t_agents_mails` (
  `ID_agents_mails` int NOT NULL AUTO_INCREMENT,
  `fk_agents_mails` int DEFAULT NULL,
  `fk_mails_agents` int DEFAULT NULL,
  `date_mails_agents` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_agents_mails`),
  KEY `FK_t_agents_t_mails` (`fk_agents_mails`),
  KEY `FK_t_mails_t_agents` (`fk_mails_agents`),
  CONSTRAINT `FK_t_agents_t_mails` FOREIGN KEY (`fk_agents_mails`) REFERENCES `t_agents` (`ID_agents`),
  CONSTRAINT `FK_t_mails_t_agents` FOREIGN KEY (`fk_mails_agents`) REFERENCES `t_mails` (`ID_mails`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_agents_mails : ~5 rows (environ)
INSERT INTO `t_agents_mails` (`ID_agents_mails`, `fk_agents_mails`, `fk_mails_agents`, `date_mails_agents`) VALUES
	(1, 1, 1, '2024-04-25 11:25:56'),
	(2, 3, 3, '2024-04-25 11:25:57'),
	(3, 5, 5, '2024-04-25 11:25:57'),
	(4, 4, 4, '2024-04-25 11:25:58'),
	(5, 2, 2, '2024-04-25 11:25:59');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_agents_numeros
DROP TABLE IF EXISTS `t_agents_numeros`;
CREATE TABLE IF NOT EXISTS `t_agents_numeros` (
  `ID_agents_numeros` int NOT NULL AUTO_INCREMENT,
  `fk_agents_numeros` int DEFAULT NULL,
  `fk_numeros_agents` int DEFAULT NULL,
  `date_numeros_agents` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_agents_numeros`),
  KEY `FK_t_agents_t_numeros` (`fk_agents_numeros`),
  KEY `FK_t_numeros_t_agents` (`fk_numeros_agents`),
  CONSTRAINT `FK_t_agents_t_numeros` FOREIGN KEY (`fk_agents_numeros`) REFERENCES `t_agents` (`ID_agents`),
  CONSTRAINT `FK_t_numeros_t_agents` FOREIGN KEY (`fk_numeros_agents`) REFERENCES `t_numeros` (`ID_numeros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_agents_numeros : ~5 rows (environ)
INSERT INTO `t_agents_numeros` (`ID_agents_numeros`, `fk_agents_numeros`, `fk_numeros_agents`, `date_numeros_agents`) VALUES
	(1, 3, 3, '2024-04-25 13:18:35'),
	(2, 1, 1, '2024-04-25 13:18:35'),
	(3, 5, 5, '2024-04-25 13:18:36'),
	(4, 4, 4, '2024-04-25 13:18:37'),
	(5, 2, 2, '2024-04-25 13:18:37');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_agents_proprietes
DROP TABLE IF EXISTS `t_agents_proprietes`;
CREATE TABLE IF NOT EXISTS `t_agents_proprietes` (
  `ID_agents_propriete` int NOT NULL AUTO_INCREMENT,
  `fk_agents_proprietes` int DEFAULT NULL,
  `fk_proprietes_agents` int DEFAULT NULL,
  `date_proprietes_agents` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_agents_propriete`) USING BTREE,
  KEY `agent_id` (`fk_agents_proprietes`) USING BTREE,
  KEY `propriete_id` (`fk_proprietes_agents`) USING BTREE,
  CONSTRAINT `FK_t_agents_t_proprietes` FOREIGN KEY (`fk_agents_proprietes`) REFERENCES `t_agents` (`ID_agents`),
  CONSTRAINT `FK_t_proprietes_t_agents` FOREIGN KEY (`fk_proprietes_agents`) REFERENCES `t_proprietes` (`ID_propriete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_agents_proprietes : ~5 rows (environ)
INSERT INTO `t_agents_proprietes` (`ID_agents_propriete`, `fk_agents_proprietes`, `fk_proprietes_agents`, `date_proprietes_agents`) VALUES
	(1, 1, 4, '2024-04-25 11:26:47'),
	(2, 3, 1, '2024-04-25 11:26:47'),
	(3, 5, 5, '2024-04-25 11:26:47'),
	(4, 4, 2, '2024-04-25 11:26:48'),
	(5, 2, 3, '2024-04-25 11:26:49');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_clients
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
INSERT INTO `t_clients` (`ID_clients`, `nom`, `prenom`, `email`, `telephone`) VALUES
	(1, 'Dubois', 'François', 'francois.dubois@example.com', '+33 6 98 76 54 32'),
	(2, ' Johnson', 'Michael', 'michael.johnson@example.com', '+1 555-987-6543'),
	(3, 'Martinez', 'Maria', 'maria.martinez@example.com', ' +34 645 98 76 54'),
	(4, ' Schmidt', 'Klaus', 'klaus.schmidt@example.com', ' +49 176 98765432'),
	(5, 'Lee', ' Ji-Hyun', ' jihyun.lee@example.com', '+82 10-9876-5432');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_clients_mails
DROP TABLE IF EXISTS `t_clients_mails`;
CREATE TABLE IF NOT EXISTS `t_clients_mails` (
  `ID_clients_mails` int NOT NULL AUTO_INCREMENT,
  `fk_clients_mails` int DEFAULT NULL,
  `fk_mails_clients` int DEFAULT NULL,
  `date_mails_clients` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_clients_mails`),
  KEY `FK_t_clients_t_mails` (`fk_clients_mails`),
  KEY `FK_t_mails_t_clients` (`fk_mails_clients`),
  CONSTRAINT `FK_t_clients_t_mails` FOREIGN KEY (`fk_clients_mails`) REFERENCES `t_clients` (`ID_clients`),
  CONSTRAINT `FK_t_mails_t_clients` FOREIGN KEY (`fk_mails_clients`) REFERENCES `t_mails` (`ID_mails`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_clients_mails : ~5 rows (environ)
INSERT INTO `t_clients_mails` (`ID_clients_mails`, `fk_clients_mails`, `fk_mails_clients`, `date_mails_clients`) VALUES
	(1, 2, 2, '2024-04-25 11:27:24'),
	(2, 4, 4, '2024-04-25 11:27:24'),
	(3, 1, 1, '2024-04-25 11:27:25'),
	(4, 5, 5, '2024-04-25 11:27:25'),
	(5, 3, 3, '2024-04-25 11:27:26');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_clients_numeros
DROP TABLE IF EXISTS `t_clients_numeros`;
CREATE TABLE IF NOT EXISTS `t_clients_numeros` (
  `ID_clients_numero` int NOT NULL AUTO_INCREMENT,
  `fk_clients_numeros` int DEFAULT NULL,
  `fk_numeros_clients` int DEFAULT NULL,
  `date_numeros_clients` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_clients_numero`),
  KEY `FK_t_clients_t_numeros` (`fk_clients_numeros`),
  KEY `FK_t_numeros_t_clients` (`fk_numeros_clients`),
  CONSTRAINT `FK_t_clients_t_numeros` FOREIGN KEY (`fk_clients_numeros`) REFERENCES `t_clients` (`ID_clients`),
  CONSTRAINT `FK_t_numeros_t_clients` FOREIGN KEY (`fk_numeros_clients`) REFERENCES `t_numeros` (`ID_numeros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_clients_numeros : ~5 rows (environ)
INSERT INTO `t_clients_numeros` (`ID_clients_numero`, `fk_clients_numeros`, `fk_numeros_clients`, `date_numeros_clients`) VALUES
	(1, 2, 2, '2024-04-25 11:27:45'),
	(2, 4, 4, '2024-04-25 11:27:45'),
	(3, 1, 1, '2024-04-25 11:27:46'),
	(4, 5, 5, '2024-04-25 11:27:47'),
	(5, 3, 3, '2024-04-25 11:27:48');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_clients_proprietes
DROP TABLE IF EXISTS `t_clients_proprietes`;
CREATE TABLE IF NOT EXISTS `t_clients_proprietes` (
  `ID_clients_propriete` int NOT NULL AUTO_INCREMENT,
  `fk_clients_proprietes` int DEFAULT NULL,
  `fk_proprietes_clients` int DEFAULT NULL,
  `date_proprietes_clients` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_clients_propriete`) USING BTREE,
  KEY `client_id` (`fk_clients_proprietes`) USING BTREE,
  KEY `propriete_id` (`fk_proprietes_clients`) USING BTREE,
  CONSTRAINT `FK_t_clients_t_proprietes` FOREIGN KEY (`fk_clients_proprietes`) REFERENCES `t_clients` (`ID_clients`),
  CONSTRAINT `FK_t_proprietes_t_clients` FOREIGN KEY (`fk_proprietes_clients`) REFERENCES `t_proprietes` (`ID_propriete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_clients_proprietes : ~5 rows (environ)
INSERT INTO `t_clients_proprietes` (`ID_clients_propriete`, `fk_clients_proprietes`, `fk_proprietes_clients`, `date_proprietes_clients`) VALUES
	(1, 2, 4, '2024-04-25 11:28:13'),
	(2, 4, 1, '2024-04-25 11:28:14'),
	(3, 1, 5, '2024-04-25 11:28:14'),
	(4, 5, 2, '2024-04-25 11:28:14'),
	(5, 3, 3, '2024-04-25 11:28:15');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_mails
DROP TABLE IF EXISTS `t_mails`;
CREATE TABLE IF NOT EXISTS `t_mails` (
  `ID_mails` int NOT NULL AUTO_INCREMENT,
  `mails_priver` varchar(255) DEFAULT NULL,
  `mails_professionelle` varchar(255) DEFAULT NULL,
  `date_mails` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_mails`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_mails : ~5 rows (environ)
INSERT INTO `t_mails` (`ID_mails`, `mails_priver`, `mails_professionelle`) VALUES
	(1, 'francois.dubois@gmail.com', 'jean.dupont@companyname.com'),
	(2, 'michael.johnson@yahoo.com', 'emily.smith@corporationinc.com'),
	(3, 'maria.martinez@hotmail.com', 'carlos.garica@consultingfirm.org'),
	(4, 'klaus.schmidt@outlook.com', 'anna.müller@lawfirmname.net'),
	(5, ' jihyun.lee@icloud.com', 'min-ji.kim@techstartup.biz');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_numeros
DROP TABLE IF EXISTS `t_numeros`;
CREATE TABLE IF NOT EXISTS `t_numeros` (
  `ID_numeros` int NOT NULL AUTO_INCREMENT,
  `numero_priver` varchar(20) DEFAULT NULL,
  `numeros_professionelle` varchar(20) DEFAULT NULL,
  `date_numeros` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_numeros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_numeros : ~5 rows (environ)
INSERT INTO `t_numeros` (`ID_numeros`, `numero_priver`, `numeros_professionelle`) VALUES
	(1, '+33 6 12 34 56 78', '(555) 555-1000'),
	(2, '+1 555-123-4567', '(555) 555-2000'),
	(3, '+34 612 34 56 78', '(555) 555-3000'),
	(4, ' +49 30 1234567', '(555) 555-4000'),
	(5, '+82 10-1234-5678', '(555) 555-5000');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_proprietes
DROP TABLE IF EXISTS `t_proprietes`;
CREATE TABLE IF NOT EXISTS `t_proprietes` (
  `ID_propriete` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `code_postal` varchar(20) DEFAULT NULL,
  `pays` varchar(100) DEFAULT NULL,
  `date_proprietes` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_propriete`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_proprietes : ~5 rows (environ)
INSERT INTO `t_proprietes` (`ID_propriete`, `adresse`, `ville`, `code_postal`, `pays`) VALUES
	(1, '123 Rue de la Liberté', 'Paris', '75001', 'France'),
	(2, '456 Avenue des Roses', 'New York', '10001', 'États-Unis'),
	(3, '789 Chemin du Soleil', 'Londres', 'SW1A 1AA', 'Royaume-Uni'),
	(4, '1010 Rue Principale', 'Tokyo', '100-0001', 'Japon'),
	(5, '222 Boulevard de l\'Étoile', 'Sydney', '2000', 'Australie');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_proprietes_statuts
DROP TABLE IF EXISTS `t_proprietes_statuts`;
CREATE TABLE IF NOT EXISTS `t_proprietes_statuts` (
  `ID_proprietes_statuts` int NOT NULL AUTO_INCREMENT,
  `fk_proprietes_statuts` int DEFAULT NULL,
  `fk_statuts_proprietes` int DEFAULT NULL,
  `date_statuts_proprietes` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_proprietes_statuts`) USING BTREE,
  KEY `FK_t_proprietes_t_statuts` (`fk_proprietes_statuts`),
  KEY `FK_t_statuts_t_proprietes` (`fk_statuts_proprietes`),
  CONSTRAINT `FK_t_proprietes_t_statuts` FOREIGN KEY (`fk_proprietes_statuts`) REFERENCES `t_proprietes` (`ID_propriete`),
  CONSTRAINT `FK_t_statuts_t_proprietes` FOREIGN KEY (`fk_statuts_proprietes`) REFERENCES `t_statuts` (`ID_statuts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_proprietes_statuts : ~5 rows (environ)
INSERT INTO `t_proprietes_statuts` (`ID_proprietes_statuts`, `fk_proprietes_statuts`, `fk_statuts_proprietes`, `date_statuts_proprietes`) VALUES
	(1, 4, 3, '2024-04-25 13:23:52'),
	(2, 1, 1, '2024-04-25 13:23:53'),
	(3, 5, 2, '2024-04-25 13:23:53'),
	(4, 2, 5, '2024-04-25 13:23:54'),
	(5, 3, 4, '2024-04-25 13:23:55');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_proprietes_types_proprietes
DROP TABLE IF EXISTS `t_proprietes_types_proprietes`;
CREATE TABLE IF NOT EXISTS `t_proprietes_types_proprietes` (
  `ID_proprietes_types_proprietes` int NOT NULL AUTO_INCREMENT,
  `fk_proprietes_types_proprietes` int DEFAULT NULL,
  `fk_types_proprietes_proprietes` int DEFAULT NULL,
  `date_types_proprietes_proprietes` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_proprietes_types_proprietes`),
  KEY `FK_t_proprietes_t_types_proprietes` (`fk_proprietes_types_proprietes`),
  KEY `FK_t_types_proprietes_t_proprietes` (`fk_types_proprietes_proprietes`),
  CONSTRAINT `FK_t_proprietes_t_types_proprietes` FOREIGN KEY (`fk_proprietes_types_proprietes`) REFERENCES `t_proprietes` (`ID_propriete`),
  CONSTRAINT `FK_t_types_proprietes_t_proprietes` FOREIGN KEY (`fk_types_proprietes_proprietes`) REFERENCES `t_types_proprietes` (`ID_types_proprietes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_proprietes_types_proprietes : ~5 rows (environ)
INSERT INTO `t_proprietes_types_proprietes` (`ID_proprietes_types_proprietes`, `fk_proprietes_types_proprietes`, `fk_types_proprietes_proprietes`, `date_types_proprietes_proprietes`) VALUES
	(1, 4, 2, '2024-04-25 13:24:25'),
	(2, 1, 5, '2024-04-25 13:24:26'),
	(3, 5, 1, '2024-04-25 13:24:26'),
	(4, 2, 4, '2024-04-25 13:24:27'),
	(5, 3, 3, '2024-04-25 13:24:27');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_statuts
DROP TABLE IF EXISTS `t_statuts`;
CREATE TABLE IF NOT EXISTS `t_statuts` (
  `ID_statuts` int NOT NULL AUTO_INCREMENT,
  `nom_statut` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_statuts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_statuts`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_statuts : ~5 rows (environ)
INSERT INTO `t_statuts` (`ID_statuts`, `nom_statut`) VALUES
	(1, 'En attente de traitement'),
	(2, 'En cours d\'examen'),
	(3, 'Approuvé'),
	(4, 'Rejeté'),
	(5, 'En cours de développement');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_types_proprietes
DROP TABLE IF EXISTS `t_types_proprietes`;
CREATE TABLE IF NOT EXISTS `t_types_proprietes` (
  `ID_types_proprietes` int NOT NULL AUTO_INCREMENT,
  `nom_types_proprietes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_types_proprietes` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_types_proprietes`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_types_proprietes : ~5 rows (environ)
INSERT INTO `t_types_proprietes` (`ID_types_proprietes`, `nom_types_proprietes`) VALUES
	(1, 'Maison'),
	(2, 'Appartement'),
	(3, 'Villa'),
	(4, 'Studio'),
	(5, 'Chalet');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_types_proprietes_agences_immobilieres
DROP TABLE IF EXISTS `t_types_proprietes_agences_immobilieres`;
CREATE TABLE IF NOT EXISTS `t_types_proprietes_agences_immobilieres` (
  `ID_types_proprietes_agences_immobilieres` int NOT NULL AUTO_INCREMENT,
  `fk_types_proprietes_agences_immobilieres` int DEFAULT NULL,
  `fk_agences_immobilieres_types_proprietes` int DEFAULT NULL,
  `date_agences_immobilieres_types_proprietes` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_types_proprietes_agences_immobilieres`),
  KEY `FK_t_types_proprietes_t_agences_immobilieres` (`fk_types_proprietes_agences_immobilieres`),
  KEY `FK_t_agences_immobilieres_t_types_proprietes` (`fk_agences_immobilieres_types_proprietes`),
  CONSTRAINT `FK_t_agences_immobilieres_t_types_proprietes` FOREIGN KEY (`fk_agences_immobilieres_types_proprietes`) REFERENCES `t_agences_immobilieres` (`ID_agences_immobilieres`),
  CONSTRAINT `FK_t_types_proprietes_t_agences_immobilieres` FOREIGN KEY (`fk_types_proprietes_agences_immobilieres`) REFERENCES `t_types_proprietes` (`ID_types_proprietes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_types_proprietes_agences_immobilieres : ~5 rows (environ)
INSERT INTO `t_types_proprietes_agences_immobilieres` (`ID_types_proprietes_agences_immobilieres`, `fk_types_proprietes_agences_immobilieres`, `fk_agences_immobilieres_types_proprietes`, `date_agences_immobilieres_types_proprietes`) VALUES
	(1, 2, 4, '2024-04-25 13:25:05'),
	(2, 5, 2, '2024-04-25 13:25:06'),
	(3, 1, 1, '2024-04-25 13:25:06'),
	(4, 4, 3, '2024-04-25 13:25:07'),
	(5, 3, 5, '2024-04-25 13:25:07');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_types_proprietes_clients
DROP TABLE IF EXISTS `t_types_proprietes_clients`;
CREATE TABLE IF NOT EXISTS `t_types_proprietes_clients` (
  `ID_types_proprietes_clients` int NOT NULL AUTO_INCREMENT,
  `fk_types_proprietes_clients` int DEFAULT NULL,
  `fk_clients_types_proprietes` int DEFAULT NULL,
  `date_clients_types_proprietes` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_types_proprietes_clients`),
  KEY `FK_t_types_proprietes_t_clients` (`fk_clients_types_proprietes`),
  KEY `FK_t_clients_t_types_proprietes` (`fk_types_proprietes_clients`),
  CONSTRAINT `FK_t_clients_t_types_proprietes` FOREIGN KEY (`fk_types_proprietes_clients`) REFERENCES `t_types_proprietes` (`ID_types_proprietes`),
  CONSTRAINT `FK_t_types_proprietes_t_clients` FOREIGN KEY (`fk_clients_types_proprietes`) REFERENCES `t_clients` (`ID_clients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_types_proprietes_clients : ~5 rows (environ)
INSERT INTO `t_types_proprietes_clients` (`ID_types_proprietes_clients`, `fk_types_proprietes_clients`, `fk_clients_types_proprietes`, `date_clients_types_proprietes`) VALUES
	(1, 2, 2, '2024-04-25 13:25:42'),
	(2, 5, 4, '2024-04-25 13:25:42'),
	(3, 1, 1, '2024-04-25 13:25:43'),
	(4, 4, 5, '2024-04-25 13:25:43'),
	(5, 3, 3, '2024-04-25 13:25:44');

-- Listage de la structure de table tellenne_rayhan_expi1a_immobilier. t_types_proprietes_statuts
DROP TABLE IF EXISTS `t_types_proprietes_statuts`;
CREATE TABLE IF NOT EXISTS `t_types_proprietes_statuts` (
  `ID_types_proprietes_statuts` int NOT NULL AUTO_INCREMENT,
  `fk_types_proprietes_statuts` int DEFAULT NULL,
  `fk_statuts_types_proprietes` int DEFAULT NULL,
  `date_statuts_types_proprietes` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_types_proprietes_statuts`) USING BTREE,
  KEY `FK_t_statuts_t_types_proprietes` (`fk_types_proprietes_statuts`),
  KEY `FK_t_types_proprietes_t_statuts` (`fk_statuts_types_proprietes`),
  CONSTRAINT `FK_t_statuts_t_types_proprietes` FOREIGN KEY (`fk_types_proprietes_statuts`) REFERENCES `t_types_proprietes` (`ID_types_proprietes`),
  CONSTRAINT `FK_t_types_proprietes_t_statuts` FOREIGN KEY (`fk_statuts_types_proprietes`) REFERENCES `t_statuts` (`ID_statuts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table tellenne_rayhan_expi1a_immobilier.t_types_proprietes_statuts : ~5 rows (environ)
INSERT INTO `t_types_proprietes_statuts` (`ID_types_proprietes_statuts`, `fk_types_proprietes_statuts`, `fk_statuts_types_proprietes`, `date_statuts_types_proprietes`) VALUES
	(1, 2, 3, '2024-04-25 13:26:13'),
	(2, 5, 1, '2024-04-25 13:26:14'),
	(3, 1, 2, '2024-04-25 13:26:15'),
	(4, 4, 5, '2024-04-25 13:26:15'),
	(5, 3, 4, '2024-04-25 13:26:16');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;