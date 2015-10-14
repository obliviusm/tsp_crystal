require "json"
require "./services/*"
require "./lib/swap_two_elements.cr"
require "./lib/x_comparator.cr"
require "./lib/tsp_solution.cr"
require "./algorithms/*"

INF = 9999

parser = JSONparser.new "bays29"
initial_solutions = parser.get_initial_solutions
graph = parser.get_graph_costs
p TSPSolution.new(graph, initial_solutions[0])
