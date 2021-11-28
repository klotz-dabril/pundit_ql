# frozen_string_literal: true


module PunditQL
  module Base
    include Pundit

    def self.included(klass)
      klass.extend ClassMehtods
    end

    module ClassMehtods
      def define_action_name(action_name)
        self.define_method(:action_name) do
          action_name
        end
      end
    end

    def pundit_user
      context[:current_user]
    end

    private
      def class_name
        self.class.to_s.demodulize
      end
  end
end
