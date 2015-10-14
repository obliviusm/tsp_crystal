class JSONparser
  def initialize filename
    f = File.new("data/#{filename}.json")
    @tsp_problem = ((JSON.parse(f) as Hash)["travellingSalesmanProblemInstance"] as Hash)
    @size = (@tsp_problem["description"] as String).to_i(strict: false)
  end

  def get_initial_solutions
    initial_solutions = ([] of Array(Int8))
    ((@tsp_problem["initialSolutions"] as Hash)["path"] as Array).each do |path|
      solution = ([] of Int8)
      ((path as Hash)["vertex"] as Array).each do |vertex|
        solution.push (vertex as String).to_i8
      end
      initial_solutions.push solution
    end
    initial_solutions
  end

  def get_graph_costs
    graph = ([] of Array(Int32))
    ((@tsp_problem["graph"] as Hash)["vertex"] as Array).each_with_index do |vertex, i|
      node = Array.new(@size, 9999)
      ((vertex as Hash)["edge"] as Array).each do |edge|
        edge = edge as Hash
        cost = (edge["-cost"] as String).to_f.to_i
        index = (edge["#text"] as String).to_i
        node[index] = cost
      end
      graph.push node
    end
    graph
  end
end
