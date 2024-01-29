-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 29 jan. 2024 à 16:27
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
(3, 'grgoire', NULL, NULL, NULL, NULL, '::1', '65af66b18ce07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', NULL, NULL);

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
  `time_flag_1` varchar(11) DEFAULT '0',
  `time_flag_2` varchar(11) DEFAULT '0',
  `time_flag_3` varchar(11) DEFAULT '0',
  `cookie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `prog`
--

INSERT INTO `prog` (`id`, `nom`, `flag1`, `flag2`, `flag3`, `time_flag_1`, `time_flag_2`, `time_flag_3`, `cookie`) VALUES
(2, 'greg', 0, 0, 0, '0', '0', '0', '65aa8269b590f'),
(3, 'grgoire', 0, 0, 0, '0', '0', '0', '65af66b18ce07');

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
(3, 'grgoire', '0', '0', '0', '0h 0min 12sec', '0', '0', '65af66b18ce07');

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
  `cookie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `score`
--

INSERT INTO `score` (`nom`, `note`, `timetotal`, `caracteretotal`, `lignetotal`, `codecomplet`, `cookie`) VALUES
('grgoire', '10', '0-0-4', '0', '0', 'print(\"pair\" if int(input(\"Entrez un nombre : \")) % 2 == 0 else \"impair\")', '65a666e605f6e'),
('grgoire', '10', '0-0-5', '0', '0', 'nombre1 = int(input(\"Entrez un nombre : \"))\nnombre2 = int(input(\"Entrez un nombre : \"))\nnombre3 = int(input(\"Entrez un nombre : \"))\n\nprint(max(nombre1, nombre2, nombre3))', '65a666e605f6e'),
('grgoire', '10', '0-0-4', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-3-40', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-4-11', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-6-53', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-9-30', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-9-43', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-10-5', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-11-37', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-11-55', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-0-7', '0', '0', 'print(\"pair\" if int(input(\"Entrez un nombre : \")) % 2 == 0 else \"impair\")', '65a666e605f6e'),
('grgoire', '10', '0-0-26', '0', '0', 'nombre1 = int(input(\"Entrez un nombre : \"))\nnombre2 = int(input(\"Entrez un nombre : \"))\nnombre3 = int(input(\"Entrez un nombre : \"))\nprint(max(nombre1, nombre2, nombre3))', '65a666e605f6e'),
('grgoire', '10', '0-0-11', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-4-58', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-13-18', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-13-35', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '10', '0-14-5', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65a666e605f6e'),
('grgoire', '2.74', '1-51-27', '181', '9', 'max = int(input(\"Entrez un nombre entier n : \"))\r\n\r\ndef somme_carres(n):\r\n    somme = 0\r\n    for i in range(1, n+1):\r\n        somme += i**2\r\n    return somme\r\n    \r\nprint(somme_carres(max))', '65a666e605f6e'),
('grgoire', '5.24', '16-15-14', '181', '9', 'max = int(input(\"Entrez un nombre entier n : \"))\r\n\r\ndef somme_carres(n):\r\n    somme = 0\r\n    for i in range(1, n+1):\r\n        somme += i**2\r\n    return somme\r\n    \r\nprint(somme_carres(max))', '65a666e605f6e'),
('grgoire', '5.24', '16-15-37', '181', '9', 'max = int(input(\"Entrez un nombre entier n : \"))\r\n\r\ndef somme_carres(n):\r\n    somme = 0\r\n    for i in range(1, n+1):\r\n        somme += i**2\r\n    return somme\r\n    \r\nprint(somme_carres(max))', '65a666e605f6e'),
('grgoire', '7.74', '0-0-3', '181', '9', 'max = int(input(\"Entrez un nombre entier n : \"))\r\n\r\ndef somme_carres(n):\r\n    somme = 0\r\n    for i in range(1, n+1):\r\n        somme += i**2\r\n    return somme\r\n    \r\nprint(somme_carres(max))', '65a666e605f6e'),
('grgoire', '10', '16-18-43', '0', '0', 'print(sum(i**2 for i in range(1, int(input(\"Entrez un nombre entier n : \")) + 1)))\r\n', '65a666e605f6e'),
('grgoire', '10', '16-18-50', '0', '0', 'print(sum(i**2 for i in range(1, int(input(\"Entrez un nombre entier n : \")) + 1)))\r\n', '65a666e605f6e'),
('grgoire', '10', '16-19-25', '0', '0', 'print(sum(i**2 for i in range(1, int(input(\"Entrez un nombre entier n : \")) + 1)))\r\n', '65a666e605f6e'),
('grgoire', '6.07', '14-13-44', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65a666e605f6e'),
('grgoire', '4.57', '14-19-3', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65a666e605f6e'),
('grgoire', '6.57', '0-12-12', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65aa8269b590f'),
('grgoire', '10', '0-2-11', '0', '0', 'nombre1 = int(input(\"Entrez un nombre : \"))\nnombre2 = int(input(\"Entrez un nombre : \"))\nnombre3 = int(input(\"Entrez un nombre : \"))\nprint(max(nombre1, nombre2, nombre3))', '65aa8269b590f'),
('grgoire', '10', '0-0-5', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65aa8269b590f'),
('grgoire', '10', '0-0-5', '0', '0', 'print(sum(i**2 for i in range(1, int(input(\"Entrez un nombre entier n : \")) + 1)))\r\n', '65aa8269b590f'),
('grgoire', '10', '1-7-34', '0', '0', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65aa8269b590f'),
('grgoire', '8.72', '0-1-54', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65aa8269b590f'),
('grgoire', '3.67', '15-39-10', '103', '6', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\n\nif nombre % 2 == 0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65aa8269b590f'),
('grgoire', '10', '0-1-36', '0', '0', 'nombre1 = int(input(\"Entrez un nombre : \"))\nnombre2 = int(input(\"Entrez un nombre : \"))\nnombre3 = int(input(\"Entrez un nombre : \"))\nprint(max(nombre1, nombre2, nombre3))', '65aa8269b590f'),
('grgoire', '10', '0-0-4', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65aa8269b590f'),
('grgoire', '10', '0-0-10', '0', '0', 'print(sum(i**2 for i in range(1, int(input(\"Entrez un nombre entier n : \")) + 1)))\r\n', '65aa8269b590f'),
('grgoire', '10', '0-0-6', '0', '0', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65aa8269b590f'),
('grgoire', '8.57', '0-0-19', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '6.07', '7-13-36', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '6.07', '7-15-33', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '8.57', '0-0-4', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '5.07', '7-16-33', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '5.07', '7-16-45', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '8.57', '0-0-2', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '5.07', '7-17-9', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '4.57', '7-18-7', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '8.57', '0-0-3', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '4.57', '7-18-40', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '4.57', '7-18-51', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '4.57', '7-19-22', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '4.57', '7-19-29', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '4.57', '7-19-41', '108', '7', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '10', '0-0-4', '0', '0', 'nombre1 = int(input(\"Entrez un nombre : \"))\nnombre2 = int(input(\"Entrez un nombre : \"))\nnombre3 = int(input(\"Entrez un nombre : \"))\nprint(max(nombre1, nombre2, nombre3))', '65af66b18ce07'),
('grgoire', '3.14', '7-21-25', '166', '4', 'nombre1 = int(input(\"Entrez un nombre : \"))\nnombre2 = int(input(\"Entrez un nombre : \"))\nnombre3 = int(input(\"Entrez un nombre : \"))\nprint(max(nombre1, nombre2, nombre3))', '65af66b18ce07'),
('grgoire', '10', '0-0-3', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '10', '0-0-36', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '10', '0-0-40', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '2.89', '7-22-13', '186', '5', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '2.89', '7-22-29', '186', '5', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '10', '0-1-1', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '10', '0-1-4', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '10', '0-2-2', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '10', '0-2-8', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '8.67', '0-0-5', '103', '6', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\n\nif nombre % 2 == 0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65af66b18ce07'),
('grgoire', '10', '0-0-3', '0', '0', 'nombre1 = int(input(\"Entrez un nombre : \"))\nnombre2 = int(input(\"Entrez un nombre : \"))\nnombre3 = int(input(\"Entrez un nombre : \"))\nprint(max(nombre1, nombre2, nombre3))', '65af66b18ce07'),
('grgoire', '10', '0-0-4', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '8.67', '0-1-48', '103', '6', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\n\nif nombre % 2 == 0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65af66b18ce07'),
('grgoire', '10', '0-1-10', '0', '0', 'nombre1 = int(input(\"Entrez un nombre : \"))\nnombre2 = int(input(\"Entrez un nombre : \"))\nnombre3 = int(input(\"Entrez un nombre : \"))\nprint(max(nombre1, nombre2, nombre3))', '65af66b18ce07'),
('grgoire', '10', '0-0-32', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '10', '0-0-5', '0', '0', 'print(sum(i**2 for i in range(1, int(input(\"Entrez un nombre entier n : \")) + 1)))\r\n', '65af66b18ce07'),
('grgoire', '4.07', '7-34-24', '83', '2', 'print(sum(i**2 for i in range(1, int(input(\"Entrez un nombre entier n : \")) + 1)))\r\n', '65af66b18ce07'),
('grgoire', '4.83', '0-16-49', '122', '9', 'nombre = int(input())\r\nif nombre == 12:\r\n    print(650)\r\nelif nombre == 3:\r\n    print(14)\r\nelif nombre == 23:\r\n    print(4324)\r\n\r\n', '65af66b18ce07'),
('grgoire', '3.33', '7-51-45', '122', '9', 'nombre = int(input())\r\nif nombre == 12:\r\n    print(650)\r\nelif nombre == 3:\r\n    print(14)\r\nelif nombre == 23:\r\n    print(4324)\r\n\r\n', '65af66b18ce07'),
('grgoire', '10', '0-0-5', '0', '0', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07'),
('grgoire', '7.13', '0-8-46', '107', '6', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '10', '0-2-59', '0', '0', 'nombre1 = int(input(\"Entrez un nombre : \"))\nnombre2 = int(input(\"Entrez un nombre : \"))\nnombre3 = int(input(\"Entrez un nombre : \"))\nprint(max(nombre1, nombre2, nombre3))', '65af66b18ce07'),
('grgoire', '10', '0-1-53', '0', '0', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '10', '0-4-31', '0', '0', 'print(sum(i**2 for i in range(1, int(input(\"Entrez un nombre entier n : \")) + 1)))\r\n', '65af66b18ce07'),
('grgoire', '7.39', '0-3-21', '186', '5', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '2.89', '8-39-46', '186', '5', '# Demander à l\'utilisateur de saisir les trois notes\nnote1 = float(input(\"Entrez la première note : \"))\nnote2 = float(input(\"Entrez la deuxième note : \"))\nnote3 = float(input(\"Entrez la troisième note : \"))\n\nprint((note1 + note2 + note3)/3)', '65af66b18ce07'),
('grgoire', '10', '0-0-10', '0', '0', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07'),
('grgoire', '3.63', '8-43-4', '107', '6', '# Demandez à l\'utilisateur d\'entrer un nombre\r\nnombre = int(input(\"Entrez un nombre : \"))\r\n# Vérifiez si le nombre est pair ou impair\r\nif nombre % 2 == 0:\r\n    print(\"pair\")\r\nelse:\r\n    print(\"impair\")\r\n', '65af66b18ce07'),
('grgoire', '8.67', '12-1-37', '103', '6', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\n\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '8.67', '12-1-41', '103', '6', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\n\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '10', '0-0-47', '0', '0', '\nprint(max(int(input()), int(input()),int(input()) ))', '65af66b18ce07'),
('grgoire', '10', '0-2-24', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '10', '0-7-10', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '10', '12-9-55', '0', '0', '\nprint(max(int(input()), int(input()),int(input()) ))', '65af66b18ce07'),
('grgoire', '3.67', '12-35-32', '103', '6', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\n\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '3.67', '13-45-7', '103', '6', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\n\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '8.74', '0-1-0', '101', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2==0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65af66b18ce07'),
('grgoire', '10', '0-0-5', '0', '0', '\nprint(max(int(input()), int(input()),int(input()) ))', '65af66b18ce07'),
('grgoire', '10', '14-15-58', '0', '0', '\nprint(max(int(input()), int(input()),int(input()) ))', '65af66b18ce07'),
('grgoire', '10', '14-16-2', '0', '0', '\nprint(max(int(input()), int(input()),int(input()) ))', '65af66b18ce07'),
('grgoire', '10', '14-16-4', '0', '0', '\nprint(max(int(input()), int(input()),int(input()) ))', '65af66b18ce07'),
('grgoire', '10', '14-16-6', '0', '0', '\nprint(max(int(input()), int(input()),int(input()) ))', '65af66b18ce07'),
('grgoire', '10', '0-3-18', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '10', '1-11-18', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '10', '1-11-19', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '4.38', '15-28-52', '52', '2', '\nprint(max(int(input()), int(input()),int(input()) ))', '65af66b18ce07'),
('grgoire', '3.74', '15-28-55', '101', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2==0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65af66b18ce07'),
('grgoire', '8.72', '0-0-3', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '6.22', '19-13-23', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '6.22', '19-14-6', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '5.22', '19-16-20', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '4.72', '19-18-13', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '3.72', '19-23-50', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '3.72', '19-24-3', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '3.72', '19-24-8', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '3.72', '19-24-20', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '3.72', '19-24-29', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '3.72', '19-24-35', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '3.72', '19-29-33', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '8.72', '0-0-3', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '3.72', '19-47-36', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '3.72', '19-48-52', '103', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2 == 0:\n    print(\"pair\")\nelse :\n    print(\"impair\")', '65af66b18ce07'),
('grgoire', '10', '0-0-10', '0', '0', 'print(max(int(input()), int(input()),int(input())))', '65af66b18ce07'),
('grgoire', '10', '0-0-6', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '10', '0-5-42', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '10', '0-0-22', '0', '0', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07'),
('grgoire', '8.74', '0-0-14', '101', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2==0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65af66b18ce07'),
('grgoire', '6.24', '7-14-17', '101', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2==0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65af66b18ce07'),
('grgoire', '8.74', '0-0-4', '101', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2==0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65af66b18ce07'),
('grgoire', '10', '0-0-4', '0', '0', 'print(max(int(input()), int(input()),int(input())))', '65af66b18ce07'),
('grgoire', '10', '0-0-5', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '8.74', '0-0-5', '101', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2==0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65af66b18ce07'),
('grgoire', '10', '0-0-4', '0', '0', 'print(max(int(input()), int(input()),int(input())))', '65af66b18ce07'),
('grgoire', '10', '0-0-26', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '4.36', '7-48-56', '59', '1', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '4.36', '7-50-41', '59', '1', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '4.36', '7-50-58', '59', '1', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '10', '0-2-11', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '10', '8-10-34', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '10', '8-10-45', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '10', '8-12-41', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '8.74', '0-0-4', '101', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2==0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65af66b18ce07'),
('grgoire', '10', '0-0-43', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '8.33', '0-0-5', '122', '9', 'nombre = int(input())\r\nif nombre == 12:\r\n    print(650)\r\nelif nombre == 3:\r\n    print(14)\r\nelif nombre == 23:\r\n    print(4324)\r\n\r\n', '65af66b18ce07'),
('grgoire', '10', '0-0-5', '0', '0', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07'),
('grgoire', '8.74', '0-0-2', '101', '5', '# Demander à l\'utilisateur de saisir un nombre\nnombre = int(input(\"Entrez un nombre : \"))\nif nombre % 2==0:\n    print(\'pair\')\nelse :\n    print(\'impair\')', '65af66b18ce07'),
('grgoire', '10', '0-0-10', '0', '0', 'print(max(int(input()), int(input()),int(input())))', '65af66b18ce07'),
('grgoire', '10', '0-0-3', '0', '0', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '2.21', '0-36-39', '224', '11', 'nombre_a_trouver = int(input())\nliste = eval(input())\n\ndef present(nombre_a_trouver, liste):\n    for val in liste:\n        if val == nombre_a_trouver :\n            return True\n    return False\n\nprint(present(nombre_a_trouver, liste))\n', '65af66b18ce07'),
('grgoire', '10', '0-0-8', '0', '0', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07'),
('grgoire', '4.34', '10-39-19', '51', '3', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07'),
('grgoire', '4.36', '10-39-21', '59', '1', 'print((float(input()) + float(input()) + float(input()))/3)', '65af66b18ce07'),
('grgoire', '10', '0-0-8', '0', '0', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07'),
('grgoire', '7.21', '0-0-4', '224', '11', 'nombre_a_trouver = int(input())\nliste = eval(input())\n\ndef present(nombre_a_trouver, liste):\n    for val in liste:\n        if val == nombre_a_trouver :\n            return True\n    return False\n\nprint(present(nombre_a_trouver, liste))\n', '65af66b18ce07'),
('grgoire', '10', '0-0-2', '0', '0', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07'),
('grgoire', '4.34', '13-41-57', '51', '3', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07'),
('grgoire', '4.34', '13-42-21', '51', '3', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07'),
('grgoire', '4.34', '15-31-43', '51', '3', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07'),
('grgoire', '4.34', '15-31-47', '51', '3', '#la valeur du input est le maximum possible \nmax = int(input())\nprint(*range(2, max, 2), sep=\' \')\n', '65af66b18ce07');

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
  `time4` varchar(20) DEFAULT NULL,
  `time5` varchar(20) DEFAULT NULL,
  `time6` varchar(20) DEFAULT NULL,
  `key1` int(11) DEFAULT NULL,
  `key2` int(11) DEFAULT NULL,
  `key3` int(11) DEFAULT NULL,
  `key4` int(11) DEFAULT NULL,
  `key5` int(11) DEFAULT NULL,
  `key6` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `timepython`
--

INSERT INTO `timepython` (`id`, `nom`, `cookie`, `time1`, `time2`, `time3`, `time4`, `time5`, `time6`, `key1`, `key2`, `key3`, `key4`, `key5`, `key6`) VALUES
(0, 'grgoire', '65af66b18ce07', '26 10 12 37', '0h0min10sec', '10h39min21sec', '26 10 13 15', '15h31min47sec', '25 13 42 24', 1, 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `triche`
--

CREATE TABLE `triche` (
  `nom` varchar(20) NOT NULL,
  `etape` varchar(20) NOT NULL,
  `cookie` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `triche`
--

INSERT INTO `triche` (`nom`, `etape`, `cookie`) VALUES
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape3', '65af66b18ce07'),
('grgoire', 'etape3', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape3', '65af66b18ce07'),
('grgoire', 'etape3', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape5', '65af66b18ce07'),
('grgoire', 'etape5', '65af66b18ce07'),
('grgoire', 'etape5', '65af66b18ce07'),
('grgoire', 'etape5', '65af66b18ce07'),
('grgoire', 'etape5', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape3', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape2', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape6', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07'),
('grgoire', 'etape1', '65af66b18ce07'),
('grgoire', 'etape4', '65af66b18ce07');

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
('12 [11,12,23,27,1]', 'True', '23 [248,234,19,24,91]', 'False', '3 [1,2,3]', 'True', 'partie4'),
('12', '2 4 6 8 10', '23', '2 4 6 8 10 12 14 16 18 20 22', '3', '2', 'partie5');

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
-- Index pour la table `timepython`
--
ALTER TABLE `timepython`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `prog`
--
ALTER TABLE `prog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `python`
--
ALTER TABLE `python`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `rsociaux`
--
ALTER TABLE `rsociaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
