// additional info for templates like copy extra libraries.
// in this case library needs JSON
const config = {
  files: ["3rdPartyLibraries/jimhttp/json.tcl"],
  commands: [process.replacePMByDistro("apt-get install tcllib")],
  repos: ["https://github.com/dbohdan/jimhttp"],
  descriptions: [
    "jimhttp - Copyright (c) 2014, 2015, 2016, 2017, 2018 dbohdan MIT License\nhttps://github.com/dbohdan/jimhttp/blob/master/LICENSE"
  ]
};

module.exports = config;
