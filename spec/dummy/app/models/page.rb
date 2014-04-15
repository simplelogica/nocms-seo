class Page < ActiveRecord::Base
  has_one :seo_info, class_name: 'NoCms::Seo::Info', as: :target
end
