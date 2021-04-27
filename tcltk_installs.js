const tclLibCustomInstall = (binary = "tclsh") => {
  return `wget https://core.tcl-lang.org/tcllib/uv/tcllib-1.20.tar.gz
echo Unpacking tcllib..
tar zxf tcllib-1.20.tar.gz
rm tcllib-1.20.tar.gz
cd tcllib-1.20
echo Installing tclib
${binary} installer.tcl -no-gui -no-wait`;
};

module.exports = { tclLibCustomInstall };
