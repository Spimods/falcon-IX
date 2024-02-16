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
    $requeteverif = $connexion->prepare("SELECT key4 FROM timeprogsql WHERE cookie = ?");
    $requeteverif->bind_param("s",$valeurCookie);
    $requeteverif->execute();
    $requeteverif->bind_result($valeur1);
    $requeteverif->fetch();
    if ($valeur1 != NULL) {
        header('Location: timestartetape5.php');
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
            <div id="editor" style="left: -10%; height: 210px; width: 30%; margin-bottom: 1em;">SELECT * FROM users WHERE id = 2;</div>
<div id="tooltip">
            <p>Informations :</p>
            <ul>
                <li>Cette requête SQL sélectionne toutes les colonnes de la table "users" où la valeur de la colonne "id" est égale à 2, permettant ainsi de récupérer les données spécifiques correspondantes à cet identifiant.</li>
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
        users: [
            { id: 1, name: 'John Doe', age: 30 },
            { id: 2, name: 'Jane Smith', age: 25 },
            { id: 3, name: 'Bob Johnson', age: 40 }
        ]
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
        if (query.toLowerCase().includes('select')) {
            const tableName = query.match(/from\s+(\w+)/i)[1];
            if (database.hasOwnProperty(tableName)) {
                let resultSet = database[tableName];
                if (query.toLowerCase().includes('where')) {
                    const whereIndex = query.toLowerCase().indexOf('where');
                    const whereClause = query.substring(whereIndex + 5).trim();
                    resultSet = filterResultSet(resultSet, whereClause);
                }
                if (query.includes('SELECT') && !query.includes('*')) {
                    const selectedColumns = query.match(/select\s+(.*)\s+from/i)[1].trim();
                    const columns = selectedColumns.split(',');
                    resultSet = resultSet.map(row => {
                        const newRow = {};
                        columns.forEach(column => {
                            const columnName = column.trim();
                            newRow[columnName] = row[columnName];
                        });
                        return newRow;
                    });
                }
                return resultSet;
            } else {
                throw new Error(`Table ${tableName} does not exist.`);
            }
        } else {
            throw new Error('Only SELECT statements are supported in this simulation.');
        }
    }

    function filterResultSet(resultSet, whereClause) {
        const conditionParts = whereClause.split(/\b(and|or)\b/i);
        let filteredResultSet = resultSet;
        for (let i = 0; i < conditionParts.length; i += 2) {
            const condition = conditionParts[i].trim();
            const operator = condition.match(/(?:=|>|<|>=|<=)/)[0];
            const conditionValues = condition.split(/\s*(?:=|>|<|>=|<=)\s*/);
            const field = conditionValues[0];
            const value = parseFloat(conditionValues[1]);
            if (operator === '=') {
                filteredResultSet = filteredResultSet.filter(row => row[field] === value);
            } else if (operator === '>') {
                filteredResultSet = filteredResultSet.filter(row => row[field] > value);
            } else if (operator === '<') {
                filteredResultSet = filteredResultSet.filter(row => row[field] < value);
            } else if (operator === '>=') {
                filteredResultSet = filteredResultSet.filter(row => row[field] >= value);
            } else if (operator === '<=') {
                filteredResultSet = filteredResultSet.filter(row => row[field] <= value);
            }
            if (i + 1 < conditionParts.length) {
                const logicOperator = conditionParts[i + 1].trim().toLowerCase();
                if (logicOperator === 'or') {
                    break;
                }
            }
        }
        return filteredResultSet;
    }
    function displayResults(resultSet) {
        const resultElement = document.getElementById('result');
        resultElement.innerHTML = '';

        if (resultSet.length === 0) {
            resultElement.innerText = 'No results found.';
            return;
        }

        const table = document.createElement('table');
        const headers = Object.keys(resultSet[0]);
        const headerRow = document.createElement('tr');

        headers.forEach(header => {
            const th = document.createElement('th');
            th.textContent = header;
            headerRow.appendChild(th);
        });

        table.appendChild(headerRow);

        resultSet.forEach(rowData => {
            const row = document.createElement('tr');
            headers.forEach(header => {
                const cell = document.createElement('td');
                cell.textContent = rowData[header];
                row.appendChild(cell);
            });
            table.appendChild(row);
        });
        setTimeout(afficherBouton, 1000);
        resultElement.appendChild(table);
    }

        function afficherBouton() {
            button.style.display = "initial";
        }


        function redirect(){
            window.location.href = "save4.php";
        }

    </script>
</body>
</html>
