filename = "puzzle4/input.txt"

require_relative "./pair"

pairs = File.readlines(filename)
  .map { |line| Pair.new(line) }

puts "Part 1"

puts pairs.count { |pair| pair.contains? }

puts "Part 2"

puts pairs.count { |pair| pair.overlaps? }
