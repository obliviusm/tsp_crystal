module Neighborhood
  def neighborhood shuffle = false
    indices = swap_indices
    if make_shuffle? shuffle
      indices.shuffle!
    end
    indices.each do |pair|
      yield @solution.swap(pair[0], pair[1])
    end
  end

  def make_shuffle? shuffle
    if shuffle
      if @shuffle_made
        false
      else
        @shuffle_made = true
      end
    end
  end

  def swap_indices
    if @swap_indices.empty?
      set_swap_indices
    end
    @swap_indices
  end

  def set_swap_indices
    (0...@n).to_a.each do |i|
      ((i + 1)..@n).to_a.each do |j|
        @swap_indices.push [i, j]
      end
    end
  end
end
