# package require Img;
package require Tk

image create photo IMAGENAME -file "./img/calculatorUI.jpg"
labelframe .lb -text buttons
label .myentry -text "0"
label .click_coord -text click_coord
canvas .lb.c -height [image height IMAGENAME] -width [image width IMAGENAME] -bd 5
.lb.c create image 0 0 -image IMAGENAME -anchor nw


bind .lb.c <Button-1> {
    set coordx %x
    set coordy %y
    .click_coord configure -text "click_coord: x:$coordx y:$coordy"
}

pack .myentry
pack .lb .lb.c
pack .click_coord