#!/usr/bin/tclsh

#	if {$start_found || $nxt_found } {
#	if {$start_found} {
#	puts "Start gate is $gate"
#	set gate_start($gate) $start_gate
#	incr ::found_start
#	incr ::count 1
#	puts "next is $nxt"
#	set path_gate($nxt) $gate
#	}
#	if {$nxt_found && $::count !=1} {
#	puts "next gate is $gate"
#	set path_gate($nxt) $gate
#	puts "[array get gate_start]"
#	}
#	puts "[array get path_gate]"
	
	
#	set end_found [regexp -all $end_pattern $path end_gate]
#	if {$end_found} {
#	puts "End gate is $gate"
#	set gate_end($gate) $end_gate
#	incr ::found_end

proc path_extract {reqpath} {
puts "--Required path is $reqpath"
set pathpattern {(\w+):(\w+)}
regexp $pathpattern $reqpath  full_path start end 
puts "--Start point is $start"
puts "--End point is $end"
set fRead [open demo_parallel.syn.v r]

set found_start 0
set found_end 0
set count 0
set type S

set start_inst_gate {}
set end_inst_gate {}
set nxt ""
array set path_gate ""
array set nxt_move ""
array set output_of ""
array set input_to ""


#set pattern_search {([A-Z]+\d*_[A-Z]\d+)\s+(i_[0-9])\s*\(\.[A-Z]+\(.*[A-Z]+\[\d+\]\),}
set gate_inst_pattern {([A-Z]+\d*_[A-Z]\d+)\s+(i_[0-9])}
set start_pattern "\\(($start)\\)"
set end_pattern "\\(($end)\\)"
#set nxt_gate_pattern {([A-Z]+)\((\w+_\d+)[*\d*]*\)}
#puts "$start_pattern"


while {![eof $fRead]} {
	gets $fRead path
	set exist [regexp $gate_inst_pattern $path fullmatch gate instance]
	if {$exist} {
	#puts "$gate $instance"
	
	set start_found [regexp $start_pattern $path]
	if {$start_found} {
		incr ::found_start
		dict lappend start_inst_gate $start [list $instance $gate]
		puts [dict get $start_inst_gate $start]
		if {[regexp $end_pattern $path]} {
			dict lappend end_inst_gate $end [list $instance $gate] 
			set ::type S
			}
		if {$::found_start > 1} {
			set ::type P
			} 
		if {$::found_start == 1} {
			set ::nxt $instance
			}
			}
	set nxt_found [regexp $nxt $path]
	if {$nxt_found} {
		if {[regexp $end_pattern $path]} {
		dict lappend end_inst_gate $end [list $instance $gate] 
		}
		set $::nxt $instance
	}
	
#	set nxt_found [regexp $nxt_gate_pattern $path nxt_gate_match nxtname nxt]
	#puts "$start_gate"
	
	if {$start_found} {
	set output_of($start) $gate
  	lappend inputs_to($gate) $start
	incr ::count
	puts "Start gate is $gate"
#	set gate_start($gate) $start_gate ;#AND2_X1 A
	set nxt_move($nxt) $gate ;# n_0 A
#	puts "[array get nxt_move]" 
#	puts "next is $nxt"
	}
	
	if {!$start_found} {
		if {$nxt_found} {
#		puts "$nxt"
		set nxt_move($nxt) $gate
		foreach item [array names nxt_move] {
		if {[regexp $item $path level]} {
		set nxt_gate($level) $gate
	#	puts "[array get nxt_gate]"
		}
		}
#		puts "[array get nxt_move]"
		}
	
	}	
	
	} ;#close if
	} ;#close while
	if {$::count > 1} {
	set mode P
	} else {
	set mode S
	}
#	puts "[array names gate_start]"
	return [array names gate_start]
	
	close $fRead
	
	}
	
path_extract A:K
