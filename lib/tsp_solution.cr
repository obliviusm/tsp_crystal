class TSPSolution
  include Comparable(TSPSolution)
  include SwapTwoElements
  include XComparator
  getter :w, :n, :x, :f

  def initialize w, x, f = 0
    @w = w              # graph weights
    @x = x              # path through cities
    @n = x.size - 1     # last index in x
    @f = (f == 0 ? distance : f)  # length of path
  end

  def <=> (other)
    @f <=> other.f
  end

  def self.new_array graph, solution_paths
    solution_paths.map do |path|
      self.new graph, path
    end
  end

  # protected

  def distance
    length = 0
    (0...@n).to_a.each do |i|
      length += edge i, i+1
    end
    length = length + edge @n, 0
    length
  end

  def edge i, j
    @w[@x[i]][@x[j]]
  end
end
