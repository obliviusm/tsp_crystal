require "json"
require "./services/*"
require "./lib/swap_two_elements.cr"
require "./lib/x_comparator.cr"
require "./lib/tsp_solution.cr"
require "./lib/neighborhood.cr"
require "./algorithms/hill_climbing.cr"

INF = 9999

parser = JSONparser.new "bays29"
initial_solutions = parser.get_initial_solutions
graph = parser.get_graph_costs
hc = HillClimbing.new(graph, initial_solutions[0])
p hc.solve
# p TSPSolution.new(graph, initial_solutions[0]).swap(3,5)
