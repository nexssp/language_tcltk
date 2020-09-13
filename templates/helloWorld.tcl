#!/usr/bin/tclsh
encoding system utf-8
# set ::env(LANG) en_US.UTF-8
# TCL/TK Nexss PROGRAMMER 2.0
# Default for JSON data
package require json 

# Sometimes is loaded from the Nexss Project 'src', sometimes from the same directory
if {[file exists "src/3rdPartyLibraries/tcl2json/tcl2json.tcl"] == 1} {
    source src/3rdPartyLibraries/tcl2json/tcl2json.tcl
} else {
    source 3rdPartyLibraries/tcl2json/tcl2json.tcl
}

set NexssStdin [gets stdin]

set ParsedJSON [json::json2dict $NexssStdin]

# READ data
# puts [dict get $ParsedJSON start]

# MODIFY data
dict set ParsedJSON HellofromTCLTK $tcl_version

puts [tcl2json $ParsedJSON]
