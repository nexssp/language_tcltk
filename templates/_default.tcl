#!/usr/bin/tclsh
# TCL/TK Nexss PROGRAMMER 2.0
# Default for JSON data

# json needs TCLib https://core.tcl.tk/tcllib/zip/tcllib-trunk.zip?uuid=trunk
# install: nexss install.tcl
package require json 
source src/3rdPartyLibraries/tcl2json/tcl2json.tcl

set NexssStdin [gets stdin]
# puts "$line"

set ParsedJSON [json::json2dict $NexssStdin]

# READ data
# puts [dict get $ParsedJSON start]

# MODIFY data
dict set ParsedJSON test test

# FIXME: [] is replaced by "" on stringify2
puts [tcl2json $ParsedJSON]
