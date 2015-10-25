  struct ToU64Info
    getter value, negative, invalid

    def initialize(@value, @negative, @invalid)
    end

    

    def clone
      ToU64Info.new(@value.clone, @negative.clone, @invalid.clone)
    end
  end
