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
    $valeurCookieNOM = $_SESSION['ctfNOM'];
    $requeteverif = $connexion->prepare("SELECT key2 FROM timeproghtml WHERE cookie = ?");
    $requeteverif->bind_param("s",$valeurCookie);
    $requeteverif->execute();
    $requeteverif->bind_result($valeur1);
    $requeteverif->fetch();
    if ($valeur1 != NULL) {
        header('Location: timestartetape3.php');
        exit();
    } else {
        $requeteverif->close();
    }
}

?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plus à droite</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ace.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ext-language_tools.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ext-beautify.js"></script>
    <style>
        body {
            overflow: hidden;
            background: url(../../images/bg.png);
            background-color: #000309;
            background-position: right;
            background-size: cover;
            background-repeat: no-repeat;
            background-position-x: 350px;
        }
        .editor {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 50px;
        }
        #css-code {
            height: 200px;
            margin-bottom: 20px;
            resize: none;
            width: 50%;
        }
        .output-container {
            border-radius: 1em;
            border: 2px solid #333;
            width: 50%;
            height: 230px;
            display: inline-block;
            position: relative; 
            overflow: hidden; 
            background: #000000a3;
        }
        #output {
            width: 100px;
            height: 100px;
            background-color: blue;
            transition: all 0.3s ease; 
            top: 25%;
            right : 5%;
            border-radius: 100%;
            position: absolute; 
            box-sizing: border-box; 
            border: 2px solid transparent; 
            z-index: 1;
        }
        #case {
            width: 96px;
            height: 96px;
            border-radius: 20%;
            position: absolute;
            border-color: red; 
            border-style: dashed; 
            right : 80%;
            top: 25%;
            z-index: 2; 
        }
        #validButton {
            display: none;
            position: fixed;
            width: 10%;
            top: 90%;
            left: 45%;
            padding: 10px;
            animation: neon2 1s infinite alternate;
            cursor: pointer;
            color: #fff;
            border: 2px solid #bcbcbc;
            border-radius: 5px;
            font-size: 16px;
            transform-style: preserve-3d;
            perspective: 800px;
            transition: transform 0.3s ease, box-shadow 0.3s ease, border 0.3s ease;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0);
            background-color: transparent;
            margin-top: -10px;
            margin-bottom: 10px;
            background-color: #1a1a1a;
        }
        #validButton:hover {
            animation: neon2 1s infinite alternate;
            box-shadow: 0 0 20px rgba(23, 230, 116, 0.8);
            border: 2px solid #14c65e;
        }
        @keyframes neon2 {
            to {
                box-shadow: 0 0 40px rgba(184, 184, 184, 0.5);
            }
        }
        #tooltip {
            width: 17.2%;
            background-color: #272822;
            color: #fff;
            height: 190px;
            padding: 10px;
            border-radius: 5px;
            text-align: left;
            position: fixed;
            left: 56%;
            font-size: 14px;
            font-family: Arial, sans-serif;
        }
        .loading-bar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background-color: rgb(66, 66, 66);
            z-index: 13;
        }

        .progress {
            height: 100%;
            width: 0;
            background-color: #b80900;
            transition: width 1s ease;
        }

        .time {
            font-family: Arial, sans-serif;
            position: fixed;
            top: 10px;
            left: 10px;
            color: #b80900;
            font-size: 18px;
            font-weight: bold;
        }
        #texte {
            color: white;
            font-family: Arial, sans-serif;
            font-weight: 600;
            text-align: center;
        }
        .centeralign {
            margin-top: 10px;
            text-align:center;
        }
        #texte2 {
            color: white;
            font-family: Arial, sans-serif;
            font-weight: 200;
            text-align: center;
            font-size: 13px;
        }
    </style>
</head>
<body>
<div class="loading-bar">
    <div class="progress" id="progress"></div>
    <div class="time" id="time">0:00</div>
</div>
    <div class="editor">
    <div id="editor" style="left: -10%; height: 210px; width: 30%; margin-bottom: 1em;">&lt;div class="centeralign"&gt; 
    &lt;span id="texte"&gt;Le fameux titre&lt;/span&gt;
    &lt;br&gt;
    &lt;span id="texte2"&gt;Votre texte ici&lt;/span&gt;
&lt;/div&gt;</div>
<div id="tooltip">
            <p>Consignes :</p>
            <ul>
                <li>Remplacez 'Votre texte ici' par 'Dans un monde parallèle, les licornes organisent des concours de crinière colorée.'.</li>
                <li>Remplacez 'Le fameux titre' par 'Une licorne rose'</li>
            </ul>
        </div>

        <div class="output-container">
        </div>
    </div>
    <button id="validButton" onclick="redirect()">Valider</button>

    <script>
    var editor = ace.edit("editor");
    editor.setTheme("ace/theme/monokai");
    editor.session.setMode("ace/mode/html");
    
    const outputContainer = document.querySelector('.output-container');
    const caseElement = document.getElementById('case');

    editor.session.on('change', function() {
        outputContainer.innerHTML = editor.getValue();
        checkOverflow();
    });

    function checkOverflow() {
        console.log(document.getElementById("texte2").textContent, document.getElementById("texte").textContent)
        if (document.getElementById("texte2") && document.getElementById("texte")) {
            if (document.getElementById("texte2").textContent == "Dans un monde parallèle, les licornes organisent des concours de crinière colorée." && document.getElementById("texte").textContent == "Une licorne rose") {
                    document.getElementById("validButton").style.display = "initial" 
            }
        }
    }

    function redirect() {
        window.location.href = "save.php";
    }

</script>
</body>
</html>
