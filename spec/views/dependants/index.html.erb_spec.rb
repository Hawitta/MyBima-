require 'rails_helper'

RSpec.describe "dependants/index", type: :view do
  before(:each) do
    assign(:dependants, [
      Dependant.create!(
        user_id: 2,
        surname: "Surname",
        first_name: "First Name",
        dob: "Dob",
        id_no: "Id No",
        blood_group: "Blood Group"
      ),
      Dependant.create!(
        user_id: 2,
        surname: "Surname",
        first_name: "First Name",
        dob: "Dob",
        id_no: "Id No",
        blood_group: "Blood Group"
      )
    ])
  end

  it "renders a list of dependants" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Surname".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Dob".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Id No".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Blood Group".to_s), count: 2
  end
end
