# frozen_string_literal: true

class Stash
  attr_reader :total

  def initialize
    @items = []
  end

  def add(value)
    @items.push(value)
  end

  def total
    @items.sum
  end

  # Define comparision operator to allow calling max on a list of Stashes
  def <=>(other)
    self.total <=> other.total
  end
end
