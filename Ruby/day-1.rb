#!/bin/env ruby

hello_world = 'Hello, world.'

# Prints 'Hello, world.'.
puts hello_world

# Prints the index of 'world' in 'Hello, world.'.
puts  hello_world.index 'world'

# Prints my name 10 times.
10.times { puts "Caleb Everett" }

# Prints the string 'This is sentence number 1' where the number 1
# changes from 1 to 10
(1..10).each { |n| puts "This is sentence number #{n}" }

# Picks a random number between 0 and 9 and tells
# a user if it is higher or lower than
# their guess.

computer_guess = rand(0..9)
print "Guess a number between 0 and 9:"
while user_guess = gets.to_i do
  if user_guess == computer_guess
    puts 'You guessed right'
    break;
  elsif user_guess < computer_guess
    puts 'go higher'
  elsif user_guess > computer_guess
    puts 'go lower'
  else
    throw 'wat'
  end
end
