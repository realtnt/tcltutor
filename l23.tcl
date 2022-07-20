array set array1 [list {123} {Abigail Aardvark} \
		       {234} {Bob Baboon} \
                       {345} {Cathy Coyote} \
		       {456} {Daniel Dog} ]

;#
;# Simply iterating through an array with a foreach loop:
;#

foreach id [array names array1] {
  puts "$array1($id) has ID: $id"
  }

;#
;# Two procs iterating through the same array with iteration commands
;#

proc getrec_format1 {arrayVar searchid} {
  global $arrayVar
  upvar $searchid id
  set record [array nextelement $arrayVar $id];
  return "The current ID is: $record"
  }

proc getrec_format2 {arrayVar searchid} {
  global $arrayVar 
  upvar $searchid id
  set record [array nextelement $arrayVar $id];
  return $record;
  }

set searchId [array startsearch array1];

puts ""
set item 0;
while {[array anymore array1 $searchId]} {
  incr item;
  if {[expr $item %2]} {
    set format1 [getrec_format1 array1 searchId]
    puts "item number: $item format 1: $format1"
    } else {
    set format2 [getrec_format2 array1 searchId]
    puts "item number: $item format 2: $format2"
    }
  }

