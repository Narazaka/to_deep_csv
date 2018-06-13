
lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "to_deep_csv/version"

Gem::Specification.new do |spec|
  spec.name          = "to_deep_csv"
  spec.version       = ToDeepCsv::VERSION
  spec.licenses      = ["Zlib"]
  spec.authors       = ["Narazaka"]
  spec.email         = ["info@narazaka.net"]

  spec.summary       = "to_csv for Array<Array>, Array<Hash>, Array<ActiveRecord::Base>, ActiveRecord::Relation etc."
  spec.homepage      = "https://github.com/Narazaka/to_deep_csv"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "onkcop"
  spec.add_development_dependency "rake", "~> 10.0"
end
