# frozen_string_literal: true

FactoryGirl.define do
  ARTWORK_TYPES = %i(copic painting sketch).freeze

  factory :artwork do
    title { Faker::Name.title }
    slug { title.parameterize }
    artwork_type { ARTWORK_TYPES[Faker::Number.between(0, 2)] }
    size { Faker::Name.title }
    featured { Faker::Boolean.boolean(0.3) }
    for_sale { Faker::Boolean.boolean(0.6) }
    price { Faker::Number.decimal(2) }
    image { File.new(Rails.root + 'spec/factories/images/sample.jpg') }
    media { Faker::Name.title }
  end
end
