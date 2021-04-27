// additional info for templates like copy extra libraries.
// in this case library needs JSON
const config = {
  files: ["3rdPartyLibraries/tcl2json/tcl2json.tcl"],
  commands: [
    process.platform !== "win32"
      ? process.replacePMByDistro("apt-get install tcllib")
      : "",
  ],
  repos: ["https://rosettacode.org/wiki/JSON#Tcl"],
  descriptions: [
    "file: tcl2json.tcl based on rosettacode.org, GNU Free Documentation License 1.2",
  ],
};

module.exports = config;
