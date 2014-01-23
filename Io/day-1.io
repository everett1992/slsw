1 + 1 println

# The following would cause an exception, Io
# I guess Io is weakly typed.
# 1 + "one" println

0 and true
# => true
# 0 is true


a := true
# => true

a := false
# => false

# `:=' can create or reassign slots

a = true
# => true

# The following would cause an exception, Io
# b = true
# => Exception

# `=' can reassign existing slots, but not create new slots.

c ::= 1
# => 1

setSlot("a", 1)
a
# => 1
setSlot("c", 2)
c
# => 2

# The docs say the difference between `::=' and `:=' are that `::' creates a setter,
# but both methods created setters. I'm not sure the difference.

Animal := Object clone
Animal say := method("?" println)
Dog := Animal clone
Dog say := method("Woof" println)
Cat := Animal clone
Cat say := method("Meow" println)
Fox := Animal clone

Cat say
Dog say
Fox say
