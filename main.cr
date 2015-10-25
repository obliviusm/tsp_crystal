require "json"
require "./services/*"
require "./lib/swap_two_elements.cr"
require "./lib/x_comparator.cr"
require "./lib/tsp_solution.cr"
require "./lib/neighborhood.cr"
require "./lib/single_solution_based.cr"
require "./lib/solver.cr"
require "./lib/tsp_solved_data.cr"
require "./algorithms/hill_climbing.cr"

INF = 9999
problems = ["br17", "bays29", "ftv33", "ftv35", "swiss42" , "p43", "ftv44", "ftv47", "ry48p", "eil51", "berlin52", "ft53", "ftv55", "ftv64", "eil76", "eil101"]
t = Timer.exec_time do
  problems.each do |problem|
    parser = JSONparser.new problem
    initial_solutions = parser.get_initial_solutions[0...10]
    graph = parser.get_graph_costs
    # hc = HillClimbing.new(graph, [1, 8, 28, 20, 9, 17, 10, 11, 24, 5, 16, 2, 0, 6, 21, 26, 7, 14, 15, 19, 4, 22, 18, 25, 13, 12, 27, 23, 3])
    # p hc.solve
    # p TSPSolution.new(graph, initial_solutions[0]).swap(3,5)
    general_time = Timer.exec_time do
      algorithm_solver = Solver.new(graph, HillClimbing, initial_solutions.dup)
      p algorithm_solver.solve
    end
    # p initial_solutions.size
    p general_time
  end
end
p t
