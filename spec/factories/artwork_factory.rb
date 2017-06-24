FactoryGirl.define do
  factory :artwork do
    title    { Faker::Name.title }
    slug     { title.parameterize }
    featured { Faker::Boolean.boolean(0.3) }
    for_sale { Faker::Boolean.boolean(0.6) }
    price    { Faker::Number.decimal(2) }
  end
end
