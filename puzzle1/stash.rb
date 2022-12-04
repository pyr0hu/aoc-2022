# frozen_string_literal: true

class Stash
  attr_reader :total

  def initialize
    @total = 0
  end

  def add(value)
    @total += value
  end

  def <=>(other)
    @total <=> other.total
  end
end
