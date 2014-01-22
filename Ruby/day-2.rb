#!/bin/env ruby

sixteen = 16.times.to_a

puts  <<EOF
Print the contents of an array of sixteen numbers, four
numbers at a time, using just each.
EOF
(0..12).step(4) do |n|
  puts '- group -'
  puts sixteen[n,4]
end

# Same as above, using each_slice instead of each.
puts <<EOF
Print the contents of an array of sixteen numbers, four
numbers at a time, using each_slice.
EOF
sixteen.each_slice(4) do |nums|
  puts '- group -'
  puts nums
end

puts <<EOF
Let the Tree initialize accept a nested structure with hashes and
arrays.
EOF

class Tree
  attr_accessor :children, :node_name
  def initialize(hash)
    name, children = hash.first
    @node_name = name
    @children = children.map { |child|  Tree.new Hash[*child] }
  end
  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block) }
  end
  def visit(&block)
    block.call self
  end
end

hash_tree = Tree.new(grandpa: { dad: {child1: {}, child2: {}}, uncle: {child3: {}, child4: {} } })

hash_tree.visit_all { |node| puts node.node_name }
