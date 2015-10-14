require "json"
require "./services/json_parser.cr"

parser = JSONparser.new "br17"
initial_solutions = parser.get_initial_solutions
graph = parser.get_graph_costs
p graph
