package require Tk

if {[info exists env(DEBUG)] && [catch {package present Tk}] == 0} {
    rename puts tcl_puts
    proc puts {args} {
        # put special code here to send data to the text widget
        # also print to the screen
        uplevel 1 tcl_puts $args
    }
}

proc doIt {widget} {
    set current_color \
        [tk_chooseColor -title "Choose a background color" -parent .]
    $widget configure -background $current_color
    destroy 
    puts stdout  "{\"current_color\":\"$current_color\"}"
    
}

int returnCode = Tcl_Eval(interp, "puts \"Hello World\"");

label .l
button .b -text "Choose a color..." \
        -command "doIt .b" 
grid .b -row 0 -column 0