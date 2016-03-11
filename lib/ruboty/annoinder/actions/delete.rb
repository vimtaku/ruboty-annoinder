module Ruboty
  module Annoinder
    module Actions
      class Delete < Ruboty::Actions::AnnoinderBase
        def call
          message.reply(delete)
        rescue => e
          message.reply(e.message)
        end

        private
        def delete
          ids = message.body.scan(/\d+/)
          repository = Ruboty::Annoinder::Repository::Notification.new(robot.brain)
          rets = ids.map do |id|
            repository.delete_notification(id)
            id
          end
          return "削除しました:" + rets.join(',')
        end
      end
    end
  end
end
