# frozen_string_literal: true

class Compartment
  attr_reader :items, :common_items

  def initialize(line)
    @items = line.strip.chars

    compartment_size = line.length / 2 - 1
    @first_compartment = line.slice!(0..compartment_size).chars
    @second_compartment = line.chars

    @common_items = @first_compartment.intersection(@second_compartment)
  end
end
