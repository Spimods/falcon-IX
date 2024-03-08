<?php
$part1 = 0;
$part2 = 0;
$part3 = 0;
$serveur = "localhost";
$utilisateur = "root";
$motDePasse = "";
$baseDeDonnees = "ctf";
$connexion = new mysqli($serveur, $utilisateur, $motDePasse, $baseDeDonnees);
if ($connexion->connect_error) {
    die("Échec de la connexion à la base de données : " . $connexion->connect_error);
}
session_start();
if (isset($_SESSION['ctfcookies']) && isset($_SESSION['ctfId'])) {
    $valeurCookie = $_SESSION['ctfcookies'];
    $valeurCookieID = $_SESSION['ctfId'];
    $requetedebut = $connexion->prepare("SELECT finish FROM ctfuser WHERE cookie = ?");
    $requetedebut->bind_param("s", $valeurCookie);
    $requetedebut->execute();
    $requetedebut->bind_result($finish);
    $requetedebut->fetch();
    $requetedebut->close();
    if ($finish == null) {
        header('Location: start/');
        exit();
    }
    $requete = $connexion->prepare("SELECT flag1, flag2, flag3, nom, time_flag_1, time_flag_2 ,time_flag_3 FROM python WHERE cookie = ?");
    $requete->bind_param("s", $valeurCookie);
    $requete->execute();
    $requete->bind_result($flag1,$flag2,$flag3,$nom,$time1,$time2,$time3);
    $requete->fetch();
    $requete->close();
    $requete1 = $connexion->prepare("SELECT flag1, flag2, flag3, time_flag_1, time_flag_2 ,time_flag_3 FROM prog WHERE cookie = ?");
    $requete1->bind_param("s", $valeurCookie);
    $requete1->execute();
    $requete1->bind_result($flag4,$flag5,$flag6,$time4,$time5,$time6);
    $requete1->fetch();
    $requete1->close();
    $requete2 = $connexion->prepare("SELECT flag1,time_flag_1 FROM rsociaux WHERE cookie = ?");
    $requete2->bind_param("s", $valeurCookie);
    $requete2->execute();
    $requete2->bind_result($flag7,$time7);
    $requete2->fetch();
    $requete2->close();
    function parseTime($timeString) {
        preg_match('/(\d+)h (\d+)min (\d+)sec/', $timeString, $matches);
        $hours = isset($matches[1]) ? intval($matches[1]) : 0;
        $minutes = isset($matches[2]) ? intval($matches[2]) : 0;
        $seconds = isset($matches[3]) ? intval($matches[3]) : 0;
        return $hours * 3600 + $minutes * 60 + $seconds;
    }
    function totalTime($times) {
        $totalSeconds = 0;
        foreach ($times as $time) {
            if (!is_null($time)) {
                $totalSeconds += parseTime($time);
            }
        }
        $hours = floor($totalSeconds / 3600);
        $minutes = floor(($totalSeconds % 3600) / 60);
        $seconds = $totalSeconds % 60;
        $totalTime = sprintf("%02dh %02dmin %02dsec", $hours, $minutes, $seconds);
        return $totalTime;
    }
    $times = array($time1, $time2, $time3, $time4, $time5, $time6, $time7);
    $totalTime = totalTime($times);
    if ($flag1===1 and $flag2===1 and $flag3=== 1) {
        $part1 = 1;
    }
    if($flag4===1 and $flag5===1 and $flag6=== 1) {
        $part2 = 1;
    }
    if($flag7===1) {
        $part3 = 1;
    }
    $valeurBaseDeDonneesNom = $nom;
}
if (isset($_GET['nom'])){
    $nomget = $_GET["nom"];
    $requete2 = $connexion->prepare("SELECT COUNT(*) AS nombre_occurences FROM ctfuser WHERE nom = ?");
    $requete2->bind_param("s", $nomget);
    $requete2->execute();
    $requete2->bind_result($nombre_occurences);
    $requete2->fetch();
    if ($nombre_occurences == 0){
        header('Location: cheat.php');
        exit();
    }
    $requete2->close();
    $nomget = $_GET["nom"];
    $requete2 = $connexion->prepare("SELECT COUNT(*) AS nombre_occurences FROM ctfuser WHERE nom = ?");
    $requete2->bind_param("s", $nomget);
    $requete2->execute();
    $requete2->bind_result($nombre_occurences);
    $requete2->fetch();
    if ($nombre_occurences == 0){
        header('Location: cheat.php');
        exit();
    }
    $requete2->close();
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, shrink-to-fit=no">
    <meta name="viewport" content="initial-scale=1.25"/>
    <meta name="viewport" content="user-scalable=no"/>
    <title>Ozanam CyberQuest</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap4-neon-glow.min.css">
    <link rel='stylesheet' href='//cdn.jsdelivr.net/font-hack/2.020/css/hack.min.css'>
    <link rel="stylesheet" href="css/main.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
</head>
<body class="imgloaded">
    <div class="glitch">
        <div class="glitch__img"></div>
        <div class="glitch__img"></div>
        <div class="glitch__img"></div>
        <div class="glitch__img"></div>
        <div class="glitch__img"></div>
    </div>
    <div class="navbar-dark text-white">
        <div class="container">
            <nav class="navbar px-0 navbar-expand-lg navbar-dark">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a href="home.php" class="pl-md-0 p-3 text-decoration-none text-light">
                            <h3 class="bold"><span class="color_danger">Ozanam</span><span class="color_white">CyberQuest</span></h3>
                        </a>
                    </div>
                    <div class="navbar-nav ml-auto">
                        <a href="home.php" class="p-3 text-decoration-none text-light bold">Accueil</a>
                        <a href="intro.html" class="p-3 text-decoration-none text-white bold">Commencer</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="jumbotron bg-transparent mb-0 pt-3 radius-0">
        <div class="container">
            <div class="row">
                <div class="col-xl-8">
                    <div class="container">
                        <div class="stack" style="--stacks: 3;">
                            <span style="--index: 0;"><?php echo ucfirst($valeurBaseDeDonneesNom) ," : " , "$totalTime"; ?></span>
                            <span style="--index: 1;"><?php echo ucfirst($valeurBaseDeDonneesNom) ," : " , "$totalTime"; ?></span>
                            <span style="--index: 2;"><?php echo ucfirst($valeurBaseDeDonneesNom) ," : " , "$totalTime" ; ?></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<br>
<?php if($part1 != 0){
    echo "<div class='box1end' onclick='location.href=`python.php`;' ><span class='text'>Python</span></div>"; 
} else {
    echo "<div class='box1' onclick='location.href=`python.php`;' ><span class='text'>Python</span></div>"; 
}; 
if($part2 != 0){
    echo "<div class='box2end' onclick='location.href=`prog.php`;' ><span class='text'>Programmation</span></div>";
}else{
    echo "<div class='box2' onclick='location.href=`prog.php`;' ><span class='text'>Programmation</span></div>";
}
if($part3 != 0){
    echo "<div class='box3end' onclick='location.href=`reseaux.php`;'><span class='text'>Réseaux sociaux</span></div>";
}else{
    echo "<div class='box3' onclick='location.href=`reseaux.php`;'><span class='text'>Réseaux sociaux</span></div>";
}?>
</body>
</html>
