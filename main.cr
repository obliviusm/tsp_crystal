require "json"
require "./services/json_parser.cr"

parser = JSONparser.new "br17"
initial_solutions = parser.get_initial_solutions
p initial_solutions
