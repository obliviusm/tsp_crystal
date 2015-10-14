require "json"
require "./services/json_parser.cr"

p JSONparser.get_tcp_problem "br17"
