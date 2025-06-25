#! /usr/bin/tclsh

# this code calculates the width of guard ring
# based on input file structured as:
# ID Type : info
# info are sperated by commas
# the code extracts the values from input file
# uses the values to determine the line type
# then adds the width 
# if there is a cross checks the number of horizontal and 
# number of vertical, if equal then take the minimum width
# if not equal take the width of majority type

set fread [open input.txt r]
set fwrite [open output.txt w]

array set ID ""
array set line ""
array set cross ""
array set hside ""
array set vside ""
set guardwidth 0

while {![eof $fread]} {

#getting input
set inp "[gets $fread]" 

#extracting ID,type,info
set pattern {^(\d+)\s+(line|cross|hside|vside)\s+:\s+(.*)}
regexp $pattern $inp idtypeinfo id2 type2 info2

#extracting info
set infovaluepatttern {([^\,]+)\s*,*\s*(\d+)*\s*,*\s*(\d+)*}
regexp $infovaluepatttern $info2 vall v1 v2 v3

#extracting ID
set idpattern {^(\d+)}
regexp $idpattern $inp id 

#extracting Type
set typepattern {(\w{4,5})}
regexp $typepattern $inp Type

# id type array
set ID($id) $Type

if {$Type == "vside"} {
set vside($id) $v1
}

if {$Type == "hside"} {
set hside($id) $v1
}

if {$Type == "cross"} {
set cross($id,1) [string trim $v1]
set cross($id,2) [string trim $v2]
}

if {$Type == "line"} {
set line($id,1) [string trim $v1]
set line($id,2) [string trim $v2]
set line($id,3) [string trim $v3]
}
}
close $fread

set vno 0
set hno 0
set cno 0
set ch 0
set cv 0
for {set i 0} {$i<4} {incr i} {
  	set wh($i) 0
  	set wv($i) 0
  	}

foreach item [array names ID] {
set ::vno 0
set ::hno 0
set ::cno 0
set ::ch 0
set ::cv 0
set ::guardwidth 0
 if {$ID($item)=="line"} {
  	puts -nonewline $fwrite "$item $ID($item) : "
   	for {set i 1} {$i < 4} {set i [expr $i +1]} {
  	if {$ID($line($item,$i))=="vside"} {
  	 set ::wv($i) $vside($line($item,$i))
  	 incr ::vno
    	}
  	if {$ID($line($item,$i))=="hside"} {
  	 set ::wh($i) $hside($line($item,$i))
  	 incr ::hno
  	
  	}
  	if {$ID($line($item,$i))=="cross"} {
  	 for {set j 1} {$j < 3} {incr j} {
  	 incr ::cno
  	 if {[info exist cross($line($item,$i),$j)]} {
  	 
  	  if {$ID($cross($line($item,$i),$j))=="hside"} {
  	    set ::ch $hside($cross($line($item,$i),$j))
  	  }
  	  if {$ID($cross($line($item,$i),$j))=="vside"} {
  	    set ::cv $vside($cross($line($item,$i),$j))
  	 }
  	  
  	 }
  	}
  	}
  	}
  	if {$::cno == 0} {
  	for {set i 1} {$i<4} {incr i} {
  	if {[info exists ::wh($i)]} {
  	incr ::guardwidth $wh($i)
  	puts $fwrite "$::guardwidth"
  	}
  	if {[info exists wv($i)]} {
  	incr ::guardwidth $wv($i)
  	puts $fwrite "$::guardwidth"
  	}
  	}
  	} else { #puts "entered"
  		for {set i 1} {$i<4} {incr i} {
  		if {[info exists ::wh($i)] && $::hno !=0} {
  		set ::guardwidth [expr {$::guardwidth + $wh($i)}]
  		}
  		if {[info exists ::wv($i)] && $::vno !=0} {
  		set ::guardwidth [expr {$::guardwidth + $wv($i)}]
  		}
  		}
  		if {$::vno > $::hno} {
  		set ::guardwidth [expr {$::guardwidth + $::cv}]
  		puts $fwrite "$::guardwidth"		
  		} 
  		if {$::vno < $::hno} {
  		set ::guardwidth [expr {$::guardwidth + $::ch}]
  		puts $fwrite "$::guardwidth" 
  		}
  		if {$::vno == $::hno} {
  	
  		if {$::ch < $::cv} {
  		
  		set ::guardwidth [expr {$::guardwidth + $::ch}]
  		puts $fwrite "$::guardwidth"
  		}
  		if {$::ch > $::cv} {
  		set ::guardwidth [expr {$::guardwidth + $::cv}]
  		puts $fwrite "$::guardwidth"
  		}
  		}
  	}
  	}
  	}

# code limitation is that it is based on the concept
# that each line doesnot intersect with more than 3 sides
# the 3 sides could be of any type
# problem is this could be inpractical in industry
# cause then you need to define new line after 3 intersects
# so the idea of the code should have been modified 
# i.e. in order to be more scalable it could have been
# modified as follows:
# array set ID ""
# array set line ""
# array set cross ""
# array set hside ""
# array set vside ""

# set pattern {^(\d+)\s+(line|cross|hside|vside)\s+:\s+(.*)}
# set fread [open input.txt r]

# while {![eof $fread]} {
# #getting input
# gets $fread inp
# set lines [split $inp "\n"]
# foreach cline $lines {
# #extracting ID,type,info
# set found [regexp $pattern $inp idtypeinfo id2 type2 info2]
# if { $found } {
# set ID($id2) $type2
# regsub -all {\s+} $info2 "" infotrimmed
# set ${type2}($id2) [split $infotrimmed ","]
# }
# }
# }
# close $fread
# set fwrite [open output.txt w]