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
    $requeteverif = $connexion->prepare("SELECT key3 FROM timeproghtml WHERE cookie = ?");
    $requeteverif->bind_param("s",$valeurCookie);
    $requeteverif->execute();
    $requeteverif->bind_result($valeur1);
    $requeteverif->fetch();
    if ($valeur1 != NULL) {
        header('Location: timestartetape4.php');
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
    <title>Une image imaginaire</title>
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
            background: yellow;
            transition: all 0.3s ease; 
            top: 25%;
            right : 40%;
            border: 2px solid blue;
            border-radius: 100%;
            position: absolute; 
            box-sizing: border-box; 
            z-index: 1;
            background-image: url(../../images/no_image.png);
            background-size: cover;
            background-repeat: no-repeat;
        }
        #case {
            width: 96px;
            height: 96px;
            border-radius: 100%;
            position: absolute;
            border-color: red; 
            border-style: dashed; 
            right : 40%;
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
    </style>
</head>
<body>
<div class="loading-bar">
    <div class="progress" id="progress"></div>
    <div class="time" id="time">0:00</div>
</div>
    <div class="editor">
        <div id="editor" style="left: -10%; height: 210px; width: 30%; margin-bottom: 1em;">&lt;!DOCTYPE html&gt;
&lt;html lang="fr"&gt;
&lt;head&gt;
    &lt;meta charset="UTF-8"&gt;
    &lt;meta name="viewport" content="width=device-width, initial-scale=1.0"&gt;
    &lt;title&gt;Ma Carte Postale&lt;/title&gt;
    &lt;style&gt;
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        .carte {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .carte img {
            width: 100%;
            display: block;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .carte .message {
            padding: 20px;
        }
    &lt;/style&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;div class="carte"&gt;
        &lt;img src="lien_vers_votre_image.jpg" alt="Image de la carte postale"&gt;
        &lt;div class="message"&gt;
            &lt;h2&gt;Bonjour !&lt;/h2&gt;
            &lt;p&gt;J'espère que cette carte postale vous trouve en bonne santé. Je profite de l'occasion pour vous envoyer quelques mots depuis cet endroit magnifique.&lt;/p&gt;
            &lt;p&gt;À bientôt !&lt;/p&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
</div>
<div id="tooltip">
            <p>Consignes :</p>
            <ul>
                <li>Remplacez l'image no_image.png par image.png.</li>
                <li>Ajouter une bordure de 4 pixels de couleur rouge.</li>
            </ul>
        </div>

        <div class="output-container">
            <div id="output"></div>
            <div id="case"></div>
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
        var monElement = document.getElementById("output");
        if (monElement) {
            if (monElement.tagName === "IMG" && window.getComputedStyle(monElement).getPropertyValue('height')=="200px" && window.getComputedStyle(monElement).getPropertyValue('width')=="200px" && monElement.getAttribute("src")=="image.png") {
                    document.getElementById("validButton").style.display = "initial" 
            }
        }
    }

    function redirect() {
        window.location.href = "save3.php";
    }

</script>
<script src="../../js/timerHTML.js"></script>
</body>
</html>
