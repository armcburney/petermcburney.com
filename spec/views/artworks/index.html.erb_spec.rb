require 'rails_helper'

RSpec.describe "artworks/index", type: :view do
  before(:each) do
    assign(:artworks, [
      Artwork.create!(
        :title => "Title",
        :image_url => "Image Url",
        :featured => false,
        :for_sale => false,
        :type => "",
        :size => "Size",
        :price => "9.99"
      ),
      Artwork.create!(
        :title => "Title",
        :image_url => "Image Url",
        :featured => false,
        :for_sale => false,
        :type => "",
        :size => "Size",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of artworks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
