let languageConfig = Object.assign({}, require("./tcltk.win32.nexss.config"));

languageConfig.builders = {}; // See Win32 version for field details how to setup
languageConfig.compilers = {
  tcl: {
    install: `pkg install -y tcl tcllib`,
    command: "tclsh",
    args: "<file>",
    help: ``,
  },
  tcltk: {
    install: `pkg install -y tcl tk tcllib`,
    command: "tclsh",
    args: "<file>",
    help: ``,
  },
};

const distName = process.distro;
languageConfig.dist = distName;

languageConfig.errors = require("./nexss.tcltk.errors"); // You may need the separate error file for different platform?
languageConfig.languagePackageManagers = {}; // See Win32 version for field details how to setup

module.exports = languageConfig;
