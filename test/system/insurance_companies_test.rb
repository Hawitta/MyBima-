require "application_system_test_case"

class InsuranceCompaniesTest < ApplicationSystemTestCase
  setup do
    @insurance_company = insurance_companies(:one)
  end

  test "visiting the index" do
    visit insurance_companies_url
    assert_selector "h1", text: "Insurance companies"
  end

  test "should create insurance company" do
    visit insurance_companies_url
    click_on "New insurance company"

    fill_in "Company", with: @insurance_company.company_id
    fill_in "Company name", with: @insurance_company.company_name
    fill_in "Email", with: @insurance_company.email
    fill_in "Logo", with: @insurance_company.logo
    fill_in "Website", with: @insurance_company.website
    click_on "Create Insurance company"

    assert_text "Insurance company was successfully created"
    click_on "Back"
  end

  test "should update Insurance company" do
    visit insurance_company_url(@insurance_company)
    click_on "Edit this insurance company", match: :first

    fill_in "Company", with: @insurance_company.company_id
    fill_in "Company name", with: @insurance_company.company_name
    fill_in "Email", with: @insurance_company.email
    fill_in "Logo", with: @insurance_company.logo
    fill_in "Website", with: @insurance_company.website
    click_on "Update Insurance company"

    assert_text "Insurance company was successfully updated"
    click_on "Back"
  end

  test "should destroy Insurance company" do
    visit insurance_company_url(@insurance_company)
    click_on "Destroy this insurance company", match: :first

    assert_text "Insurance company was successfully destroyed"
  end
end
