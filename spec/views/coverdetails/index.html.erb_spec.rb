require 'rails_helper'

RSpec.describe "coverdetails/index", type: :view do
  before(:each) do
    assign(:coverdetails, [
      Coverdetail.create!(
        cover_id: 2,
        category: "Category",
        optional: "Optional",
        younger_age: 3,
        older_age: 4
      ),
      Coverdetail.create!(
        cover_id: 2,
        category: "Category",
        optional: "Optional",
        younger_age: 3,
        older_age: 4
      )
    ])
  end

  it "renders a list of coverdetails" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Category".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Optional".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
  end
end
