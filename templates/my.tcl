#!/usr/bin/tclsh

#https://github.com/dbohdan/jimhttp

source 3rdPartyLibraries/jimhttp/json.tcl

# while {[gets stdin line] >= 0} {
#     # do what you like here
#     # puts "$line"


#     # 
# }

set line [gets stdin]
# puts "$line"
set x [::json::parse "$line"]

# TODO: find out how to change the data

# parray $x
# puts stdout "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
set $x{zzzz} 1000

# puts [json::json2dict "\{$x\}"]

puts [::json::stringify2 $x]

# puts [::json::stringify {
#     a 123
#     b 123
#     c {123 456}
#     d true
#     e true
# } 0 {
#     a string
#     c {N* number}
#     d string
# }]


