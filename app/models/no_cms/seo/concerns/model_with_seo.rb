module NoCms::Seo::Concerns::ModelWithSeo
  extend ActiveSupport::Concern

  included do
    has_one :seo_info, -> { where(kind: nil) }, class_name: 'NoCms::Seo::Info', as: :target
    accepts_nested_attributes_for :seo_info

    has_many :seo_infos, class_name: 'NoCms::Seo::Info', as: :target
    accepts_nested_attributes_for :seo_infos

    def seo_info
      super || build_seo_info(kind: nil)
    end

    def dup_with_seo
      dupped_model = dup_without_seo
      dupped_model.seo_info = seo_info.dup
      self.class.seo_info_kinds.each do |kind|
        relation_name = "#{kind}_seo_info"
        if current_seo_info = send(relation_name)
          dupped_model.send("#{relation_name}=", current_seo_info.dup)
        end
      end
      dupped_model
    end
    alias_method_chain :dup, :seo
  end

  module ClassMethods
    cattr_accessor :seo_info_kinds
    self.seo_info_kinds = []

    def add_seo_infos *kinds
      self.seo_info_kinds = kinds
      seo_info_kinds.each do |kind|
        relation_name = "#{kind}_seo_info".to_sym
        has_one relation_name, -> { where(kind: kind) }, class_name: 'NoCms::Seo::Info', as: :target
        accepts_nested_attributes_for relation_name
      end
    end
  end
end
