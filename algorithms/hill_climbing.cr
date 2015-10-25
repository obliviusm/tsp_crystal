class HillClimbing
  include Neighborhood
  getter :solution

  def initialize w, x
    @solution = TSPSolution.new(w, x)
    @n = @solution.n # is used in Neighborhood
    @swap_indices = [] of Array(Int32)
  end

  def solve
    found_new_solution = true
    while found_new_solution
      found_new_solution = false
      neighborhood do |solution_new|
        p 1# p solution_new.f.to_s + " " + @solution.f.to_s
        if solution_new < @solution
          @solution = solution_new
          found_new_solution = true
          break
        end
        p 2
      end
    end
    @solution
  end
end
