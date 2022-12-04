require_relative './inventory'

filename = "puzzle1/input.txt"

inventory = Inventory.new

File.readlines(filename).each do |line|
  # If the line only contains an empty-line, advance the inventory slot
  if line == "\n"
    inventory.advance
  else
    # Else add the value to the current stash
    inventory.current_stash.add(line.to_i)
  end
end

# We make sure to call advance one more time to process the last batch
inventory.advance

puts "Part 1"
# Print the largest stash's total value
puts inventory.stashes.max.total

puts "Part 2"
# Take the 3 largest stashes and print the sum of the totals
# TODO: maybe define a coercion or an integer cast, so we can call sum
#   without the block?
puts inventory.stashes.max(3).sum(&:total)
