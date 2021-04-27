let languageConfig = Object.assign({}, require("./tcltk.win32.nexss.config"));
const { tclLibCustomInstall } = require("./tcltk_installs");
let sudo = process.sudo;

languageConfig.builders = {}; // See Win32 version for field details how to setup
languageConfig.compilers = {
  tcl86: {
    install: `${sudo}apt install -y tcl tcllib cmake wget`,
    command: "tclsh",
    args: "<file>",
    help: ``,
  },
  tcltk86: {
    install: `${sudo}apt install -y tcl tk tcllib cmake wget`,
    command: "tclsh",
    args: "<file>",
    help: ``,
  },
};

const distName = process.distro;
languageConfig.dist = distName;
switch (distName) {
  case process.distros.AMAZON:
    languageConfig.compilers.tcl86.install = process.replacePMByDistro(
      languageConfig.compilers.tcl86.install + tclLibCustomInstall()
    );

    languageConfig.compilers.tcltk86.install = process.replacePMByDistro(
      languageConfig.compilers.tcltk86.install + tclLibCustomInstall()
    );

    break;
  case process.distros.ARCH:
    languageConfig.compilers.tcl86.install =
      `${sudo}pacman -Syy
${sudo}pacman -S --noconfirm wget tcl
${sudo}pacman -Scc --noconfirm
` + tclLibCustomInstall();
    languageConfig.compilers.tcltk86.install =
      `${sudo}pacman -Syy
${sudo}pacman -S --noconfirm wget tcl tk
${sudo}pacman -Scc --noconfirm
` + tclLibCustomInstall();
    languageConfig.compilers.tcl86.install = languageConfig.compilers.tcltk86.install.replace(
      "tcl tk",
      "tcl"
    );
    // case "Alpine Linux":
    //   languageConfig.compilers.apt.install = ``;
    break;
  //     case "Oracle":
  //     case "Oracle Linux Server":
  //     case "CentOS Linux":
  //       languageConfig.compilers.apt.install = `curl https://packages.microsoft.com/config/rhel/7/prod.repo | ${sudo} tee /etc/yum.repos.d/microsoft.repo
  // ${sudo}yum install -y powershell`;
  //       break;
  //     case "RHEL Linux":
  //       languageConfig.compilers.apt.install = `curl https://packages.microsoft.com/config/rhel/7/prod.repo | ${sudo} tee /etc/yum.repos.d/microsoft.repo
  // ${sudo}yum install -y powershell`;
  //       break;
  //     case "Fedora":
  //       languageConfig.compilers.apt.install = `${sudo} rpm --import https://packages.microsoft.com/keys/microsoft.asc
  // curl https://packages.microsoft.com/config/rhel/7/prod.repo | ${sudo} tee /etc/yum.repos.d/microsoft.repo
  // ${sudo} dnf check-update
  // ${sudo} dnf install compat-openssl10
  // ${sudo} dnf install -y powershell`;
  //       break;
  case process.distros.ORACLE:
  case process.distros.CENTOS:
    languageConfig.compilers.tcl86.install =
      `yum install -y cmake curl gcc make
wget https://prdownloads.sourceforge.net/tcl/tcl8.6.10-src.tar.gz
tar zxf tcl8.6.10-src.tar.gz
cd tcl8.6.10/unix
./configure
make
make install
cd ../../
` + tclLibCustomInstall("tclsh8.6");
    languageConfig.compilers.tcl86.command = "tclsh8.6";
    languageConfig.compilers.tcltk86.install = `yum install -y cmake wget gcc make
wget https://prdownloads.sourceforge.net/tcl/tcl8.6.10-src.tar.gz
tar zxf tcl8.6.10-src.tar.gz
cd tcl8.6.10/unix
./configure
make
make install
cd ../../
wget https://prdownloads.sourceforge.net/tcl/tk8.6.10-src.tar.gz
tar zxf tk8.6.10-src.tar.gz
cd tk8.6.10/unix
./configure --with-tcl="$(pwd)/../../tcl8.6.10/unix"
make
make install`;
    languageConfig.compilers.tcltk86.command = "tclsh8.6";
    break;
  case process.distros.ALPINE:
    languageConfig.compilers.tcltk86.install =
      process.replacePMByDistro(
        languageConfig.compilers.tcl86.install
          .replace(" tcllib", "") //No tclib
          .replace("tcl tk", "tcl")
      ) +
      `
` +
      tclLibCustomInstall();
    languageConfig.compilers.tcl86.install =
      process.replacePMByDistro(
        languageConfig.compilers.tcl86.install.replace(" tcllib", "") //No tclib
      ) +
      `
` +
      tclLibCustomInstall();
    break;
  default:
    languageConfig.compilers.tcl86.install = process.replacePMByDistro(
      languageConfig.compilers.tcl86.install
    );
    languageConfig.compilers.tcltk86.install = process.replacePMByDistro(
      languageConfig.compilers.tcltk86.install
    );
    break;
}

languageConfig.errors = require("./nexss.tcltk.errors"); // You may need the separate error file for different platform?
languageConfig.languagePackageManagers = {}; // See Win32 version for field details how to setup

module.exports = languageConfig;
