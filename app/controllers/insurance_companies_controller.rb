class InsuranceCompaniesController < ApplicationController
  before_action :set_insurance_company, only: %i[ show edit update destroy ]

  # GET /insurance_companies or /insurance_companies.json
  def index
    @insurance_companies = InsuranceCompany.all
  end

  # GET /insurance_companies/1 or /insurance_companies/1.json
  def show
  end

  # GET /insurance_companies/new
  def new
    @insurance_company = InsuranceCompany.new
  end

  # GET /insurance_companies/1/edit
  def edit
  end

  # POST /insurance_companies or /insurance_companies.json
  def create
    @insurance_company = InsuranceCompany.new(insurance_company_params)

    respond_to do |format|
      if @insurance_company.save
        format.html { redirect_to @insurance_company, notice: "Insurance company was successfully created." }
        format.json { render :show, status: :created, location: @insurance_company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insurance_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insurance_companies/1 or /insurance_companies/1.json
  def update
    respond_to do |format|
      if @insurance_company.update(insurance_company_params)
        format.html { redirect_to @insurance_company, notice: "Insurance company was successfully updated." }
        format.json { render :show, status: :ok, location: @insurance_company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @insurance_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_companies/1 or /insurance_companies/1.json
  def destroy
    @insurance_company.destroy!

    respond_to do |format|
      format.html { redirect_to insurance_companies_path, status: :see_other, notice: "Insurance company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_company
      @insurance_company = InsuranceCompany.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def insurance_company_params
      params.expect(insurance_company: [ :company_id, :company_name, :logo, :website, :email ])
    end
end
