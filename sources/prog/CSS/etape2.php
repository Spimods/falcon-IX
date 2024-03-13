<?php
session_start();

require '../../connect.php';
date_default_timezone_set('Europe/Paris');
if (isset($_SESSION['ctfcookies'])) {
    $valeurCookie = $_SESSION['ctfcookies'];
    $valeurCookieNOM = $_SESSION['ctfNOM'];
    $requeteverif = $connexion->prepare("SELECT key2 FROM timeprog WHERE cookie = ?");
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
    <link rel="stylesheet" href="../../css/scrollbar.css">
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
            z-index: 1000000;
            font-family: Arial, sans-serif;
            display: none;
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
    </style>
</head>
<body>
<div class="loading-bar">
    <div class="progress" id="progress"></div>
    <div class="time" id="time">0:00</div>
</div>
<div class="message" id="message">
<p>La sortie de cette page est interdite sous peine d'invalidation du flag.</p>
</div>
    <div class="editor">
        <div id="editor" style="left: -10%; height: 210px; width: 30%; margin-bottom: 1em;">#output {
    width: 100px;
    height: 100px;
    background-color: blue; /* Bleu par défaut*/
    border-radius: 100%;/* Carré par défaut */
    right : 5%;/* Par défaut à droite */
}</div>
<div id="tooltip">
            <p>Consignes :</p>
            <ul>
                <li>Définissez la propriété border-radius à 20%. Ajoutez une couleur de fond jaune avec la propriété background-color.</li>
                <li>Positionnez le carré pour qu'il soit placé à 80% de la droite, en utilisant la propriété right.</li>
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
        editor.session.setMode("ace/mode/css"); 
        const output = document.getElementById('output');
        const caseElement = document.getElementById('case');
        editor.session.on('change', function() {
            output.innerHTML = `<style>${editor.getValue()}</style>`;
            checkOverflow();
        });
        function checkOverflow() {
            const outputContainer = document.querySelector('.output-container');
            const outputHeight = output.offsetHeight;
            const containerHeight = outputContainer.offsetHeight;
            if (outputHeight > containerHeight) {
                output.style.transform = `translateY(-${outputHeight - containerHeight}px)`;
            } else {
                output.style.transform = `translateY(0)`;
            }
        }
        function checkCSS() {
            var outputElement = document.getElementById('output');
            var rightPixels = parseFloat(window.getComputedStyle(outputElement).getPropertyValue('right'));
            var parentWidth = outputElement.parentElement.offsetWidth;
            var rightPercentage = Math.round((rightPixels / parentWidth) * 100) + '%';
            var heightPixels = parseFloat(window.getComputedStyle(outputElement).getPropertyValue('height')) + 'px';
            var widthPixels = parseFloat(window.getComputedStyle(outputElement).getPropertyValue('width')) + 'px';
            var borderRadiusPixels = parseFloat(window.getComputedStyle(outputElement).getPropertyValue('border-radius'));
            var borderRadiusPercentage = Math.round(borderRadiusPixels) + '%';
            var backcolor = window.getComputedStyle(outputElement).getPropertyValue('background-color');
            console.log(rightPercentage,rightPixels, heightPixels, borderRadiusPercentage, widthPixels, backcolor);
            if ((rightPercentage === '80%' || rightPercentage === '79%' || rightPercentage === '81%')&& borderRadiusPercentage === '20%' && widthPixels === '100px' && heightPixels === '100px' && backcolor == 'rgb(255, 255, 0)') {
                document.getElementById('validButton').style.display = "initial"
            } else {
                document.getElementById('validButton').style.display = "none"

            }
        }
        setInterval(checkCSS, 1000); 
        function redirect(){
            window.location.href = "save2.php";
        }

    </script>
    <script src="../../js/timerCSS.js"></script>

</body>
</html>
