module NoCms
  module Seo
    class Engine < ::Rails::Engine
      isolate_namespace Seo
    end
  end
end
