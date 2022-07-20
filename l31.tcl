;# Set up a temporary file with a test proc.

set filename "TT_[pid].tcl"
set outfile [open "~\\TCL\\$filename" "w"];

puts $outfile "package provide tutordemo 1.0"
puts $outfile "proc demoproc {} {"
puts $outfile "puts {Running the demoproc}"
puts $outfile "}"
close $outfile;

pkg_mkIndex C:/windows/temp $filename

# With Tcl8.3, this must come after auto_mkindex.

lappend auto_path "C:/windows/temp"

puts "procedures matching demopr before package require are: [info proc demopr*]"
package require tutordemo
puts "procedures matching demopr after package require are: [info proc demopr*]"
demoproc
puts "procedures matching demopr after using deomproc : [info proc demopr*]"

# file delete C:/windows/temp/pkgIndex
# file delete $filename 
