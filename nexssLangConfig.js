module.exports = {
  description: "TCL/TK",
  type: "language",
  author: "Marcin Polak <mapoart@gmail.com>",
  version: "1.0",
  description: "TCL",
  compiler: "tclsh",
  extension: ".tcl",
  executeCommandLine: "",
  InteractiveShell: "",
  errors: {
    "'tcl' is": {
      win32: "scoop install git"
    },
    "tclsh: not found": {
      linux: "sudo apt-get install tcl tk",
      darwin: "brew install tcl"
    },
    'package require (.*?)"': {
      win32: "teacup install <module>",
      darwin: "brew install cpanm && sudo cpan <module>",
      linux: "teacup install <module>"
    },
    "no $DISPLAY": {
      win32: "Are you on DOS?",
      darwin: " ---- To fill in ----",
      linux:
        "Start X-Window (startx) ? If you are running Linux subsystem on Windows (WSL) start nexss from Windows Terminal (cmd.exe or powershell.exe)."
    }
  },
  url: ""
};
