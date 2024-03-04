-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 04 mars 2024 à 10:39
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_etudiant`
--
CREATE DATABASE IF NOT EXISTS `gestion_etudiant` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `gestion_etudiant`;

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int NOT NULL,
  `quartier` varchar(50) DEFAULT NULL,
  `commune` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `pays` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `matricule` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `postnom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `sexe` varchar(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`matricule`),
  UNIQUE KEY `uk_etudiant` (`nom`,`postnom`,`prenom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personneadresse`
--

DROP TABLE IF EXISTS `personneadresse`;
CREATE TABLE IF NOT EXISTS `personneadresse` (
  `id` int NOT NULL,
  `id_etudiant` int NOT NULL,
  `id_adresse` int NOT NULL,
  `avenue` varchar(50) DEFAULT NULL,
  `numero_avenue` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_etudiant_domicile` (`id_etudiant`),
  KEY `fk_addresse_domicile` (`id_adresse`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `telephone`
--

DROP TABLE IF EXISTS `telephone`;
CREATE TABLE IF NOT EXISTS `telephone` (
  `id` int NOT NULL,
  `id_proprietaire` int NOT NULL,
  `initial` varchar(4) NOT NULL,
  `numero` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_etudiant_telephone` (`id_proprietaire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
