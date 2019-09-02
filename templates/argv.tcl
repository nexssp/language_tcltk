# Source from: https://wiki.tcl-lang.org/page/argv

if { $::argc > 0 } {
    set i 1
    foreach arg $::argv {
        puts "argument $i is $arg"
        incr i
    }
} else {
    puts "no command line argument passed"
}