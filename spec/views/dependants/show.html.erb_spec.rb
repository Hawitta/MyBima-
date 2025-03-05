require 'rails_helper'

RSpec.describe "dependants/show", type: :view do
  before(:each) do
    assign(:dependant, Dependant.create!(
      user_id: 2,
      surname: "Surname",
      first_name: "First Name",
      dob: "Dob",
      id_no: "Id No",
      blood_group: "Blood Group"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Dob/)
    expect(rendered).to match(/Id No/)
    expect(rendered).to match(/Blood Group/)
  end
end
