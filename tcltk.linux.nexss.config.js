let languageConfig = Object.assign({}, require("../config.linux"));
languageConfig.title = "TCL/TK";
languageConfig.description = `Tcl (Tool Command Language) is a very powerful but easy to learn dynamic programming language, suitable for a very wide range of uses, including web and desktop applications, networking, administration, testing and many more.
Tk is a graphical user interface toolkit that takes developing desktop applications to a higher level than conventional approaches.`;
languageConfig.url = "https://www.tcl.tk/";
languageConfig.extensions = [".tcl"];
languageConfig.executeCommandLine = "tclsh -e";
languageConfig.printCommandLine = "tclsh -p";
languageConfig.checkSyntax = "tclsh -c";
languageConfig.interactiveShell = "tclsh";
languageConfig.builders = {}; // See Win32 version for field details how to setup
languageConfig.compilers = {
  apt: {
    install: "sudo apt install tcl tk",
    command: "tclsh",
    args: "<file>",
    help: ``
  }
};
languageConfig.errors = require("./nexss.tcltk.errors"); // You may need the separate error file for different platform?
languageConfig.languagePackageManagers = {}; // See Win32 version for field details how to setup

module.exports = languageConfig;
