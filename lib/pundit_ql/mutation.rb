# frozen_string_literal: true


module PunditQL
  module Mutation
    def self.included(klass)
      klass.include Base
    end

    def action_name
      case class_name
      when matches_create?
        :create
      when matches_update?
        :update
      when matches_delete?
        :destroy
      else
        raise StandardError, "PunditQL cannot infer action name for #{class_name}."
      end
    end

    private
      def matches_create?
        build_matcher_for 'create'
      end

      def matches_update?
        build_matcher_for 'update'
      end

      def matches_delete?
        build_matcher_for 'delete'
      end

      def build_matcher_for(prefix)
        -> (name) { name.underscore.match? /\A#{prefix}_/ }
      end
  end
end
