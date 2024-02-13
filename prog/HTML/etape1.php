<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plus à gauche</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ace.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ext-language_tools.js"></script>

</head>
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

        #html-code {
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

        #case {
            width: 96px;
            height: 96px;
            border-radius: 100%;
            position: absolute;
            border-color: red; 
            border-style: dashed; 
            left: 80%;
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

<body>
<div class="loading-bar">
    <div class="progress" id="progress"></div>
    <div class="time" id="time">0:00</div>
</div>
<div class="editor">
    <div id="editor" style="left: -10%; height: 210px; width: 30%; margin-bottom: 1em;">&lt;img id="output" src="votre_image_ici.png" style="height:200px; width:200px"/&gt;</div>
    <div id="tooltip">
        <p>Consignes :</p>
        <ul>
            <li>Appliquez un style CSS pour dessiner un cercle en utilisant les propriétés border-radius.</li>
            <li>Positionnez le cercle pour qu'il soit placé à 80% de la gauche, en utilisant la propriété left.</li>
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
        var monElement = document.getElementById("output");
        if (monElement) {
            if (monElement.tagName === "IMG" && window.getComputedStyle(monElement).getPropertyValue('height')=="200px" && window.getComputedStyle(monElement).getPropertyValue('width')=="200px" && monElement.getAttribute("src")=="image.png") {
                    document.getElementById("validButton").style.display = "initial" 
            }
        }
    }

    function redirect() {
        window.location.href = "save.php";
    }

</script>
<script src="../../js/timerHTML.js"></script>

</body>
</html>
