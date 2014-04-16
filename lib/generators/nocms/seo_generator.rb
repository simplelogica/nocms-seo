module NoCms
  class SeoGenerator < Rails::Generators::Base

    source_root File.expand_path("../templates/", __FILE__)

    def generate_nocms_menus_initializer
      template "config/initializers/nocms/seo.rb", File.join(destination_root, "config", "initializers", "nocms", "seo.rb")
    end

    def self.namespace
      "nocms:seo"
    end

  end
end
