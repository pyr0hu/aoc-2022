class Pair
  def initialize(line)
    sections = line.split(',')
      .map { |section_range| 
        items = section_range.split('-')
                             .map(&:to_i)
        Range.new(*items) 
      }

    @first = sections[0]
    @last = sections[1]
  end

  def contains?
    @first.cover?(@last) || @last.cover?(@first)
  end

  def overlaps?
    not (@first.to_a & @last.to_a).empty?
  end
end
