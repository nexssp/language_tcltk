module.exports = {
  "t find package json":
    "It seems that you have preinstalled tcl. Please install tcllib: https://www.tcl.tk/software/tcllib.\nYou may want to use: " +
    process.replacePMByDistro("apt-get install tcllib"),
  "no $DISPLAY": "Are you on DOS?",
  "'tcl' is": `scoop install git`,
  "couldn't open socket": `Please Add connection/serverName/host and port to the _nexss.yml. For more information go to the troubleshooting area of readme.md`,
  'invalid command name "(?<command>.*?)".*\\(file "(?<file>.*?)" line (?<line>.*?)\\)':
    "Check the word/command '<command>' line: <line> in the file: <file>",
  // 'invalid command name "(?<found1>.*?)"': function(
  //   errorBody,
  //   filename,
  //   arrayMatch,
  //   languageConfig
  // ) {
  //   console.log(
  //     "Example of function as error solution",
  //     errorBody,
  //     filename,
  //     arrayMatch,
  //     languageConfig
  //   );
  // }
};
