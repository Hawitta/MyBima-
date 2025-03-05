require 'rails_helper'

RSpec.describe "benefitiaries/edit", type: :view do
  let(:benefitiary) {
    Benefitiary.create!(
      surname: "MyString",
      first_name: "MyString",
      relationship: "MyString",
      id_no: 1,
      phone_number: 1,
      postal_address: 1
    )
  }

  before(:each) do
    assign(:benefitiary, benefitiary)
  end

  it "renders the edit benefitiary form" do
    render

    assert_select "form[action=?][method=?]", benefitiary_path(benefitiary), "post" do

      assert_select "input[name=?]", "benefitiary[surname]"

      assert_select "input[name=?]", "benefitiary[first_name]"

      assert_select "input[name=?]", "benefitiary[relationship]"

      assert_select "input[name=?]", "benefitiary[id_no]"

      assert_select "input[name=?]", "benefitiary[phone_number]"

      assert_select "input[name=?]", "benefitiary[postal_address]"
    end
  end
end
