  __temp_116 = Fiber.new do
    begin
      __temp_117
    rescue __temp_118
      STDERR.puts "Unhandled exception:"
      __temp_118.inspect_with_backtrace STDERR
      STDERR.flush
    end
  end

  Scheduler.enqueue __temp_116

  __temp_116
