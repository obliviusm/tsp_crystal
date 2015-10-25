  fun main = main(argc : Int32, argv : UInt8**) : Int32
    GC.init
    __temp_120
    0
  rescue ex
    ex.inspect_with_backtrace STDERR
    1
  ensure
    AtExitHandlers.run
    STDOUT.flush
  end
