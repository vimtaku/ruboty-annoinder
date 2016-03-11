module Ruboty
  module Annoinder
    module Entity
      class Notification
        attr_accessor :id, :duration, :content, :target

        def self.get_instance(message)
          instance = self.new
          instance.duration = ValueObject::Duration.new

          head_trim_message = message.gsub(/\A\S+/, '')

          res = head_trim_message.scan(/@\S+/)
          instance.target = ValueObject::Target.new(res)

          notify_body = head_trim_message.gsub(/@\S+/, '')

          instance.content = ValueObject::Content.new(
            raw_message: message,
            notify_message: notify_body
          )

          return instance
        end

        def got_it(username)
          @target.members = @target.members - [at(username)]
        end

        def at(username)
          return username if username.match(/\A@/)
          return "@#{username}"
        end

        def to_s
          "#{id}:duration:#{duration}, content:#{content}, target:#{target}"
        end
      end
    end
  end
end
