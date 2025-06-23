#!/usr/bin/tclsh
# this is a recursive searching procedure to search for files with tcl extension
# searches in the current directory and folders in this directory

proc slocal {ccd} {
if {[string equal $ccd ./]} {
puts [glob -nocomplain -tail -d ./ {*.tcl}]
} else {
puts [glob -nocomplain -tail -d $ccd {*.tcl}]
#puts " ----------------------- "
#puts " results from current directory "
#puts [glob -nocomplain -tail -d ./ {*.tcl}]
}

}

proc srecur {rcd} { 
set directories [glob -type d * $rcd]
puts $directories
foreach index $directories {
slocal $index
} 
}

slocal tclcourse
srecur tclcourse
