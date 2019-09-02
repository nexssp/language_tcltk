set apachectl "/usr/local/apache/bin/apachectl"
global apachectl

package require Tk

proc start {} {
  global apachectl
  exec $apachectl start & 
}

proc stop {} {
  global apachectl
  exec $apachectl stop &
}

proc restart {} {
  global apachectl
  exec $apachectl restart &
}

proc screen {} {
  frame .top -borderwidth 10
  pack .top -fill x	
  button .top.start -text "Start" -command start
  button .top.stop -text "Stop" -command stop
  button .top.restart -text "Restart" -command restart
  pack .top.start .top.stop .top.restart -side left -padx 0p -pady 0
}
screen