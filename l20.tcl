set sample "Where there is a will, There is a way."

set result [regexp {[a-z]+} $sample match]
puts "Result: $result match: $match"

set result [regexp {([A-Za-z]+) +([a-z]+)} $sample match sub1 sub2 ]
puts "Result: $result Match: $match 1: $sub1 2: $sub2"

regsub "way" $sample "lawsuit" sample2
puts "New: $sample2"

