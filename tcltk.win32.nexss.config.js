let languageConfig = Object.assign({}, require("../config.win32"));
languageConfig.title = "TCL/TK";
languageConfig.description = `Tcl (Tool Command Language) is a very powerful but easy to learn dynamic programming language, suitable for a very wide range of uses, including web and desktop applications, networking, administration, testing and many more.
Tk is a graphical user interface toolkit that takes developing desktop applications to a higher level than conventional approaches.`;
languageConfig.url = "https://www.tcl.tk/";
languageConfig.extensions = [".tcl"];
languageConfig.executeCommandLine = "tclsh -e";
languageConfig.printCommandLine = "tclsh -p";
languageConfig.checkSyntax = "tclsh -c";
languageConfig.interactiveShell = "tclsh";
languageConfig.builders = {
  // FIXME: This doesnt work. Exe file is not created properly
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
    //TCL/TK is in the git installation
    install: "scoop install git",
    command: "tclsh",
    args: "<file>",
    help: ``
  }
};
languageConfig.errors = require("./nexss.tcltk.errors");
languageConfig.languagePackageManagers = {
  fossil: {
    // https://wiki.tcl-lang.org/page/Fossil
    // FIXME: To make fossil commands
    installation: "scoop install fossil",
    messageAfterInstallation: null, // sometimes there is need of add something to the files can be add here eg php for composer.
    installed: "fossil list",
    search: "fossil search",
    install: "fossil install",
    uninstall: "fossil remove",
    help: "fossil help",
    version: "fossil --version",
    init: () => {
      //see on node js how to make function here
    },
    // if command not found in specification
    // run directly on package manager
    else: "fossil"
  },
  teacup: {
    installation: "See how to install teacup?", //FIXME: teacup installation
    messageAfterInstallation: null, // sometimes there is need of add something to the files can be add here eg php for composer.
    installed: "teacup list",
    search: "teacup search",
    install: "teacup install",
    uninstall: "teacup remove",
    help: "teacup help",
    version: "teacup --version",
    init: () => {
      //see on node js language how to make function here
    },
    // if command not found in specification
    // run directly on package manager
    else: "teacup"
  }
};

module.exports = languageConfig;
