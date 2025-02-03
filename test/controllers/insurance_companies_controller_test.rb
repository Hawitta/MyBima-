require "test_helper"

class InsuranceCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insurance_company = insurance_companies(:one)
  end

  test "should get index" do
    get insurance_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_insurance_company_url
    assert_response :success
  end

  test "should create insurance_company" do
    assert_difference("InsuranceCompany.count") do
      post insurance_companies_url, params: { insurance_company: { company_id: @insurance_company.company_id, company_name: @insurance_company.company_name, email: @insurance_company.email, logo: @insurance_company.logo, website: @insurance_company.website } }
    end

    assert_redirected_to insurance_company_url(InsuranceCompany.last)
  end

  test "should show insurance_company" do
    get insurance_company_url(@insurance_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_insurance_company_url(@insurance_company)
    assert_response :success
  end

  test "should update insurance_company" do
    patch insurance_company_url(@insurance_company), params: { insurance_company: { company_id: @insurance_company.company_id, company_name: @insurance_company.company_name, email: @insurance_company.email, logo: @insurance_company.logo, website: @insurance_company.website } }
    assert_redirected_to insurance_company_url(@insurance_company)
  end

  test "should destroy insurance_company" do
    assert_difference("InsuranceCompany.count", -1) do
      delete insurance_company_url(@insurance_company)
    end

    assert_redirected_to insurance_companies_url
  end
end
