let languageConfig = Object.assign({}, require("../config.win32"));
languageConfig.title = "TCL/TK";
languageConfig.description = `Tcl (Tool Command Language) is a very powerful but easy to learn dynamic programming language, suitable for a very wide range of uses, including web and desktop applications, networking, administration, testing and many more.
Tk is a graphical user interface toolkit that takes developing desktop applications to a higher level than conventional approaches.`;
languageConfig.url = "https://www.tcl.tk/";
languageConfig.extensions = [".tcl"];
languageConfig.executeCommandLine = "tclsh -e";
languageConfig.printCommandLine = "tclsh -p"; //no console.log() needed to display result eg node -p "4+6"
languageConfig.checkSyntax = "tclsh -c";
languageConfig.interactiveShell = "tclsh";
languageConfig.builders = {
  freeWrap: {
    install: "installed",
    cmd: __dirname + "/builder/freewrap/win64/freewrap.exe", //https://wiki.tcl-lang.org/page/Deploying+With+Freewrap
    build: () => {
      require("path").join(
        __dirname,
        "..",
        "builder",
        `win${process.arch.replace("x", "")}`,
        "freewrap.exe"
      );
    }, // "pkg --output <destinationFile> --out-path <destinationPath> <file>",
    args: "<file> -o <destinationFile> ",
    help: ``
  }
};
languageConfig.compilers = {
  git: {
    install: "scoop install git",
    // Cpp does not have possibility to compile and run on the fly. We need to save it as a exe file first.
    command: "tclsh",
    args: "<file>",
    help: ``
  }
};
languageConfig.errors = require("./nexss.tcltk.errors");
languageConfig.languagePackageManagers = {
  fossil: {
    // https://wiki.tcl-lang.org/page/Fossil
    installation: "scoop install fossil",
    messageAfterInstallation: null, // sometimes there is need of add something to the files can be add here eg php for composer.
    installed: "teacup list <args>",
    search: "teacup search <args>",
    install: "teacup install <args>",
    uninstall: "teacup remove <args>",
    help: "teacup help <args>",
    version: "teacup --version",
    init: () => {
      //see on node js how to make function here
    },
    // if command not found in specification
    // run directly on package manager
    else: "teacup <default> <args>"
  },
  npm: {
    installation: "See how to install teacup",
    messageAfterInstallation: null, // sometimes there is need of add something to the files can be add here eg php for composer.
    installed: "teacup list <args>",
    search: "teacup search <args>",
    install: "teacup install <args>",
    uninstall: "teacup remove <args>",
    help: "teacup help <args>",
    version: "teacup --version",
    init: () => {
      //see on node js how to make function here
    },
    // if command not found in specification
    // run directly on package manager
    else: "teacup <default> <args>"
  }
};

module.exports = languageConfig;
