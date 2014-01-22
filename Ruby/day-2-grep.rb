#!/bin/env ruby

expression = Regexp.new ARGV[0]
filename = ARGV[1]

puts <<EOF
  Printing lines containing #{expression} in file #{filename}.
EOF

File.open(filename) do |f|
  f.each_line.each_with_index do |line, line_number|
    puts "#{line_number}: #{line}" if line.match expression
  end
end
