module Ruboty
  module Annoinder
    module Actions
      class Delete < Ruboty::Actions::Base
        def call
          message.reply(delete)
        rescue => e
          message.reply(e.message)
        end

        private
        def delete
          # TODO: main logic
        end
      end
    end
  end
end
