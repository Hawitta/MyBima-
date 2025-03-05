require 'rails_helper'

RSpec.describe "brokers/new", type: :view do
  before(:each) do
    assign(:broker, Broker.new(
      broker_name: "MyString",
      unit_name: "MyString",
      signature: "MyString"
    ))
  end

  it "renders new broker form" do
    render

    assert_select "form[action=?][method=?]", brokers_path, "post" do

      assert_select "input[name=?]", "broker[broker_name]"

      assert_select "input[name=?]", "broker[unit_name]"

      assert_select "input[name=?]", "broker[signature]"
    end
  end
end
