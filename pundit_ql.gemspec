# frozen_string_literal: true

require_relative "lib/pundit_ql/version"

Gem::Specification.new do |spec|
  spec.name          = "pundit_ql"
  spec.version       = PunditQL::VERSION
  spec.authors       = ["Otto Raphael Klotz D'Abril"]
  spec.email         = ["klotz.dabril@gmail.com"]

  spec.summary       = "GraphQL meets Pundit"
  spec.description   = "Pundit integration with GraphQL resolvers and mutations."
  # spec.homepage      = ""
  # spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/klotz-dabril/pundit_ql"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pundit", "~> 2.1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
