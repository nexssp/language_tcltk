# Readme

## Important info

This was only tested on Windows. Builders (TO EXE) functions are still to be validated. Package Managers needs to be added (fossil and teacup ?)

## Manual Installation / Troubleshooting

If from any reason you are unable to use tcl/tk with nexss please try install it manually:

### Tcllib

1. Download latest Tcllib package: https://core.tcl-lang.org/tcllib/wiki?name=Downloads
2. Install Tcllib https://wiki.tcl-lang.org/page/Tcllib+Installation

## Tutorials

<https://wiki.tcl-lang.org/page/Tcl+Tutorial+Lesson+0>  
<https://www.tcl.tk/man/tcl8.5/tutorial/tcltutorial.html>  
<https://www.tutorialspoint.com/tcl-tk/tcl_tk_quick_guide.htm>

## Widgets

(http://tcltk.free.fr/tcltkcode.php3)
(http://www.beedub.com/book/2nd/TKEXAMPL.doc.html)
(http://pages.cpsc.ucalgary.ca/~saul/personal/archives/Tcl-Tk_stuff/tcl_examples/)

<!-- http://www.beedub.com/book/ -->

http://www.beedub.com/book/4th/Threads.pdf

https://github.com/andreas-kupries/critcl

## Demos

cd C:\Users\mapoart\scoop\apps\git\current\mingw64\lib\tk8.6\demos
wish widget

## Notes

```sh
sh configure help

#install tcltk canvas 3d
sh configure --with-tcl=C:\Users\mapoart\scoop\apps\git\current\mingw64\lib --with-tk=C:\Users\mapoart\scoop\apps\git\current\mingw64\lib --with-tclinclude=c:\sources\tcl8.6.9\generic\ --with-tkinclude=c:\sources\tk8.6.9\generic\

#maybe to add
--with-tclinclude=c:\sources\tcl8.6.9\generic\ --with-tkinclude=c:\sources\tk8.6.9\generic\

#Linux
sudo apt-get install tcl-dev tk-dev mesa-common-dev libjpeg-dev libtogl-dev
```
