require 'rails_helper'

RSpec.describe "dependants/edit", type: :view do
  let(:dependant) {
    Dependant.create!(
      user_id: 1,
      surname: "MyString",
      first_name: "MyString",
      dob: "MyString",
      id_no: "MyString",
      blood_group: "MyString"
    )
  }

  before(:each) do
    assign(:dependant, dependant)
  end

  it "renders the edit dependant form" do
    render

    assert_select "form[action=?][method=?]", dependant_path(dependant), "post" do

      assert_select "input[name=?]", "dependant[user_id]"

      assert_select "input[name=?]", "dependant[surname]"

      assert_select "input[name=?]", "dependant[first_name]"

      assert_select "input[name=?]", "dependant[dob]"

      assert_select "input[name=?]", "dependant[id_no]"

      assert_select "input[name=?]", "dependant[blood_group]"
    end
  end
end
