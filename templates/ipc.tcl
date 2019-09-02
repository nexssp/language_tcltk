# https://www.tcl-lang.org/man/tcl/TkCmd/send.htm

# https://wiki.tcl-lang.org/page/ZeroMQ

# https://www.ira.inaf.it/Computing/manuals/tcl/SocketExample.html

package require Tk


if {[tk appname FoobarApp] ne "FoobarApp"} {
    send -async FoobarApp RemoteStart $argv
    exit
}
# The command that will be called remotely, which raises
# the application main window and opens the requested files
proc RemoteStart args {
    raise .
    foreach filename $args {
        OpenFile $filename
    }
}