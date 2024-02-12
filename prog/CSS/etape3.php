
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

    </style>
</head>
<body>
    <div class="editor">
        <div id="editor" style="left: -10%; height: 210px; width: 30%; margin-bottom: 1em;">#output {
    width: 100px;
    height: 100px;
    background: yellow; 
    border-radius: 100%;
    right : 40%;
    border: 2px solid blue; /* bordure bleue */
    background-image: url(../../images/no_image.png);
    background-size: cover;
    background-repeat: no-repeat;
}</div>
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
            var rightPercentage = Math.round((rightPixels / parentWidth) * 101) + '%';
            var heightPixels = parseFloat(window.getComputedStyle(outputElement).getPropertyValue('height')) + 'px';
            var widthPixels = parseFloat(window.getComputedStyle(outputElement).getPropertyValue('width')) + 'px';
            var borderRadiusPixels = parseFloat(window.getComputedStyle(outputElement).getPropertyValue('border-radius'));
            var borderRadiusPercentage = Math.round(borderRadiusPixels) + '%';
            var backcolor = window.getComputedStyle(outputElement).getPropertyValue('background-color');
            var backimage = window.getComputedStyle(outputElement).getPropertyValue('background-image');
            var backsizeimage = window.getComputedStyle(outputElement).getPropertyValue('background-size');
            var backrepeatimage = window.getComputedStyle(outputElement).getPropertyValue('background-repeat');
            var border = window.getComputedStyle(outputElement).getPropertyValue('border');
            console.log(rightPercentage, heightPixels, borderRadiusPercentage, widthPixels, backimage, backsizeimage, backrepeatimage, border);
            if (rightPercentage === '40%' && borderRadiusPercentage === '100%' && widthPixels === '100px' && heightPixels === '100px' && backcolor == 'rgb(255, 255, 0)' && backrepeatimage == 'no-repeat' && backsizeimage == 'cover' && backimage == 'url("http://localhost/falcon-V/images/image.png")' && border == '4px solid rgb(255, 0, 0)') {
                document.getElementById('validButton').style.display = "initial"
            } else {
                document.getElementById('validButton').style.display = "none"

            }
        }
        setInterval(checkCSS, 1000); 
        function redirect(){
            window.location.href = "save3.php";
        }

    </script>
</body>
</html>
