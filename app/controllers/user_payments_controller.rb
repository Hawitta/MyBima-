class UserPaymentsController < ApplicationController
  before_action :set_user_payment, only: %i[ show edit update destroy ]

  # GET /user_payments or /user_payments.json
  def index
    @user_payments = UserPayment.all
  end

  # GET /user_payments/1 or /user_payments/1.json
  def show
  end

  # GET /user_payments/new
  def new
    @user_payment = UserPayment.new
    @covers = Cover.all
   
    if session[:selected_cover_id].nil?
      flash[:notice] = "Cover not selected."
      redirect_to new_user_payment_path
    else
      @selected_cover = Cover.find(session[:selected_cover_id])
      flash[:notice] = "Cover choice saved successfully."
      redirect_to mpesa_path
    end
    
  end

  # GET /user_payments/1/edit
  def edit
  end

  # POST /user_payments or /user_payments.json
  def create
    @user_payment = UserPayment.new(user_payment_params)
    respond_to do |format|
      if @user_payment.save
        format.html { redirect_to @user_payment, notice: "User payment was successfully created." }
        format.json { render :show, status: :created, location: @user_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_payments/1 or /user_payments/1.json
  def update
    session[:user_payment] ||= {}
    respond_to do |format|
      if @user_payment.update(user_payment_params)
        format.html { redirect_to @user_payment, notice: "User payment was successfully updated." }
        format.json { render :show, status: :ok, location: @user_payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_payments/1 or /user_payments/1.json
  def destroy
    @user_payment.destroy!
    respond_to do |format|
      format.html { redirect_to user_payments_path, status: :see_other, notice: "User payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def insurance_cover
    @covers = Cover.all
    @user_payment = UserPayment.new
  end

  def insurance_type
    @covers = Cover.all
    @user_payment = UserPayment.new
  end

  def personal_details
    @covers = Cover.all
    @user_payment = UserPayment.new
  end

  def make_payment
    @covers = Cover.all
    @user_payment = UserPayment.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_payment
      @user_payment = UserPayment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_payment_params
      params.expect(user_payment: [ :user_id, :cover_id, :amount_paid, :payment_mode ])
    end

 
   
end
