set files [glob *]

set mx 0

foreach fl $files {
    set len [string length $fl]
    if { $len > $mx} {
        set mx $len
    }
}

set fstr "%-$mx\s %-s"
puts [format $fstr Name Size]

set fstr "%-$mx\s %d bytes"
foreach fl $files {
    set size [file size $fl]
    puts [format $fstr $fl $size]
}