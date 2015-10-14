module JSONparser
  # interface
  def self.get_tcp_problem filename
    f = File.new("data/#{filename}.json")
    tsp_problem = ((JSON.parse(f) as Hash)["travellingSalesmanProblemInstance"] as Hash)
    initialSolutions = reoder_initial_solutions tsp_problem
    # reoder_costs_in_graph tsp_problem
    # tsp_problem
  end
  # other things
  def self.reoder_initial_solutions tsp_problem
    initialSolutions = ([] of Array(Int8))
    ((tsp_problem["initialSolutions"] as Hash)["path"] as Array).each do |path|
      solution = ([] of Int8)
      ((path as Hash)["vertex"] as Array).each do |vertex|
        solution.push (vertex as String).to_i8
      end
      initialSolutions.push solution
    end
    initialSolutions
  end
end
