;# Set the variables we'll be comparing
set x "ONE";
set y 1;
set z "ONE";


;# This is legal
switch $x "ONE" "puts ONE=1" "TWO" "puts TWO=2" "default" "puts NO_MATCH"

;# This is more readable, the patterns are to the left, and the body
;#             associated with each pattern is to its right.
switch $x \
  "ONE" 	"puts ONE=1"  \
  "TWO" 	"puts TWO=2" \
  "default" 	"puts NO_MATCH";

;# These two examples show the difference between using the un-braced and
;#   braced versions of the switch command.
;# You can also see how a switch command can become too complex to 
;#   be written on a single line.

;# This form allows substitution in the pattern arguments.

switch $x \
  "$z"		{set y1 [expr $y+1]; puts "MATCH \$z. $y + $z is $y1" } \
  "ONE"		{set y1 [expr $y+1]; puts "MATCH ONE. $y + one is $y1"} \
  "TWO"		{set y1 [expr $y+2]; puts "MATCH TWO. $y + two is $y1" } \
  "THREE"	{set y1 [expr $y+3]; puts "MATCH THREE. $y + three is $y1" } \
  "default"	{puts "$x does not match any of these choices";}

;# This form of the command disables variable substitution in the pattern

switch $x {
  "$z"		{set y1 [expr $y+1]; puts "MATCH \$z. $y + $z is $y1" }
  "ONE"		{set y1 [expr $y+1]; puts "MATCH ONE. $y + one is $y1"}
  "TWO"		{set y1 [expr $y+2]; puts "MATCH TWO. $y + two is $y1"}
  "THREE"	{set y1 [expr $y+3]; puts "MATCH THREE. $y + three is $y1"}
  "default"	{puts "$x is NOT A MATCH"}
  }
