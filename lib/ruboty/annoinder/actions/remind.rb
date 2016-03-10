module Ruboty
  module Annoinder
    module Actions
      class Remind < Ruboty::Actions::Base
        def call
          message.reply(remind)
        rescue => e
          message.reply(e.message)
        end

        private
        def remind
          # TODO: main logic
        end
      end
    end
  end
end
