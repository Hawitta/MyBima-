require 'rails_helper'

RSpec.describe "stripes/new", type: :view do
  before(:each) do
    assign(:stripe, Stripe.new(
      user_id: 1,
      stripe_payment_id: "MyString",
      card_brand: "MyString",
      last_4: "MyString",
      card_fingerprint: "MyString"
    ))
  end

  it "renders new stripe form" do
    render

    assert_select "form[action=?][method=?]", stripes_path, "post" do

      assert_select "input[name=?]", "stripe[user_id]"

      assert_select "input[name=?]", "stripe[stripe_payment_id]"

      assert_select "input[name=?]", "stripe[card_brand]"

      assert_select "input[name=?]", "stripe[last_4]"

      assert_select "input[name=?]", "stripe[card_fingerprint]"
    end
  end
end
