# Written based on https://wiki.tcl-lang.org/page/tcl_platform

set elements [list platform osVersion user engine machine]

foreach element $elements {
    puts "$element $::tcl_platform($element)"
}
# or just
parray tcl_platform
