-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 12 fév. 2024 à 18:56
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

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
(4, 'grgoire', NULL, NULL, NULL, NULL, '::1', '65c9d10576f33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', NULL, NULL);

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
(4, 'grgoire', 0, 1, 0, '0', '16h 12min 1', '0', '65c9d10576f33');

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
(5, 'grgoire', '0', '0', '0', '0', '0', '0', '65c9d10576f33');

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
('grgoire', '', '33-9-9', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '', '8-15-35', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '', '33-9-54', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '', '33-11-8', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '', '8-18-9', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '', '8-18-10', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '', '33-12-31', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '', '8-19-8', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '', '33-13-25', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '', '8-22-5', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '1', '0-4-32', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '4', '0-11-28', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '8-47-32', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-15', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '8-48-0', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '2', '9-7-51', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '3', '9-9-30', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '3', '9-10-45', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-18', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-7', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '4', '9-11-19', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '7', '9-17-11', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '7', '9-17-13', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '7', '9-17-20', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '7', '9-17-21', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '7', '9-17-21', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '7', '9-17-49', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '7', '9-17-49', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '7', '9-17-50', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '9-24-12', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-17', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-14', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-12', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-6', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-3-44', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '9-40-44', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '9-44-1', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-21', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '9-46-29', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-9', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '9-52-57', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-15', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '9-53-25', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-13', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-11', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-7', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-17', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '59-0-30', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '3', '10-8-47', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '59-0-15', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '4', '10-12-7', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '59-0-8', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '59-0-23', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '49-45-21', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '49-43-56', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '49-43-41', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '49-43-36', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '1--1-45', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '59-0-38', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '8', '11-20-9', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-2-2', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '11-22-20', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '1', '0-4-9', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '11-23-32', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '9', '0-5-6', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '11-29-59', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '5', '0-11-38', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '11-32-11', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '3', '0-15-26', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-1-36', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-16', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '0-0-18', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '15-54-33', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '10', '0-0-11', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '15-56-6', '', '', '', 'progCSS', '65c9d10576f33'),
('grgoire', '0', '15-56-35', '', '', '', 'progCSS', '65c9d10576f33');

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
(0, 'grgoire', '65c9d10576f33', '0h15min26sec', '0h0min16sec', '0h0min13sec', '0h0min11sec', '0h0min7sec', '15h56min35sec', 1, 1, 1, 1, 1, 1);

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
(0, 'grgoire', '65c9d10576f33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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

--
-- Déchargement des données de la table `triche`
--

INSERT INTO `triche` (`id`, `nom`, `etape`, `cookie`) VALUES
(1, 'grgoire', 'etape7', '65af66b18ce07'),
(2, 'grgoire', 'etape8', '65af66b18ce07'),
(3, 'grgoire', 'etape1', '65af66b18ce07'),
(4, 'grgoire', 'etape2', '65af66b18ce07'),
(5, 'grgoire', 'etape3', '65af66b18ce07'),
(6, 'grgoire', 'etape2', '65af66b18ce07'),
(7, 'grgoire', 'etape4', '65af66b18ce07'),
(8, 'grgoire', 'etape6', '65af66b18ce07'),
(9, 'grgoire', 'etape7', '65af66b18ce07'),
(10, 'grgoire', 'etape6', '65af66b18ce07'),
(11, 'grgoire', 'etape8', '65af66b18ce07'),
(12, 'grgoire', 'etape9', '65af66b18ce07'),
(13, 'grgoire', 'etape8', '65af66b18ce07'),
(14, 'grgoire', 'etape8', '65af66b18ce07'),
(15, 'grgoire', 'etape4', '65af66b18ce07'),
(16, 'grgoire', 'etape4', '65af66b18ce07'),
(17, 'grgoire', 'etape4', '65af66b18ce07'),
(18, 'grgoire', 'etape4', '65af66b18ce07'),
(19, 'grgoire', 'etape4', '65af66b18ce07'),
(20, 'grgoire', 'etape7', '65af66b18ce07'),
(21, 'grgoire', 'etape6', '65af66b18ce07'),
(22, 'grgoire', 'etape6', '65af66b18ce07'),
(23, 'grgoire', 'etape6', '65af66b18ce07'),
(24, 'grgoire', 'etape6', '65af66b18ce07'),
(25, 'grgoire', 'etape9', '65af66b18ce07'),
(26, 'grgoire', 'etape9', '65af66b18ce07'),
(27, 'grgoire', '', '65af66b18ce07'),
(28, 'grgoire', '', '65af66b18ce07'),
(29, 'grgoire', 'tuto', '65af66b18ce07'),
(30, 'grgoire', 'etape3', '65af66b18ce07'),
(31, 'grgoire', 'etape3', '65af66b18ce07'),
(32, 'grgoire', 'etape4', '65af66b18ce07');

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
-- Déchargement des données de la table `valeur python`
--

INSERT INTO `valeur python` (`valeur_1`, `result_1`, `valeur_2`, `result_2`, `valeur_3`, `result_3`, `nom`) VALUES
('98', 'pair', '121', 'impair', '18', 'pair', 'partie1'),
('12 23 22', '23', '58 21 32', '58', '23 34 97', '97', 'partie2'),
('12.25 14.50 18.25', '15.0', '8.5 12.0 14.0', '11.5', '16.0 13.5 19.25', '16.25', 'partie3'),
('[9,68,7,50,98]', '[81, 4624, 49, 2500, 9604]', '[53,19,49,68,25]', '[2809, 361, 2401, 4624, 625]', '[23,46,52,43,25]', '[529, 2116, 2704, 1849, 625]', 'partie4'),
('12', '2 4 6 8 10', '23', '2 4 6 8 10 12 14 16 18 20 22', '3', '2', 'partie5'),
('El0izzz', '7', 'Aubin', '5', 'grgoire', '6', 'partie6'),
('12 [11,12,23,27,1]', 'True', '23 [248,234,19,24,91]', 'False', '3 [1,2,3]', 'True', 'partie7'),
('la mariee ira mal', '\' la mariee ira mal \' est un palindrome.', 'Coucou', '\' Coucou \' n\'est pas un palindrome.', 'Ta bete te bat', '\' Ta bete te bat \' est un palindrome.', 'partie8'),
('Bonjour, monde !', ' ! ednom ,ruojnoB', 'Merci les participants', ' stnapicitrap sel icreM', 'Site dev par Spimods', ' sdomipS rap ved etiS', 'partie9');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `prog`
--
ALTER TABLE `prog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `python`
--
ALTER TABLE `python`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `rsociaux`
--
ALTER TABLE `rsociaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `triche`
--
ALTER TABLE `triche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
