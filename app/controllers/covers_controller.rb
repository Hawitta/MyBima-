class CoversController < ApplicationController
  before_action :set_layout
  before_action :set_insurance_companies, only: [:new, :create, :edit, :update]
  
  def set_layout
    if current_admin
      self.class.layout "admin"
    else
      self.class.layout "application"
    end
  end

  # GET /covers or /covers.json
  def index
    @covers = Cover.all
    @insurance_companies = InsuranceCompany.all
  end



  def selected
    cover = Cover.find_by(params[:id]) # Find the selected cover by ID

    if cover
      session[:selected_cover_id] = cover.id  # Store the selected cover in session
      redirect_to new_user_path, notice: "You selected #{cover.cover_name}!"
    else
      flash[:alert] = "Invalid cover selection."
      redirect_to covers_path
    end
  
  end
  
  # GET /covers/1 or /covers/1.json
  def show
  end

  def cover_details
  end
  
  # GET /covers/new
  def new
    @admin = current_admin
    @cover = Cover.new
    @insurance_companies = InsuranceCompany.all
  end

  # GET /covers/1/edit
  def edit
    @cover = Cover.find(params[:id]) # Find the cover record
    @insurance_companies = InsuranceCompany.all # Fetch all
  end

  # POST /covers or /covers.json
  def create
    @cover = Cover.new(cover_params)

    respond_to do |format|
      if @cover.save
        format.html { redirect_to new_cover_path, notice: "Cover was successfully created"}
        
      else
        format.html { redirect_to new_cover_path, notice: "Cover was not created." }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /covers/1 or /covers/1.json
  def update
    respond_to do |format|
      if @cover.update(cover_params)
        format.html { redirect_to @cover, notice: "Cover was successfully updated." }
        format.json { render :show, status: :ok, location: @cover }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /covers/1 or /covers/1.json
  def destroy
    @cover.destroy!

    respond_to do |format|
      format.html { redirect_to covers_path, status: :see_other, notice: "Cover was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_insurance_companies
    @insurance_companies = InsuranceCompany.all
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_cover
      @cover = Cover.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cover_params
      params.expect(cover: [ :company_id, :insurance_type, :cover_name, :description ])
    end
end
