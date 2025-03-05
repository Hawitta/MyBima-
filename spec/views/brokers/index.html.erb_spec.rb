require 'rails_helper'

RSpec.describe "brokers/index", type: :view do
  before(:each) do
    assign(:brokers, [
      Broker.create!(
        broker_name: "Broker Name",
        unit_name: "Unit Name",
        signature: "Signature"
      ),
      Broker.create!(
        broker_name: "Broker Name",
        unit_name: "Unit Name",
        signature: "Signature"
      )
    ])
  end

  it "renders a list of brokers" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Broker Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Unit Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Signature".to_s), count: 2
  end
end
