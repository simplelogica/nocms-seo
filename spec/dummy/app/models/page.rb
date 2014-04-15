class Page < ActiveRecord::Base
  include NoCms::Seo::Concerns::ModelWithSeo
end
