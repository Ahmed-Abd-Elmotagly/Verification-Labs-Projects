#!/usr/bin/tclsh 
# dh 34an y4t8l TCL
# hena 3ml procedure bta5od var 3awzha t4of lw mlo4 value tdylo value default
proc vardefault {var default} { 
puts "function called"
upvar $var a ;# hena by2olo 5od qemt el var smeha a 
# b3dha hy check lw qemt el var el hya dlw2ty esmha a m4 mwgoda
# lw m4 mwgoda hy7ot fyha el default
if {![info exists a]} {
	set a $default
} 
}

vardefault x 6
puts " now x = $x "

set a 10
vardefault a 5
puts " now a = $a "
