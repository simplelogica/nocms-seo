$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "no_cms/seo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nocms-seo"
  s.version     = NoCms::Seo::VERSION
  s.authors     = ["Simplelogica"]
  s.email       = ["gems@simplelogica.net"]
  s.homepage    = "https://github.com/simplelogica/nocms-seo"
  s.summary     = "Gem with SEO functionality independent from any CMS and embeddable in any Rails 4 app"
  s.description = "Gem with SEO functionality independent from any CMS and embeddable in any Rails 4 app"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0", '< 5.1'
  s.add_dependency "globalize", '>= 4.0.0', '< 5.5'

  s.add_development_dependency "sqlite3"
end
