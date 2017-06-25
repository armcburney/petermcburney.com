require 'rails_helper'

RSpec.describe 'artworks/edit', type: :view do
  before(:each) do
    @artwork = assign(:artwork, Artwork.create!(
      title: 'MyString',
      slug: 'my-string',
      featured: false,
      for_sale: true,
      artwork_type: :painting,
      size: 'MyString',
      price: '9.99',
      image: File.new(Rails.root + 'spec/factories/images/sample.jpg')
    ))
  end

  it 'renders the edit artwork form' do
    render

    assert_select 'form[action=?][method=?]', artwork_path(@artwork), 'post' do
      assert_select 'input[name=?]', 'artwork[title]'

      assert_select 'input[name=?]', 'artwork[featured]'

      assert_select 'input[name=?]', 'artwork[for_sale]'

      assert_select 'input[name=?]', 'artwork[artwork_type]'

      assert_select 'input[name=?]', 'artwork[size]'

      assert_select 'input[name=?]', 'artwork[price]'
    end
  end
end
