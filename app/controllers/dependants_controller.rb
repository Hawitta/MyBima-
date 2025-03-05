class DependantsController < ApplicationController
  before_action :set_dependant, only: %i[ show edit update destroy ]

  # GET /dependants or /dependants.json
  def index
    @dependants = Dependant.all
  end

  # GET /dependants/1 or /dependants/1.json
  def show
  end

  # GET /dependants/new
  def new
    @dependant = Dependant.new
  end

  # GET /dependants/1/edit
  def edit
  end

  # POST /dependants or /dependants.json
  def create
    @dependant = Dependant.new(dependant_params)

    respond_to do |format|
      if @dependant.save
        format.html { redirect_to new_user_path, notice: "Dependant was successfully created." }
        format.json { render :show, status: :created, location: @dependant }
      else
        format.html { redirect_to new_user_path, notice: "Dependant was not successfully created." }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dependant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dependants/1 or /dependants/1.json
  def update
    respond_to do |format|
      if @dependant.update(dependant_params)
        format.html { redirect_to new_user_path, notice: "Dependant was successfully updated." }
        format.json { render :show, status: :ok, location: @dependant }
      else
        format.html { redirect_to new_user_path, notice: "Dependant was not successfully updated." }
        format.json { render json: @dependant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dependants/1 or /dependants/1.json
  def destroy
    @dependant.destroy!

    respond_to do |format|
      format.html { redirect_to dependants_path, status: :see_other, notice: "Dependant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dependant
      @dependant = Dependant.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def dependant_params
      params.expect(dependant: [ :user_id, :surname, :first_name, :relationship, :dob, :id_no, :blood_group ])
    end
end
