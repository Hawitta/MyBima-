require 'rails_helper'

RSpec.describe "coverdetails/show", type: :view do
  before(:each) do
    assign(:coverdetail, Coverdetail.create!(
      cover_id: 2,
      category: "Category",
      optional: "Optional",
      younger_age: 3,
      older_age: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Optional/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
