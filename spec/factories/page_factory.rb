FactoryBot.define do
  factory :page, class: Spree::Page do
    title { "My Page Title" }
    content { generate(:random_description) }
  end
end
