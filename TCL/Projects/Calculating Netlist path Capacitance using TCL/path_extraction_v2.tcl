#!/usr/bin/tclsh

proc path_extract {reqpath top} {
puts "--Required path is $reqpath"
set pathpattern {(\w+):(\w+)}
regexp $pathpattern $reqpath  full_path start end 
puts "--Start point is $start"
puts "--End point is $end"

set fRead [open demo_parallel.syn.v r]

set found_start 0
set ::type S

set start_inst_gate {}
set end_inst_gate {}
set ::nxt {}
set path ""

set gate_inst_pattern {([A-Z]+\d*_[A-Z]\d+)\s+(i_[0-9])}
set start_pattern "\\(($start)\\)"
set end_pattern "\\(($end)\\)"
set output_pattern {\.ZN*\((.*)\)\)}
#puts "$start_pattern"


while {![eof $fRead]} {
	gets $fRead path
	set exist [regexp $gate_inst_pattern $path fullmatch gate instance]
	if {$exist} {
	#puts "$gate $instance"
	
	#step 1 searching for start point
	set start_found [regexp $start_pattern $path]

	#step 3 search for the nxt
	if {$start_found==0} {	
	foreach signal $::nxt {
	if {[regexp $signal $path fulln nxtg]} {
	
	#if the next is end then you need to end
	if {[regexp $end_pattern $path full endg]} {
	
		dict lappend end_inst_gate $end [list $instance $gate] 
		set ::type S
		lappend ::path $::type $gate ;#$instance 
		lappend ::nxt $endg
		#puts "$::nxt"
		break
	} else {		
        if {[regexp $output_pattern $path fullout out]} {
        set ::type S
        lappend ::nxt $out
        lappend ::path $::type $gate ;#$instance 
        break
	#puts "$::nxt"
	}
	}
	}
	}
#	puts "$::nxt"
#	puts "$::path"
	}
	#step 2 if start found then check if end is in same line therefore Series one gate
	# if end not found therefore take the output as nxt
	# check again for another start therefor Parallel
	
	if {$start_found} {
		incr ::found_start
		dict lappend start_inst_gate $start [list $gate] ;#$instance
		
		if {[regexp $end_pattern $path]} {
			dict lappend end_inst_gate $end [list $instance $gate] 
			set ::type S
			lappend ::path $::type $gate ;#$instance  
			} else {
			regexp $output_pattern $path fullout out
			}
		
		if {$::found_start > 1} {
			set ::type P
			lappend ::path $::type [dict values $start_inst_gate]
			lappend ::nxt $out
		#	puts "$::nxt"
			} 
				
		if {$::found_start == 1} {
			lappend ::nxt $out
		#	puts "$::nxt"
			}
		#	puts [dict get $start_inst_gate $start]
			}
	}
	}
	puts "path is: $::path"
	close $fRead
	return $::path
	}
	
path_extract "A:K" "Adder"
