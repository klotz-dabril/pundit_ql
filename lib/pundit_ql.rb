# frozen_string_literal: true

require_relative "pundit_ql/version"

require_relative "pundit_ql/base"
require_relative "pundit_ql/resolver"
require_relative "pundit_ql/mutation"

module PunditQL
  class Error < StandardError; end
end
