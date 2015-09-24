module NoCms::Seo::Concerns::ModelWithSeo
  extend ActiveSupport::Concern

  included do
    has_one :seo_info, class_name: 'NoCms::Seo::Info', as: :target
    accepts_nested_attributes_for :seo_info

    def seo_info
      super || build_seo_info
    end

    def dup_with_seo
      dupped_model = dup_without_seo
      dupped_model.seo_info = seo_info.dup
      dupped_model
    end
    alias_method_chain :dup, :seo
  end

end
