module Ruboty
  module Annoinder
    module Actions
      class Got < Ruboty::Actions::AnnoinderBase
        def call
          message.reply(got)
        rescue => e
          message.reply(e.message)
        end

        private
        def got
          ids = message.body.scan(/\d+/)
          repository = Ruboty::Annoinder::Repository::Notification.new(robot.brain)
          ids.each do |id|
            notification = repository.find_notification(id)
            next if notification.nil?

            notification.got_it(message.from.to_s)
            repository.save_notification(notification)
          end
          ""
        end

      end
    end
  end
end
