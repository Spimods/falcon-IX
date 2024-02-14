<?php
session_start();

$serveur = "localhost";
$utilisateur = "root";
$motDePasse = "";
$baseDeDonnees = "ctf";

date_default_timezone_set('Europe/Paris');

$connexion = new mysqli($serveur, $utilisateur, $motDePasse, $baseDeDonnees);

if ($connexion->connect_error) {
    die("Échec de la connexion à la base de données : " . $connexion->connect_error);
}

if (isset($_SESSION['ctfcookies'])) {
    $valeurCookie = $_SESSION['ctfcookies'];
    $requete = $connexion->prepare("SELECT `key2` FROM `timeproghtml` WHERE `cookie`= ?");
    $requete->bind_param("s", $valeurCookie);
    $requete->execute();
    $requete->bind_result($valeur1);
    $requete->fetch();
    if ($valeur1 != NULL) {
        header('Location: timestartetape3.php');
        exit();
    } else {
        $tempsDebut = new DateTime();
        $tempsDebut = $tempsDebut->getTimestamp();
        $tempsDebut = gmdate("d H i s", $tempsDebut);
        $requete->close();
        $requeteUpdate = $connexion->prepare("UPDATE timeproghtml SET time2 = ? WHERE cookie = ?");
        $requeteUpdate->bind_param("ss", $tempsDebut, $valeurCookie);
        $requeteUpdate->execute();
        header('Location: etape2.php');
    }
}
exit();
?>