module NoCms::Seo::Concerns::ModelWithSeo
  extend ActiveSupport::Concern

  included do
    has_one :seo_info, class_name: 'NoCms::Seo::Info', as: :target
    accepts_nested_attributes_for :seo_info
  end

end
