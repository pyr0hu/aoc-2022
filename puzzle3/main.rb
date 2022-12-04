require_relative './compartment'

filename = "puzzle3/input.txt"

compartments = File.readlines(filename)
                   .map { |line| Compartment.new(line) }

# TODO: I ain't sure if this is the correct place but this should not be defined in the compartment.
#   Because of the reduce at the end, this cannot be called if inside the Compartment class, so here it is
def item_value(item)
  if item.ord < 97
    item.ord - 38
  else
    item.ord - 96
  end
end

puts "Part 1"
puts compartments
       .flat_map { |compartment| compartment.common_items }
       .map {|item| item_value(item)}
       .sum

puts "Part 2"
puts compartments
       .each_slice(3)
       .flat_map { |compartment_group|
         compartment_group
           .last(2)
           .reduce(compartment_group.first.items) { |carry, compartment| carry.intersection(compartment.items) }
           .map {|item| item_value(item)}
       }
       .sum
