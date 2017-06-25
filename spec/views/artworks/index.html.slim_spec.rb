require 'rails_helper'

RSpec.describe 'artworks/index', type: :view do
  before(:each) do
    assign(:artworks, [
      Artwork.create!(
        title: 'Title',
        featured: false,
        for_sale: true,
        artwork_type: :painting,
        size: 'Size',
        price: '9.99',
        image: File.new(Rails.root + 'spec/factories/images/sample.jpg')
      ),
      Artwork.create!(
        title: 'Title',
        featured: false,
        for_sale: false,
        artwork_type: :painting,
        size: 'Size',
        image: File.new(Rails.root + 'spec/factories/images/sample.jpg')
      )
    ])
  end

  it 'renders a list of artworks' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 3
    assert_select 'tr>td', text: true.to_s, count: 1
    assert_select 'tr>td', text: 'painting'.to_s, count: 2
    assert_select 'tr>td', text: 'Size'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 1
  end
end
