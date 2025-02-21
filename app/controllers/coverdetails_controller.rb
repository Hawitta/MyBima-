class CoverdetailsController < ApplicationController
  before_action :set_coverdetail, only: %i[ show edit update destroy ]

  layout 'application'
  # GET /coverdetails or /coverdetails.json
  def index
    @coverdetails = Coverdetail.all
  end

  # GET /coverdetails/1 or /coverdetails/1.json
  def show
  end

  # GET /coverdetails/new
  def new
    @coverdetail = Coverdetail.new
  end

  # GET /coverdetails/1/edit
  def edit
  end

  # POST /coverdetails or /coverdetails.json
  def create
    @coverdetail = Coverdetail.new(coverdetail_params)

    respond_to do |format|
      if @coverdetail.save
        format.html { redirect_to @coverdetail, notice: "Coverdetail was successfully created." }
        format.json { render :show, status: :created, location: @coverdetail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coverdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coverdetails/1 or /coverdetails/1.json
  def update
    respond_to do |format|
      if @coverdetail.update(coverdetail_params)
        format.html { redirect_to @coverdetail, notice: "Coverdetail was successfully updated." }
        format.json { render :show, status: :ok, location: @coverdetail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coverdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coverdetails/1 or /coverdetails/1.json
  def destroy
    @coverdetail.destroy!

    respond_to do |format|
      format.html { redirect_to coverdetails_path, status: :see_other, notice: "Coverdetail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coverdetail
      @coverdetail = Coverdetail.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def coverdetail_params
      params.expect(coverdetail: [ :cover_id, :category, :optional, :younger_age, :older_age ])
    end
end
