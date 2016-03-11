module Ruboty
  module Annoinder
    module Actions
      class List < Ruboty::Actions::AnnoinderBase
        def call
          message.reply(list)
        rescue => e
          message.reply(e.message)
        end

        private
        def list
          repository = Ruboty::Annoinder::Repository::Notification.new(robot.brain)
          notifications = repository.find_notifications
          return notifications.map(&:to_s)
        end
      end
    end
  end
end
