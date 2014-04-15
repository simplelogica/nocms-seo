class NoCms::Seo::Info < ActiveRecord::Base
  belongs_to :target, polymorphic: true
  translates :title, :description
end
