let languageConfig = Object.assign({}, require("./tcltk.win32.nexss.config"));
languageConfig.builders = {}; // See Win32 version for field details how to setup
languageConfig.compilers = {
  brew: {
    install: "brew install tcl-tk",
    command: "tclsh",
    args: "<file>",
    help: ``,
  },
};
languageConfig.languagePackageManagers = {}; // See Win32 version for field details how to setup

module.exports = languageConfig;
