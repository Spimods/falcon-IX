-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 12 fév. 2024 à 21:30
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ctf`
--

-- --------------------------------------------------------

--
-- Structure de la table `ctfuser`
--

CREATE TABLE `ctfuser` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `errors` varchar(200) DEFAULT NULL,
  `keyword` varchar(8) DEFAULT NULL,
  `finish` tinyint(1) DEFAULT NULL,
  `time_finish` varchar(20) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `cookie` varchar(15) DEFAULT NULL,
  `n_modele` varchar(255) DEFAULT NULL,
  `n_connect` int(40) DEFAULT NULL,
  `No` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ctfuser`
--

INSERT INTO `ctfuser` (`id`, `nom`, `errors`, `keyword`, `finish`, `time_finish`, `ip`, `cookie`, `n_modele`, `n_connect`, `No`) VALUES
(1, 'grgoire', NULL, NULL, NULL, NULL, '::1', '65ca5d2ccb0e9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `prog`
--

CREATE TABLE `prog` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `flag1` tinyint(1) DEFAULT 0,
  `flag2` tinyint(1) DEFAULT 0,
  `flag3` tinyint(1) DEFAULT 0,
  `time_flag_1` varchar(30) DEFAULT '0',
  `time_flag_2` varchar(30) DEFAULT '0',
  `time_flag_3` varchar(30) DEFAULT '0',
  `cookie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `prog`
--

INSERT INTO `prog` (`id`, `nom`, `flag1`, `flag2`, `flag3`, `time_flag_1`, `time_flag_2`, `time_flag_3`, `cookie`) VALUES
(1, 'grgoire', 0, 1, 0, '0', '20h 14min 20sec', '0', '65ca5d2ccb0e9');

-- --------------------------------------------------------

--
-- Structure de la table `python`
--

CREATE TABLE `python` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `flag1` varchar(6) DEFAULT '0',
  `flag2` varchar(6) DEFAULT '0',
  `flag3` varchar(6) DEFAULT '0',
  `time_flag_1` varchar(20) DEFAULT '0',
  `time_flag_2` varchar(20) DEFAULT '0',
  `time_flag_3` varchar(20) DEFAULT '0',
  `cookie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `python`
--

INSERT INTO `python` (`id`, `nom`, `flag1`, `flag2`, `flag3`, `time_flag_1`, `time_flag_2`, `time_flag_3`, `cookie`) VALUES
(1, 'grgoire', '0', '0', '0', '0', '0', '0', '65ca5d2ccb0e9');

-- --------------------------------------------------------

--
-- Structure de la table `rsociaux`
--

CREATE TABLE `rsociaux` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `flag1` tinyint(1) DEFAULT 0,
  `flag2` tinyint(1) DEFAULT 0,
  `flag3` tinyint(1) DEFAULT 0,
  `time_flag_1` varchar(11) DEFAULT '0',
  `time_flag_2` varchar(11) DEFAULT '0',
  `time_flag_3` varchar(11) DEFAULT '0',
  `cookie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `score`
--

CREATE TABLE `score` (
  `nom` varchar(50) NOT NULL,
  `note` varchar(20) NOT NULL,
  `timetotal` varchar(50) NOT NULL,
  `caracteretotal` varchar(50) NOT NULL,
  `lignetotal` varchar(50) NOT NULL,
  `codecomplet` text NOT NULL,
  `etape` varchar(30) NOT NULL,
  `cookie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `score`
--

INSERT INTO `score` (`nom`, `note`, `timetotal`, `caracteretotal`, `lignetotal`, `codecomplet`, `etape`, `cookie`) VALUES
('grgoire', '10', '0-0-17', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-0-24', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '9', '0-3-34', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-0-8', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-0-3', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-0-8', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '9', '59-5-35', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '6', '18-8-32', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '7', '59-6-19', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '6', '18-9-10', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '7', '59-6-54', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '18-28-43', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '18-41-1', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '59-38-58', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '18-55-45', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '59-53-28', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '59-55-43', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '9', '-1-4-42', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '19-0-6', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '9', '-1-5-15', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '-1-58-39', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0--1-11', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '20-2-24', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '1-0-10', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '1-2-51', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-1-14', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '1-1-21', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '20-9-51', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-2-17', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-1-19', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-1-49', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-1-27', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '1-2-52', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '19-35-41', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-0-6', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '19-36-2', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-2-12', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '19-38-42', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '19-38-43', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '0', '19-38-43', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-2-26', '', '', '', 'progCSS', '65ca5d2ccb0e9'),
('grgoire', '10', '0-0-7', '', '', '', 'progCSS', '65ca5d2ccb0e9');

-- --------------------------------------------------------

--
-- Structure de la table `timeprog`
--

CREATE TABLE `timeprog` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `cookie` varchar(40) NOT NULL,
  `time1` varchar(30) DEFAULT NULL,
  `time2` varchar(30) DEFAULT NULL,
  `time3` varchar(30) DEFAULT NULL,
  `time4` varchar(30) DEFAULT NULL,
  `time5` varchar(30) DEFAULT NULL,
  `time6` varchar(30) DEFAULT NULL,
  `key1` int(11) DEFAULT NULL,
  `key2` int(11) DEFAULT NULL,
  `key3` int(11) DEFAULT NULL,
  `key4` int(11) DEFAULT NULL,
  `key5` int(11) DEFAULT NULL,
  `key6` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `timeprog`
--

INSERT INTO `timeprog` (`id`, `nom`, `cookie`, `time1`, `time2`, `time3`, `time4`, `time5`, `time6`, `key1`, `key2`, `key3`, `key4`, `key5`, `key6`) VALUES
(0, 'grgoire', '65ca5d2ccb0e9', '0h0min7sec', '0h2min17sec', '19h38min43sec', '19h38min43sec', '19h38min42sec', '0h2min12sec', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `timepython`
--

CREATE TABLE `timepython` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `cookie` varchar(40) NOT NULL,
  `time1` varchar(30) DEFAULT NULL,
  `time2` varchar(30) DEFAULT NULL,
  `time3` varchar(30) DEFAULT NULL,
  `time4` varchar(30) DEFAULT NULL,
  `time5` varchar(30) DEFAULT NULL,
  `time6` varchar(30) DEFAULT NULL,
  `time7` varchar(30) DEFAULT NULL,
  `time8` varchar(30) DEFAULT NULL,
  `time9` varchar(30) DEFAULT NULL,
  `key1` int(11) DEFAULT NULL,
  `key2` int(11) DEFAULT NULL,
  `key3` int(11) DEFAULT NULL,
  `key4` int(11) DEFAULT NULL,
  `key5` int(11) DEFAULT NULL,
  `key6` int(11) DEFAULT NULL,
  `key7` int(11) DEFAULT NULL,
  `key8` int(11) DEFAULT NULL,
  `key9` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `timepython`
--

INSERT INTO `timepython` (`id`, `nom`, `cookie`, `time1`, `time2`, `time3`, `time4`, `time5`, `time6`, `time7`, `time8`, `time9`, `key1`, `key2`, `key3`, `key4`, `key5`, `key6`, `key7`, `key8`, `key9`) VALUES
(0, 'grgoire', '65ca5d2ccb0e9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `triche`
--

CREATE TABLE `triche` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `etape` varchar(20) NOT NULL,
  `cookie` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `valeur python`
--

CREATE TABLE `valeur python` (
  `valeur_1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `result_1` varchar(50) NOT NULL,
  `valeur_2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `result_2` varchar(50) NOT NULL,
  `valeur_3` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `result_3` varchar(50) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ctfuser`
--
ALTER TABLE `ctfuser`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `prog`
--
ALTER TABLE `prog`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `python`
--
ALTER TABLE `python`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rsociaux`
--
ALTER TABLE `rsociaux`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `timeprog`
--
ALTER TABLE `timeprog`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `timepython`
--
ALTER TABLE `timepython`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `triche`
--
ALTER TABLE `triche`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `valeur python`
--
ALTER TABLE `valeur python`
  ADD PRIMARY KEY (`nom`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ctfuser`
--
ALTER TABLE `ctfuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `prog`
--
ALTER TABLE `prog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `python`
--
ALTER TABLE `python`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `rsociaux`
--
ALTER TABLE `rsociaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `triche`
--
ALTER TABLE `triche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
