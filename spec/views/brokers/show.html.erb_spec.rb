require 'rails_helper'

RSpec.describe "brokers/show", type: :view do
  before(:each) do
    assign(:broker, Broker.create!(
      broker_name: "Broker Name",
      unit_name: "Unit Name",
      signature: "Signature"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Broker Name/)
    expect(rendered).to match(/Unit Name/)
    expect(rendered).to match(/Signature/)
  end
end
