require_relative './inventory'

filename = "puzzle1/input.txt"

inventory = Inventory.new

File.readlines(filename).each do |line|
  if line == "\n"
    inventory.reset
  else
    inventory.current_stash.add(line.to_i)
  end
end

inventory.reset

puts "Part 1"
puts inventory.stashes.max.total

puts "Part 2"
puts inventory.stashes.max(3).sum {|el| el.total }
