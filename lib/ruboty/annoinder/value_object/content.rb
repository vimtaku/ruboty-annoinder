module Ruboty
  module Annoinder
    module ValueObject
      class Content
        attr_accessor :raw_message
        attr_accessor :notify_message

        def initialize(raw_message:"", notify_message: "")
          @notify_message = notify_message
          @raw_message = raw_message
        end

        def to_s
          @notify_message.to_s
        end
      end
    end
  end
end
