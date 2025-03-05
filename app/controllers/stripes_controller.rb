class StripesController < ApplicationController
  before_action :set_stripe, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, only: [ :create ]

  # GET /stripes or /stripes.json
  def index
    @stripes = Stripe.all
  end

  # GET /stripes/1 or /stripes/1.json
  def show
  end

  # GET /stripes/new
  def new
    @stripe = Stripe.new
  end

  # GET /stripes/1/edit
  def edit
  end

  # POST /stripes or /stripes.json
  def create
      payment_method_id = params[:payment_method_id]  # gets from the stripe js frontend
      amount = params[:amount]

      if amount.nil? || amount.to_i <= 0
        render json: { error: "Invalid amount" }, status: :unprocessable_entity
        return
      end

      if payment_method_id.present?
        # Confirm Payment Intent
        intent = Stripe::PaymentIntent.create(
          amount: amount.to_i,
          currency: "usd",
          payment_method: payment_method_id,
          confirm: true
        )
      end

        if intent.status == "succeeded"
          # Extract Card Details
          payment_method = Stripe::PaymentMethod.retrieve(payment_method_id)
          card_details = payment_method.card

          # Store Payment Details in DB
          @stripe_payment = Stripes.create(
            user_id: user_id,
            stripe_payment_id: intent.id,
            card_brand: card_details.brand,
            last_4: card_details.last4,
            card_fingerprint: card_details.fingerprint,
            paid_at: Time.current
          )
        end

        send_payment_to_flask(@stripe_payment, amount)
  end

  def send_payment_to_flask(stripe_payment, amount)
    flask_api_url = "https://1651-41-90-176-53.ngrok-free.app/stripe_payment" # Update this with your Flask API URL
    uri = URI.parse(flask_api_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == "https")

    request = Net::HTTP::Post.new(uri.path, { "Content-Type" => "application/json" })
    payload = {
      user_id: stripe_payment.user_id,
      stripe_payment_id: stripe_payment.stripe_payment_id,
      card_brand: stripe_payment.card_brand,
      last_4: stripe_payment.last_4,
      card_fingerprint: stripe_payment.card_fingerprint,
      paid_at: stripe_payment.paid_at,
      amount: amount
    }.to_json

    request.body = payload
    response = http.request(request)

    Rails.logger.info "Flask API Response: #{response.body}"
  end


  def choose_payment
      @stripe = Stripe.new
  end

  # PATCH/PUT /stripes/1 or /stripes/1.json
  def update
    respond_to do |format|
      if @stripe.update(stripe_params)
        format.html { redirect_to @stripe, notice: "Stripe was successfully updated." }
        format.json { render :show, status: :ok, location: @stripe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stripe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stripes/1 or /stripes/1.json
  def destroy
    @stripe.destroy!

    respond_to do |format|
      format.html { redirect_to stripes_path, status: :see_other, notice: "Stripe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stripe
      @stripe = Stripe.find(params.expect(:id))
    end

    def stripe_params
      params.require(:stripe).permit(:user_id, :stripe_payment_id, :card_brand, :last_4, :card_fingerprint, :paid_at)
    end
end
