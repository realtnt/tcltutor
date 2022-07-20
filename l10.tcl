for {puts "Start"; set i 0} {$i < 2} {incr i; puts "I after incr: $i"; } {
  puts "I inside first loop: $i"
  }

;# Because the test is evaluated before the body,
;#  this loop won't execute the body of the code.

for {puts "Start"; set i 3} {$i < 2} {incr i; puts "I after incr: $i"; } {
  puts "I inside second loop: $i"
  }

;# A while loop equivalent to the first for loop:

puts "Start"; set i 0;
while {$i < 2} {
  puts "I inside first loop: $i"
  incr i; 
  puts "I after incr: $i"; 
  }
