class NoCms::Seo::Info < ActiveRecord::Base
  belongs_to :target, polymorphic: true
  translates :title, :description
  accepts_nested_attributes_for :translations
end
