# frozen_string_literal: true


module PunditQL
  module Resolver
    def self.included(klass)
      klass.include Base
    end


    def action_name
      return :show if class_name_is_singular?

      :index
    end

    private
      def class_name_is_singular?
        class_name == class_name.singularize
      end
  end
end
