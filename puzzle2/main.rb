require_relative './match'

filename = "puzzle2/input.txt"

matches = []

File.readlines(filename).each do |line|
  matches.push(Match.new(line))
end

puts "Part 1"
puts matches.sum {|match| match.total}

puts "Part 2"
puts matches.sum {|match| match.guess_choice.total}
