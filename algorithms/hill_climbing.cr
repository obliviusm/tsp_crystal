class HillClimbing
  include Neighborhood
  extend SingleSolutionBased
  getter :solution

  def initialize w, x
    @solution = TSPSolution.new(w, x)
    @n = @solution.n # is used in Neighborhood
    @swap_indices = [] of Array(Int32)
  end

  def solve
    found_new_solution = true
    # i = 0
    while found_new_solution
      # i+=1
      found_new_solution = false
      neighborhood do |solution_new|
        # p "#{solution_new}: #{solution_new.f}"
        if solution_new < @solution
          @solution = solution_new
          found_new_solution = true
          break
        end
      end
    end
    # p i
    @solution
  end
end
