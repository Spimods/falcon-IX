<?php
session_start();

require '../../connect.php';
date_default_timezone_set('Europe/Paris');
if (isset($_SESSION['ctfcookies'])) {
    $valeurCookie = $_SESSION['ctfcookies'];
    $valeurCookieNOM = $_SESSION['ctfNOM'];
    $requeteverif = $connexion->prepare("SELECT key2 FROM timeprogsql WHERE cookie = ?");
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
    <title>Plus à gauche</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ace.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ext-language_tools.js"></script>
    <link rel="stylesheet" href="../../css/scrollbar.css">
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
            padding: 20px;
            font-family: Arial, sans-serif;
            border-radius: 1em;
            color: white;
            border: 2px solid #333;
            width: 50%;
            height: 160px;
            display: inline-block;
            position: fixed;
            overflow: hidden;
            background: #000000a3;
            top: 55%;
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


        #output {
            width: 100px;
            height: 100px;
            background-color: blue;
            transition: all 0.3s ease; 
            top: 25%;
            left : 10%;
            position: absolute; 
            box-sizing: border-box; 
            border: 2px solid transparent; 
            z-index: 1;
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
            top: 92.5%;
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
        #runButton {
            position: fixed;
            width: 10%;
            top: 48%;
            left: 45%;
            padding: 10px;
            animation: neon 1s infinite alternate;
            cursor: pointer;
            color: #fff;
            border: 2px solid #e62117;
            border-radius: 5px;
            font-size: 16px;
            transform-style: preserve-3d;
            perspective: 800px;
            transition: transform 0.3s ease, box-shadow 0.3s ease, border 0.3s ease;
            box-shadow: 0 0 10px rgba(230, 33, 23, 0);
            background-color: transparent;
            margin-top: -10px;
            margin-bottom: 10px;
            background-color: #1a1a1a;
        }
        #runButton:hover {
            animation: neon 1s infinite alternate;
            box-shadow: 0 0 20px rgba(230, 33, 23, 0.8);
            border: 2px solid #c61a14;
        }

        @keyframes neon {
            to {
                box-shadow: 0 0 40px rgba(230, 33, 23, 0.8);
            }
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

    </style>
</head>
<body>
    <div class="editor">
            <div id="editor" style="left: -10%; height: 210px; width: 30%; margin-bottom: 1em;">INSERT INTO `users`(`id`, `name`, `age`) VALUES ('1','John Doe','30');
INSERT INTO `users`(`id`, `name`, `age`) VALUES ('2','Jane Smith','25');
INSERT INTO `users`(`id`, `name`, `age`) VALUES ('3','Bob Johnson','40');</div>
<div id="tooltip">
            <p>Informations :</p>
            <ul>
                <li>Cette instruction SQL insère des données dans la table "users", en spécifiant les valeurs pour les colonnes "id", "name" et "age".</li>
            </ul>
        </div>
        <button id="runButton" onclick="executeQuery()">Run</button>

        <div class="output-container">
            <div id="result"></div>
        </div>
    </div>
    <button id="validButton" onclick="redirect()">Valider</button>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ace.js" type="text/javascript" charset="utf-8"></script>

    <script>
    var button = document.getElementById("validButton");
    const database = {
        users: []
    };
    const editor = ace.edit("editor");
    editor.setTheme("ace/theme/monokai");
    editor.session.setMode("ace/mode/sql");
    function executeQuery() {
        const query = editor.getValue();
        const resultElement = document.getElementById('result');

        try {
            const resultSet = simulateQueryExecution(query);
            displayResults(resultSet);
        } catch (error) {
            resultElement.innerText = `Error: ${error.message}`;
        }
    }
    function simulateQueryExecution(query) {
        const queries = query.split(';').filter(q => q.trim() !== '');
        const errorMessages = [];

        queries.forEach(q => {
            try {
                if (q.toLowerCase().includes('insert into') && q.toLowerCase().includes('values')) {
                    if (!q.includes('(') || !q.includes(')')) {
                        throw new Error('Incomplete INSERT INTO statement: Missing column specification.');
                    }
                    const values = q.match(/\('(.*?)','(.*?)','(.*?)'\)/);
                    if (!values || values.length !== 4) {
                        throw new Error('Incomplete INSERT INTO statement: Missing values.');
                    }
                    const id = values[1];
                    const name = values[2];
                    const age = parseInt(values[3]);
                    database.users.push({ id, name, age });
                } else {
                    throw new Error('Only INSERT INTO statements are supported in this simulation.');
                }
            } catch (error) {
                errorMessages.push(error.message);
            }
        });

        if (errorMessages.length > 0) {
            throw new Error(errorMessages.join('\n'));
        } else {
            setTimeout(afficherBouton, 1000);
            return { message: 'Insertion successful.' };
        }
    }
    function displayResults(resultSet) {
        const resultElement = document.getElementById('result');
        resultElement.innerText = resultSet.message;
    }

        function afficherBouton() {
            button.style.display = "initial";
        }


        function redirect(){
            window.location.href = "save2.php";
        }

    </script>
</body>
</html>
