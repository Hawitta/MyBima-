require 'rails_helper'

RSpec.describe "stripes/index", type: :view do
  before(:each) do
    assign(:stripes, [
      Stripe.create!(
        user_id: 2,
        stripe_payment_id: "Stripe Payment",
        card_brand: "Card Brand",
        last_4: "Last 4",
        card_fingerprint: "Card Fingerprint"
      ),
      Stripe.create!(
        user_id: 2,
        stripe_payment_id: "Stripe Payment",
        card_brand: "Card Brand",
        last_4: "Last 4",
        card_fingerprint: "Card Fingerprint"
      )
    ])
  end

  it "renders a list of stripes" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Stripe Payment".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Card Brand".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last 4".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Card Fingerprint".to_s), count: 2
  end
end
