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
    $idcookie = $_SESSION['ctfcookies'];
    $name = $_SESSION['ctfNOM'];
    $requete = $connexion->prepare("SELECT time2 FROM timepython WHERE cookie = ?");
    $requete->bind_param("s", $idcookie);
    $requete->execute();
    $requete->bind_result($timedebut);
    $requete->fetch();
    
    $tempsFin = new DateTime();
    $tempsFinTimestamp = $tempsFin->getTimestamp();
    $tempsFin = gmdate("d H i s", $tempsFinTimestamp);

    list($jourfin, $heurefin, $minfin, $secfin) = explode(" ", $tempsFin);
    list($jourdebut, $heuredebut, $mindebut, $secdebut) = explode(" ", $timedebut);

    $jour = $jourfin - $jourdebut;
    $heure = $heurefin - $heuredebut;
    $minute = $minfin - $mindebut;
    $seconde = $secfin - $secdebut;
    if ($heure < 0){
        $jour = $jour -1;
        $heure = 60 + $heure;
    }
    if ($minute < 0){
        $heure = $heure -1;
        $minute = 60 + $minute;
    }
    if ($seconde < 0){
        $minute = $minute -1;
        $seconde = 60 + $seconde;
    }

    if ($minute < 2.5) {
        $notetime = 0;
    } elseif ($minute <= 5) {
        $notetime = 1;
    } elseif ($minute <= 7.5) {
        $notetime = 2;
    } elseif ($minute <= 10) {
        $notetime = 3;
    } elseif ($minute <= 12.5) {
        $notetime = 4;
    } elseif ($minute <= 15) {
        $notetime = 5;
    } elseif ($minute <= 17.5) {
        $notetime = 7;
    } elseif ($minute <= 20) {
        $notetime = 8;
    } else {
        $notetime = 10;
    }


    $code = $_GET['code'];

    $lignes = explode("\n", $code);
    $lignes_de_code = array_filter($lignes, function ($ligne) {
        return !trim($ligne) || strpos(trim($ligne), '#') !== 0;
    });
    $nombre_de_lignes = count($lignes_de_code);
    $nombre_de_caracteres = array_sum(array_map('strlen', $lignes_de_code));

    $note = 10 - (($nombre_de_lignes * 0.1)/2 + ($notetime/2) + $nombre_de_caracteres * 0.01);
    $note = max(0, min(10, $note));


    if ($nombre_de_lignes <= 5 and $notetime < 9){
        $note = 10;
        $nombre_de_lignes = 0;
        $nombre_de_caracteres = 0;
        $notetime = 0;
    };
    $time = $heure . "-" . $minute . "-" . $seconde;
    $timeend = $heure . "h" . $minute . "min" . $seconde . "sec" ;
    $requete->close();
    $requete2 = $connexion->prepare("INSERT INTO score (nom, note, timetotal, caracteretotal, lignetotal, codecomplet, cookie) VALUES (?, ?, ?, ?, ?,? ,?)");
    $requete2->bind_param("sssssss",$name, $note, $time, $nombre_de_caracteres, $nombre_de_lignes, $code, $idcookie);
    $requete2->execute();
    $requete3 = $connexion->prepare("UPDATE timepython SET time2 = ?, key2 = 1  WHERE cookie = ?");
    $requete3->bind_param("ss",$timeend, $idcookie);
    $requete3->execute();
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Score</title>
    <link rel="stylesheet" href="../css/main.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            width:500px;
            z-index:2;

        }

        .note {
            font-size: 50px;
            font-weight: bold;
            color: #b90012;
            margin-bottom: 30px;
        }

        .details {
            margin-top: 20px;
            color: #333;
        }

        .progress-bar {
            position: relative;
            left: 50%;
            top: -36px;
            margin-top: 16px;
            width: 50%;
            height: 20px;
            background-color: #ecf0f1;
            border-radius: 10px;
            overflow: hidden;
        }
        .progress {
            height: 100%;
            background-color: #b90012;
            border-radius: 10px;
            width: <?php 
            if (($nombre_de_lignes*2) < 100) {
                echo 100 - $nombre_de_lignes*2 . "%";
            } else {
                echo 4 . "%";
            } ?>;
        }
        .progress2 {
            height: 100%;
            background-color: #b90012;
            border-radius: 10px;
            width: <?php 
            if (($nombre_de_caracteres/4) < 100) {
                echo 100 - $nombre_de_caracteres/4 . "%";
            } else {
                echo 4 . "%";
            } ?>; 
        }
        .progress3 {
            height: 100%;
            background-color: #b90012;
            border-radius: 10px;
            width: <?php 
            echo 100 - $notetime * 10 . "%";
            ?>; 
        }
        p {
            font-size: 16px;
            display: flex;
        }
        .button {
            background-color: #b90012;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        .button:hover {
            background-color: #780105;
        }
        .svgfleche{
            fill: #fff;
            width: 25px;
            margin-bottom: -6.7px;
        }
        #confetti-canvas {
            position: fixed; 
            z-index: 1; 
            top: 0; 
            left: 0; 
            width: 100vw; 
            height: 100vh; 
            pointer-events: none;
        }
        *::selection {
            background-color: #b6000065; 
            color: #fff; 
        }

        *::-moz-selection {
            background-color: #b6000065; 
            color: #fff; 
        }

        *::-webkit-selection {
            background-color: #b6000065; 
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="note"><?php echo $note;?> / 10</div>
        <div class="details">
            <p>Nombre de lignes :</p><div class="progress-bar"><div class="progress"></div></div>
            <p>Nombre de caractères :</p><div class="progress-bar"><div class="progress2"></div></div>
            <p>Temps total :</p><div class="progress-bar"><div class="progress3"></div></div>
        </div>
        <button class="button" onClick='location.href="timestartetape3.php"'>Niveau Suivant <svg xmlns="http://www.w3.org/2000/svg" class="svgfleche" class="bi bi-chevron-double-right" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/> <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/> </svg></button>
    </div>
    <canvas id="confetti-canvas"></canvas>

<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.5.1/dist/confetti.browser.min.js"></script>
<script type="text/javascript">
  const canvas = document.querySelector('#confetti-canvas');
  window.addEventListener("load", (event) => {


  var myConfetti = confetti.create(canvas, {
      resize: true,
      useWorker: true
    });
    myConfetti({
      particleCount: 500,
      spread: 200
    });
});
</script>


</body>
</html>
