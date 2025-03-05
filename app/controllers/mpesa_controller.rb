require "net/http"
require "uri"
require "json"


class MpesaController < ApplicationController
    def index
      user=current_user
      if user.nil?
        flash[:notice]= "Invalid user"
      else
        flash[:notice]= "Valid user"
      end

      if session[:selected_cover_id]
        @selected_cover = Cover.find(session[:selected_cover_id])
      else
        redirect_to covers_path, alert: "Please select an insurance cover first."
      end
    end

    def send_phone_number
        phone_number = params[:phone_number]
        amount = params[:amount]
        response = send_to_flask(phone_number, amount)

        user=current_user
        if user.nil?
          flash[:notice]= "Invalid user"
        else
          flash[:notice]= "Valid user"
        end

        payment_details = UserPayment.new(
          user_id: user.id,
          cover_id: session[:selected_cover_id],
          amount_paid: params[:amount],
          payment_mode: params[:method]
        )
        session[:last_payment_id] = payment_details.id

        if payment_details.save
          flash[:notice] = "Payment details saved successfully."
        else
          flash[:alert] = "Failed to save payment details."
        end

        if response["ResponseCode"] == "0"
          flash[:notice] = "Success: #{response['CustomerMessage']} - Checkout Request ID: #{response['CheckoutRequestID']}"
          transaction = MpesaTransaction.create(
          checkout_request_id: response["CheckoutRequestID"],
          merchant_request_id: response["MerchantRequestID"],
          phone_number: params[:phone_number], # You can store the phone number from the request
          amount: params[:amount],
          response_code: response["ResponseCode"],
          response_description: response["ResponseDescription"],
          customer_message: response["CustomerMessage"]
      )

        PaymentMailer.payment_confirmation(user, amount).deliver_now
        Rails.logger.info "Sending payment confirmation to #{current_user.email}"

        else
          flash[:alert] = "Error: #{response['errorMessage']}"
          Rails.logger.error("MPESA Error: #{response['errorMessage']}")

          # Optionally store the failed transaction or error in the database
          failed_transaction = MpesaTransaction.create(
            phone_number: params[:phone_number],
            amount: params[:amount],
            response_code: response["ResponseCode"],
            response_description: response["ResponseDescription"],
            customer_message: response["CustomerMessage"],
            error_message: response["errorMessage"]
          )
          render json: { status: "error", message: "Failed to send phone number to Flask API" }, status: :unprocessable_entity
        end
      end


  private

  def send_to_flask(phone_number, amount, transaction_type = "CustomerPayBillOnline")
    uri = URI.parse("https://0aff-41-80-114-105.ngrok-free.app/subscribe") # Flask server URL

    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request.body = { phone_number: phone_number, amount: amount, transaction_type: transaction_type }.to_json

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true  # Ensure SSL is enabled if using https

    # Send the request and get the response
    response = http.request(request)

    # Check for response success or failure
    if response.is_a?(Net::HTTPSuccess)
      puts "Success: #{response.body}"
      return JSON.parse(response.body)  # Parse JSON response
    else
      puts "Error: #{response.code} - #{response.body}"  # Print error details
      return { "error" => "Request failed", "details" => response.body }
    end

    def test_email_sending
      user = current_user
      amount = 100 # You can pass any amount for testing
      Rails.logger.info "Sending test email to #{user.email}"

      # Send the email directly within the controller
      PaymentMailer.payment_confirmation(user, amount).deliver_now
      render plain: "Test email sent to #{user.email}"
    end
  end
end
