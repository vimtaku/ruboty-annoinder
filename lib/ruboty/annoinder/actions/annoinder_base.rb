module Ruboty
  module Actions
    class AnnoinderBase < Ruboty::Actions::Base
      attr_accessor :robot
      def initialize(message, robot)
        @message = message
        @robot = robot
      end

    end
  end
end
