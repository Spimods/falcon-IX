<?php
session_start();

require '../connect.php';
date_default_timezone_set('Europe/Paris');
if (isset($_SESSION['ctfcookies'])) {
    $valeurCookie = $_SESSION['ctfcookies'];
    $valeurCookieNOM = $_SESSION['ctfNOM'];
    $requeteverif = $connexion->prepare("SELECT key4 FROM timersociaux WHERE cookie = ?");
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
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Safe ou pas ?</title>
    <link rel="stylesheet" href="../css/scrollbar.css">
    <link rel="stylesheet" href="../css/select.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background: url(../images/bg.png);
        background-color: #000309;
        background-position: right;
        background-size: cover;
        background-repeat: no-repeat;
        background-position-x: 350px;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: "Poppins", sans-serif;
    }

    .password-input-box {
        position: relative;
        width: 300px;
        height: 40px;
    }

    .password-input {
        width: 100%;
        height: 100%;
        background: #fff;
        border: none;
        padding: 5px 15px;
        outline: none;
        border-radius: 5px;
        color: #3B0309;
        padding-right: 45px;
    }

    .password-input::placeholder {
        color: #3B0309;
    }

    .password-input:focus {
        box-shadow: 0 0 0 3px #3B0309, 0 0 0 6px #4fe222;
    }

    .show-password {
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        color: #3B0309;
    }

    .password-checklist {
        position: absolute;
        top: calc(100% + 10px);
        width: 100%;
        padding: 20px 30px;
        background: #77000c34;
        border-radius: 5px;
        opacity: 0;
        pointer-events: none;
        transform: translateY(20px);
        transition: 0.5s ease;
    }

    .password-input:focus ~ .password-checklist {
        opacity: 1;
        transform: translateY(0);
    }

    .checklist-title {
        font-size: 15px;
        color: #810310;
        margin-bottom: 10px;
    }

    .checklist {
        list-style: none;
    }

    .list-item {
        padding-left: 30px;
        color: #fff;
        font-size: 14px;
    }

    .list-item::before {
        content: "\f00d";
        font-family: FontAwesome;
        display: inline-block;
        margin: 8px 0;
        margin-left: -30px;
        width: 20px;
        font-size: 12px;
    }

    .list-item.checked {
        opacity: 0.5;
    }

    .list-item.checked::before {
        content: "\f00c";
        color: #810310;
    }
    #validButton {
        display: none;
        position: fixed;
        width: 23%;
        top: 93%;
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

    </style>
</head>
<body>
    <div class="password-input-box">
        <input type="password" placeholder="Password" class="password-input" />
        <i class="fa-solid fa-eye show-password"></i>
        <div class="password-checklist">
        <h3 class="checklist-title">Le mot de passe doit avoir :</h3>
        <ul class="checklist">
            <li class="list-item">Au moins 8 caractères de long</li>
            <li class="list-item">Au moins 1 chiffre</li>
            <li class="list-item">Au moins 1 lettre minuscule</li>
            <li class="list-item">Au moins 1 lettre majuscule</li>
            <li class="list-item">Au moins 1 caractère spécial</li>
        </ul>
        </div>
    </div>

    <button id="validButton" onclick="redirect()">Valider</button>

<script>
let showPasswordBtn = document.querySelector(".show-password");
let passwordInp = document.querySelector(".password-input");
let passwordChecklist = document.querySelectorAll(".list-item");
let submitButton = document.getElementById("validButton"); 
showPasswordBtn.addEventListener("click", () => {
    showPasswordBtn.classList.toggle("fa-eye");
    showPasswordBtn.classList.toggle("fa-eye-slash");
    passwordInp.type = passwordInp.type === "password" ? "text" : "password";
});

let validationRegex = [
    { regex: /.{8,}/ }, 
    { regex: /[0-9]/ }, 
    { regex: /[a-z]/ },
    { regex: /[A-Z]/ }, 
    { regex: /[^A-Za-z0-9]/ } 
];

passwordInp.addEventListener("keyup", () => {
    let allValid = true; 
    validationRegex.forEach((item, i) => {
        let isValid = item.regex.test(passwordInp.value);
        if (isValid) {
            passwordChecklist[i].classList.add("checked");
        } else {
            passwordChecklist[i].classList.remove("checked");
            allValid = false; 
        }
    });

    if (allValid) {
        submitButton.style.display = "block";
    } else {
        submitButton.style.display = "none"; 
    }
});
function redirect(){
    window.location.href = "save4.php";
}
</script>
</body>
</html>
