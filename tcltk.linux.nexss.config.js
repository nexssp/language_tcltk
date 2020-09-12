let languageConfig = Object.assign({}, require("./tcltk.win32.nexss.config"));

let sudo = "sudo ";
if (process.getuid && process.getuid() === 0) {
  sudo = "";
}

languageConfig.builders = {}; // See Win32 version for field details how to setup
languageConfig.compilers = {
  apt: {
    install: `${sudo}apt install -y tcl tk tcllib`,
    command: "tclsh",
    args: "<file>",
    help: ``,
  },
};

const {
  replaceCommandByDist,
  dist,
} = require(`${process.env.NEXSS_SRC_PATH}/lib/osys`);

const distName = dist();

switch (distName) {
  case "Arch Linux":
    languageConfig.compilers.apt.install = `${sudo}pacman -Syy
${sudo}pacman -S --noconfirm tcl tk
${sudo}pacman -Scc --noconfirm
wget https://core.tcl-lang.org/tcllib/uv/tcllib-1.20.tar.gz
tar zxf tcllib-1.20.tar.gz
rm tcllib-1.20.tar.gz
cd tcllib-1.20
tclsh installer.tcl -no-gui -no-wait`;
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
  default:
    languageConfig.compilers.apt.install = replaceCommandByDist(
      languageConfig.compilers.apt.install
    );
    break;
}

languageConfig.errors = require("./nexss.tcltk.errors"); // You may need the separate error file for different platform?
languageConfig.languagePackageManagers = {}; // See Win32 version for field details how to setup

module.exports = languageConfig;
