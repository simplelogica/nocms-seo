module NoCms
  module Seo
    include ActiveSupport::Configurable

    config_accessor :default_title
    config_accessor :default_description

    self.default_title = ""
    self.default_description = ""

  end
end
