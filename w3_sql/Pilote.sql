-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 17 mars 2020 à 15:08
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `flotte`
--

-- --------------------------------------------------------

--
-- Structure de la table `Pilote`
--

CREATE TABLE `Pilote` (
  `brevet` char(6) NOT NULL,
  `nom` char(15) DEFAULT NULL,
  `nbHvol` decimal(7,2) DEFAULT NULL CHECK (`nbHvol` between 0 and 20000),
  `compa` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Pilote`
--

INSERT INTO `Pilote` (`brevet`, `nom`, `nbHvol`, `compa`) VALUES
('PL-1', 'DUPONT', '800.00', 'AF'),
('PL-2', 'GORGES', '800.00', 'SING'),
('PL-3', 'LEOPOLD', '1000.00', 'AF'),
('PL-5', 'PHILIPPE', '19000.00', 'AF'),
('PL-6', 'PIERRE', '800.00', 'SING'),
('PL-7', 'DURAND', '14500.00', 'SING');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Pilote`
--
ALTER TABLE `Pilote`
  ADD PRIMARY KEY (`brevet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
