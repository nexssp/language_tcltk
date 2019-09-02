namespace eval mypackage {}
proc mypackage::add {a b} {
 return [expr {$a + $b}]
}
package provide mypackage 1.0

# pkg_mkIndex /tmp/packages/mypackage1.0

#  lappend ::auto_path /tmp/packages
# package require mypackage

# OR tcl::tm::add /tmp/tclmodules