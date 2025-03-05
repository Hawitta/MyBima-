require 'rails_helper'

RSpec.describe "benefitiaries/new", type: :view do
  before(:each) do
    assign(:benefitiary, Benefitiary.new(
      surname: "MyString",
      first_name: "MyString",
      relationship: "MyString",
      id_no: 1,
      phone_number: 1,
      postal_address: 1
    ))
  end

  it "renders new benefitiary form" do
    render

    assert_select "form[action=?][method=?]", benefitiaries_path, "post" do

      assert_select "input[name=?]", "benefitiary[surname]"

      assert_select "input[name=?]", "benefitiary[first_name]"

      assert_select "input[name=?]", "benefitiary[relationship]"

      assert_select "input[name=?]", "benefitiary[id_no]"

      assert_select "input[name=?]", "benefitiary[phone_number]"

      assert_select "input[name=?]", "benefitiary[postal_address]"
    end
  end
end
