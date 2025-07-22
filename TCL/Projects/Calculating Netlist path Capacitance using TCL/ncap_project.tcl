#!/usr/bin/tclsh
# TCL script that reads netlist file and cell library file, identifies specific net paths 
# as specified by the user, and calculates the total capacitance for each path based on the 
# capacitance values from the cell library. 
# This project reflects real-world applications of TCL in digital design 

# Sub-Project 1 Capacitance extraction from Lib file

proc cap_extr {libfile} {
array set cell_type_cap ""
set ::p 1

set fRead [open $libfile r]

set pattern1 {cell\s*\(([A-Z]+\d*_[A-Z]\d+)\)\s*\{}
set patternvalue {max_capacitance\s*:(.*);}

while {![eof $fRead]} {
	gets $fRead data
	
	# p=1 look for cell pattern
	if {$::p ==1} {
	set exist [regexp $pattern1 $data fullmacth cell]
	if {$exist} {
	#need to push cell in array
	set ::cell_type "$cell"
	set ::p 0}
	}

	# p=0 look for cap pattern
	if {$::p ==0} {
	set exist2 [regexp $patternvalue $data valuematch cap]
	if {$exist2} {
	#need to push cap in array corresponding to its cell
	set cell_type_cap($::cell_type) [string trim $cap] 
	set ::p 1}
	}
	}
#puts "[array get cell_type_cap]"
return cell_type_cap
close $fRead 

}
cap_extr NangateOpenCellLibrary_typical.lib
