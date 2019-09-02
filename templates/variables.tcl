set x {z a b c}
puts $x
puts [lindex $x 2]
puts [lsort $x]
lappend x cccccccc
puts $x
;#zoncat foreach lappend lindex linsert list list llength lrange lreplace lsearch lsort lreplace
puts [lindex {a 1 z {x 5 c} z} 3]
