require 'rails_helper'

RSpec.describe "stripes/show", type: :view do
  before(:each) do
    assign(:stripe, Stripe.create!(
      user_id: 2,
      stripe_payment_id: "Stripe Payment",
      card_brand: "Card Brand",
      last_4: "Last 4",
      card_fingerprint: "Card Fingerprint"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Stripe Payment/)
    expect(rendered).to match(/Card Brand/)
    expect(rendered).to match(/Last 4/)
    expect(rendered).to match(/Card Fingerprint/)
  end
end
