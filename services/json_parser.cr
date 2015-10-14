class JSONparser
  def initialize filename
    f = File.new("data/#{filename}.json")
    @tsp_problem = ((JSON.parse(f) as Hash)["travellingSalesmanProblemInstance"] as Hash)
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
end
