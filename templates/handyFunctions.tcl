# Display top level windows

proc toplevels {{w .}} {
    if {[winfo toplevel $w] eq $w} {
        set res [list $w]
    } else {
        set res {}
    }
    foreach ww [winfo children $w] {
        lappend res {*}[toplevels $ww]
    }
    return $res
}

# display top level windows which are on the screen

wm stackorder .