// additional info for templates like copy extra libraries.
// in this case library needs JSON
let install = "";
if (process.platform !== "win32") {
  switch (process.distro) {
    case process.distros.CENTOS:
      break;
    default:
      const { tclLibCustomInstall } = require("./../tcltk_installs");
      install = process.replacePMByDistro(tclLibCustomInstall());
  }
}

const config = {
  files: ["3rdPartyLibraries/tcl2json/tcl2json.tcl"],
  commands: [install],
  repos: ["https://rosettacode.org/wiki/JSON#Tcl"],
  descriptions: [
    "file: tcl2json.tcl based on rosettacode.org, GNU Free Documentation License 1.2",
  ],
};

module.exports = config;
