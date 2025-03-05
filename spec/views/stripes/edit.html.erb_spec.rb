require 'rails_helper'

RSpec.describe "stripes/edit", type: :view do
  let(:stripe) {
    Stripe.create!(
      user_id: 1,
      stripe_payment_id: "MyString",
      card_brand: "MyString",
      last_4: "MyString",
      card_fingerprint: "MyString"
    )
  }

  before(:each) do
    assign(:stripe, stripe)
  end

  it "renders the edit stripe form" do
    render

    assert_select "form[action=?][method=?]", stripe_path(stripe), "post" do

      assert_select "input[name=?]", "stripe[user_id]"

      assert_select "input[name=?]", "stripe[stripe_payment_id]"

      assert_select "input[name=?]", "stripe[card_brand]"

      assert_select "input[name=?]", "stripe[last_4]"

      assert_select "input[name=?]", "stripe[card_fingerprint]"
    end
  end
end
