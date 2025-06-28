# This is a regression test script where:
# tcl script runs modelsim compilation and simulation
# on design and testbench, saves compile data to log files,
# searches for data of testbench modules
# and prints the pass rate

#! C:\Users\Ahmed\anaconda3\Library\bin\tclsh.exe

# delete work directory if exist
set check "work"
if {[file exists $check] && [file isdirectory $check]} {
file delete -force $check
}

#delete log directory if exist
set check2 "log"
if {[file exists $check2] && [file isdirectory $check2]} {
file delete -force $check2
}

#make folder for log files
file mkdir log

exec vlib work
exec vlog *.v >> log/compilation.log

set fRead [open log/compilation.log r]
set pattern {Top}
set pattern2 {tb_.*}
set enter 0
set i 0
array set logs ""

while {![eof $fRead]} {
	gets $fRead logdata
	set lines [split $logdata "\n"]
	foreach cline $lines {
	set found [regexp -all $pattern $cline]
	#puts "$found"
	if {$found == 1} {
	set ::enter $found
	continue
	}
	if {$::enter == 1} {
	set found2 [regexp -all $pattern2 $cline fullmatch top]
	exec vsim -batch $fullmatch -do "run -all;quit" > log/${fullmatch}.log
	if {$found2} {
	set logs($::i) ${fullmatch}.log 
	incr ::i
	}
				}
			}
		}
close $fRead

set pattern3 {(Total.*(\d+).*\\(\d+))}
foreach logname [array names logs] {
set fReadlog [open log/$logs($logname) r]
	while {![eof $fReadlog]} {
	gets $fReadlog ratedata
 set found4 [regexp -all $pattern3 $ratedata rate pass total]
	if {$found4} {puts "For $logs($logname)--> $rate"}
	}

close $fReadlog
}
#exec vsim -batch src/tb_* -do "run -all;run -all;" 
