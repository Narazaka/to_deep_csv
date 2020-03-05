lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "to_deep_csv/version"

Gem::Specification.new do |spec|
  spec.name = "to_deep_csv"
  spec.version = ToDeepCsv::VERSION
  spec.licenses = %w[Zlib]
  spec.authors = %w[Narazaka]
  spec.email = %w[info@narazaka.net]

  spec.summary =
    "to_csv for Array<Array>, Array<Hash>, Array<ActiveRecord::Base>, ActiveRecord::Relation etc."
  spec.homepage = "https://github.com/Narazaka/to_deep_csv"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_dependency "activesupport"
  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-airbnb"
  spec.add_development_dependency "prettier"
  spec.add_development_dependency "yard", "~> 0.9"
  spec.add_development_dependency "rake", "~> 13.0"
end
