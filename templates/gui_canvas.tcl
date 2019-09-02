package require Tk
source 3rdPartyLibraries/retcl/retcl.tm

retcl create r2
# r2 -sync PUBLISH foo canvas
    
proc moveit {object x y} {
  .c coords $object [expr $x-25] [expr $y-25] [expr $x+25] [expr $y+25]
  puts stdout  "{\"x\":\"$x\",\"y\":\"$y\"}"
  # redis publish
  r2 -sync PUBLISH foo "{\"x\":\"$x\",\"y\":\"$y\"}"
}

set r [retcl new]
$r callback foo [list mycallback $r [clock seconds]]
$r PSUBSCRIBE foo


proc mycallback {obj registrationTime type pattern channel message} {
    set elapsed [expr {[clock seconds] - $registrationTime}]
    puts "After $elapsed seconds I got a message of type $type"
    puts "on my registration channel $pattern."
    puts "The actual channel was $channel. The message is $message."

    if {$type eq {pmessage}} {
        $obj destroy
        set ::forever 1
    }
}


canvas .c -width 250 -height 100
set myoval [.c create oval 0 0 50 50 -fill orange]
set myline [.c create line 50 50 100 100 -fill blue -width 4]

.c bind $myoval <B1-Motion>  {moveit $myoval %x %y}
.c bind $myline <B1-Motion>  {moveit $myline %x %y}

grid .c -row 0 -column 0