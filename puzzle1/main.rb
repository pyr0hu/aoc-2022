require_relative './inventory'

filename = "puzzle1/input.txt"

inventory = Inventory.new

File.readlines(filename).each do |line|
  if line == "\n"
    inventory.reset
  else
    inventory.current.add(line.to_i)
  end
end

inventory.reset

puts inventory.largest(3).sum {|el| el.total }
