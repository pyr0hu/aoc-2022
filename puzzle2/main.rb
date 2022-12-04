require_relative './match'

filename = "puzzle2/input.txt"

# Create a list of matches from the input
matches = File.readlines(filename)
            .map { |line| Match.new(line) }

puts "Part 1"
puts matches.sum(&:total)

puts "Part 2"
puts matches.sum {|match| match.guess_choice.total}
