function toggleMenu() {
    var menu = document.getElementById("menu");
    menu.style.right = (menu.style.right === "0px") ? "-375px" : "0";
  }
  
  function closeMenu() {
    document.getElementById("menu").style.right = "-400px";
  }
  
  function showInfo(topic, element) {
    var infoDropdown;
    switch (topic) {
        case 'print()':
            infoDropdown = document.getElementById("infoDropdownPrint");
            infoDropdown.innerHTML = "La fonction <span class='function-fonction'>print</span><span class='parentheses'>( )</span> est utilisée pour afficher du texte à la console. Par exemple :<br><code><span class='function-fonction'>print</span><span class='parentheses'>(</span><span class='texte-code'>'Bonjour, comment ça va?'</span><span class='parentheses'>)</span></code></p>";
            break;
        case 'input()':
            infoDropdown = document.getElementById("infoDropdownInput");
            infoDropdown.innerHTML = "La fonction <span class='function-fonction'>input</span><span class='parentheses'>( )</span> permet de recevoir des entrées de l'utilisateur. Voici un exemple simple : <br><code><span class='parentheses'>nom_utilisateur = </span><span class='function-fonction'>input</span><span class='parentheses'>(</span><span class='texte-code'>'Entrez votre nom : '</span><span class='parentheses'>)</span><br><span class='function-fonction'>print</span><span class='parentheses'>(</span><span class='texte-code'>'Bonjour'</span><span class='parentheses'>, nom_utilisateur)</span></code></p>";
            break;
        // Ajout des nouvelles fonctions
        case 'newFunction1()':
            infoDropdown = document.getElementById("infoDropdownNew1");
            infoDropdown.innerHTML = "<p>La fonction <span class='function-fonction'>len</span>( ) renvoie la longueur d'un objet. Par exemple :<br><code><span class='parentheses'> mot = <span class='texte-code'>'Python'</span> <br>longueur = </span><span class='function-fonction'>len</span><span class='parentheses'>(mot)</span><br><span class='function-fonction'>print</span><span class='parentheses'>(<span class='texte-code'>'La longueur du mot est :'</span>, longueur)</span></code></p>";
            break;
        case 'newFunction2()':
            infoDropdown = document.getElementById("infoDropdownNew2");
            infoDropdown.innerHTML = "<p>La fonction <span class='function-fonction'>range</span>( ) génère une séquence d'entiers. Par exemple :<br><code> <span style='color : #003dd8'>for</span> <span class='parentheses'>i</span> <span style='color : #003dd8'>in</span> <span class='function-fonction'>range</span><span class='parentheses'>(<span style='color : #e90000;'>5</span>):</span> <br></span>&emsp;&ensp;<span class='function-fonction'>print</span><span class='parentheses'>(<span class='texte-code'>'Répétition numéro '</span>, i+1)</span></code></p>";
            break;
        case 'newFunction3()':
            infoDropdown = document.getElementById("infoDropdownNew3");
            infoDropdown.innerHTML = "<p>Les listes sont des structures de données importantes. Voici un exemple :<br><code><span class='parentheses'>ma_liste = [<span style='color : #ae81ff'>1</span>, <span style='color : #ae81ff'>2</span>, <span style='color : #ae81ff'>3</span>, <span style='color : #ae81ff'>4</span>, <span style='color : #ae81ff'>5</span>]</span><br><span class='function-fonction'>print</span><span class='parentheses'>(ma_liste[<span style='color : #ae81ff;'>2</span>])</span><code></p>";
            break;
        case 'newFunction4()':
            infoDropdown = document.getElementById("infoDropdownNew4");
            infoDropdown.innerHTML = "<p>La structure <span class='function-fonction'>if</span> est utilisée pour prendre des décisions. Par exemple :<br><code><span class='parentheses'>age = <span style='color : #ae81ff'>18</span><br><span style='color : #003dd8'>if</span> age >= <span style='color : #ae81ff'>18</span>:  <br><span class='function-fonction'>&emsp;&ensp;print</span><span class='parentheses'>(</span><span class='texte-code'>'Vous êtes majeur.'</span><span class='parentheses'>)</span><br><span style='color : #003dd8'>else</span>:<br>&emsp;&ensp;<span class='function-fonction'>print</span><span class='parentheses'>(</span><span class='texte-code'>'Vous êtes mineur.'</span><span class='parentheses'>)</span></span></span></code><p>";
            break;
        case 'newFunction5()':
            infoDropdown = document.getElementById("infoDropdownNew5");
            infoDropdown.innerHTML = "<p>Les boucles for sont utilisées pour répéter des blocs de code. Voici un exemple de boucle for :<br><code><span class='parentheses'><span style='color : #003dd8'>for</span> i <span style='color : #003dd8'>in</span> <span class='function-fonction'>range</span>(<span style='color : #e90000'>3</span>):<br>&emsp;&ensp;<span class='function-fonction'>print</span>(<span class='texte-code'>'Répétition numéro'</span>, i+<span style='color : #ae81ff'>1</span>)</span></code></p>";
            break;
        case 'newFunction6()':
            infoDropdown = document.getElementById("infoDropdownNew6");
            infoDropdown.innerHTML = "<p>La boucle <span class='function-fonction'>while</span> permet d'exécuter un bloc de code tant qu'une condition est vraie. Voici une structure :<br><code><span class='parentheses'>compteur = <span style='color : #ae81ff'>0</span><br><span style='color : #003dd8'>while</span> compteur < <span style='color : #ae81ff'>3</span>:<br>&emsp;&ensp;<span class='function-fonction'>print</span>(<span class='texte-code'>'Répétition numéro'</span>, compteur +<span style='color : #ae81ff'>1</span>)<br>&emsp;&ensp;compteur += <span style='color : #ae81ff'>1</span></span></code></p>";
            break;
    }
    infoDropdown.style.maxHeight = "300px"; 
    element.classList.add('info-shown');
  }
  
  function toggleInfo(topic, element) {
    var infoDropdown = element.querySelector('.info-dropdown');
    if (infoDropdown.style.maxHeight === '300px') {
        infoDropdown.style.maxHeight = '0';
        element.classList.remove('info-shown');
    } else {
        showInfo(topic, element);
    }
  }
  
  function preventDropdownClick(event) {
    event.stopPropagation();
  }
  