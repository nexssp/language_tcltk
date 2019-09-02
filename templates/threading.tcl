package require Thread

puts "*** I'm thread [thread::id]"
# Create 3 threads
for {set thread 1} {$thread <= 3} {incr thread} {
    set id [thread::create {
        # Print a hello message 3 times, waiting
        # a random amount of time between messages
        for {set i 1} {$i <= 3} {incr i} {
            after [expr { int(500*rand()) }]
            puts "Thread [thread::id] says hello"
        }
    }] ;# thread::create
    puts "*** Started thread $id"
} ;# for

puts "*** Existing threads: [thread::names]"
# Wait until all other threads are finished
while {[llength [thread::names]] > 1} {
    after 500
}
puts "*** That's all, folks!"

thread::wait
# set t [thread::create] ;# Create a thread
# => 1572
# set myX 42 ;# Create a variable in the main thread
# => 42
# # Copy the value to a variable in the worker thread
# thread::send $t [list set yourX $myX]
# => 42
# # Perform a calculation in the worker thread
# thread::send $t {expr { $yourX / 2 } }
# => 21
# thread::send $t {expr { $yourX / 0 } }
# => divide by zero
# catch {thread::send $t {expr { $yourX / 0 } } } ret
# => 1
# puts $ret
# => divide by zero
# puts $errorInfo
# => divide by zero
# while executing
# "expr { $yourX / 0 } "
# invoked from within
# "thread::send $t {expr { $yourX / 0 } } "