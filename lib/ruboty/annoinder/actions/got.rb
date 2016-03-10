module Ruboty
  module Annoinder
    module Actions
      class Got < Ruboty::Actions::Base
        def call
          message.reply(got)
        rescue => e
          message.reply(e.message)
        end

        private
        def got
          # TODO: main logic
        end
      end
    end
  end
end
