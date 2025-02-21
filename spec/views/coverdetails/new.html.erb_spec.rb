require 'rails_helper'

RSpec.describe "coverdetails/new", type: :view do
  before(:each) do
    assign(:coverdetail, Coverdetail.new(
      cover_id: 1,
      category: "MyString",
      optional: "MyString",
      younger_age: 1,
      older_age: 1
    ))
  end

  it "renders new coverdetail form" do
    render

    assert_select "form[action=?][method=?]", coverdetails_path, "post" do

      assert_select "input[name=?]", "coverdetail[cover_id]"

      assert_select "input[name=?]", "coverdetail[category]"

      assert_select "input[name=?]", "coverdetail[optional]"

      assert_select "input[name=?]", "coverdetail[younger_age]"

      assert_select "input[name=?]", "coverdetail[older_age]"
    end
  end
end
