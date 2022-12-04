require_relative './stash'

class Inventory
  attr_reader :stashes

  def initialize
    @stashes = []
    @current_stash = Stash.new
  end

  def reset
    @stashes.push(@current_stash)
    @current_stash = Stash.new
  end

  def current
    @current_stash
  end
end
