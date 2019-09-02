package require Tk

# ttk::notebook .n  -width 100 -height 100
# frame .n.f1
# frame .n.f2 
# frame .n.f3 

# .n add .n.f1 -text "TabOne" 
# .n add .n.f2 -text "TabTwo"
# .n add .n.f3 -text "TabThree"
# pack [label .n.f1.f2 -background red -foreground white -text "TabOne"]
# pack [label .n.f2.f2 -background red -foreground white -text "TabTwo"]
# pack [label .n.f3.f2 -background green -foreground black -text "zzzzzzz"]
# pack [ttk::separator .n.f1.s -orient horizontal]
# pack .n

ttk::panedwindow .p -orient vertical
# first pane, which would get widgets gridded into it:
ttk::labelframe .p.f1 -text Pane1 -width 100 -height 100
ttk::labelframe .p.f2 -text Pane2 -width 100 -height 100; # second pane
.p add .p.f1
.p add .p.f2