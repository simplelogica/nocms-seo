FactoryGirl.define do
  factory :no_cms_seo_info, class: NoCms::Seo::Info do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    no_index { rand > 0.5 }
    no_follow { rand > 0.5 }
    exclude_from_sitemap { rand > 0.5 }
  end
end
