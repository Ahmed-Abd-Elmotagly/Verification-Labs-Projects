#!
set st1 "Ahmed grades : 94, 95, 97, 286"
set pattern2 {(\d+)[,\s]*}
set pattern {(\w+)(\s+grades\s+:)([\d\s,]*)}
puts [regex -inline $pattern2 $st1]
