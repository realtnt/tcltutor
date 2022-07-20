;# Collect a bunch of files to compare

set ail1 [glob /etc/*.conf]
set ail2 [glob /var/log/*.log]

;# Set the format string (see Lsn.18), and display column headers

set fmt "%-15s %-23s %15s %-15s %-15s"
puts "[format "$fmt Comment" "Directory" "Name" "Inode" "Time" "Type"]"

;# Loop through the filenames collected by glob, and
;# determine their inode, size, and type.
;# Then display the results.

foreach name [concat $ail1 $ail2] {  
  ;# split the name into pieces for display:
  set dir [file dirname $name]
  set filename [file tail $name]
  
  ;# Collect some status and type info.
  file stat $name arr
  set type [file type $name]

  ;# Display what we've learned.
  puts -nonewline "[format $fmt $dir $filename $arr(ino) $arr(gid) $type]"
  
  ;# and particular data depending on whether item is a file or symbolic link.

  if {[string match [file type $name] "link"]} {
      puts " points to: [file readlink $name]"
     }

  if {[string match [file type $name] "file"]} {
      puts " Size: [file size $name] bytes "
     }
  }

