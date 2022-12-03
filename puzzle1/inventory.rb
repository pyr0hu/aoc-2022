require_relative './stash'

class Inventory
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

  def largest(n)
    @stashes.sort {|a, b| b.total <=> a.total }
            .slice(0, n)
  end
end
