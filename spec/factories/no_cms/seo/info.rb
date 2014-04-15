FactoryGirl.define do
  factory :no_cms_seo_info, class: NoCms::Seo::Info do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end
