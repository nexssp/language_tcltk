set worker [thread::create]
thread::send -async $worker $script
# Later terminate the worker thread
thread::release

set t[thread::create {
    puts "Starting.."
    thread::wait
    puts "exiting thread.."
}]

thread::configure $t -unwindonerror 1

set errorFile [open errors.txt a]
proc logError {id error}{
    global errorFile
    puts $errorFile "Error in thread $id"
    puts $errorFile $error
    puts $errorFile ""
}
thread::errorproc logError

# SAFE using multithreads
package require Thread
# save the pwd in a thread-shared variable
tsv::set application pwd [pwd]
set t [thread::create {#...}]

set logger [thread::create{
    proc OpenLog {file} {
        global fid
        set fid [open $file a]
    }

    proc CloseLog {file} {
        global fid
        close $fid
    }

    proc AddLog {msg} {
        global fid
        puts fid $msg
    }

    thread::wait


}]




# thread::send -async $t [list ProcessValues $vals] result
# vwait result

# thread::wait

# thread::preserve

# thread::create --preserved

# thread::release

