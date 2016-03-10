module Ruboty
  module Annoinder
    module Actions
      class List < Ruboty::Actions::Base
        def call
          message.reply(list)
        rescue => e
          message.reply(e.message)
        end

        private
        def list
          # TODO: main logic
        end
      end
    end
  end
end
