require_relative './stash'

class Inventory
  attr_reader :stashes
  attr_reader :current_stash

  def initialize
    @stashes = []
    @current_stash = nil
    self.reset
  end

  def reset
    if @current_stash != nil then @stashes.push(@current_stash) end
    @current_stash = Stash.new
  end
end
