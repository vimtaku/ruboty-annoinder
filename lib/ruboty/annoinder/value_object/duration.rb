module Ruboty
  module Annoinder
    module ValueObject
      class Duration
        attr_accessor :threshold

        def initialize(threshold = 5 * 60)
          @threshold = threshold
        end

        def to_s
          @threshold.to_s
        end
      end
    end
  end
end
