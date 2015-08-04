Gem::Specification.new do |s|
  s.name              = "nido"
  s.version           = "1.0.0"
  s.summary           = "Structured keys helper"
  s.description       = "It is a design pattern in key-value databases to use the key to simulate structure, and Nido can take care of that."
  s.authors           = ["Michel Martens"]
  s.email             = ["michel@soveran.com"]
  s.homepage          = "http://github.com/soveran/nido"

  s.files = Dir[
    "LICENSE",
    "README.md",
    "Rakefile",
    "lib/**/*.rb",
    "*.gemspec",
    "test/*.*"
  ]

  s.add_development_dependency "cutest"
end
