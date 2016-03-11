module Ruboty
  module Annoinder
    module Repository
      class Notification
        attr :brain

        def initialize(brain)
          @brain = brain
        end

        def find_notifications
          data.map do |id, marshal|
            Marshal.load(marshal)
          end
        end
        def find_notification(notification_id)
          data.each do |id, marshal|
            return Marshal.load(marshal) if notification_id == id
          end
          return nil
        end

        def save_notification(notification)
          if notification.id.nil?
            notification.id = generate_id
            data[notification.id] = Marshal.dump(notification)
            return notification
          else
            data[notification.id] = Marshal.dump(notification)
            return notification
          end
        end


        def delete_notification(id)
          data.delete(id)
        end

        def data
          brain.data[Ruboty::Annoinder::NAMESPACE + ":" + Ruboty::Annoinder::VERSION] ||= {}
        end

        def seq_data
          brain.data[Ruboty::Annoinder::NAMESPACE + ":" + Ruboty::Annoinder::VERSION + ":seq"] ||= {}
        end

        def min_seq
          seq_data["seq"] ||= 0
        end
        def increment_min_seq
          seq_data["seq"] = min_seq + 1
        end

        def generate_id
          prefix = Date.today.strftime("%m%d")
          loop do
            id = prefix + sprintf("%03d", increment_min_seq)
            return id unless data.has_key?(id)
          end
        end

      end
    end
  end
end
