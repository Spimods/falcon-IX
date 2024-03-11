<?php

require 'connect.php';

session_start();

if (isset($_SESSION['ctfcookies']) && isset($_SESSION['ctfId'])) {
    $valeurCookie = $_SESSION['ctfcookies'];
    $valeurCookieID = $_SESSION['ctfId'];
    
    $requete1 = $connexion->prepare("SELECT nom FROM ctfuser WHERE cookie = ?");
    $requete1->bind_param("s", $valeurCookie);
    $requete1->execute();
    $requete1->bind_result($nom);
    $requete1->fetch();
    $requete1->close();
}

?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, shrink-to-fit=no">
    <meta name="viewport" content="initial-scale=1.25"/>
    <meta name="viewport" content="user-scalable=no"/>
    <title>Ozanam CyberQuest</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap4-neon-glow.min.css">
    <link rel='stylesheet' href='//cdn.jsdelivr.net/font-hack/2.020/css/hack.min.css'>
    <link rel="stylesheet" href="css/main.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <style>
        .center {
            z-index: 100;
            width: 100%;
            text-align: center;
            position: absolute;
            top: 80%;
        }
    </style>
</head>
<body class="imgloaded">
<div class="glitch">
    <div class="glitch__img"></div>
    <div class="glitch__img"></div>
    <div class="glitch__img"></div>
    <div class="glitch__img"></div>
    <div class="glitch__img"></div>
</div>
<div class="navbar-dark text-white">
    <div class="container">
        <nav class="navbar px-0 navbar-expand-lg navbar-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a href="home.php" class="pl-md-0 p-3 text-decoration-none text-light">
                        <h3 class="bold"><span class="color_danger">Ozanam</span><span class="color_white">CyberQuest</span></h3>
                    </a>
                </div>
                <div class="navbar-nav ml-auto">
                    <a href="home.php" class="p-3 text-decoration-none text-light bold">Accueil</a>
                    <a href="intro.html" class="p-3 text-decoration-none text-white bold">Commencer</a>
                </div>
            </div>
        </nav>
    </div>
</div>
<div class="jumbotron bg-transparent mb-0 pt-3 radius-0">
    <div class="container">
        <div class="row">
            <div class="col-xl-8">
                <div class="container">
                    <div class="stack" style="--stacks: 3;">
                        <span style="--index: 0;">Triche ? 😬</span>
                        <span style="--index: 1;">Triche ? 😬</span>
                        <span style="--index: 2;">Triche ? 😬</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<span style="z-index: 10; position: absolute; margin: 40px; text-align: center;"><?php echo $nom ?>, la triche, c'est comme mettre de l'ananas sur la pizza : ça gâche tout le plaisir et ça rend le jeu fade. Soyons fair-play, la victoire a bien meilleur goût quand elle est méritée !</span>
<br>
<div class="center">
    <button class="btn btn-outline-danger btn-shadow px-3 my-2 ml-0 ml-sm-1 text-left typewriter" onclick="(function(){window.location.href='home.php'})();">
        <h4>Non à la pizza-ananas !</h4>
    </button>
</div>
</body>
</html>
