package require Tk
# source 3rdPartyLibraries/retcl/retcl.tm
variable myLocation [file normalize [info script]]

interp alias {} console {} tkcon

# toplevel .w
# wm geometry .w 600x400+100+50

frame .launchpad
label .launchpad.label1 -text "           Nexss PROGRAMMER 2.0          "
pack .launchpad.label1 -side top -fill x

# Checkboxes
checkbutton .launchpad.przycisk -text "To jest checkbutton"
pack .launchpad.przycisk
.launchpad.przycisk select
puts "Stan przycisku: [.launchpad.przycisk cget -state]"

# Radio buttons
radiobutton .launchpad.przycisk1 -text "Jeden" -variable moja_zmienna -value jeden
radiobutton .launchpad.przycisk2 -text "Dwa" -variable moja_zmienna -value dwa
radiobutton .launchpad.przycisk3 -text "Trzy" -variable moja_zmienna -value trzy
radiobutton .launchpad.przycisk4 -text "Cztery" -variable moja_zmienna -value cztery
pack .launchpad.przycisk1 .launchpad.przycisk2 .launchpad.przycisk3 .launchpad.przycisk4

# List
set moja_zmienna "element1 element2 element3 element4 element5 element6"
listbox .launchpad.lista -width 15 -height 10 -listvariable moja_zmienna
pack .launchpad.lista

.launchpad.lista selection set 3
puts "Wybrany element: [.launchpad.lista get [.launchpad.lista curselection]]"

foreach color {red orange yellow green blue purple} {
    label .launchpad.l$color -text $color -bg white
    frame .launchpad.f$color -background $color -width 100 -height 2
    # grid .launchpad.l$color .launchpad.f$color
    pack .launchpad.l$color .launchpad.f$color

}

button .launchpad.button1 -text "Add New Sequence" -command {exec nexss selectElement.au3}
pack .launchpad.button1 -side top -fill x

# must be active window!!!!
bind . <Control-p> {.launchpad.button1 invoke}

button .launchpad.button2 -text "Sequences List" -command {exec nexss launchpad.tcl &}
pack .launchpad.button2 -side top -fill x

button .launchpad.button4 -text "Open Explorer" -command {exec explorer "../data" &}
pack .launchpad.button4 -side top -fill x

button .launchpad.button3 -text "About" -command {showAbout}
pack .launchpad.button3 -side top -fill x

pack .launchpad -side top

wm manage .launchpad

wm protocol .launchpad WM_DELETE_WINDOW {
    if {[tk_messageBox -parent . \
            -title "Close?" -icon question \
            -type yesno -default no \
            -message "Do You want to close this window"] == yes} {
        exit
    }
}

proc showAbout {} {
    tk_messageBox -message "Welcome to Example 1\nNexss PROGRAMMER 2.0" \
        -title {About example 1}
}

# console hide