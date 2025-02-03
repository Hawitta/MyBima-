require "application_system_test_case"

class UserPaymentsTest < ApplicationSystemTestCase
  setup do
    @user_payment = user_payments(:one)
  end

  test "visiting the index" do
    visit user_payments_url
    assert_selector "h1", text: "User payments"
  end

  test "should create user payment" do
    visit user_payments_url
    click_on "New user payment"

    fill_in "Amount paid", with: @user_payment.amount_paid
    fill_in "Cover", with: @user_payment.cover_id
    fill_in "Date", with: @user_payment.date
    fill_in "Payment mode", with: @user_payment.payment_mode
    fill_in "User", with: @user_payment.user_id
    click_on "Create User payment"

    assert_text "User payment was successfully created"
    click_on "Back"
  end

  test "should update User payment" do
    visit user_payment_url(@user_payment)
    click_on "Edit this user payment", match: :first

    fill_in "Amount paid", with: @user_payment.amount_paid
    fill_in "Cover", with: @user_payment.cover_id
    fill_in "Date", with: @user_payment.date.to_s
    fill_in "Payment mode", with: @user_payment.payment_mode
    fill_in "User", with: @user_payment.user_id
    click_on "Update User payment"

    assert_text "User payment was successfully updated"
    click_on "Back"
  end

  test "should destroy User payment" do
    visit user_payment_url(@user_payment)
    click_on "Destroy this user payment", match: :first

    assert_text "User payment was successfully destroyed"
  end
end
