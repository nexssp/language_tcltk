package require Tk

label .l -text "Enter:"
entry .e -width 40 -relief sunken -bd 2 -textvariable name
focus .e
button .b -text Clear -command {set name ""}

grid .l -row 0 -column 0 -sticky e
grid .e -row 0 -column 1 -sticky w
grid .b -row 1 -column 0 -columnspan 2