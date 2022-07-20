;# Set up a temporary file with a test proc.

set filename "~/TCL/TT_[pid]"
set outfile [open "$filename" "w+"];


puts $outfile {set scr [info script]}
puts $outfile "proc testproc {} {"
puts $outfile "global scr;"
puts $outfile "puts \"testproc source file: \$scr.\""
puts $outfile "}"
puts $outfile {set abc 1};
puts $outfile {return};
puts $outfile {set aaaa 1};

close $outfile;

puts "This is the contents of $filename:"
puts ".............................................................."
puts "[exec less $filename]"
puts ".............................................................."
puts "\n"

puts "Global variables visible before sourcing $filename:"
puts "[lsort [info globals]]\n"

;# Check that the proc does not exist, and source the file.

if {[info procs testproc] == ""} {
 	puts "testproc does not exist.  sourcing $filename"
	source $filename
	}

;# run the proc.
puts "\nNow executing testproc"
testproc;

puts "Global variables visible after sourcing $filename:"
puts "[lsort [info globals]]\n"


;# Remove the extra file.
file delete $filename
