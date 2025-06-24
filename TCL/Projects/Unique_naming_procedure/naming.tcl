#!/usr/bin/tclsh
# procedure that takes a basename and optionally a suffix
# And create a unique name from this basename
# If the basename was already created by this proc we update the already found count


proc naming {base {suff \ }} {
if {![info exists ::count]} {
set ::count 0
}
set pattern {(n)(\d+)(\_)*}
if {[regexp $pattern $base a b c]} {
incr c
regsub {(\d+)} $base $c modname 
return $modname
} else {
set name "n$::count\_$base\_$suff"
incr ::count 1
set name2 [string trimright $name]
set name3 [string trimright $name2 _]
return $name3
}
}
puts "[naming and pnr]"
puts "[naming n50_or]"
puts "[naming and]"
