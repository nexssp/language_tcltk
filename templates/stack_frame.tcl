proc proc1 {} {
 set othervalue 1
 proc2
}
proc proc2 {} {
 upvar 2 somevalue sv
 upvar 1 othervalue ov
 puts "sv=$sv ov=$ov"
}
set somevalue 12
proc1