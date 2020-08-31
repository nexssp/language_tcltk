let languageConfig = Object.assign({}, require("./tcltk.win32.nexss.config"));
languageConfig.builders = {}; // See Win32 version for field details how to setup
languageConfig.compilers = {
  apt: {
    install: "sudo apt install tcl tk",
    command: "tclsh",
    args: "<file>",
    help: ``,
  },
};
languageConfig.errors = require("./nexss.tcltk.errors"); // You may need the separate error file for different platform?
languageConfig.languagePackageManagers = {}; // See Win32 version for field details how to setup

module.exports = languageConfig;
