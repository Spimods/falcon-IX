<?php
session_start();

$serveur = "localhost";
$utilisateur = "root";
$motDePasse = "";
$baseDeDonnees = "ctf";
$connexion = new mysqli($serveur, $utilisateur, $motDePasse, $baseDeDonnees);
if ($connexion->connect_error) {
    die("Échec de la connexion à la base de données : " . $connexion->connect_error);
}
if (isset($_SESSION['ctfcookies']) && isset($_SESSION['ctfId'])) {
    $valeurCookie = $_SESSION['ctfcookies'];
    $valeurCookieID = $_SESSION['ctfId'];
    $valeurCookieNOM = $_SESSION['ctfNOM'];

    $requete = $connexion->prepare("SELECT flag1, flag2, flag3, time_flag_1 , time_flag_2 , time_flag_3 FROM python WHERE cookie = ?");
    $requete->bind_param("s", $valeurCookie);
    $requete->execute();
    $requete->bind_result($flag1,$flag2,$flag3, $time1, $time2, $time3);
    $requete->fetch();
    $flag1end = $flag1;
    $flag2end = $flag2;
    $flag3end = $flag3;
    if ($flag1 == "triche"){
        $flag1end = 0;
        $time1 = "Suspicion de triche";
    }
    if ($flag2 == "triche"){
        $flag2end = 0;
        $flag1end = $flag1;
        $flag3end = $flag3;
        $time2 = "Suspicion de triche";
    }
    if ($flag3 == "triche"){
        $flag3end = 0;
        $flag1end = $flag1;
        $flag2end = $flag2;
        $time3 = "Suspicion de triche";
    }
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
    <link rel="stylesheet" href="css/python.css">
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
                        <span style="--index: 0;"><?php echo "Python : ", (int)$flag1end + (int)$flag2end + (int)$flag3end, "/3"; ?></span>
                        <span style="--index: 1;"><?php echo "Python : ", (int)$flag1end + (int)$flag2end + (int)$flag3end, "/3"; ?></span>
                        <span style="--index: 2;"><?php echo "Python : ", (int)$flag1end + (int)$flag2end + (int)$flag3end, "/3"; ?></span>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<br>
<?php if($flag1 != 0){
    echo "<div class='box1end'><span class='text'>$time1</span></div>"; 
}
else {
    echo "<div class='box1' onclick='location.href=`./python/tuto.html`;' ><span class='text'>Novice</span></div>"; 
}; 
if($flag2 != 0){
    echo "<div class='box2end'><span class='text'>$time2</span></div>";
}
else{
    if($flag1 != 0){
    echo "<div class='box2' onclick='location.href=`./python/timestartetape4.php`;'><span class='text'>Intermédiaire</span></div>";
    }else{
        echo "<div class='box2end'><span class='text'>Intermédiaire</span></div>";
    }
}
if($flag3 != 0){
    echo "<div class='box3end'><span class='text'>$time3</span></div>";
}
else{
    if($flag2 != 0){
        echo "<div class='box3' onclick='location.href=`./python/timestartetape7.php`;'><span class='text'>Maître</span></div>";
    } else {
        echo "<div class='box3end'><span class='text'>Maître</span></div>";
    }
}?>
</body>
</html>