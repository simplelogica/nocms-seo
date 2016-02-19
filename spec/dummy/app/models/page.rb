class Page < ActiveRecord::Base
  include NoCms::Seo::Concerns::ModelWithSeo
  add_seo_infos :mobile
end
