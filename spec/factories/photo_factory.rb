# frozen_string_literal: true

FactoryGirl.define do
  PHOTO_TYPES = %i(location nature wildlife).freeze

  factory :photo do
    title { Faker::Name.title }
    slug { title.parameterize }
    image_type { PHOTO_TYPES[Faker::Number.between(0, 2)] }
    featured { Faker::Boolean.boolean(0.3) }
    location { Faker::Address.city + ', ' + Faker::Address.state }
    image { File.new(Rails.root + 'spec/factories/images/image.jpg') }
  end
end
