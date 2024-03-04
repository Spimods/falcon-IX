<?php

$serveur = "localhost";
$utilisateur = "root";
$motDePasse = "";
$baseDeDonnees = "ctf";
$connexion = new mysqli($serveur, $utilisateur, $motDePasse, $baseDeDonnees);
if ($connexion->connect_error) {
    die("Échec de la connexion à la base de données : " . $connexion->connect_error);
}
$adresseIP = $_SERVER['REMOTE_ADDR'];
$proxy_headers = array(
    'HTTP_VIA',
    'HTTP_X_FORWARDED_FOR',
    'HTTP_FORWARDED_FOR',
    'HTTP_X_FORWARDED',
    'HTTP_FORWARDED',
    'HTTP_CLIENT_IP',
    'HTTP_FORWARDED_FOR_IP',
    'VIA',
    'X_FORWARDED_FOR',
    'FORWARDED_FOR',
    'X_FORWARDED',
    'FORWARDED',
    'CLIENT_IP',
    'FORWARDED_FOR_IP',
    'HTTP_PROXY_CONNECTION'
);
foreach($proxy_headers as $x){
    if (isset($_SERVER[$x])) {
        echo("Vous êtes derrière un proxy!");
    }
}
$nom = $_POST['nom'];
session_start();
if (isset($_SESSION['ctfcookies']) and isset($_SESSION['ctfId']) ) {
    $valeurCookie = $_SESSION['ctfcookies'];
    $valeurCookieID = $_SESSION['ctfId'];
    $requete = $connexion->prepare("SELECT cookie, n_modele, ip, nom FROM ctfuser WHERE id = ?");
    $requete->bind_param("s", $valeurCookieID);
    $requete->execute();
    $requete->bind_result($valeurBaseDeDonnees, $valeurBaseDeDonneesModele, $valeurBaseDeDonneesIp, $valeurBaseDeDonneesNom);
    $requete->fetch();
    if ($valeurCookie === $valeurBaseDeDonnees) {
        if (htmlentities($_SERVER["HTTP_USER_AGENT"]) === $valeurBaseDeDonneesModele) {
            if ($adresseIP === $valeurBaseDeDonneesIp) {
                echo "La valeur du cookie correspond à celle de la base de données.";
                $requete->close();
                $requete2 = $connexion->query("UPDATE ctfuser SET n_connect = n_connect + 1 WHERE id = $valeurCookieID");
                header("Location: home.php?nom=$valeurBaseDeDonneesNom");
                exit();
            }else{
                echo "<br>Merci de ne pas déconnecter votre Pc";
            }
        }else{
            $_SESSION['ctfNOM'] = $valeurBaseDeDonneesNom;
            header("Location: home.php?nom=$valeurBaseDeDonneesNom");
            exit();
    }
    } else {
        $_SESSION = array();
        header("refresh: 0"); 
        exit; 
    }
} else {
    $requete4 = $connexion->prepare("SELECT EXISTS( SELECT * FROM ctfuser WHERE ip=? );");
    $requete4->bind_param("s", $adresseIP);
    $requete4->execute();
    $requete4->bind_result($value);
    $requete4->fetch();
    $requete4->close();
    if ($value === 1){
        $requete3 = $connexion->prepare("SELECT cookie, id, nom FROM ctfuser WHERE ip = ?");
        $requete3->bind_param("s", $adresseIP);
        $requete3->execute();
        $requete3->bind_result($cookiesbdd, $id, $nom);
        $requete3->fetch();
        $_SESSION['ctfId'] = $id;
        $_SESSION['ctfcookies'] = $cookiesbdd;
        $_SESSION['ctfNOM'] = $nom;
        header("Location: home.php?nom=$nom");
        exit();
    } else {
        $sql = "SELECT * FROM ctfuser WHERE nom = '$nom'";
        $result = $connexion->query($sql);
        if ($result->num_rows > 0) {
            echo "Ce nom existe déjà dans la base de données.";
            header("Location: login.html?error=12");
            exit();
        } else {
            $codeAleatoire = uniqid();
            $_SESSION['ctfcookies'] = $codeAleatoire;
            $requete6 = $connexion->prepare("INSERT INTO ctfuser (cookie, n_modele, ip, nom) VALUES (?, ?, ?, ?)");
            $numeroNav = htmlentities($_SERVER["HTTP_USER_AGENT"]);
            $requete6->bind_param("ssss", $codeAleatoire, $numeroNav, $adresseIP, $nom);
            $requete6->execute();
            $idAutoIncrement = $requete6->insert_id;
            $requete7 = $connexion->prepare("INSERT INTO prog (nom, cookie) VALUES (?,?);");
            $requete7->bind_param("ss", $nom,$codeAleatoire );
            $requete7->execute();
            $idprog = $requete7->insert_id;
            $requete8 = $connexion->prepare("INSERT INTO python (nom, cookie) VALUES (?,?);");
            $requete8->bind_param("ss", $nom, $codeAleatoire);
            $requete8->execute();
            $requete9 = $connexion->prepare("INSERT INTO timepython (nom, cookie) VALUES (?,?);");
            $requete9->bind_param("ss", $nom, $codeAleatoire);
            $requete9->execute();
            $requete10 = $connexion->prepare("INSERT INTO timeprog (nom, cookie) VALUES (?,?);");
            $requete10->bind_param("ss", $nom, $codeAleatoire);
            $requete10->execute();
            $requete11 = $connexion->prepare("INSERT INTO timeproghtml (nom, cookie) VALUES (?,?);");
            $requete11->bind_param("ss", $nom, $codeAleatoire);
            $requete11->execute();
            $requete12 = $connexion->prepare("INSERT INTO timeprogsql (nom, cookie) VALUES (?,?);");
            $requete12->bind_param("ss", $nom, $codeAleatoire);
            $requete12->execute();
            $idpython = $requete8->insert_id;
            $_SESSION['ctfId'] = $idAutoIncrement;
            $_SESSION['ctfIdprog'] = $idprog;
            $_SESSION['ctfIdpython'] = $idpython;
            $_SESSION['ctfNOM'] = $nom;
            header("Location: home.php?nom=$nom");
            exit();
        }
    }
}
$connexion->close();
?>