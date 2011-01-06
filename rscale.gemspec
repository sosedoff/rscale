Gem::Specification.new do |s|
  s.name = "rscale"
  s.version = "0.1.2"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Sosedoff"]
  s.date = "2011-01-06"
  s.description = "Image scaling wrapper based on ImageMagick console utils"
  s.email = "dan.sosedoff@gmail.com"
  s.files = [
    "lib/rscale.rb",
    "lib/rscale/rscale.rb",
    "lib/rscale/errors.rb",
    "lib/rscale/uuid.rb",
    "lib/rscale/configuration.rb",
    "lib/rscale/format.rb",
    "lib/rscale/helpers.rb",
    "lib/rscale/processor.rb",
    "lib/rscale/geometry.rb",
    "README.rdoc"
  ]
  s.homepage = "http://github.com/sosedoff/rscale"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.3.7"
  s.summary = "Image scaling wrapper based on ImageMagick console utils"
end