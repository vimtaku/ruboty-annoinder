module Ruboty
  module Annoinder
    module Actions
      class Remind < Ruboty::Actions::AnnoinderBase
        def call
          message.reply(remind)
        rescue => e
          message.reply(e.message)
        end

        private
        def remind
          notification = Ruboty::Annoinder::Entity::Notification.get_instance(message.body)
          repository = Ruboty::Annoinder::Repository::Notification.new(robot.brain)
          repository.save_notification(notification)
          return "記憶しました。"
        end
      end
    end
  end
end
