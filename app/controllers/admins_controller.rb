class AdminsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  # GET /admins or /admins.json
  def index
    @admin = current_admin # Assign for debugging

    if current_admin
      Rails.logger.debug "Admin logged in: #{current_admin.email}"
    else
      Rails.logger.debug "No admin logged in!"
    end
    render template: 'admins/dashboard/index'
  end


  # GET /admins/1 or /admins/1.json
  def show
    @admin = current_admin 
    render template: 'admins/dashboard/index',layout: "admin"

  end

  def dashboard
    @admin = current_admin # Assign for debugging

    render template: 'admins/dashboard/index',layout: "admin"
  end

  # GET /admins/new
  def new
    @admin = Admin.new
    
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins or /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: "Admin was successfully created." }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1 or /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: "Admin was successfully updated." }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1 or /admins/1.json
  def destroy
    @admin.destroy!

    respond_to do |format|
      format.html { redirect_to admins_path, status: :see_other, notice: "Admin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.expect(admin: [ :first_name, :last_name, :email, :password ])
    end
end
