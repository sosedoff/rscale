Gem::Specification.new do |s|
  s.name = "rscale"
  s.version = "0.1"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Sosedoff"]
  s.date = %q{2010-07-02}
  s.description = %q{Image scaling wrapper based on ImageMagick console utils}
  s.email = %q{dan.sosedoff@gmail.com}
  s.files = [
    "lib/rscale.rb",
    "lib/rscale/rscale.rb",
    "lib/rscale/errors.rb",
    "lib/rscale/configuration.rb",
    "lib/rscale/format.rb",
    "lib/rscale/helpers.rb",
    "lib/rscale/processor.rb",
    "lib/rscale/geometry.rb"
  ]
  s.homepage = %q{http://github/sosedoff/rscale}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Image scaling wrapper based on ImageMagick console utils}
end

