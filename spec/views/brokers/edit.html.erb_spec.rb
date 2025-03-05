require 'rails_helper'

RSpec.describe "brokers/edit", type: :view do
  let(:broker) {
    Broker.create!(
      broker_name: "MyString",
      unit_name: "MyString",
      signature: "MyString"
    )
  }

  before(:each) do
    assign(:broker, broker)
  end

  it "renders the edit broker form" do
    render

    assert_select "form[action=?][method=?]", broker_path(broker), "post" do

      assert_select "input[name=?]", "broker[broker_name]"

      assert_select "input[name=?]", "broker[unit_name]"

      assert_select "input[name=?]", "broker[signature]"
    end
  end
end
