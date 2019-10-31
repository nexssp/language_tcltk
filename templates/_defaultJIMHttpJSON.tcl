#!/usr/bin/tclsh
# TCL/TK Nexss PROGRAMMER 2.0
# Default for JSON data

#https://github.com/dbohdan/jimhttp
source src/3rdPartyLibraries/jimhttp/json.tcl

set line [gets stdin]
# puts "$line"

set NexssStdin [::json::parse "$line"]
array set ParsedJSON $NexssStdin
# READ data
# set start $ParsedJSON(start)

# MODIFY data
set ParsedJSON(test) test

# FIXME: [] is replaced by "" on stringify2
puts [::json::stringify2 [array get ParsedJSON]]
