#!/usr/bin/tclsh
# example on printing each character in a string
set stat1 "   Fan is a device  "
for {set i 0} {$i<= [string length $stat1]} {incr i} { 
puts "The character number $i  is [string index $stat1 $i]" }
set stat2 [string trim $stat1]
for {set i 0} {$i<= [string length $stat2]} {incr i} { 
puts "TRIMMED: The character number $i  is [string index $stat $i]" }
