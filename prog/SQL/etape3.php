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
    $requeteverif = $connexion->prepare("SELECT key3 FROM timeprog WHERE cookie = ?");
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
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SQL IDE</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }

    #editor {
        width: 100%;
        height: 300px;
        margin-bottom: 10px;
    }

    #result {
        margin-top: 20px;
    }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ace.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="editor">SELECT id FROM users WHERE id = 1;</div>
<button onclick="executeQuery()">Run</button>
<div id="result"></div>
<script>
    // Simulation de la base de données
    const database = {
        users: [
            { id: 1, name: 'John Doe', age: 30 },
            { id: 2, name: 'Jane Smith', age: 25 },
            { id: 3, name: 'Bob Johnson', age: 40 }
        ]
    };

    // Initialisation de l'éditeur ACE
    const editor = ace.edit("editor");
    editor.setTheme("ace/theme/twilight");
    editor.session.setMode("ace/mode/sql");

    // Exécution de la requête SQL
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

    // Simulation de l'exécution de la requête SQL
    function simulateQueryExecution(query) {
        // Pour cet exemple, nous simulerons simplement une requête SELECT depuis notre base de données fictive
        if (query.toLowerCase().includes('select')) {
            // Extraction du nom de la table
            const tableName = query.match(/from\s+(\w+)/i)[1];
            // Récupération des données de la table correspondante
            if (database.hasOwnProperty(tableName)) {
                let resultSet = database[tableName];
                // Si la requête contient une clause WHERE
                if (query.toLowerCase().includes('where')) {
                    const whereIndex = query.toLowerCase().indexOf('where');
                    const whereClause = query.substring(whereIndex + 5).trim();
                    resultSet = filterResultSet(resultSet, whereClause);
                }
                // Si la requête spécifie des colonnes spécifiques
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

    // Filtrer les résultats en fonction de la clause WHERE
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

    // Affichage des résultats dans un tableau HTML
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

        resultElement.appendChild(table);
    }
</script>
</body>
</html>
