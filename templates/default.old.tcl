#!/usr/bin/tclsh
encoding system utf-8
# set ::env(LANG) en_US.UTF-8
# TCL/TK Nexss PROGRAMMER 2.0
# Default for JSON data
package require json 
package require json::write

proc json::dict2json {dictVal} {
    set json ""
        dict for {key val} $dictVal {
	if {0 && ![string is double -strict $val]
	    && ![regexp {^(?:true|false|null)$} $val]} {
	    set val "\"$val\""
	}
    	append json ",\"$key\": \"$val\""
    }
    set json [string range ${json} 1 end]
    return "\{${json}\}"
}

set NexssStdin [gets stdin]

set ParsedJSON [json::json2dict $NexssStdin]

# READ data
# puts [dict get $ParsedJSON start]

# MODIFY data
dict set ParsedJSON test test

puts [json::dict2json $ParsedJSON]
