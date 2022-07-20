;#
;# safeIncr checks for a variable's existence before
;# it tries to increment it.  If the variable does not exist,
;# it is initialized and returned.

proc safeIncr {val {amt 1}} {
  upvar $val v
  if {[info exists v]} { incr v $amt}  else { set v $amt }
  }


;#
;# Check that the safeIncr proc exists before invoking it.

if {[info procs safeIncr] == "safeIncr"} {
  safeIncr a
  }

puts "After calling SafeIncr with a non existent variable: $a"

set a 100
safeIncr a
puts "After calling SafeIncr with a variable with a value of 100: $a"

safeIncr b -3
puts "After calling safeIncr with a non existent variable by -3: $b"

set b 100
safeIncr b -3
puts "After calling safeIncr with a variable whose value is 100 by -3: $b"

puts "\nThese variables have been defined: [lsort [info vars]]"
puts "\nThese globals have been defined:   [lsort [info globals]]"

;#
;# Check for the existence of localproc
;#

set exist [info procs localproc];
if {$exist == ""} {
  puts "\nlocalproc does not exist at point 1"
  }

proc localproc {} {
  global argv;

  set loc1 1;
  set loc2 2;
  puts "\nLocal variables accessible in this proc are: [lsort [info locals]]"
  puts "\nVariables accessible from this proc are:     [lsort [info vars]]"
  puts "\nGlobal variables visible from this proc are: [lsort [info globals]]"
  }

set exist [info procs localproc];
if {$exist != ""} {
  puts "localproc does exist at point 2"
  }

localproc;