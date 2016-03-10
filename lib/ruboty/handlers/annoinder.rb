require "ruboty/annoinder/actions/got"
require "ruboty/annoinder/actions/remind"
require "ruboty/annoinder/actions/list"
require "ruboty/annoinder/actions/delete"

module Ruboty
  module Handlers
    # The annoying reminder you've never seen.
    class Annoinder < Base
      on /got( (.+))?\z/, name: 'got', description: 'Tell got it to annoinder'
      on /remind\s.*\z/, name: 'remind', description: 'Add reminder'
      on /list\z/, name: 'list', description: 'list reminder tasks'
      on /delete\s+\d+\z/, name: 'delete', description: 'delete reminder tasks'


      def got(message)
        Ruboty::Annoinder::Actions::Got.new(message).call
      end

      def remind(message)
        Ruboty::Annoinder::Actions::Remind.new(message).call
      end

      def list(message)
        Ruboty::Annoinder::Actions::List.new(message).call
      end

      def delete(message)
        Ruboty::Annoinder::Actions::Delete.new(message).call
      end

    end
  end
end
