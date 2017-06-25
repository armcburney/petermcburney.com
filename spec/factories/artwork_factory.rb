FactoryGirl.define do
  TYPES = %i[copic painting sketch].freeze

  factory :artwork do
    title { Faker::Name.title }
    slug { title.parameterize }
    artwork_type { TYPES[Faker::Number.between(0, 2)] }
    featured { Faker::Boolean.boolean(0.3) }
    for_sale { Faker::Boolean.boolean(0.6) }
    price { Faker::Number.decimal(2) }
    image { File.new(Rails.root + 'spec/factories/images/sample.jpg') }
  end
end
