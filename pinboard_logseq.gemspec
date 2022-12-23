# frozen_string_literal: true

require_relative "lib/pinboard_logseq/version"

Gem::Specification.new do |spec|
  spec.name = "pinboard_logseq"
  spec.version = PinboardLogseq::VERSION
  spec.authors = ["Andy Waite"]
  spec.email = ["andyw8@users.noreply.github.com"]

  spec.summary = "Export from Pinboard to Logseq"
  spec.homepage = "https://github.com/andyw8/pinboard_logseq"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "sorbet-runtime"
  spec.add_development_dependency "debug"
  spec.add_development_dependency "sorbet"
  spec.add_development_dependency "standard"
  spec.add_development_dependency "rubocop-minitest"
  spec.add_development_dependency "rubocop-rake"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
