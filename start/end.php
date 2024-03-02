<?php
$indice = $_GET['chiffre'];
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


if (isset($_SESSION['ctfcookies']) ) {
    $idcookie = $_SESSION['ctfcookies'];
    $name = $_SESSION['ctfNOM'];
    $requete = $connexion->prepare("INSERT INTO skills (nom, skills, cookie) VALUES (?, ?, ?)");
    $requete->bind_param("sss", $name, $indice, $idcookie);
    $requete->execute();
    $requeteuptade = $connexion->prepare("UPDATE ctfuser SET finish = 1 WHERE cookie = ?");
    $requeteuptade->bind_param("s", $idcookie);
    $requeteuptade->execute();

}

$listeIndices = str_split($indice);
$php = ($listeIndices[0]-1) * 100 / 3;
$css = ($listeIndices[2]-1) * 100 / 3;
$html = ($listeIndices[4]-1) * 100 / 3;
$js = ($listeIndices[6]-1) * 100 / 3;
$sql = ($listeIndices[8]-1) * 100 / 3;
?>
<!DOCTYPE html>
<html lang="fr">
<head> 
<title>Ozanam CyberQuest | Skills</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style>
:root {
    --color-violet : #964688;
	--color-red: #d75959; 
	--color-yellow: #f5c463;
	--color-green: #9ccd7e; 
    --color-blue: #5ca7db;
    --color-blue: #5ca7db; 
    --rgb-black: 0, 0, 0;
	 
}
    *{
        color: white;
    }
 
    body{
        font-family: 'Poppins', sans-serif;
        background-color: #000000;
background-image: linear-gradient(147deg, #000000 0%, #2c3e50 74%);
        height: 100vh;
        color: white;
        overflow: hidden;

    }
    
    .wrapper{
        margin-top: 50px;
    }
.progress-list {
    margin: 0;
    padding: 0;
    list-style: none;
}
 
.progress-list li .line {
    position: relative;
}
.progressbar:not(.circle) svg,
.progressbar:not(.circle) svg path {
    border-radius: 20px;
}
.progressbar svg path:first-child {
    stroke: rgba(var(--rgb-black), 0.09);
}
.progressbar.border {
    border: 1px solid transparent;
    box-sizing: border-box;
}
.progressbar.border svg path:first-child {
    stroke: transparent;
}
.progressbar.line svg {
    height: 5px;
}
.progressbar.line.border svg {
    height: 4px;
}
.progressbar.circle {
    position: relative;
    margin: 0 auto 30px;
}
.progressbar.circle {
    width: 170px;
    height: 85px;
}
.progressbar.circle .progressbar-text {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    margin: 0;
    font-size: 40px;
    display: flex;
    align-items: flex-end;
    justify-content: center;
    color: white !important;
    font-weight: bold;
}
.progressbar.circle .progressbar-text:after {
    content: "%";
    display: block;
    font-size: 20px;
    padding-left: 2px;
}

.progressbar.red svg path:last-child {
    stroke: var(--color-red)
}

.progressbar.yellow svg path:last-child {
    stroke: var(--color-yellow)
}
.progressbar.green svg path:last-child {
    stroke: var(--color-green)
}
.progressbar.blue svg path:last-child {
    stroke: var(--color-blue)
}
.progressbar.violet svg path:last-child {
    stroke: var(--color-violet)
}
h5{
    background: transparent;
    padding: 10px;
    width: 75%;
    margin: 0 auto;
    border-radius: 50px;
    border: 2px solid #ebebeb;
    font-size: 17px;
    color: white;
}
h5:hover {
    background: #ebebeb;
    color: #161F28;
}
p{
    margin-top: 25px;
}
.row {
    flex-wrap: nowrap !important;
}
@media (min-width: 768px){
    .offset-md-1 {
        margin-left: -20px !important;
    }
}
.validation {
    top: 78%;
    background: transparent;
    padding: 7px;
    width: 10%;
    margin: 0 auto;
    border-radius: 50px;
    border: 2px solid #ebebeb;
    font-size: 17px;
    color: white;
    text-align: center;
    left: 45%;
    position: fixed;
    cursor: pointer;
    pointer-events: pointer;
    text-decoration: none;
}
.validation:hover {
    text-decoration: none;
    background-color: white;
    color: #273848;
}

    </style>
</head>
<body>
  
    <div class="wrapper image-wrapper">
    <div class="container inner">
      <div class="row">
        <div class="col-md-10 offset-md-1">
        <br><br><br>
           <div class="row text-center">          
          <div class="col-lg-3">
            <div class="progressbar circle blue" data-value="<?php echo $css; ?>"></div>
            <h5>CSS</h5>
            <p>Le CSS stylise les éléments HTML d'une page web.</p>
          </div>
           
          <div class="col-lg-3">
            <div class="progressbar circle green" data-value="<?php echo $js; ?>"></div>
            <h5>JavaScript</h5>
              <p>JavaScript est pour ajouter de l'interactivité et manipuler le contenu des pages.</p>
              </div>
                
              <div class="col-lg-3">
                <div class="progressbar circle red" data-value="<?php echo $html; ?>"></div>
                <h5>HTML</h5>
                <p>HTML est le langage standard utilisé pour créer et structurer le contenu des pages web.</p>
              </div>
               
              <div class="col-lg-3">
                <div class="progressbar circle yellow" data-value="<?php echo $php; ?>"></div>
                <h5>PHP</h5>
                <p>PHP génère du contenu HTML côté serveur pour des sites web dynamiques.</p>
              </div>

              <div class="col-lg-3">
                <div class="progressbar circle violet" data-value="<?php echo $sql; ?>"></div>
                <h5>SQL</h5>
                <p>SQL est utilisé pour gérer et manipuler des bases de données relationnelles.</p>
              </div>
           </div>
         </div>
        </div>
        </div>
    </div>
<div style="width: 100%;">
<a class="validation" href="../home.php">Continuer</a>
</div>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script> 

<script src="progressbar.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.min.js"></script>



<script>
    $(document).ready(function() {
	'use strict';
	var $pline = $('.progressbar.line');
	var $pcircle = $('.progressbar.circle');
	$pline.each(function(i) {
		var line = new ProgressBar.Line(this, {
			strokeWidth: 6,
			trailWidth: 6,
			duration: 3000,
			easing: 'easeInOut',
			text: {
				style: {
					color: 'inherit',
					position: 'absolute',
					right: '0',
					top: '-30px',
					padding: 0,
					margin: 0,
					transform: null
				},
				autoStyleContainer: false
			},
			step: function(state, line, attachment) {
				line.setText(Math.round(line.value() * 100) + ' %');
			}
		});
		var value = ($(this).attr('data-value') / 100);
		$pline.waypoint(function() {
			line.animate(value);
		}, {
			offset: "100%"
		})
	});
	$pcircle.each(function(i) {
		var circle = new ProgressBar.SemiCircle(this, {
			strokeWidth: 5,
			trailWidth: 5,
			duration: 2000,
			easing: 'easeInOut',
			step: function(state, circle, attachment) {
				circle.setText(Math.round(circle.value() * 100));
			}
		});
		var value = ($(this).attr('data-value') / 100);
		$pcircle.waypoint(function() {
			circle.animate(value);
		}, {
			offset: "100%"
		})
	});
	 
	$('.counter .value').counterUp({
		delay: 50,
		time: 1000
	});
	 
	$(".countdown").countdown();
	 
	  
});
    
    </script>
</body>
</html>