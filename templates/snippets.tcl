# if is not empty
if {[string trim $var] != ""} {
    puts $var
}

# list to assoc array like v_array(mykey1)
foreach {a b} $list {
  set v_array($a) $b
}

# list to assoc 'array set' method
array set v_array $pkgConfig
parray v_array

# shift
proc lshift listVar {
    upvar 1 $listVar l
    set r [lindex $l 0]
    set l [lreplace $l [set l 0] 0]
    return $r
}

## Dictonaries

set colours [dict create colour1 "black" colour2 "white"]
foreach item [dict keys $colours] {
   set value [dict get $colours $item]
   puts $value
}

## Conversions

# array -> dict
set dict [array get myArr]

# dict -> array
array set myArrCopy $dict

## Arrays

Sorting Arrays and Dictonaries

lsort -stride 2 {grapefruit 10 banana 110 cherry 25}
lsort -stride 2 -index 1 -integer {grapefruit 10 banana 110 cherry 25}

### Loop

set languages(0) Tcl
set languages(1) "C Language"
for { set index 0 }  { $index < [array size languages] }  { incr index } {
   puts "languages($index) : $languages($index)"
}

### loop 2

set personA(Name) "Dave"
set personA(Age) 14
foreach index [array names personA] {
   puts "personA($index): $personA($index)"
}

# loop list + multiple radio choice element
foreach size {8 10 12 18 24} {
    radiobutton .pts$size -variable pts \
            -value $size -text "$size points"
}

pack .pts8 .pts10 .pts12 .pts18 .pts24 \
                -in .left -side top -anchor w

# messagebox
tk_messageBox -message "Have a good day"
tk_messageBox -type "yesno" 
	    -message "Are you sure you want to install SuperVirus?" 
	    -icon question -title "Install"

# Windows
set oldtitle [wm title .window]

set thestate [wm state .window]
wm state .window normal
wm iconify .window
wm deiconify .window

# Dialogs

set filename [tk_getOpenFile]
set filename [tk_getSaveFile]
set dirname [tk_chooseDirectory]

