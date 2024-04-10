const Component = React.Component;
var  liste_final = []

class CommandPrompt extends Component {
  constructor(props) {
    super(props);
    this.state = {
      path: 'WINDOWS',
      cwd: {},
      currentQuestionIndex: 0,
      text: '',
      questions: [
        {
          question: "Microsoft(R) Windows 95\n    (C)Copyright Microsoft Corp 1981-1995.\n\nAvez-vous déjà utilisé un framework PHP ou un autre outil pour créer des sites web ?",
          options: ["1. Jamais       ", "2. Une seule fois       ", "3. Occasionnellement       ", "4. Expérimenté\n"]
        },
        {
          question: "Cochez les fonctionnalités que vous avez déjà développées en utilisant PHP :",
          options: ["1. Formulaire de contact       ", "2. Intégration de services de paiement en ligne     ", " 3. Autre     "," 4. Aucune\n"]
        },
        {
          question: "Avez-vous créé des mises en page avec du CSS, même des plus simples ?",
          options: ["1. Jamais       ", "2. Une seule fois       ", "3. Occasionnellement       ", "4. Expérimenté\n"]
        },
        {
          question: "Cochez les fonctionnalités que vous avez déjà développées en utilisant CSS :",
          options: [" 1. Mise en page responsive       ", "2. Styling des éléments HTML     ", "3. Autre\n", "4. Aucune\n"]
        },
        {
          question: "Avez-vous déjà créé une page web en utilisant HTML  ?",
          options: ["1. Jamais       ", "2. Une seule fois       ", "3. Occasionnellement       ", "4. Expérimenté\n"]
        },
        {
          question: "Cochez les fonctionnalités que vous avez déjà développées en utilisant HTML :",
          options: [" 1. Création de formulaires de connexion     ", "2. Un site web pour une petite entreprise\n", "3. Autre     ", "4. Aucune\n"]
        },
        {
          question: "Avez-vous déjà créé une page web en utilisant JS ?",
          options: ["1. Jamais       ", "2. Une seule fois       ", "3. Occasionnellement       ", "4. Expérimenté\n"]
        },
        {
          question: "Cochez les fonctionnalités que vous avez déjà développées en utilisant JS :",
          options: [" 1. Créez une animation de site web     ", "2. Création de formulaires avec du JS\n", "3. Autre     ", "4. Aucune\n"]
        },
        {
          question: "Avez-vous écrit des requêtes SQL ?",
          options: ["1. Jamais       ", "2. Une seule fois       ", "3. Occasionnellement       ", "4. Expérimenté\n"]
        },
        {
          question: "Cochez les fonctionnalités que vous avez déjà développées en utilisant SQL :",
          options: [" 1. Créé une basse de données     ", "2. Faire une sélection dans une basse de données\n", "3. Autre     ", "4. Aucune\n"]
        }
      ]
    };

    this.input = this.input.bind(this);
  }

  async input(e) {
    const allowedKeys = ['1', '2', '3', '4'];
    if (e.key === "Enter") {
        if (this.state.currentQuestionIndex === this.state.questions.length) {
          document.getElementById('root').style.display = "none";
          document.getElementById('start__menu').style.display = "none";
          document.getElementById('monitor').style.backgroundImage = "url(shutdown.jpg)";
          document.getElementById('start').style.display = "none";
          var elems = document.getElementsByClassName('desktop-icon');
          for (var i=0;i<elems.length;i+=1){
            elems[i].style.display = 'none';
          }
          setTimeout(hack, 4000);
          //var params = new URLSearchParams();
          //params.append('code', liste_final.join(','));
          //var url = "classement.php?" + params.toString();
          //window.location.href = url;
          return;
        }
        const userResponse = parseInt(this.state.text.slice(-1));
        if (!isNaN(userResponse) && userResponse >= 1 && userResponse <= 4) {
            liste_final.push(userResponse);
            const currentQuestion = this.state.questions[this.state.currentQuestionIndex];
            const newCommand = `${this.state.text}\nC:\\WINDOWS> `;
            this.setState(prevState => ({ text: '', currentQuestionIndex: prevState.currentQuestionIndex + 1 }));
        }
    } else if (e.key === "Backspace") {
        if (this.state.text.slice(-12) === `C:\\${this.state.path}> `) return;
        this.setState({ text: this.state.text.slice(0, -1) });
    } else if (e.key === "Shift" ||
        e.key === "Alt" ||
        e.key === "Control" ||
        e.key === "Meta" ||
        e.key === "Tab" ||
        e.key === "CapsLock") {
        return;
    } else {
        if (allowedKeys.includes(e.key)) {
            this.setState({ text: this.state.text + e.key });
        }
    }
    
    if (this.state.currentQuestionIndex === this.state.questions.length) {
        console.log("Appuyez sur Entrée pour quitter.");
    }
}


  render() {
    const { text, currentQuestionIndex, questions } = this.state;
    let questionDisplay = '';
    if (currentQuestionIndex < questions.length) {
      console.log(liste_final)
      const currentQuestion = questions[currentQuestionIndex];
      questionDisplay = `${currentQuestion.question}\n${currentQuestion.options.join(' ')}\nC:\\WINDOWS> ${text}`;
    } else {
      questionDisplay = "[====================================== 100% ======================================]\n\nThe operation completed successfully. \n\nMicrosoft(R) Windows 95\n    (C)Copyright Microsoft Corp 1981-1995.\n\nC:\\WINDOWS> press ENTER to exit ...\n";
    }
    return /*#__PURE__*/(
      React.createElement("textarea", { className: "command", contenteditable: "true", value: questionDisplay, autoFocus: true, onKeyDown: this.input, readOnly: currentQuestionIndex === questions.length })
    );
  }
}

function Menubar() {
  return /*#__PURE__*/(
    React.createElement("div", { className: "window__menubar" }, /*#__PURE__*/
    React.createElement("div", { className: "window__program" }, /*#__PURE__*/
    React.createElement("img", { className: "window__logo", src: "https://devblogs.microsoft.com/commandline/wp-content/uploads/sites/33/2018/09/msdos-logo.png" }), /*#__PURE__*/
    React.createElement("span", null, "MS-DOS Prompt")), /*#__PURE__*/

    React.createElement("div", { className: "window__buttons" }, /*#__PURE__*/
    React.createElement("button", { onClick: () => {closepage()}}, "_"), /*#__PURE__*/
    React.createElement("button", null, "\u2610"), /*#__PURE__*/
    React.createElement("button", { onClick: () => {closepage()}}, "X"))));
  }

class TerminalWindow extends Component {
  render() {
    return /*#__PURE__*/(
      React.createElement("div", { className: "window" }, /*#__PURE__*/
      React.createElement(Menubar, null), /*#__PURE__*/
      React.createElement(CommandPrompt, null)));

  }
}

ReactDOM.render( /*#__PURE__*/React.createElement(TerminalWindow, null),
document.querySelector('#root'));
