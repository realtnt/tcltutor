proc example {first {second ""} args} {
  if {$second == ""} {
    puts "There is only one argument and it is: $first";
    return 1;
    } else {
    if {$args == ""} {
      puts "There are two arguments - $first and $second";
      return 2;
      } else {
      puts "There are many arguments - $first and $second and $args";
      puts $args
      return "many";
      }
    }
  }

set count1 [example ONE]
set count2 [example ONE TWO]
set count3 [example ONE TWO THREE ]
set count4 [example ONE TWO THREE FOUR]
set count4 [example ONE TWO THREE FOUR FIVE SIX]

puts "The example was called with $count1, $count2, $count3, and $count4 Arguments"