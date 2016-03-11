module Ruboty
  module Annoinder
    module ValueObject
      class Target
        attr_accessor :members

        def initialize(members)
          @members = members
        end

        def to_s
          @members.to_s
        end
      end
    end
  end
end
