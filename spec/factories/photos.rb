FactoryGirl.define do
  TYPES = %i(location nature wildlife).freeze

  factory :photo do
    title { Faker::Name.title }
    slug { title.parameterize }
    image_type { TYPES[Faker::Number.between(0, 2)] }
    featured { Faker::Boolean.boolean(0.3) }
    location { Faker::Address.city + ', ' + Faker::Address.state }
    image { File.new(Rails.root + 'spec/factories/images/sample.jpg') }
  end

end
