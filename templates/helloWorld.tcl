#!/usr/bin/tclsh
encoding system utf-8
# set ::env(LANG) en_US.UTF-8
# TCL/TK Nexss PROGRAMMER 2.x
# Default for JSON data

package require json 
package require json::write

set NexssStdin [gets stdin]
set ParsedJSON [json::json2dict $NexssStdin]

# READ data
# puts [dict get $ParsedJSON start]

# MODIFY data
dict set ParsedJSON HellofromTCLTK $tcl_version

puts [json::write object {*}[dict map {key val} $ParsedJSON  {json::write string $val}]]
