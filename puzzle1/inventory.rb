require_relative './stash'

class Inventory
  attr_reader :stashes
  attr_reader :current_stash

  def initialize
    @stashes = []
    @current_stash = nil
    self.advance
  end

  def advance
    # If the current stash is nil (like on initialize), just skip adding that to the stash list
    if @current_stash != nil then @stashes.push(@current_stash) end
    @current_stash = Stash.new
  end
end
