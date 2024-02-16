-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 16 fév. 2024 à 15:06
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
(1, 'grgoire', NULL, NULL, NULL, NULL, '::1', '65cbc080d4af7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', NULL, NULL);

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
(1, 'bh', 1, 1, 0, '0h 0min 43sec', '12h 19min 60sec', '0', '65cbc080d4af7');

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
(1, 'bh', '1', 'triche', '0', '20h min sec', '0', '0', '65cbc080d4af7');

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
('bh', '10', '0-4-20', '0', '0', 'nombre1 = int(input(\"Entrez un nombre : \"))\nnombre2 = int(input(\"Entrez un nombre : \"))\nnombre3 = int(input(\"Entrez un nombre : \"))\nprint(max(nombre1, nombre2, nombre3))', 'python', '65cbc080d4af7'),
('bh', '10', '0-0-39', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\nprint((note1+note2+note3)/3)', 'python', '65cbc080d4af7'),
('bh', '10', '20-7-31', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\nprint((note1+note2+note3)/3)', 'python', '65cbc080d4af7'),
('bh', '10', '0-1-9', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-33', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-44', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-32', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-19', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-42', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-25', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '21-16-30', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-34-6', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-40-16', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-40-48', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-41-7', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-41-14', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-41-17', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-41-55', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-42-2', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-42-4', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-42-4', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '6', '0-9-20', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '9-47-33', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-8-56', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-8-59', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '10-26-0', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '9', '0-3-25', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '9', '0-5-38', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '13-5-44', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '13-6-19', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '13-11-16', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '0', '0-18-0', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-11', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '10', '0-0-20', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '10', '0-0-4', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-3', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-9', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-3', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-2', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-2', '', '', '', 'progHTML', '65cbc080d4af7'),
('bh', '0', '54-24-41', '', '', '', 'progSQL', '65cbc080d4af7'),
('bh', '10', '0-0-4', '', '', '', 'progSQL', '65cbc080d4af7'),
('bh', '10', '0-0-4', '', '', '', 'progSQL', '65cbc080d4af7'),
('bh', '0', '12-17-16', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-43', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-3', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-3', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-5', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '0', '12-18-17', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '0', '12-18-38', '', '', '', 'progCSS', '65cbc080d4af7'),
('bh', '10', '0-0-29', '', '', '', 'progCSS', '65cbc080d4af7');

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
(0, 'bh', '65cbc080d4af7', '0h1min9sec', '12h17min16sec', '0h0min44sec', '0h0min32sec', '0h0min19sec', '0h0min42sec', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `timeproghtml`
--

CREATE TABLE `timeproghtml` (
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
-- Déchargement des données de la table `timeproghtml`
--

INSERT INTO `timeproghtml` (`id`, `nom`, `cookie`, `time1`, `time2`, `time3`, `time4`, `time5`, `time6`, `key1`, `key2`, `key3`, `key4`, `key5`, `key6`) VALUES
(0, 'bh', '65cbc080d4af7', '0h0min11sec', '0h0min20sec', '0h0min4sec', '0h0min3sec', '0h0min3sec', '0h0min2sec', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `timeprogsql`
--

CREATE TABLE `timeprogsql` (
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
-- Déchargement des données de la table `timeprogsql`
--

INSERT INTO `timeprogsql` (`id`, `nom`, `cookie`, `time1`, `time2`, `time3`, `time4`, `time5`, `time6`, `key1`, `key2`, `key3`, `key4`, `key5`, `key6`) VALUES
(0, 'bh', '65cbc080d4af7', '0h0min4sec', '0h0min43sec', '0h0min3sec', '0h0min3sec', '12h18min38sec', '0h0min29sec', 1, 1, 1, 1, 1, 1);

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
(0, 'bh', '65cbc080d4af7', '13 19 19 05', '0h4min20sec', '20h7min31sec', '13 20 07 38', '13 20 07 58', NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL);

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
(1, 'bh', 'etape1', '65cbc080d4af7'),
(2, 'bh', 'etape4', '65cbc080d4af7'),
(3, 'bh', 'etape3', '65cbc080d4af7'),
(4, 'bh', 'etape3', '65cbc080d4af7'),
(5, 'bh', 'etape3', '65cbc080d4af7'),
(6, 'bh', 'etape3', '65cbc080d4af7'),
(7, 'bh', 'etape3', '65cbc080d4af7'),
(8, 'bh', 'etape3', '65cbc080d4af7'),
(9, 'bh', 'etape3', '65cbc080d4af7'),
(10, 'bh', 'etape3', '65cbc080d4af7'),
(11, 'bh', 'etape3', '65cbc080d4af7'),
(12, 'bh', 'etape3', '65cbc080d4af7'),
(13, 'bh', 'etape3', '65cbc080d4af7'),
(14, 'bh', 'etape3', '65cbc080d4af7'),
(15, 'bh', 'etape3', '65cbc080d4af7'),
(16, 'bh', 'etape3', '65cbc080d4af7'),
(17, 'bh', 'etape3', '65cbc080d4af7'),
(18, 'bh', 'etape3', '65cbc080d4af7'),
(19, 'bh', 'etape3', '65cbc080d4af7'),
(20, 'bh', 'etape3', '65cbc080d4af7'),
(21, 'bh', 'etape3', '65cbc080d4af7'),
(22, 'bh', 'etape3', '65cbc080d4af7'),
(23, 'bh', 'etape3', '65cbc080d4af7'),
(24, 'bh', 'etape3', '65cbc080d4af7'),
(25, 'bh', 'etape4', '65cbc080d4af7'),
(26, 'bh', 'etape4', '65cbc080d4af7'),
(27, 'bh', 'etape4', '65cbc080d4af7'),
(28, 'bh', 'etape4', '65cbc080d4af7'),
(29, 'bh', 'etape4', '65cbc080d4af7'),
(30, 'bh', 'etape4', '65cbc080d4af7'),
(31, 'bh', 'etape4', '65cbc080d4af7'),
(32, 'bh', 'etape4', '65cbc080d4af7'),
(33, 'bh', 'etape4', '65cbc080d4af7'),
(34, 'bh', 'etape4', '65cbc080d4af7'),
(35, 'bh', 'etape4', '65cbc080d4af7'),
(36, 'bh', 'etape4', '65cbc080d4af7'),
(37, 'bh', 'etape4', '65cbc080d4af7'),
(38, 'bh', 'etape4', '65cbc080d4af7'),
(39, 'bh', 'etape4', '65cbc080d4af7'),
(40, 'bh', 'etape4.php?name=hell', '65cbc080d4af7'),
(41, 'bh', 'etape4.php?name=hell', '65cbc080d4af7'),
(42, 'bh', 'etape4.php?name=hell', '65cbc080d4af7'),
(43, 'bh', 'etape4', '65cbc080d4af7'),
(44, 'bh', 'etape4', '65cbc080d4af7'),
(45, 'bh', 'etape6', '65cbc080d4af7'),
(46, 'bh', 'etape6', '65cbc080d4af7'),
(47, 'bh', 'etape6', '65cbc080d4af7'),
(48, 'bh', 'etape5', '65cbc080d4af7'),
(49, 'bh', 'etape5', '65cbc080d4af7'),
(50, 'bh', 'etape5', '65cbc080d4af7'),
(51, 'bh', 'etape1', '65cbc080d4af7'),
(52, 'bh', 'etape1', '65cbc080d4af7'),
(53, 'bh', 'etape1', '65cbc080d4af7'),
(54, 'bh', 'etape1', '65cbc080d4af7'),
(55, 'bh', 'etape1', '65cbc080d4af7'),
(56, 'bh', 'etape1', '65cbc080d4af7'),
(57, 'bh', 'etape1', '65cbc080d4af7');

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
-- Index pour la table `timeproghtml`
--
ALTER TABLE `timeproghtml`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `timeprogsql`
--
ALTER TABLE `timeprogsql`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
