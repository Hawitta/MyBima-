require 'rails_helper'

RSpec.describe "benefitiaries/index", type: :view do
  before(:each) do
    assign(:benefitiaries, [
      Benefitiary.create!(
        surname: "Surname",
        first_name: "First Name",
        relationship: "Relationship",
        id_no: 2,
        phone_number: 3,
        postal_address: 4
      ),
      Benefitiary.create!(
        surname: "Surname",
        first_name: "First Name",
        relationship: "Relationship",
        id_no: 2,
        phone_number: 3,
        postal_address: 4
      )
    ])
  end

  it "renders a list of benefitiaries" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Surname".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Relationship".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
  end
end
