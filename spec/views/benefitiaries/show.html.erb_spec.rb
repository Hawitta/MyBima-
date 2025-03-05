require 'rails_helper'

RSpec.describe "benefitiaries/show", type: :view do
  before(:each) do
    assign(:benefitiary, Benefitiary.create!(
      surname: "Surname",
      first_name: "First Name",
      relationship: "Relationship",
      id_no: 2,
      phone_number: 3,
      postal_address: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Relationship/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
