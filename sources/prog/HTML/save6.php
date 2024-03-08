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
    $requeteverif = $connexion->prepare("SELECT key6 FROM timeproghtml WHERE cookie = ?");
    $requeteverif->bind_param("s",$idcookie);
    $requeteverif->execute();
    $requeteverif->bind_result($valeur1);
    $requeteverif->fetch();
    if ($valeur1 == 1) {
        header('Location: ../../prog.php');
        exit();
    } else {
        $requeteverif->close();
        $requete = $connexion->prepare("SELECT time6 FROM timeproghtml WHERE cookie = ?");
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
            $notetime = 10;
        } elseif ($minute <= 5) {
            $notetime = 9;
        } elseif ($minute <= 7.5) {
            $notetime = 7;
        } elseif ($minute <= 10) {
            $notetime = 6;
        } elseif ($minute <= 12.5) {
            $notetime = 5;
        } elseif ($minute <= 15) {
            $notetime = 3;
        } elseif ($minute <= 17.5) {
            $notetime = 1;
        } elseif ($minute <= 20) {
            $notetime = 0;
        } else {
            $notetime = 0;
        }
        if ($heure >= 1){
            $notetime = 0;
        }
        $time = $heure . "-" . $minute . "-" . $seconde;
        $timeend = $heure . "h" . $minute . "min" . $seconde . "sec" ;
        $requete->close();
        $requete2 = $connexion->prepare("INSERT INTO score (nom, note,  timetotal, cookie, etape) VALUES (?, ?, ?, ?, 'progHTML')");
        $requete2->bind_param("ssss",$name,$notetime,  $time, $idcookie);
        $requete2->execute();
        $requete3 = $connexion->prepare("SELECT time1, time2, time3, time4 ,time5 FROM timeproghtml WHERE cookie = ?");
        $requete3->bind_param("s",$idcookie);
        $requete3->execute();
        $requete3->bind_result($time1, $time2, $time3, $time4, $time5);
        $requete3->fetch();

        if (preg_match('/(\d+)h(\d+)min(\d+)sec/', $time1, $matches)) {
            $val1 = (int)$matches[1]; 
            $val2 = (int)$matches[2];
            $val3 = (int)$matches[3];
            if (preg_match('/(\d+)h(\d+)min(\d+)sec/', $time2, $matches2)) {
                $val12 = (int)$matches2[1]; 
                $val22 = (int)$matches2[2];
                $val32 = (int)$matches2[3];
                if (preg_match('/(\d+)h(\d+)min(\d+)sec/', $time3, $matches3)) {
                    $val13 = (int)$matches3[1]; 
                    $val23 = (int)$matches3[2];
                    $val33 = (int)$matches3[3];
                    if (preg_match('/(\d+)h(\d+)min(\d+)sec/', $time4, $matches4)) {
                        $val14 = (int)$matches4[1]; 
                        $val24 = (int)$matches4[2];
                        $val34 = (int)$matches4[3];
                        if (preg_match('/(\d+)h(\d+)min(\d+)sec/', $time5, $matches5)) {
                            $val15 = (int)$matches5[1]; 
                            $val25 = (int)$matches5[2];
                            $val35 = (int)$matches5[3];

            $heure = $val1 + $val12 + $val13 + $val14 + $val15 + $heure;
            $min = $val2 + $val22 + $val23 + $val24 + $val25 + $minute;
            $sec = $val3 + $val32 + $val33 + $val34 +  $val35 + $seconde;
            if ($sec > 60){
                $sec = $sec - 60;
                $min = $min + 1;
            }
            if ($min > 60){
                $min = $min - 60;
                $heure = $heure + 1;
            }
        }
    }
    }
    }
    }

        $time = $heure."h ".$min."min ".$sec."sec";
        $requete3->close();
        $requete4 = $connexion->prepare("UPDATE prog SET time_flag_1 = ?, flag1 = 1 WHERE cookie = ?");
        $requete4->bind_param("ss",$time, $idcookie);
        $requete4->execute();    
        $requete5 = $connexion->prepare("UPDATE timeproghtml SET time6 = ?, key6 = 1  WHERE cookie = ?");
        $requete5->bind_param("ss",$timeend, $idcookie);
        $requete5->execute();
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Score</title>
    <link rel="stylesheet" href="../../css/main.css">
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
        .progress3 {
            height: 100%;
            background-color: #b90012;
            border-radius: 10px;
            width: <?php 
            echo $notetime * 10 . "%";
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
            z-index: 3; 
            top: 0; 
            left: 0; 
            width: 100vw; 
            height: 100vh; 
            pointer-events: none;
        }



        .content {
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            display : none;
        }

        .content__coins {
            z-index: 5;
            position: relative;
            width: 160px;
            height: 160px;
            animation-timing-function: ease-in-out;
            animation-duration: 2s;
            animation-fill-mode: forwards;
            animation-name: initial-animation; 
        }

        .currency-soft-3d {
            position: absolute;
            width: 160px;
            height: 160px;
            transform: rotateY(0deg);
            transform-origin: center center;
            transform-style: preserve-3d;
        }

        @keyframes initial-animation {
            0% {
                transform: translateY(-600px); 
            }
            100% {
                transform: translateY(0); 
            }
        }

        .currency-soft-3d_state_left {
            animation-name: coins-item-left-animation;
        }

        .currency-soft-3d_state_half_left {
            animation-name: coins-item-half-left-animation;
        }

        .currency-soft-3d::before {
            content: "";
            position: absolute;
            z-index: 1;
            top: 0;
            left: 50%;
            width: 20px;
            height: 100%;
            margin-left: -10px;
            transform: rotateY(-90deg);
            transform-origin: 100% 50%;
            background-color: #030B19;
            border-radius: 2px;
        }

        .currency-soft-3d__front_inside {
            position: absolute;
            z-index: -1;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background-color: #030B19;
            transform: translateZ(-1px);
        }

        .currency-soft-3d__front {
            position: absolute;
            z-index: 2;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            transform: translateZ(0);
            border-radius: 50%;
            background-color: #030B19;
            background-image: url('../../images/pieceproghtml1.png');
            background-repeat: no-repeat;
            background-position: center center;
            background-size: 108%;
        }
        .end {
            animation-timing-function: ease-in-out;
            animation-duration: 1s;
            animation-fill-mode: forwards;
            animation-name: end-animation; 
        }
        @keyframes end-animation {
            0% {
                transform: translateY(0); 
            }
            100% {
                transform: translateY(600px); 
            }
        }

        .currency-soft-3d__back {
            position: absolute;
            z-index: 1;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            transform: rotateY(180deg) translateZ(20px);
            border-radius: 50%;
            background-color: #030B19;
            background-image: url('../../images/pieceproghtml1.png');
            background-repeat: no-repeat;
            background-position: center center;
            background-size: 108%;
        }
        .message {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            z-index: 2;
            display: none;
        }

        .currency-soft-3d__back_inside {
            position: absolute;
            z-index: -2;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            transform: translateZ(-19px);
            border-radius: 50%;
            background-color: #030B19;
        }

        body {
            overflow: hidden;
            margin: 0;
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
        .texte-fondu {
            display: none;
            color: #fff;
            opacity: 0; 
            transition: opacity 1s ease-in-out;
        }
        .fin{
            display: none;
            display: block;
            text-decoration: none;
            color: #a90000;
            opacity: 0;
            transition: opacity 1s ease-in-out;
            cursor: default;
        }
        .texte-visible {
            text-align: center;
            display: block;
            opacity: 1; 
        }


    </style>
</head>
<body>
    <div class="container">
        <div class="note"><?php echo $notetime;?> / 10</div>
        <div class="details">
            <p>Temps total :</p><div class="progress-bar"><div class="progress3"></div></div>
        </div>
        <button class="button" onclick="start()">Niveau Suivant <svg xmlns="http://www.w3.org/2000/svg" class="svgfleche" class="bi bi-chevron-double-right" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/> <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/> </svg></button>
    </div>
    <canvas id="confetti-canvas"></canvas>

    <div class="message" id="message">
    </div>
    <div class="texte-fondu">
    Bien joué pour avoir brillamment terminé la tâche HTMLCSS de l'Ozanam CyberQuest !<br>
    Votre habileté rapide et précise dans la création de site web démontre un talent exceptionnel. Continuez sur cette lancée !<br>
    <a class='fin' href="../../prog.php">Terminer</a>
    </div>

    <div class="content">
        <span class="content__coins" onclick="casse()">
            <span class='currency-soft-3d currency-soft-3d_state_left'>
            <span class="currency-soft-3d__front_inside"></span>
            <span class="currency-soft-3d__front"></span>
            <span class="currency-soft-3d__back"></span>
            <span class="currency-soft-3d__back_inside"></span>
            </span>
        </span>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.5.1/dist/confetti.browser.min.js"></script>

    <script>

function start(){
    document.querySelector('.content').style.display = "inherit"
    document.querySelector('.container').style.display = "none"
    document.querySelector('.message').style.display = "block"
    const canvas = document.querySelector('#confetti-canvas');
        setTimeout(() => {
            var end = Date.now() + (8 * 1000);
            var colors = ['#bb0000', '#ffffff'];
            (function frame() {
            confetti({
                particleCount: 2,
                angle: 60,
                spread: 55,
                origin: { x: 0 },
                colors: colors
            });
            confetti({
                particleCount: 2,
                angle: 120,
                spread: 55,
                origin: { x: 1 },
                colors: colors
            });
            if (Date.now() < end) {
                requestAnimationFrame(frame);
            }
            }());
        }, 2000);
    }
    nombre = 0

        function casse() {
            const back = document.querySelector('.currency-soft-3d__back');
            const back2 = document.querySelector('.currency-soft-3d__front');

            if (nombre == 0) {
                back.style.backgroundColor = "#270013";
                back2.style.backgroundColor = "#270013";
                back.style.backgroundImage = "url(../../images/pieceproghtmcasse1.png)";
                back2.style.backgroundImage = "url(../../images/pieceproghtmcasse1.png)";
            } else if (nombre == 1) {
                back.style.backgroundImage = "url(../../images/pieceproghtmcasse2.png)";
                back2.style.backgroundImage = "url(../../images/pieceproghtmcasse2.png)";
            } else if (nombre == 2) {
                back.style.backgroundImage = "url(../../images/pieceproghtmcasse3.png)";
                back2.style.backgroundImage = "url(../../images/pieceproghtmcasse3.png)";
            } else if (nombre == 3) {
                back.style.backgroundImage = "url(../../images/pieceproghtmcasse4.png)";
                back2.style.backgroundImage = "url(../../images/pieceproghtmcasse4.png)";
            } else if (nombre == 4) {
                document.querySelector('.content__coins').classList.add('end');
                setTimeout(() => {
                    document.querySelector('.message').style.display = "none"
                }, 400);
                setTimeout(() => {
                    document.querySelector(".content").style.display = "none";
                    document.querySelector(".texte-fondu").classList.add("texte-visible");
                    document.querySelector(".fin").style.display = "block";
                    setTimeout(() => {
                        document.querySelector(".fin").classList.add("texte-visible");
                        document.querySelector(".fin").style.cursor = "pointer";
                    }, 2000);
                }, 900);
            }

            console.log(nombre);
            nombre = nombre + 1;
            console.log(nombre);
        }
        const container = document.querySelector('.currency-soft-3d');
        let isMouseDown = false;
        let initialX;
        const speed = 0.5; 
        document.addEventListener('mousedown', (event) => {
        if (event.button === 0) {
            isMouseDown = true;
            initialX = event.clientX;
        }
        });
        document.addEventListener('mouseup', () => {
            isMouseDown = false;
        });
        document.addEventListener('mousemove', (event) => {
        if (isMouseDown) {
            const movementX = event.clientX - initialX;
            container.style.transform = `rotateY(${speed * movementX}deg)`; 
        }
        });
    </script>



</body>
</html>
