module NoCms
  module Seo
    class Engine < ::Rails::Engine
      isolate_namespace NoCms::Seo
    end
  end
end
