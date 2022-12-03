# frozen_string_literal: true

class Stash
  def initialize
    @total = 0
  end

  def add(value)
    @total += value
  end

  def total
    @total
  end
end
