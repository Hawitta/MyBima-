require 'rails_helper'

RSpec.describe "dependants/new", type: :view do
  before(:each) do
    assign(:dependant, Dependant.new(
      user_id: 1,
      surname: "MyString",
      first_name: "MyString",
      dob: "MyString",
      id_no: "MyString",
      blood_group: "MyString"
    ))
  end

  it "renders new dependant form" do
    render

    assert_select "form[action=?][method=?]", dependants_path, "post" do

      assert_select "input[name=?]", "dependant[user_id]"

      assert_select "input[name=?]", "dependant[surname]"

      assert_select "input[name=?]", "dependant[first_name]"

      assert_select "input[name=?]", "dependant[dob]"

      assert_select "input[name=?]", "dependant[id_no]"

      assert_select "input[name=?]", "dependant[blood_group]"
    end
  end
end
