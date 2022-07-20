
set fileid [open "./testfile" w+]

seek $fileid 0 start

puts $fileid "This is a test.\nIt is only a test"

seek $fileid 0 start

set chars [gets $fileid line1];
set line2 [gets $fileid];

puts "There are $chars characters in \"$line1\""
puts "The second line in the file is: \"$line2\""

seek $fileid 0 start

set buffer [read $fileid];
puts "\nTotal contents of the file are:\n$buffer"
close $fileid
