;# An example of Upvar
;# Convert a value to a positive number before assigning.
proc SetPositive {variable value } {
  upvar $variable myvar;
  if {$value < 0} { set myvar [expr -$value];} else {set myvar $value;}
  return $myvar;
  }

SetPositive x 5;
SetPositive y -5;

puts "X : $x    Y: $y\n"
;# nesting Upvars

;# A second level proc - This will be called by one
proc two {y} {
  upvar 1 $y z			;# tie the calling value to variable z
  upvar 2 x a			;# Tie variable x two levels up  to a
  puts "two: Z: $z A: $a"	;# Output the values, just to confirm
  set z 1;			;# Set z, the passed variable to 1;
  set a 2;			;# Set x, two layers up to 2;
  }

;# A first level proc - This will be called by the global space code.
proc one {y} {
  upvar $y z			;# This ties the calling value to variable z 
  puts "one: Z: $z"		;# Output that value, to check it is 5
  # set x 20;
  # puts $x;
  two z;			;# call proc two, which will change the value
  # puts $x;
  }

one y;				;# Call one, and output X and Y after the call.
puts "\nX: $x  Y: $y"