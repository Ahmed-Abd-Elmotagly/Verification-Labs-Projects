#!/usr/bin/tclsh

# Sub-Project 2 Create Utilities to calculate capacitance

# we need to get the equivalence of such capacitance
proc equ_cap {values p} {
	if {$p == 1} {
	set ceq 0
	foreach cv $values {
	set ceq [expr $ceq + $cv]
	}
	return $ceq
	}
	if {$p == 0} {
	set ceq 0
	set rceq 0
	foreach cv $values {
	set rceq [expr (1.0/$cv) + $rceq]
	set ceq [expr (1.0/$rceq)]
	set ceq [format "%.4f" $ceq]
	}
	return $ceq
	}
#puts "$values"
} 

set valu {1 2 3 4}
puts "[equ_cap $valu 1]"
puts "[equ_cap $valu 0]"
