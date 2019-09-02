package require Tk
proc setHeight {w height} {
    incr height 21
    set y2 [expr $height - 30]
    if {$y2 <21} { 
        set y2 21 
    } 
    $w coords poly 15 20 35 20 35 $y2 45 $y2 25 $height 5 $y2 15 $y2 15 20 
    $w coords line 15 20 35 20 35 $y2 45 $y2 25 $height 5 $y2 15 $y2 15 20 
} 
scale .scale -orient vertical -length 284 -from 0 -to 250 \
    -tickinterval 50 \
    -command "setHeight .canvas" 
canvas .canvas -width 50 -height 50 -bd 0 -highlightthickness 0 
.canvas create polygon 0 0 1 1 2 2 -fill SeaGreen3 -tags poly 
.canvas create line 0 0 1 1 2 2 0 0 -fill black -tags line 
grid .scale -row 0 -column 0 -sticky ne 
grid .canvas -row 0 -column 1 -sticky nwse 
.scale set 75