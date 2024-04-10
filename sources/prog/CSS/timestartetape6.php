<?php
session_start();

require '../../connect.php';
date_default_timezone_set('Europe/Paris');
if (isset($_SESSION['ctfcookies'])) {
    $valeurCookie = $_SESSION['ctfcookies'];
    $requete = $connexion->prepare("SELECT `key6` FROM `timeprog` WHERE `cookie`= ?");
    $requete->bind_param("s", $valeurCookie);
    $requete->execute();
    $requete->bind_result($valeur1);
    $requete->fetch();
    if ($valeur1 != NULL) {
        header('Location: ../../prog.php');
        exit();
    } else {
        $tempsDebut = new DateTime();
        $tempsDebut = $tempsDebut->getTimestamp();
        $tempsDebut = gmdate("d H i s", $tempsDebut);
        $requete->close();
        $requeteUpdate = $connexion->prepare("UPDATE timeprog SET time6 = ? WHERE cookie = ?");
        $requeteUpdate->bind_param("ss", $tempsDebut, $valeurCookie);
        $requeteUpdate->execute();
        header('Location: etape6.php');
    }
}
exit();
?>