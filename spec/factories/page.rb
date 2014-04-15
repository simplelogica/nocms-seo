FactoryGirl.define do
  factory :page, class: Page do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
