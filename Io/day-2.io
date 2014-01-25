#!/bin/env io

"1) Calculate nth fibonacci number: n=" print
last := 1
fib := 1

n := File standardInput() readLine() asNumber()

# fib(1) and fib(2) are each 1, so start the loop at 3.
for(i, 3, n,
  temp := last
  last = fib
  fib = temp + fib
)

# Terrible. I can't find info on string concatination. Io is the worst name.
"  fib(" print
n print
") = " print
fib println

"" println
"2) Redefineing division so n / 0 = 0..." println
"  Old division" println
"  2 / 0 = " print
(2 / 0) println

# Store origional division.
Number origDivision := Number getSlot("/")
# Redefine.
Number / := method(denom,
  if(denom == 0, 0, self origDivision(denom))
)

"  New division" println
"  2 / 0 = " print
(2 / 0) println

"" println
"3) Define a 2d array sum method" println
List sum2D := method(self flatten sum)

list2D := list(
  list(1,2,3,4,5,6),
  list(7,8,9,0),
  list(12,43,2)
)


"  The sum the two d array " print
list2D println
"  is " print
list2D sum2D println

"" println
#:: define a myAverage function
"4) Implement a list average" println
List myAverage := method(
  self foreach(n, if((n type) != Number type, Exception raise("myAverage is only applicable to lists of numbers")))
  self sum / self size
)

aList := list(1,2,3,4,5,6)
"  The average of " print
aList println
"  is " print
aList myAverage println

# Will throw an exception
# list(1,"a") myAverage println

exit
