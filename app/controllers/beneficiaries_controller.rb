class BeneficiariesController < ApplicationController
  before_action :set_beneficiary, only: %i[ show edit update destroy ]

  # GET /benefitiaries or /benefitiaries.json
  def index
    @beneficiaries = Beneficiary.all
  end

  # GET /benefitiaries/1 or /benefitiaries/1.json
  def show
  end

  # GET /benefitiaries/new
  def new
    @beneficiary = Beneficiary.new
  end

  # GET /benefitiaries/1/edit
  def edit
  end

  # POST /benefitiaries or /benefitiaries.json
  def create
    @beneficiary = Beneficiary.new(beneficiary_params)

    if @beneficiary.save
      respond_to do |format|
        format.html { redirect_to new_user_path, notice: "Beneficiary added successfully." }
        format.json { render json: @beneficiary, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, alert: "Failed to save beneficiary." }
        format.json { render json: @beneficiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /benefitiaries/1 or /benefitiaries/1.json
  def update
    respond_to do |format|
      if @beneficiary.update(beneficiary_params)
        format.html { redirect_to @beneficiary, notice: "beneficiary was successfully updated." }
        format.json { render :show, status: :ok, location: @beneficiary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @beneficiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefitiaries/1 or /benefitiaries/1.json
  def destroy
    @beneficiary.destroy!

    respond_to do |format|
      format.html { redirect_to benefitiaries_path, status: :see_other, notice: "beneficiary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beneficiary
      @beneficiary = beneficiary.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def beneficiary_params
      params.expect(beneficiary: [ :user_id, :surname, :first_name, :relationship, :id_no, :phone_number, :postal_address ])
    end
end
