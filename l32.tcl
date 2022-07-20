# Using eval on a single command:
# Note the "list" command.  eval will discard one level of
# grouping - the quotes around the string.
eval [list puts "this is done with two arguments to eval"]

;# Using eval to define a proc

if {[string match [info procs newProcA] ""] } {
  puts "\nDefining newProcA for this invocation"
  set num 0;
  set cmd "proc newProcA "
  set cmd [concat $cmd "{} {\n"]
  set cmd [concat $cmd "global num;\n"]
  set cmd [concat $cmd "incr num;\n"]
  set cmd [concat $cmd " return \"/tmp/TMP.[pid].\$num\";\n"]
  set cmd [concat $cmd "}"]
  eval  $cmd
  }

puts "\nThe body of newProcA is: \n[info body newProcA]\n"

puts "newProcA returns: [newProcA]"
puts "newProcA returns: [newProcA]"

#
# Define a proc using lists
#

if {[string match [info procs newProcB] ""] } {
  puts "\nDefining newProcB for this invocation"
  set cmd "proc newProcB "
  lappend cmd {}
  lappend cmd {global num; incr num; return $num;}

  eval  $cmd
  }

puts "\nThe body of newProcB is: \n[info body newProcB]\n"
puts "newProcB returns: [newProcB]"

set arg1 {-nonewline {this will be }}
set arg2 {on a single line}

# This prints two lines - one of which has -nonewline in it.
puts "\nDoesn't do what it says"
puts $arg1; puts $arg2

# This prints as a single line, the -nonewline is an argument to puts
puts "\nDoes what it says"
puts {*}$arg1; puts $arg2
