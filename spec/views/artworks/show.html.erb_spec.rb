require 'rails_helper'

RSpec.describe 'artworks/show', type: :view do
  before(:each) do
    @artwork = assign(:artwork, Artwork.create!(
      title: 'Title',
      featured: false,
      for_sale: false,
      type: '',
      size: 'Size',
      price: '9.99'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/9.99/)
  end
end
