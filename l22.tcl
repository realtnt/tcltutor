array set array1 [list {123} {Abigail Aardvark} \
		       {234} {Bob Baboon} \
                       {345} {Cathy Coyote} \
		       {456} {Daniel Dog} ]

puts "Array1 has [array size array1] entries\n"

puts "Array1 has the following entries: \n [array names array1] \n"

puts "ID Number 123 belongs to $array1(123)\n"

if {[array exist array1]} {
   puts "array1 is an array"
   } else {
   puts "array1 is not an array"
   }

if {[array exist array2]} {
   puts "array2 is an array"
   } else {
   puts "array2 is not an array"
   }
