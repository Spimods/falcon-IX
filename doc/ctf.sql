-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 10 mars 2024 à 21:18
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
(3, 'test', NULL, NULL, 1, NULL, NULL, '65e5c14893f0c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', NULL, NULL),
(4, 'grgoire', NULL, NULL, 1, NULL, '::1', '65ea1d9ce62b3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', NULL, NULL);

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
(1, 'test', 0, 0, 0, '0', '0', '0', '65e5c14893f0c'),
(2, 'grgoire', 1, 1, 1, '0h min sec', '0h min sec', '0h min sec', '65ea1d9ce62b3');

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
(1, 'test', '0', '0', '0', '0', '0', '0', '65e5c14893f0c'),
(2, 'grgoire', '0', '0', '0', '0', '0', '0', '65ea1d9ce62b3');

-- --------------------------------------------------------

--
-- Structure de la table `rsociaux`
--

CREATE TABLE `rsociaux` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `flag1` tinyint(1) DEFAULT 0,
  `time_flag_1` varchar(11) DEFAULT '0',
  `cookie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rsociaux`
--

INSERT INTO `rsociaux` (`id`, `nom`, `flag1`, `time_flag_1`, `cookie`) VALUES
(1, 'grgoire', 1, '0h 0min 30s', '65ea1d9ce62b3');

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
('test', '8.71', '0-0-5', '104', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0 :\n    print(\'pair\')\nelse :\n    print(\'impair\')', 'python', '65e5c14893f0c'),
('test', '10', '0-0-7', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '0', '20-56-3', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '0', '20-56-29', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '0', '20-56-47', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '0', '20-57-12', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '10', '0-0-7', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '0', '19-57-58', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '10', '0-0-7', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '0', '19-58-32', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '10', '0-0-10', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '10', '0-0-49', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '10', '0-1-23', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '10', '0-1-41', '', '', '', 'rsociaux', '65e5c14893f0c'),
('test', '10', '0-1-51', '', '', '', 'rsociaux', '65e5c14893f0c'),
('grgoire', '10', '0-0-7', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-6', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-6', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-7', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-4', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-5', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '0', '26-13-18', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '0', '26-14-1', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-8', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-3', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '0', '20-28-31', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-4', '', '', '', 'rsociaux', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-4', '', '', '', 'progSQL', '65ea1d9ce62b3'),
('grgoire', '0', '8-12-6', '', '', '', 'progSQL', '65ea1d9ce62b3'),
('grgoire', '0', '8-12-35', '', '', '', 'progSQL', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-2', '', '', '', 'progSQL', '65ea1d9ce62b3'),
('grgoire', '0', '8-13-51', '', '', '', 'progSQL', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-2', '', '', '', 'progSQL', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-3', '', '', '', 'progHTML', '65ea1d9ce62b3'),
('grgoire', '10', '0-0-9', '', '', '', 'progCSS', '65ea1d9ce62b3');

-- --------------------------------------------------------

--
-- Structure de la table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `skills` varchar(20) NOT NULL,
  `cookie` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `skills`
--

INSERT INTO `skills` (`id`, `nom`, `skills`, `cookie`) VALUES
(1, 'test', '1234444444', '65e5c14893f0c'),
(2, 'test', '1234444444', '65e5c14893f0c'),
(3, 'test', '1234444444', '65e5c14893f0c'),
(4, 'grgoire', '1444444444', '65ea1d9ce62b3');

-- --------------------------------------------------------

--
-- Structure de la table `timeprog`
--

CREATE TABLE `timeprog` (
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
  `key6` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `timeprog`
--

INSERT INTO `timeprog` (`nom`, `cookie`, `time1`, `time2`, `time3`, `time4`, `time5`, `time6`, `key1`, `key2`, `key3`, `key4`, `key5`, `key6`, `id`) VALUES
('test', '65e5c14893f0c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
('grgoire', '65ea1d9ce62b3', '08 09 39 00', NULL, NULL, NULL, NULL, '0h0min9sec', NULL, NULL, NULL, NULL, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `timeproghtml`
--

CREATE TABLE `timeproghtml` (
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
  `key6` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `timeproghtml`
--

INSERT INTO `timeproghtml` (`nom`, `cookie`, `time1`, `time2`, `time3`, `time4`, `time5`, `time6`, `key1`, `key2`, `key3`, `key4`, `key5`, `key6`, `id`) VALUES
('test', '65e5c14893f0c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
('grgoire', '65ea1d9ce62b3', '08 09 16 58', NULL, NULL, NULL, NULL, '0h0min3sec', NULL, NULL, NULL, NULL, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `timeprogsql`
--

CREATE TABLE `timeprogsql` (
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
  `key6` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `timeprogsql`
--

INSERT INTO `timeprogsql` (`nom`, `cookie`, `time1`, `time2`, `time3`, `time4`, `time5`, `time6`, `key1`, `key2`, `key3`, `key4`, `key5`, `key6`, `id`) VALUES
('test', '65e5c14893f0c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
('grgoire', '65ea1d9ce62b3', NULL, NULL, NULL, NULL, NULL, '0h0min2sec', NULL, NULL, NULL, NULL, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `timepython`
--

CREATE TABLE `timepython` (
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
  `key9` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `timepython`
--

INSERT INTO `timepython` (`nom`, `cookie`, `time1`, `time2`, `time3`, `time4`, `time5`, `time6`, `time7`, `time8`, `time9`, `key1`, `key2`, `key3`, `key4`, `key5`, `key6`, `key7`, `key8`, `key9`, `id`) VALUES
('test', '65e5c14893f0c', '0h0min5sec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
('grgoire', '65ea1d9ce62b3', '08 10 32 58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `timersociaux`
--

CREATE TABLE `timersociaux` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `cookie` varchar(40) NOT NULL,
  `time1` varchar(30) DEFAULT NULL,
  `time2` varchar(30) DEFAULT NULL,
  `time3` varchar(30) DEFAULT NULL,
  `time4` varchar(30) DEFAULT NULL,
  `time5` varchar(30) DEFAULT NULL,
  `key1` int(11) DEFAULT NULL,
  `key2` int(11) DEFAULT NULL,
  `key3` int(11) DEFAULT NULL,
  `key4` int(11) DEFAULT NULL,
  `key5` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `timersociaux`
--

INSERT INTO `timersociaux` (`id`, `nom`, `cookie`, `time1`, `time2`, `time3`, `time4`, `time5`, `key1`, `key2`, `key3`, `key4`, `key5`) VALUES
(1, 'test', '65e5c14893f0c', '20h57min12sec', '19h57min58sec', '19h58min32sec', '0h0min10sec', '0h1min51sec', 1, 1, 1, 1, 1),
(2, 'grgoire', '65ea1d9ce62b3', '0h0min7sec', '0h0min6sec', '0h0min6sec', '0h0min7sec', '0h0min4sec', 1, 1, 1, 1, 1);

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
-- Index pour la table `skills`
--
ALTER TABLE `skills`
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
-- Index pour la table `timersociaux`
--
ALTER TABLE `timersociaux`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `python`
--
ALTER TABLE `python`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `rsociaux`
--
ALTER TABLE `rsociaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `timeprog`
--
ALTER TABLE `timeprog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `timeproghtml`
--
ALTER TABLE `timeproghtml`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `timeprogsql`
--
ALTER TABLE `timeprogsql`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `timepython`
--
ALTER TABLE `timepython`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `timersociaux`
--
ALTER TABLE `timersociaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `triche`
--
ALTER TABLE `triche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
