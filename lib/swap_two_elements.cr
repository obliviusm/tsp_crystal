module SwapTwoElements
  def swap_random num = 1
    solution = self
    num.times do
      i, j = two_random_num(@n + 1)
      solution = solution.swap i, j
    end
    solution
  end

  def two_random_num max_num
    i = rand max_num
    j = rand max_num
    while i == j
      j = rand max_num
    end
    [i, j]
  end

  def swap i, j
    i, j = [i, j].sort

    # 28 0 1
    i0, i1, i2 = x[i - 1], x[i], x[i + 1]
    # 26 27 28
    j0, j1, j2 = x[j - 1], x[j], x[(j + 1) % (n+1)]
    delta = 0
    if i == 0 && j == n
      delta = (w[j0][i1] + w[i1][j1] + w[j1][i2]) -(w[j0][j1] + w[j1][i1] + w[i1][i2])
    else
      if j - i == 1
        delta = (w[i1][j2] + w[j1][i1]) - (w[i1][j1] + w[j1][j2])
      else
        delta = (w[j0][i1] + w[i1][j2] + w[j1][i2]) - (w[i1][i2] + w[j0][j1] + w[j1][j2])
      end
      delta += w[i0][j1] - w[i0][i1]
    end

    tsp = TSPSolution.new w, swap_path(i, j), (f + delta)
    if tsp.f != tsp.distance
      raise "(#{i},#{j})#{n} #{x}:#{f} #{swap_path(i, j)} #{tsp.f} #{tsp.distance} #{delta}"
    end
    tsp
  end

  def swap_path i, j
    x_copy = x.dup
    x_copy[i], x_copy[j] = x_copy[j], x_copy[i]
    x_copy
  end
end
