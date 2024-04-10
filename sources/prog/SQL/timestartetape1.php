<?php
session_start();

require '../../connect.php';
date_default_timezone_set('Europe/Paris');
if (isset($_SESSION['ctfcookies'])) {
    $valeurCookie = $_SESSION['ctfcookies'];
    $requete = $connexion->prepare("SELECT `key1` FROM `timeprogsql` WHERE `cookie`= ?");
    $requete->bind_param("s", $valeurCookie);
    $requete->execute();
    $requete->bind_result($valeur1);
    $requete->fetch();
    if ($valeur1 != NULL) {
        header('Location: timestartetape2.php');
        exit();
    } else {
        $tempsDebut = date("d H i s");
        $requete->close();
        $requeteUpdate = $connexion->prepare("UPDATE timeprogsql SET time1 = ? WHERE cookie = ?");
        $requeteUpdate->bind_param("ss", $tempsDebut, $valeurCookie);
        $requeteUpdate->execute();
        header('Location: etape1.php');
        exit();
    }
}

?>
