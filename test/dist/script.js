const Component = React.Component;

const fileTree = {
  "WINDOWS": {
    "Users": {
      "Evan": {
        'Documents': {
          "resume.txt": "this is my resume" },

        "Downloads": {
          "St.John_Fisher_College.txt": "B.S. Biology",
          "SUNY_Cortland.txt": "M.S. Exercise Science" },

        "Applications": {
          "This!.txt": "look a round at the code!" } },


      "world.txt": 'Hello World!' } } };




class CommandPrompt extends Component {
  constructor(props) {
    super(props);
    this.state = {
      path: 'WINDOWS',
      cwd: fileTree['WINDOWS'],
      text: `Microsoft(R) Windows 95\n    (C)Copyright Microsoft Corp 1981-1995.\n\nC:\\WINDOWS> ` };

    this.input = this.input.bind(this);
    this.evaluate = this.evaluate.bind(this);
  }
  // cmd prompt functions
  type(args) {this.setState({ text: this.state.text + `\n${this.state.cwd[args]}` });}
  cls() {this.setState({ text: '' });}
  date() {this.setState({ text: this.state.text += " " + Date() });}
  echo(args) {this.setState({ text: this.state.text + `\n${args.join(' ')}` });}
  mkdir(dirname) {
    this.state.cwd[dirname] = {};
    this.setState({ cwd: this.state.cwd });
  }
  rmdir(dirname) {
    delete this.state.cwd[dirname];
    this.setState({ cwd: this.state.cwd });
  }
  dir() {
    let newText = `\n`;
    for (let object of Object.keys(this.state.cwd)) {
      newText += `${object}\t`;
    }
    this.setState({ text: this.state.text += newText });
  }
  cd(args) {
    for (let arg of args) {
      if (arg === '..') {
        if (this.state.cwd === fileTree['WINDOWS']) return;
        const directories = this.state.path.split('\\');
        let cwd = fileTree;
        directories.pop(directories.length - 1);
        let newPath = directories.join('\\');
        console.log('new path', newPath);
        while (directories.length) {
          cwd = cwd[directories[0]];
          directories.shift(0);
        }
        this.setState({
          path: newPath,
          cwd: cwd });

      } else if (this.state.cwd[arg]) {
        this.setState({
          path: this.state.path += arg === 'WINDOWS' ? `${arg}` : `\\${arg}`,
          cwd: this.state.cwd[arg] });

      } else {
        this.setState({ text: this.state.text += '\nNo such file or directory' });
      }
    }
  }

  async evaluate(cmd) {
    if (cmd === '') return;
    let args = cmd.split(' ');
    if (this[args[0]]) await this[args[0]](args.slice(1));else
    this.state.text += `\n'${args[0]}' is not recognized as an internal or external command,operable program or batch file\n`;
  }
  async input(e) {
    if (e.key === "Enter") {
      const commands = this.state.text.split(/C:\\.+> /);
      await this.evaluate(commands[commands.length - 1].trim());
      this.setState({ text: this.state.text + `${this.state.text !== "" ? `\n` : ``}C:\\${this.state.path}> ` });
    } else if (e.key === "Backspace") {
      if (this.state.text.slice(-12) === `C:\\${this.state.path.split(/\\/).join('\\')}> `) return;
      this.setState({ text: this.state.text.slice(0, -1) });
    } else if (e.key === "Shift" ||
    e.key === "Alt" ||
    e.key === "Control" ||
    e.key === "Meta" ||
    e.key === "Tab" ||
    e.key === "CapsLock") {
      return;
    } else {
      this.setState({ text: this.state.text + e.key });
    }
  }
  render() {
    return /*#__PURE__*/(
      React.createElement("textarea", { className: "command", contenteditable: "true", onKeyDown: this.input, value: this.state.text }));
  }}


function Menubar() {
  return /*#__PURE__*/(
    React.createElement("div", { className: "window__menubar" }, /*#__PURE__*/
    React.createElement("div", { className: "window__program" }, /*#__PURE__*/
    React.createElement("img", { className: "window__logo", src: "https://devblogs.microsoft.com/commandline/wp-content/uploads/sites/33/2018/09/msdos-logo.png" }), /*#__PURE__*/
    React.createElement("span", null, "MS-DOS Prompt")), /*#__PURE__*/

    React.createElement("div", { className: "window__buttons" }, /*#__PURE__*/
    React.createElement("button", null, "_"), /*#__PURE__*/
    React.createElement("button", null, "\u2610"), /*#__PURE__*/
    React.createElement("button", null, "X"))));



}

class TerminalWindow extends Component {
  render() {
    return /*#__PURE__*/(
      React.createElement("div", { className: "window" }, /*#__PURE__*/
      React.createElement(Menubar, null), /*#__PURE__*/
      React.createElement(CommandPrompt, null)));

  }}


ReactDOM.render( /*#__PURE__*/React.createElement(TerminalWindow, null),
document.querySelector('#root'));