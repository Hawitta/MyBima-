require 'rails_helper'

RSpec.describe "coverdetails/edit", type: :view do
  let(:coverdetail) {
    Coverdetail.create!(
      cover_id: 1,
      category: "MyString",
      optional: "MyString",
      younger_age: 1,
      older_age: 1
    )
  }

  before(:each) do
    assign(:coverdetail, coverdetail)
  end

  it "renders the edit coverdetail form" do
    render

    assert_select "form[action=?][method=?]", coverdetail_path(coverdetail), "post" do

      assert_select "input[name=?]", "coverdetail[cover_id]"

      assert_select "input[name=?]", "coverdetail[category]"

      assert_select "input[name=?]", "coverdetail[optional]"

      assert_select "input[name=?]", "coverdetail[younger_age]"

      assert_select "input[name=?]", "coverdetail[older_age]"
    end
  end
end
