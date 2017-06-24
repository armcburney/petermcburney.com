require 'rails_helper'

RSpec.describe "artworks/new", type: :view do
  before(:each) do
    assign(:artwork, Artwork.new(
      :title => "MyString",
      :image_url => "MyString",
      :featured => false,
      :for_sale => false,
      :type => "",
      :size => "MyString",
      :price => "9.99"
    ))
  end

  it "renders new artwork form" do
    render

    assert_select "form[action=?][method=?]", artworks_path, "post" do

      assert_select "input[name=?]", "artwork[title]"

      assert_select "input[name=?]", "artwork[image_url]"

      assert_select "input[name=?]", "artwork[featured]"

      assert_select "input[name=?]", "artwork[for_sale]"

      assert_select "input[name=?]", "artwork[type]"

      assert_select "input[name=?]", "artwork[size]"

      assert_select "input[name=?]", "artwork[price]"
    end
  end
end
